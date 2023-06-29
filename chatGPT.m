n = 15;
X = 1:n;
Y = [234.503326, 237.906662, 237.470001, 249.366669, 244.483337, 230.5, 224.509995, 227, 223, 230.779999, 233.919998, 242.333328, 252.103333, 236.846664, 225.5];

Z = ones(n, 1);
V = ones(n, 1);

for i = 1:n
    for j = 1:n
        if j == i 
            continue;
        end
        Z(i) = Z(i) * (X(i) - X(j));
    end
end

x = 17;
px = 0;

for i = 1:n
    for j = 1:n
        if j == i
            continue;
        end
        V(i) = V(i) * (x - X(j));
    end
    V(i) = V(i) / Z(i);
    px = px + Y(i) * V(i);
end

 % Output the interpolated value
