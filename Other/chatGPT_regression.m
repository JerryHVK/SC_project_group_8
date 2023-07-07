data = csvread('tesla.csv');
n = 160;
X = data(1:n, 1);
Y = data(1:n, 6);


% Define the order of the polynomial for curve fitting
order = 3;

% Fit a polynomial regression model
coefficients = polyfit(X, Y, order);

% Define the x-values for extrapolation
x = n;

% Evaluate the polynomial at the extrapolation point
y = polyval(coefficients, x);

% Output the extrapolated value
y

% Plot the fitted polynomial curve
x_fit = linspace(min(X), max(X), 100);  % Generate x-values for the curve
y_fit = polyval(coefficients, x_fit);   % Evaluate the polynomial at the x-values
plot(x_fit, y_fit, 'r-', 'LineWidth', 2);

hold on;

% Plot the extrapolation point
plot(x, y, 'ko', 'MarkerFaceColor', 'g', 'MarkerSize', 8);

plot(X, Y, '-')