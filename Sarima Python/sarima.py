import pandas as pd
import matplotlib.pyplot as plt
from statsmodels.tsa.statespace.sarimax import SARIMAX

# Load the temperature data
data = pd.read_csv('DataMonthly.csv')
temperatureData = data["Temp"]

# Split the data into training and test sets
trainData = temperatureData[:-12]  # Use all but the last year for training
testData = temperatureData[-12:]  # Use the last year for testing

# Fit the SARIMA model
model = SARIMAX(trainData, order=(1, 1, 0), seasonal_order=(1, 1, 0, 12))
model_fit = model.fit()

# Forecast future values
numForecastSteps = len(testData)
forecastedValues = model_fit.forecast(steps=numForecastSteps)

# Evaluate the model
mse = ((forecastedValues - testData) ** 2).mean()
rmse = mse ** 0.5

# Plot the forecasted values
plt.plot(trainData, label='Training Data')
plt.plot(testData, label='Test Data')
plt.plot(testData.index, forecastedValues, label='Forecasted Values')
plt.xlabel('Time')
plt.ylabel('Temperature')
plt.title('Temperature Forecast')
plt.legend()
plt.show()

plt.savefig('forecast_plot.png')

print('RMSE:', rmse)
