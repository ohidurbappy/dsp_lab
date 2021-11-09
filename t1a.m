clc;
close all;
clear all;
t=0:.005:.2;
length(t)
xa=sin(2*pi*10*t);
subplot(2,3,1),plot(t, xa);
title('Analog Signal');
F=[10 20 22 50 30];
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

    subplot(2,3,i+1), plot(Ts,xs);
    title(['Sampled Frequency: ',num2str(F(i)), 'Hz']);

end
