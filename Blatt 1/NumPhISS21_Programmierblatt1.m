%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften SS2021 
%
%   Prof. Dr. J. Stoeckler
%   M.Sc. M. Weimann
%   Dipl.-Math. M. Bangert
%
%   Programmierblatt 1
%   Abgabe bis zum 21.04.2021
%  
%   Student*in 1: Vorname, Nachname, Matrikelnummer
%   Student*in 2: Vorname, Nachname, Matrikelnummer
%
%   Programmversion: z.B. Matlab R2021a oder Octave 6.2.0
%% 

close all; % close plots 
clear all; % delets all data in the Workspace

%% Definition der Funktionen
f = %... Definition als function handle 

% Polynom vierten Grades
n = %... Grad
x4 = %... Knoten mittels linspace
y4 = %... Daten
p4 = %... Interpolationspolynom mittels polyfit	

% Polynom zehnten Grades
n = %... Grad
x10 = %...
y10 = %...
p10 = %...	

%% Auswertung
xx = linspace(-5,5,101); % diskrete Definitionsmenge
yyf = %... Auswertung von f an den Stellen xx
yy4 = %... Auswertung von p4 an den Stellen xx mittels polyval	
yy10 = %...
r4 = %... Interpolationsfehler zu p4
r10 = %...

%% Ausgabe
%...

