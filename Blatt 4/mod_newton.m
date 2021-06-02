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

function [x,ret] = mod_newton(f, df, p, x0, tol, k_max)
  x = x0;
  k = int8(1);
  while abs(f(x)) > tol && k < k_max
    x = x - p.*f(x)/df(x);
    % Natürlich wäre ein int als Laufvariable schöner.
    % Aber nur so kann ich die anderen Einträge sinnvoll darstellen.
    %           ↓↓↓↓↓↓↓↓↓
    ret(k,:) = [single(k), x, f(x), df(x)];
    k++;
  end
end

% Aufgabe 4c)
% Die betrachtete Nullstelle x = -1 ist eine 3-fache Nullstelle,
% da f(-1)=f'(-1)=f''(-1)=0 und f'''(-1)=36≠0.
% Da f natürlich stetig ist und p=3 ≥ 2 ist, ist für p=3 quadratische Konvergenz gegen x = -1 gegeben.
%
% Das deckt sich mit den Ergebnissen aus den vorherigen Aufgabenteilen,
% wo für p=3 (p=5 zählt nicht, weil eine andere Nullstelle resultiert, s.u.)
% die wenigsten Iterationsschritte benötigt werden,
% um unter die Fehlertoleranz zu kommen.
%
%
% Es handelt sich um einen „Glückstreffer“ (ob das nun etwas Gutes ist, sei hingestellt).
% Durch manuelles Nachrechnen zeigt sich:
% x_1 = 5 - 5 * (5184 / 3240)
% x_1 = 5 - 5 * 1.6
% x_1 = 5 - 8
% x_1 = -3
% …was eine der beiden Nullstellen von f ist.
% Wir haben also nicht die gesuchte Nullstelle x = -1, sondern die zweite, x = -3, gefunden.
