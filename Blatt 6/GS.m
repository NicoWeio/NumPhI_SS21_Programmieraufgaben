%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften SS2021
%
%   Prof. Dr. J. Stoeckler
%   M.Sc. M. Weimann
%   Dipl.-Math. M. Bangert
%
%   Programmierblatt 6ai
%   Abgabe bis zum 08.07.2021
%
%   Student*in 1: Elias, Giannopoulos, 220848
%   Student*in 2: Nicolai, Weitkemper, 220837
%
%   Programmversion: Octave 6.2.0
%%

function [x,ret] = GS(A,b,tol,maxiter)

n = length(b);
ret = zeros(n+1, 1); % wird in der 2. Dimension später nach Bedarf erweitert

% 1. Wähle Startvektor…
x_0 = zeros(n,1);
for i=1:n
    x_0(i) = b(i)/A(i,i);
end
ret(:,1) = [x_0; 0]; % entspricht k=0, also der ersten Spalte

% 2. …
for k=1:maxiter
  for i=1:n
    % Summiere eigentlich über j=1 bis j=n ohne j=i.
    % Aber: A ist tridiagonal, daher brauchen wir nur sehr wenige j betrachten…
    index_candidates = [i-1; i+1]';
    index_candidates = index_candidates(index_candidates >= 1); % edge case abfangen…
    index_candidates = index_candidates(index_candidates <= n); % edge case abfangen…
    subtrahend = 0;
    for j = index_candidates
      if j < i
        subtrahend = subtrahend + A(i,j) * ret(j,k+1);
      else % => j > i, denn j!=i
        subtrahend = subtrahend + A(i,j) * ret(j,k);
      end
    end

    ret(i,k+1) = (b(i) - subtrahend)/A(i,i);
  end
  err = norm(ret(1:end-1,k+1) - ret(1:end-1,k), inf);
  ret(end,k+1) = err;
  % fprintf('Iterationen: %d | Fehler: %e\n', k, err)
  if err < tol
    break
  end
end

x = ret(:,end);
end
