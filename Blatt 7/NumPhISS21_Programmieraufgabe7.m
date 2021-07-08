%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften SS2021
%
%   Prof. Dr. J. Stoeckler
%   M.Sc. M. Weimann
%   Dipl.-Math. M. Bangert
%
%   Programmierblatt 7
%   Abgabe bis zum 15.07.2021
%
%   Student*in 1: Vorname, Nachname, Matrikelnummer
%   Student*in 2: Vorname, Nachname, Matrikelnummer
%
%   Programmversion: z.B. Matlab R2021a oder Octave 6.2.0
%

close all
clear all
clc


%% Parameter und Konstanten
G  = 6.67430 * 1e-11; % Gravitationskonstante
M  = 5.972 * 1e24;    % Masse der Erde in kg
GM = G * M;
m  = 1000;            % Masse des Sateliten in kg
r  = 6.371*1e6;       % Radius der Erde in m

%% Gravitationspotential und Gravitationsfeld als function handle
% reduziertes Gravitationspotential
V_tilde = @(x1,x2) % ...

% reduziertes Gravitationsfeld
g_tilde_1 = @(x1,x2) % ...
g_tilde_2 = @(x1,x2) % ...


%% Anfangsbedingung
% ...
Y_tilde_0 = [q_tilde_0; p_tilde_0];

%% Funktion f_tilde der reduzierten Rechten Seite
f_tilde = @(y) % ...


%% Ausfuehrung Runge-Kutta
h = 1;
Y_tilde = Y_tilde_0;
for k = 1:1000
    Y_tilde(:,end+1) = RK4(...);
end

%% Plot
% Vorbereitung: Gitter fuer den Plot
R = linspace(r+5e5,r+4e6,6);
T = linspace(0,pi/2,20);
[x, y] = meshgrid(R,T);
x_q = x.*cos(y);
y_q = x.*sin(y);
[x,y] = meshgrid(1e4:1e4:8e6,1e4:1e4:8e6);

% Erdoberflaeche
Erde = [r;0];
for phi = 0.01:0.01:pi/2
    Erde(:,end+1) = [cos(phi) * r; sin(phi) * r];
end

% Plot
figure('name','Programmierblatt 7')
quiver(x_q,y_q,g_tilde_1(x_q,y_q),g_tilde_2(x_q,y_q),0.2) % Gravitationsfeld
hold on
s = surf(x,y,V_tilde(x,y));  % Gravitationspotential
shading flat;
set(gca,'ColorScale','log')
axis equal
view(2);
xlim([0,8e6])
ylim([0,8e6])
colorbar
plot(Erde(1,:),Erde(2,:),'b') % Erdoberflaeche
plot(Y_tilde(1,:),Y_tilde(2,:),'r')   % Flugbahn
legend('Gravitationsfeld','Gravitationspotential','Erdoberflaeche','Flugbahn','Location','eastoutside')
