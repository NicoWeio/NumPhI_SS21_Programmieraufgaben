%%  Numerische Mathematik fuer Physik und Ingenieurwissenschaften SS2021
%
%   Prof. Dr. J. Stoeckler
%   M.Sc. M. Weimann
%   Dipl.-Math. M. Bangert
%
%   Programmierblatt 6
%   Abgabe bis zum 08.07.2021
%
%   Student*in 1: Elias, Giannopoulos, 220848
%   Student*in 2: Nicolai, Weitkemper, 220837
%
%   Programmversion: Octave 6.2.0
%%

clear all
close all
clc

format long

%% Parameter
% Parameter der Linienlast
t = 3;          % Translationsparameter
s = 0.5;        % Skalierungsparameter

% Geometrie und Diskretisierung
l = 10;       % Laenge des Balkens
n = 100;       % Dimension des Problems
h = l/(n+1);  % Schrittweite

% Materialeigenschaft
C = 100;       % Biegesteifigkeit

%% Mechanik
q = @(x) - exp(- s .* s .* (x-t) .* (x-t));        % Linienlast
B_v = integral(@(x) x .* q(x),0,l)/l;   % vertikale Auflagerkraft in B = (l,0)
A_v = integral(q,0,l) - B_v;            % vertikale Auflagerkraft in A = (0,0)

% Querkraft
Q = @(x)  A_v + 0.5 * sqrt(pi) * (erf(s * (x - t)) + erf(s * t)) / s; 

% Biegemoment
M = @(x) A_v .* x + 0.5 * sqrt(pi) * (x - t) .* (erf(s * (x - t)) + erf(s * t)) / s - 0.5 * (exp(-s*s*t*t) - exp(s*s*(t*x- x.*x - t*t))) / (s*s);


%% Numerische Berechnungen
% Matrix A aus Bsp. 5.3.7
A = sparse(diag(2*ones(n,1)) + diag(-1*ones(n-1,1),1) + diag(-1*ones(n-1,1),-1));

% Rechte Seite b aus Bsp. 5.3.7
b = transpose(h * h * M(h * (1:n)) / C);

% Biegelinie u aus Bsp. 5.3.7 mittels GS und Jacobi
[u_GS,ret_GS] = GS(A,b,1e-6,40000);
[u_Jacobi,ret_Jacobi] = Jacobi(A,b,1e-6,40000);

iteration_GS = size(ret_GS,2);
iteration_Jacobi = size(ret_Jacobi,2);

L_GS     = ret_GS(n+1,end)     /  ret_GS(n+1,end-1);
L_Jacobi = ret_Jacobi(n+1,end) /  ret_Jacobi(n+1,end-1);
a = log(L_GS)/log(L_Jacobi);


%% Post-Processing
% disp
disp(['Anzahl Iterationen fuer das Jacobi-Verfahren:       ' num2str(iteration_Jacobi)])
disp(['Anzahl Iterationen fuer das Gauss-Seidel-Verfahren: ' num2str(iteration_GS)])
disp(['log(L_GS) / log(L_Jacobi):                          ' num2str(a)])

% plot
figure('name','Programmierblatt 6');

subplot(2,1,1)
plot(h * (1:n),-q(h * (1:n)),'--r')
hold on
plot(h * (1:n),-Q(h * (1:n)))
plot(h * (1:n),M(h * (1:n)))
legend('Linienlast','Querkraft','Momentenverlauf')

subplot(2,1,2)
A_v1 = [0 0];
A_v2 = [A_v 0];
B_v1 = [l l];
B_v2 = [B_v 0];
plot(h * (1:n),-q(h * (1:n)),'--r')
hold on
plot(h * (1:n),u_GS(1:n),'b')
quiver( A_v1(1),A_v2(1),A_v1(2)-A_v1(1),A_v2(2)-A_v2(1),0,'r','LineWidth',1 )
quiver( B_v1(1),B_v2(1),B_v1(2)-B_v1(1),B_v2(2)-B_v2(1),0,'r','LineWidth',1 )
xlim([-0.5,10.5])
legend('Linienlast','Biegelinie','Auflagerkraft')

%% Aufgabe 6b
%{
...
%}


