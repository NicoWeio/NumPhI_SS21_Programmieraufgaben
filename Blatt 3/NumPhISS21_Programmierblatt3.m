%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften SS2021
%
%   Prof. Dr. J. Stoeckler
%   M.Sc. M. Weimann
%   Dipl.-Math. M. Bangert
%
%   Programmierblatt 3
%   Abgabe bis zum 20.05.2021
%
%   Student*in 1: Elias, Giannopoulos, 220848
%   Student*in 2: Nicolai, Weitkemper, 220837
%
%   Programmversion: Octave 6.2.0
%
%%

clear all
close all

%% nichtsummierte Quadraturformeln als Funktionen

function I = m(f,c,d)
% n=0; Mittelpunktsregel; naturgemäß offen; S. 41
I = (c-d) * f((c+d)/2);
end

function I = t(f,c,d)
% n=1; Trapezregel; abgeschlossen
I = (c-d)/2 * (f(c) + f(d))
end

function I = s(f,c,d)
% n=2; Simpsonregel; S. 40
I = (d-c)/6 * (f(c) + 4*f((c+d)/2) + f(d))
end

function I = g(f,c,d)
% zweipunktige Gaußregel (ϱ≡1)
% Koordinatentransformation:
% – berechne neue Stützstellen
stuetz_1 = (d-c)/2 * (- sqrt(3)/3) + (c+d)/2
stuetz_2 = (d-c)/2 * (  sqrt(3)/3) + (c+d)/2
% – berechne neue Gewichte (war überall 1)
weight_i = (d-c)/2 * 1

I = weight_i * (f(stuetz_1) + f(stuetz_2))
end


%% Definition der Funktion f als function handle
f = @(x) sin(5*pi.*x);
a = 0;
b = 1;

I_theo = 2/(5*pi)

%% Berechnung der absoluten Fehler für N = 1,...,4

F_abs = zeros(4,4); % Zeilen: N=1,..,4; Spalten: Schemata (Mittelpunkt, ...)

N_list = [1,2,3,4];
I_fun_list = {@m, @t, @s, @g}

for fun_index = 1:4
  I_fun = I_fun_list{fun_index}
  for N = N_list
    single_result = 0;
    for n = 1:N
      lower = (n-1) / N;
      upper = n     / N;
      single_result += I_fun(f, lower, upper);
    endfor
    F_abs(N, fun_index) = abs(single_result - I_theo)
  endfor
endfor

%% Plot des Balkendiagramms

% `categorical` ist in Octave noch nicht implementiert.
the_plt = bar(F_abs);
legend('Mittelpunkt', 'Trapez', 'Simpson', '2-pkt. Gauß')
title('Absolute Fehler der summierten Quadrationsformeln zu \int_0^1{sin(5 \pi x) dx}')
% xlabel('N')
xticks([1 2 3 4])
xticklabels({'N=1', 'N=2', 'N=3', 'N=4'})
waitfor(the_plt)

%% Anmerkung zum Resultat:
% Wir sehen bei Mittelpunktsregel und Trapezregel Abweichungen zum gegebenen Plot,
% die wir uns aber nicht erklären können.

%% Interpratation (Programmieraufgabe 3b)
%{
Die Approximation verschlechtert sich anfänglich tatsächlich.
Das liegt einfach an der teils ungünstigen Positionierung der äquidistanten Knoten.
(Ich habe auch eine kleine Visualisierung dazu programmiert,
die das veranschaulicht.)

Für größere N sind jedoch bessere Approximationen zu erwarten.
Das geht einerseits aus der Fehlerabschätzung hervor,
welche besagt, dass der Fehler proportional zur 2. bzw. 4. Ableitung des Integranden ist
(siehe Skript S. 43).
Andererseits ist die betrachtete Funktion beliebig oft stetig differenzierbar etc.
Für immer kleinere Teilintervall-Längen und ohne Berücksichtigung der Rechengenauigkeit
konvergiert die Quadraturformel für N→∞ daher gegen das Integral.
%}
