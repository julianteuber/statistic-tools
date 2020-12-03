clear all; close all; clc;

s = [randn(1,1000) (randn(1,1000)+10)*0.5];

[f_my,xi_my] = kde(s,0.75,1000);
[f_na,xi_na] = ksdensity(s,linspace(min(s)*2,max(s)*2,1000));

F_my = cumsum(f_my)*(max(xi_my)-min(xi_my))/length(xi_my);
F_na = cumsum(f_na)*(max(xi_na)-min(xi_na))/length(xi_na);

subplot(2,1,1)
plot(xi_my,f_my,xi_na,f_na);hold on;
histogram(s,50,'Normalization','pdf');
legend('my kde','matlab kde','histogram');

subplot(2,1,2)
plot(xi_my,F_my,xi_na,F_na);
legend('my kde','matlab kde');

%% Second test
clc; clear all;
xmin = 5;
xmax = 10;
num = 9;
linSpaceTemp = zeros(num,1);

for I = 1:num
    linSpaceTemp(I) = xmin + (I - 1) * (xmax - xmin) / (num-1);
end
linSpaceTempRef = linspace(xmin,xmax,num);