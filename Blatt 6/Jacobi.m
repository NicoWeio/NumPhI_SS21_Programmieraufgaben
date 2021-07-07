%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften SS2021
%
%   Prof. Dr. J. Stoeckler
%   M.Sc. M. Weimann
%   Dipl.-Math. M. Bangert
%
%   Programmierblatt 6aii
%   Abgabe bis zum 08.07.2021
%
%   Student*in 1: Vorname, Nachname, Matrikelnummer
%   Student*in 2: Vorname, Nachname, Matrikelnummer
%
%   Programmversion: z.B. Matlab R2021a oder Octave 6.2.0
%

function [x,ret] = Jacobi(A,b,tol,maxiter)

n = length(b);
x_0 = zeros(n,1);

for i=1:n
    x_0(i) = b(i)/A(i,i);
end

% ...
end
