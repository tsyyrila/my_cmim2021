% Computational Methods in Mechanics
% Fall 2021
% Tuomas Syyrilä
% Student 0451762
% Assignment 4, part 2 section 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;

%Solve f(x)=0 for x for given phi
%x = [theta,d]
a = 0.1;
b = 0.2;
phi = 30*pi/180;

F=@(x) [a*cos(phi)+b*cos(x(1))-x(2); a*sin(phi)-b*sin(x(1))];
J=@(x) [-b*sin(x(1)), -1; -b*cos(x(1)), 0];

init_val = [pi/3,0.15]';
eps = 0.0001;
result=NR_method(F, J, init_val, eps);
theta_degree = result(1)*180/pi;

fprintf('With the given parameters, solving for f(x) = 0 results in:\n')
fprintf('A theta value of %.2f degrees and d value of %.2f m',theta_degree,result(2))
