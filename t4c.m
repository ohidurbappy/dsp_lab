clc;
clear all;
close all;
nl=-10;
n2=100;
n=nl:n2;
x=zeros(1,111);%length fo n=111 
n0=-2;
temp=((n-n0)>=0); 
x=(n-n0).*temp; 
stem(n,x); 
