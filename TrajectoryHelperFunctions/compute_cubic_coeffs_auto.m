function [cubic_coeffs_s1,cubic_coeffs_s2] = compute_cubic_coeffs_auto(xi,vxi,xm,xf,vxf,tf,tm)
% Cubic polynomial 
% Calculates the coefficients of a trajectory with one intermediate point
% in auto mode 
% auto mode: system automatically choose the velocity of the intermediate point
% user only need to specify the position of the intermediate point 
B = [xi; vxi; xm; xm; xf; vxf; 0; 0];

A = [1 0 0 0 0 0 0 0;
     0 1 0 0 0 0 0 0;
     1 tm tm^2 tm^3 0 0 0 0;
     0 0 0 0 1 0 0 0;
     0 0 0 0 1 (tf-tm) (tf-tm)^2 (tf-tm)^3;
     0 0 0 0 0 1 2*(tf-tm) 3*(tf-tm)^2;
     0 1 2*tm 3*tm^2 0 -1 0 0;
     0 0 2 6*tm 0 0 -2 0;
    ];

cubic_coeffs = transpose(A\B);
cubic_coeffs_s1 = cubic_coeffs(1:4);
cubic_coeffs_s2 = cubic_coeffs(5:8);
end