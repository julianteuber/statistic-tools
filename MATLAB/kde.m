function [f,xi] = kde(x,bw,pts)
%kde calculates the porbability density estimate of vector x
%   The probability estimate f is calculated using kernel density estimation
%   at pts equally spaced points xi with the bandwidth bw.
%   calculated points over the range of x times 2*bw

kernel = @(x) (1/sqrt(2*pi))*exp(-(1/2)*x^2);

% calculation of three-sigma interval
ximin = min(x)-3*sqrt(bw);
ximax = max(x)+3*sqrt(bw);

% equally spaced output vector
xi = linspace(ximin,ximax,pts);

% preallocation of density estimate
f = zeros(size(xi));
sumKernel = 0;

for i = 1:length(xi)
    for j = 1:length(x)
        sumKernel = sumKernel + kernel((xi(i)-x(j))/bw);
    end
    f(i) = sumKernel;
    sumKernel = 0;
end
f = f./(bw*length(x));

end