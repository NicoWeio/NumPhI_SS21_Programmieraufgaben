%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften SS2021
%
%   Prof. Dr. J. Stoeckler
%   M.Sc. M. Weimann
%   Dipl.-Math. M. Bangert
%
%   Programmierblatt 1
%   Abgabe bis zum 21.04.2021
%
%   Student*in 1: Elias, Giannopoulos, 220848
%   Student*in 2: Nicolai, Weitkemper, 220837
%
%   Programmversion: Octave 6.2.0
%%

close all; % close plots
clear all; % delets all data in the Workspace

%% Definition der Funktionen
f = @(x) 10./(1+x.^2);

% Polynom vierten Grades
n = 4; % Grad
x4 = linspace(-5, 5, n+1); % Knoten mittels linspace
y4 = f(x4); % Daten
p4 = polyfit(x4, y4, n) % Interpolationspolynom mittels polyfit

% Polynom zehnten Grades
n = 10; % Grad
x10 = linspace(-5, 5, n+1);
y10 = f(x10);
p10 = polyfit(x10, y10, n)

%% Auswertung
xx = linspace(-5,5,101); % diskrete Definitionsmenge
yyf = f(xx); % Auswertung von f an den Stellen xx
yy4 = polyval(p4, xx); % Auswertung von p4 an den Stellen xx mittels polyval
yy10 = polyval(p10, xx);
r4 = abs(yyf-yy4); % Interpolationsfehler zu p4
r10 = abs(yyf-yy10);

%% Ausgabe
subplot(2,1,1)
hold on
plot(xx, yyf) % plotte die Ausgangs-Funktion
plot(xx, yy4) % plotte Interpolation-Polynom 4. Grades
plot(xx, yy10) % plotte Interpolation-Polynom 10. Grades
hold off
subplot(2,1,2)
hold on
plot(xx, r4) % plotte Interpolationsfehler zu p4
plot(xx, r10) % plotte Interpolationsfehler zu p10
hold off
pause
