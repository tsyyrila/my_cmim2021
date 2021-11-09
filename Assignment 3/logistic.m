% Computational Methods in Mechanics
% Fall 2021
% Tuomas Syyrilä
% Student 0451762
% Assignment 3, exercise 4.4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc ; clear all; close all;

f = @(u, t) 0.1*(1 - u/500)*u;
U_0 = 100;  
dt = 20;  T = 100;
[u_0, t_0] = ode_FE(f, U_0, dt, T); %initial numerical solution

k= 0; % k initial value 
repeat = true;

while repeat == true
    delta_tk = 2^-k *dt;
    [u_1, t_1] = ode_FE(f, U_0, delta_tk, T); %numerical solution with new timesttep
    plot(t_0, u_0, 'r',t_1, u_1,'g');
    xlabel('t');  ylabel('N(t)');
    fprintf('Value of k: %i\nTimestep: %.3f\n\n',k,delta_tk)
    status = input('Would you like to repeat with k = k+1 ? (y/n)','s');
    if status == 'y'
        repeat = true;
        u_0 = u_1;
        t_0 = t_1;
        k = k+1;
    else
         repeat = false;
    end
    
end