% Computational Methods in Mechanics
% Fall 2021
% Tuomas Syyrilä
% Student 0451762
% Assignment 3, exercise 4.14
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; close all; clear all;

omega = 2;
P = 2*pi/omega;
%dt= P/20;
dt= P/2000;
T = 3*P;
N_t = floor(T/dt);
t=linspace(0,N_t*dt,N_t+1);
u = zeros(N_t+1,1);
v = zeros(N_t+1,1);

%Initial conditions
X_0 = 2;
u(1) = X_0;
v(1) = 0;

%Step_equations forward in time
for n = 2:N_t
    u(n)=u(n-1)+dt*(v(n-1)-dt*omega^2*u(n-1))/(1+(dt*omega)^2);
    v(n) = (v(n-1)-dt*omega^2*u(n-1))/(1+(dt*omega)^2);
end
plot(t, u, 'g', t, X_0*cos(omega*t), 'r');
legend('numerical', 'exact', 'Location', 'northwest');
xlabel('t');