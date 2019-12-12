clear all
close all
clc
%Initializes the vectors and matrices we will need.
%Creates the matrix x according to the guidelines.
N = 256;

x1=zeros(1,N+1);
for i=0:N
    x1(i+1) = (-20 + (i/256)*40);
end

x2 = zeros(1,N+1);
for j=0:N
    x2(j+1) = (-20 + (j/256)*40);
end

S=zeros(N+1,N+1); %Will store the values for S(x_ij,t).
t=5;
for i = 1:N+1
    for j = 1:N+1
        x = [x1(i) ; x2(j)];
        S(i,j) = computeS(x,t);
    end
end

%Plots X1,X2, and S.
[X1,X2] = meshgrid(x1,x2);
pcolor(X1,X2,S); shading interp; hold on; contour(X1,X2,S, 'color', 'black');