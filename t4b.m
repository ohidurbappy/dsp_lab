%Unit impulse sequence u(n + 1) 
clc; 
clear all; 
nl=-3; 
n2=3;
n=nl:n2; 
n0=-1; 
xl=((n-n0)>=0); 
stem(n,xl); 
