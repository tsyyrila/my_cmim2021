% Computational Methods in Mechanics
% Fall 2021
% Tuomas Syyrilä
% Student 0451762
% Assignment 4, part 2 section 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;
init_val = [pi/3,0.15]';
a = 0.1;
b = 0.2;
w = -1; %rad/s
phi = 30*pi/180;
eps = 0.0001;
F=@(x) [a*cos(phi)+b*cos(x(1))-x(2); a*sin(phi)-b*sin(x(1))];
J=@(x) [-b*sin(x(1)), -1; -b*cos(x(1)), 0];
init_val=NR_method(F, J, init_val, eps);

%write program that solves f(x,t) = 0 using NR
t=linspace(0,1,101);
theta_data = zeros(101,1);
d_data = zeros(101,1);
for i = 1:length(t)
    F=@(x) [a*cos(pi/6+w*t(i))+b*cos(x(1))-x(2); a*sin(pi/6+w*t(i))-b*sin(x(1))];
    J=@(x) [-b*sin(x(1)), -1; -b*cos(x(1)), 0];
    result=NR_method(F, J, init_val, eps);
    theta_data(i) = result(1);
    d_data(i) = result(2);
end


figure
plot(t,theta_data*180/pi,'r')
legend('theta')
xlabel('Time [s]') 
ylabel('Angle of rotation [degree]') 

figure
plot(t,d_data,'g')
legend('d')
xlabel('Time [s]') 
ylabel('Displacement [m]') 


