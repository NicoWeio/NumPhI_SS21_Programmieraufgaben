%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften SS2021
%
%   Prof. Dr. J. Stoeckler
%   M.Sc. M. Weimann
%   Dipl.-Math. M. Bangert
%
%   Programmierblatt 3
%   Abgabe bis zum 20.05.2021
%
%   Student*in 1: Vorname, Nachname, Matrikelnummer
%   Student*in 2: Vorname, Nachname, Matrikelnummer
%
%   Programmversion: z.B. Matlab R2021a oder Octave 6.2.0
%
%%

clear all
close all

%% Definition der Funktion f als functin handle
f = %...
a = %...
b = %...

%% Berechnung der absoluten Fehler für N = 1,...,4
F_abs = zeros(4,4); % Zeilen: N=1,..,4; Spalten: Schemata (Mittelpunkt, ...)
%...

%% Plot des Balkendiagramms
%...

%% nichtsummierte Quadraturformeln als Funktionen
function I = m(f,c,d)
I = %...
end

function I = t(f,c,d)
I = %...
end

function I = s(f,c,d)
I = %...
end

function I = g(f,c,d)
% Koordinatentransformation beachten!
%...
end

%% Interpratation (Programmieraufgabe 3b)
%{
...
%}
