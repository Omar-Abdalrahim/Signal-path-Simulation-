r = randi([0 1],1,10);
seq='';
for i=1:length(r)
    seq=seq+string(r(i));
end;
Ts=20;
amp=5;
t=1:1:200;
y=repelem(r,20);

figure(1);
y_unipolar=amp*y;
plot(t,y_unipolar);
xlabel("Time (sec)");
ylabel("Amplitude");
title("NRZ Unipolar line coding")
legend(seq);

figure(2);
y_polar=y;
y_polar(find(y==1))=(amp/2);
y_polar(find(y==0))=(-amp/2);
plot(t,y_polar);
xlabel("Time (sec)");
ylabel("Amplitude");
title("NRZ polar line coding")
legend(seq);

figure(3);
f=true;
rnew=r;
for i=1:length(r)
    if (r(i)==1 && f==true)
       rnew(i)=amp;
       f=false;
    else
        if(r(i)==1 && f==false)
           rnew(i)=-amp;
           f=true;
        end   
    end
end
y_Bipolar=repelem(rnew,20);
plot(t,y_Bipolar);
xlabel("Time (sec)");
ylabel("Amplitude");
title("NRZ Bipolar line coding")
legend(seq);
