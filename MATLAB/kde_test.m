clear all; close all; clc;

bw = 0.75;
pts = 1000;

% random variable with probability density with two peaks
s = [randn(1,1000) (randn(1,1000)+10)*0.5];

% calculation of three-sigma interval
ximin = min(s)-3*sqrt(bw);
ximax = max(s)+3*sqrt(bw);

[f_my,xi_my] = kde(s,bw,pts);
[f_na,xi_na] = ksdensity(s,linspace(ximin,ximax,1000));

F_my = cumsum(f_my)*(max(xi_my)-min(xi_my))/length(xi_my);
F_na = cumsum(f_na)*(max(xi_na)-min(xi_na))/length(xi_na);

subplot(2,1,1)
plot(xi_my,f_my,xi_na,f_na);hold on;
histogram(s,50,'Normalization','pdf');
legend('my kde','matlab kde','histogram');

subplot(2,1,2)
plot(xi_my,F_my,xi_na,F_na);
legend('my kde','matlab kde');