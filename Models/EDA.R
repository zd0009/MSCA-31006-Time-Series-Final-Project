library(forecast)
library(tseries)
library(plyr)
library(readr)
library(readxl)
library(fpp)
library(TSA)

setwd("C:/Users/luiseduardo/OneDrive/Documentos/MScA/5. Time Series/Final Project")

rides = read.csv("RidershipTS.csv")
weather = read.csv("weather_final.csv")

# Rides

rides$Date = as.Date(rides$Date, format = "%m/%d/%Y")

rides_ts = ts(rides$number_of_trips)
tsdisplay(rides_ts) # Very clear seasonality, likely weekly

rides_ts_diff1 = diff(rides_ts, lag = 7)
tsdisplay(rides_ts_diff1) # Improves seasonality a lot



# Weather

weather$DATE = as.Date(weather$DATE, format = "%Y/%m/%d")

temp_ts = ts(weather$Daily.Avg.Temperature)
tsdisplay(temp_ts) # no apparent seasonality or trend (less than yearly)

prec_ts = ts(weather$Daily.Total.Precipitation)
tsdisplay(prec_ts) # no apparent seasonality or trend (less than yearly)

wind_ts = ts(weather$Daily.Avg.WindSpeed)
tsdisplay(wind_ts) # no apparent seasonality or trend (less than yearly)