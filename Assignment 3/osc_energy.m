% Computational Methods in Mechanics
% Fall 2021
% Tuomas Syyrilä
% Student 0451762
% Assignment 3, exercise 4.10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [e_p, e_k]=osc_energy(u,v,omega)
e_p = 0.5*omega.^2*u.^2;
e_k= 0.5*v.^2;
end