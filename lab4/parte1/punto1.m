% punto 1
clc;
clear;

pkg load communications

P = [1 0 1; 
     1 1 1;
     1 1 0];
     
     
D = [0 1 1;
    0 0 1;
    0 1 1;
    0 1 1;
    1 0 0; 
    1 0 1;
    1 1 1;
    1 1 1];

e = [ 0 1 1 0 0 0;  
      0 1 0 0 0 0;  
      0 0 1 0 0 0;  
      0 0 0 1 0 0;  
      0 0 0 0 1 0;  
      0 0 0 0 0 1;  
      0 0 0 0 1 0;  
      0 0 0 1 0 0;];


C = encoder(P, D)
R = dmc(C, e)
[C_decoded, S, errors, D_decoded] = decoder(P, R)