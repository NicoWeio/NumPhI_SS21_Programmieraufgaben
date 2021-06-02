%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften SS2021
%
%   Prof. Dr. J. Stoeckler
%   M.Sc. M. Weimann
%   Dipl.-Math. M. Bangert
%
%   Programmierblatt 4
%   Abgabe bis zum 03.06.2021
%
%   Student*in 1: Elias, Giannopoulos, 220848
%   Student*in 2: Nicolai, Weitkemper, 220837
%
%   Programmversion: Octave 6.2.0
%
%%

clear all
close all

f = @(x) 3.*x.^4 + 18.*x.^3 + 36.*x.^2 + 30.*x + 9;
df = @(x) 12.*x.^3 + 54.*x.^2 + 72.*x + 30;
x0 = 5; % Startwert
tol = 10e-12;
k_max = 100;

for p=1:5
  p
  [x,ret] = mod_newton(f, df, p, x0, tol, k_max);
  ret
end
