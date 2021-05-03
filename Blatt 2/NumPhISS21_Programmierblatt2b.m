%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften SS2021
%
%   Prof. Dr. J. Stoeckler
%   M.Sc. M. Weimann
%   Dipl.-Math. M. Bangert
%
%   Programmierblatt 2b
%   Abgabe bis zum 05.05.2021
%
%   Student*in 1: Vorname, Nachname, Matrikelnummer
%   Student*in 2: Vorname, Nachname, Matrikelnummer
%
%   Programmversion: z.B. Matlab R2021a oder Octave 6.2.0
%%

close all
clear all

%% signal generation
n = 1000;
x = linspace(0,1,n+1);
k = linspace(-n/2,n/2,n+1);
y = zeros(1,n+1);

for i = 1:10
    y = y + sin(pi * i * x);
end

y_noised = y + 0.5 * randn(1,n+1);

%% computation of fft(y_noised)
c_noised = 1/(n+1)*fft(y_noised);

%% Run fftint
%...

%% Plot
%...
