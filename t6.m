clc;
clear all;
close all; 
T=2e-3; 
tstep=T/100; 
t=tstep:tstep:3*T; 
x=2*sin(2*pi*t/T);
Px=sum(x.^2)/length(x); 
SNR=-10; 
Py=Px/10^(SNR/10);
n=sqrt(Py)*randn(1,length(t)); 
y=x+n; ACF_x=normalize(xcorr(x)); 
ACF_n=normalize(xcorr(n)); 
ACF_y=normalize(xcorr(y)); 
ACF_y(length(x))=.4*max(ACF_y); 
figure(1) 
subplot(211);
plot(t,x) 
subplot(212);
plot(t,n) 
figure(2) 
subplot(221);
plot(tstep*(1:length(ACF_x)),ACF_x) 
subplot(222); 
plot(tstep*(1:length(ACF_y)),ACF_y) 

hold on 
