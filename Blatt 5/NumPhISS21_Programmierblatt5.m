%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften SS2021
%
%   Prof. Dr. J. Stoeckler
%   M.Sc. M. Weimann
%   Dipl.-Math. M. Bangert
%
%   Programmierblatt 5
%   Abgabe bis zum 17.06.2021
%
%   Student*in 1: Elias, Giannopoulos, 220848
%   Student*in 2: Nicolai, Weitkemper, 220837
%
%   Programmversion: Octave 6.2.0
%
%%

clear all
close all

function b_j = get_b_j(j)
  f = @(x) 1 ./ (10 + x.^2);
  phi_j = @(x) x.^j;
  b_j = integral(@(x) phi_j(x) .* f(x), 0, 1); % f ist definiert auf [0,1]
end

function [x, y] = get_approx_err(l, n)
  k = l * 1e-5;
  s = ones(n+1, 1);

  b = arrayfun(@get_b_j, 0:n)';
  b_l = b + k .* s; % mit Störungen

  c = invhilb(n+1) * b_l;

  f = @(x) 1 ./ (10 + x.^2);

  % ↓ Nahezu unlesbar, aber schön schlank. :)
  g_l = @(x) sum(cell2mat(arrayfun(@(j) c(j+1) .* x.^j, 0:n, 'UniformOutput', false)), 2);

  x = norm(b - b_l) / norm(b);
  y = sqrt(integral(@(x) abs(f(x) - g_l(x)).^2, 0, 1));
end

l_list = 0:100;

hold on
for n = 1:4
  [x, y] = arrayfun(@(l) get_approx_err(l, n), l_list);
  the_plt = plot(x, y, 'DisplayName', sprintf('n=%d', n));
end
legend()
xlim([0, 0.01])
ylim([0, 0.003])
waitfor(the_plt)

% 5b) (nicht ganz so kurz)
% Der Plot stellt den Approximationsfehler in Abhängigkeit der Störung von b dar.
% Grob gesagt entspricht die Steigung der einzelnen Graphen der jeweiligen Kondition, denn
% „Die Konditionszahl beschreibt den Faktor, um den der Eingangsfehler im ungünstigsten Fall verstärkt wird.“
% Auf der x-Achse ist besagter (relativer) Eingangsfehler der rechten Seite aufgetragen
% (das LGS lautete M*c=b).
% Auf der y-Achse ist dann der (absolute) Approximationsfehler aufgetragen.
%
% Aus dem Plot geht also hervor,
% dass die Approximation für größere n schlechter konditioniert ist,
% weil die Steigung der jeweiligen Graphen größer ist.


% 5c)
% Die Kondition der Hilbert-Matrix H wächst bekanntermaßen stark mit der Dimension n.
% Dieses Verhalten zeigt sich auch in unserem Plot.
