clc;
clear all;
a=-7;
b=7;
larr=[2 4 8];
deltaarr=[];
s=a+(b-a)*rand(1,10000);
m=[];
vp=[];
v=[];
SQNR_p=[];
SQNR=[];
fprintf("samples"+'\n');
disp(s(1,1:6));
for k=1:3
    l=larr(k);
    delta=(max(s)-min(s))/l;
    %disp(delta);
    delatarr(k)=delta;
    st=-delta/2-(l/2-1)*(delta);
    arr=[];
    for i=1:l
        arr(i)=st;
        st=st+delta;
    end; 
   % disp(arr);
    snew=[];
    for i=1:numel(s)
        minimun=9;
        ans=0;
        for j=1:numel(arr)
            if(abs(s(i)-arr(j))<=minimun)
                minimun=abs(s(i)-arr(j));
                ans=arr(j);
            end;    
        end;
        snew(i)=ans;
    end; 
    fprintf("l="+larr(k)+'\n');
    disp(snew(1,1:6));
    m(k)=mean(abs(snew-s));
    vp(k)=var(s-snew);
    SQNR_p(k)=max(s)^2/vp(k);
end;
v= delatarr.^2/12;
SQNR=3*larr.^2;

figure(1);
stem(larr,m);
title("The mean absolute quantization error vs Number of Levels");
xlabel("Number of Levels");
ylabel("Mean absolute quantization error");
legend('The mean');

figure(2);
stem(larr,vp,'b');
title("The variance of the quantization error (Practical and Theoretical) vs the Number of levels");
xlabel("Number of Levels");
ylabel("Variance of the quantization error (Practical and Theoretical)");
hold on

stem(larr,v,'r');
legend('Practical var','Theoretical var');
hold off

figure(3);
stem(larr,SQNR_p,'b');
title("SQNR (Practical and Theoretical) vs the Number of levels");
xlabel("Number of Levels");
ylabel("SQNR (Practical and Theoretical)");
hold on

stem(larr,SQNR,'r');
legend('Practical SQNR','Theoretical SQNR');
