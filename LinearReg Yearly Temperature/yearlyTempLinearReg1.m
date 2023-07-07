% Load data
yearlyTemp = readtable('yearlyTemp.csv');
temp = yearlyTemp.Anomaly_degC_;
y = temp(1:length(temp)-23);
x = 1:length(temp)-23;
timeData = 1850:2000;
timeForecast=2000:2023;
x_forecast = length(temp)-23:length(temp);
y_forecast_data = temp(length(temp)-23:length(temp));

% Perform linear regression
coefficients = polyfit(x, y, 1);   

% Extract the slope and intercept
slope = coefficients(1);
intercept = coefficients(2);

% Calculate the predicted values
y_predicted = polyval(coefficients, x);
y_forecast = polyval(coefficients, x_forecast);

% Plot the data and the regression line
plot(timeData, y, 'o');                    
hold on;
plot(timeData, y_predicted, 'r-');   % Regression line
plot(timeForecast, y_forecast_data, 'o');
plot(timeForecast, y_forecast, 'g-');
hold off;
grid on;

% Add labels and title to the plot
xlabel('Independent Variable (x)');
ylabel('Dependent Variable (y)');
title('Global Temperature');

% Display the slope and intercept
disp(['Slope: ', num2str(slope)]);
disp(['Intercept: ', num2str(intercept)]);
