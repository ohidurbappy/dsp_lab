%Unit impulse sequence d(n + 1) 
clc;
clear all;
nl=-3; 
n2=3;
n=nl:n2;
n0=-1; 
x1=((n-n0)==0); 
stem(n,x1);
