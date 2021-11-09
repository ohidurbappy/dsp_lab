%Calculating the quantization error

clc;
close all;
clear all;
t=0:.001:.1;
y=sin(2*pi*10*t)+sin(2*pi*50*t)+sin(2*pi*100*t);
Fs=250;
i=1;
for j=1:round((length(t)-1)/((max(t)-min (t))*Fs)):length(t)
    ts(i)=t(j);
    ys(i)=y(j);
    i=i+1;
end

c=[3,4,6];
for w=1:3
    b=c(w);
    L=2^b;
    del =(max(ys)-min(ys))/(L-1);
    for i=1:L
        l(i)=min(ys)+del*(i-1);
    end

    yq= ys;
    for i=1:length(1)-1
        temp=yq>l(i) & yq<l(i+1) & abs(yq-l(i))<abs(yq-l(i+1));
        yq(temp)=l(i); 
        temp=yq>l(i) & yq<l(i+1) & abs(yq-l(i))<abs(yq-l(i+1));
        yq(temp)=l(i+1);
    end

    QNP(w)= sum((yq-ys).^2)/(length(ts)-1);
    SP(w)= sum(y.^2)/(length(t)-1);
    SQNR=SP./QNP;
    SQNR
    SQNRdB_A=10*log10(SQNR);
    SQNRdB_B(w)=1.76+6*b;

    for p=1:length(t) 
        yr(p)=interp1(ts,yq,t(p));
    end
end
subplot (2,1,1), plot (c,SQNRdB_A) 
title('SQNR using eqn.A') 
subplot(2,1,2),plot(c,SQNRdB_B) 
title('SQNR using eqn.B')