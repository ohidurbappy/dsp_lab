% Uniform Quantization 
clc;
close all;
clear all;

t=0:.001:.1;
y=sin(2*pi*10*t)+sin(2*pi*50*t)+sin(2*pi*100*t);
subplot(1,4,1),plot(t,y); title('Analog signal');

Fs=250;
i=1;
for j=1:round((length(t)-1)/((max(t)-min (t)) *Fs)):length(t)
    ts(i)=t(j);
    ys(i)=y(j);
    i=i+1;
end

c=[3,4,6];

for w=1:3 
    b=c(w);
    L=2^b;
    del=(max(ys)-min(ys))/(L-1);

    for i=1:L
        l(i)= min(ys)+del*(i-1);
    end

    yq =ys;

    for i=1:length(1)-1
        temp=yq>l(i) & yq<l(i+1) & abs(yq-l(i))<abs(yq-l(i+1));
        yq(temp)=l(i);
        temp=yq>l(i) & yq<l(i+1) & abs(yq-l(i))<abs(yq-l(i+1));
        yq(temp)=l(i+1);
    end

    for p=1:length(t)
        yr(p)= interp1(ts,yq,t(p));
    end

    subplot(1,4,w+1), stem(t,yr);
    title(['Rec. Sig. for Quantized Bits:',num2str(b)]);
end

