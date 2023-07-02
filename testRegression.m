x = [1 2 3 4 5 6 7 8];
y = [1 8 27 64 125 216 350 560];
s0 = length(x); s1 = sum(x); s2 = sum(x.^2);
s3 = sum(x.^3); s4 = sum(x.^4);
A = [s4 s3 s2; s3 s2 s1; s2 s1 s0];
b = [sum(x.^2.*y); sum(x.*y);sum(y)];
c0 = A\b;
c = polyfit(x,y,2); % Find a regression polynomial that matches the data
c0 % Returns the calculated coefficient
c % Returns the coefficient found by polyfit
xx = 1:0.1:8;
yy = polyval(c0,xx);
plot(x,y,'o',xx,yy)