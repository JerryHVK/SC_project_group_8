data = csvread('tesla.csv');
n = 160;
X = data(1:n, 1);
Y = data(1:n, 6);


Z = ones(n,1);
V = ones(n, 1);

for i = [1:1:n]
    for j = [1:1:n]
        if j == i 
            continue;
        end
        Z(i) = Z(i)*( X(i) - X(j));
    end
end

x = n+1;

px = 0;

for i = [1:1:n]
    for j = [1:1:n]
        if j == i
            continue;
        end
        V(i) = V(i)*(x - X(j));
    end
    V(i) = V(i)/Z(i);
    px = px + Y(i)*V(i);
end

plot(X, Y, '-');


