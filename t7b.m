clc 
clear all;
num=[1 0.3 0 0.9];
den=[9 0.5 0.6 0.7];
figure(1)
zplane(num,den); 
[h,t]=impz(num,den, 100); 
figure(2) 
stem(h); 
