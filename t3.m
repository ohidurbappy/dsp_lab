%Experiment Name: Encoding the quantized signal

clc;
close all;
clear all;

t=0:.0001:.1;
y=sin(2*pi*10*t)+sin(2*pi*50*t)+sin(2*pi*100*t);

subplot(2,2,1),plot(t,y);
title('Analog signal');

Fs=500;
i=1;
for j=1:round((length(t)-1)/((max(t)-min (t))*Fs)):length(t)
    ts(i)=t(j);
    ys(i)=y(j);
    i=i+1;
end

B=[3,4,6]; %Done for 3 different bits
for w=1:3
    b=B(w);
    L=2^b;
    del =(max(ys)-min(ys))/(L-1);
    for i=1:L
        l(i)=min(ys)+del *(i-1);
    end
    yq=ys;
    for i=1:length(1)-1
        temp=yq>l(i) & yq<l(i+1) & abs(yq-l(i))<abs(yq-l(i+1));
        yu(temp)=l(i); 
        temp=yq>l(i) & yq<l(i+1) & abs(yq-l(i))<abs(yq-l(i+1)); 
        yq(temp)=l(i+1);
    end

    for z=1:length(yq)
        ye(z)=round((yq(z)-min(yq))/del);
    end

    if w==1 
        encoded_3=dec2bin(ye);
    elseif w==2 
        encoded_4=dec2bin(ye); 
    else
        encoded_6=dec2bin(ye);
    end

subplot(2,2,w+1), stairs(ts,ye); 
title(['Quantized Bits:', num2str(B(w))]);

end

display(encoded_3);

display(encoded_4);

display(encoded_6);


