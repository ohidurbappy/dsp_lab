clc 
clear all;
num1=[ 1 1 0];
den1=[ 1.5 -1.25 1.25];
figure(1) 
zplane(num1,den1);
[h,t]=impz(num1,den1,100); 
figure(2) 
stem(h) 
num2=[ 1 1 0]; 
den2=[ 1.5 -1.5 1.5]; 
figure(3) 
zplane(num2,den2); 
[h,t]=impz(num2,den2,100); 
figure(4) 
stem(h); 
num3=[ 1 1 0]; 
den3=[ 1.85 -1.25 2.15]; 
figure(5) 
zplane(num3,den3); 
[h,t]=impz(num3,den3,100); 
figure(6) 
stem(h); 
