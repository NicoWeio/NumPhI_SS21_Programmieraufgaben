%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften SS2021
%
%   Prof. Dr. J. Stoeckler
%   M.Sc. M. Weimann
%   Dipl.-Math. M. Bangert
%
%   Programmierblatt 2b
%   Abgabe bis zum 05.05.2021
%
%   Student*in 1: Elias, Giannopoulos, 220848
%   Student*in 2: Nicolai, Weitkemper, 220837
%
%   Programmversion: Octave 6.2.0
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

[xfine,yfine,c,threshold] = NumPhISS21_Programmierblatt2a(y_noised,1,0.989);

%% Plot

subplot(2,2,1);
hold on;
plot(x, y_noised);
plot(x, y);
legend('verrauscht', 'original');
title('Gegebene Daten');
xlabel('x');
ylabel('y');
hold off;

subplot(2,2,2);
hold on;
plot(xfine, yfine);
plot(x, y);
legend('entrauscht', 'original');
title('Entrauschte Daten');
xlabel('x');
ylabel('y');
hold off;

subplot(2,2,3);
hold on;
plot(k, abs(fftshift(c_noised)));
% in MATLAB ließe sich yline nutzen…
line([-500 500], [threshold threshold], 'linestyle', '--');
xlim([-500 500]);
legend('verrauscht', 'Threshold');
title('Gegebene Daten im Spektralraum');
xlabel('k');
ylabel('|c_k|');
hold off;

subplot(2,2,4);
hold on;
plot(k, abs(fftshift(c)));
% in MATLAB ließe sich yline nutzen…
line([-500 500], [threshold threshold], 'linestyle', '--');
xlim([-500 500]);
l = legend('verrauscht', 'Threshold');
set(l, 'interpreter', 'latex');
title('Entrauschte Daten im Spektralraum');
xlabel('k');
ylabel('|c_k|');
hold off;
pause
