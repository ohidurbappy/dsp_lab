clc;
close all;
clear all;
t=0:.005:.2;
length(t)
xa=sin(2*pi*10*t);
subplot(2,3,1),plot(t, xa);
title('Analog Signal');
F=[10 20 22 50 100];
length(xa)
for i=1:5
    Fs=F(i);
    j=1;
    xs=[];
    Ts=[];
    for p=1:round((length(t)-1)/((max(t)-min(t))*Fs)):length(xa)
        xs(j)=xa(p);
        Ts(j)=t(p);
        j=j+1;
    end
    for p=1:length(t)
        xr(p)=interp1(Ts,xs,t(p));
    end
    subplot(2,3,i+1), stem(t,xr);
    title(['Sampled Frequency: ',num2str(F(i)), 'Hz']);

end
