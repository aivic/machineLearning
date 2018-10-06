# -------------------------------------------------------------------
## Required Libraries
# -------------------------------------------------------------------
library(datasets)
library(ggplot2)
library(ggfortify)
library(timeSeries)
library(MASS)
library(zoo)
library(fma)
library(TTR)
library(forecast)
library(Metrics)
library(pracma)
library(tseries)
library(stats)


# -------------------------------------------------------------------
## Time-Series (TS) data and Identically and Independent Data (IID)
# -------------------------------------------------------------------

# TS data
AirPassengers
autoplot(as.timeSeries(AirPassengers),
         ts.colour = "dodgerblue3",
         main = "Air Passengers Data",
         xlab = "Jan 1949 to Dec 1960",
         ylab = "Frequency of Passengers") 

# IID
ggplot(Cars93, aes(x = as.integer(row.names(Cars93)))) +
  geom_line(aes(y = Cars93$Min.Price), colour = "blue") +
  geom_line(aes(y = Cars93$Max.Price), colour = "green") +
  ylab(label = "Min and Max Price") +
  xlab(label = "index of Cars93 data") +
  labs(title = "Min and Max Price of Cars93 dataset")
  

# -------------------------------------------------------------------
## Converting some data into TS data
# -------------------------------------------------------------------

dates <- seq(as.Date("2018/1/1"), as.Date("2018/1/10"), "day")
values <- as.vector(floor(runif(10, 1, 500)))

# Forming a zoo object
zoo_object <- zoo(values, order.by = as.Date(dates))
class(zoo_object)

# Converting zoo object into TS
ts_data <- ts(zoo_object)
class(ts_data)

# -------------------------------------------------------------------
## Components of TS data
# -------------------------------------------------------------------

# Trend
autoplot(decompose(AirPassengers)$trend,
         ts.colour = "dodgerblue3",
         main = "Air Passengers Trend",
         xlab = "Jan 1949 to Dec 1960",
         ylab = "Frequency of Passengers") 

autoplot(decompose(hsales)$trend,
         ts.colour = "dodgerblue3",
         main = "House Sales Data",
         xlab = "Jan 1973 to Nov 1995",
         ylab = "Monthly housing sales") 

# Seasonal
autoplot(decompose(AirPassengers)$seasonal,
         ts.colour = "dodgerblue3",
         main = "Air Passengers Seasonality",
         xlab = "Jan 1949 to Dec 1960",
         ylab = "Frequency of Passengers") 

# Cyclic
autoplot(ts(hsales),
         ts.colour = "dodgerblue3",
         main = "House Sales Data",
         xlab = "Jan 1973 to Nov 1995",
         ylab = "Monthly housing sales") 

# Random/Noisy walk (remainder)
autoplot(decompose(hsales),
         ts.colour = "dodgerblue3",
         main = "House Sales Data",
         xlab = "Jan 1973 to Nov 1995",
         ylab = "Monthly housing sales") 


# -------------------------------------------------------------------
## Decomposition of TS data
# -------------------------------------------------------------------

## Additive Model and deseasonalized data ---------------------------

# Converting AirPassengers Data into yearly format
AP <- ts(AirPassengers[1:132],       # not considering values for year 1960
         frequency = 12)             # Yearly format

# Decomposing the TS data
decomposedAP <- decompose(AP, 
                          type = "additive")
summary(decomposedAP)

decomposedAP$trend                  # Gives trend values
decomposedAP$seasonal               # Gives seasonal values per value
decomposedAP$figure                 # Gives overall seasonal value

# Deseasonalized data
deseasonalized_data <- AirPassengers - decomposedAP$figure

# Original TS Data
autoplot(as.timeSeries(AirPassengers),
         ts.colour = "dodgerblue3",
         main = "Air Passengers Data",
         xlab = "Jan 1949 to Dec 1960",
         ylab = "Frequency of Passengers") 

# De-Seasonalized Additive TS Data
autoplot(as.timeSeries(deseasonalized_data),
         ts.colour = "dodgerblue3",
         main = "Air Passengers Data",
         xlab = "Jan 1949 to Dec 1960",
         ylab = "Frequency of Passengers") 


## Multiplicative Model and deseasonalized data ---------------------------

# Decomposing the TS data
decomposedAP <- decompose(AP, 
                          type = "multiplicative")
summary(decomposedAP)

decomposedAP$trend                  # Gives trend values
decomposedAP$seasonal               # Gives seasonal values per value
decomposedAP$figure                 # Gives overall seasonal value

# Deseasonalized data
deseasonalized_data <- AirPassengers / decomposedAP$figure

# Original TS Data
autoplot(as.timeSeries(AirPassengers),
         ts.colour = "dodgerblue3",
         main = "Air Passengers Data",
         xlab = "Jan 1949 to Dec 1960",
         ylab = "Frequency of Passengers") 

# De-Seasonalized Multiplicative TS Data
autoplot(as.timeSeries(deseasonalized_data),
         ts.colour = "dodgerblue3",
         main = "Air Passengers Data",
         xlab = "Jan 1949 to Dec 1960",
         ylab = "Frequency of Passengers")

# It can be inferred from the above graph that there are much more variations in Multiplicative
# model as compared to additive model for Air Passengers Dataset which can be verified by even
# visualizing original Air Passenger TS data where sesonality is increasing relatively higher from
# its previous value.


# -------------------------------------------------------------------
## Smoothing TS data
# -------------------------------------------------------------------

## Simple Moving Averages -------------------------------------------

AP <- ts(AirPassengers, frequency = 1)
TrendPattern <- SMA(AP, n = 4)                # try for n = 8

autoplot(AP,
         main = "SMA and Annual Trend",
         xlab = "Jan 1949 to Dec 1960",
         ylab = "Frequency of Passengers") +
  geom_line(aes(y = TrendPattern), colour = "green")

# Under-smoothning <- with lower values of n
# Over-smoothning <- with higher values of n


## Centered Moving Averages -------------------------------------------

CMA <- function(TS_val, n){
  filter(TS_val, rep(1/n,n), sides = 2)
}

TrendPattern <- CMA(AirPassengers[1:12], 2); TrendPattern       # try with n = 3, 4, 5

AP <- ts(AirPassengers[1:12], frequency = 12)
autoplot(AP,
         main = "CMA",
         xlab = "Jan 1949 to Dec 1960",
         ylab = "Frequency of Passengers") +
  geom_line(aes(y = TrendPattern), colour = "green")



## Exponential Smoothing -------------------------------------------

for (temp in c(1:12)) {
  pred_val <- ses(AirPassengers[1:temp], 
                  h = 1,                                   # Number of periods
                  initial = "simple",                      # Simple/Optimal
                  alpha = 0.2)                             # Alpha parameter
}
pred_val$fitted                                            # Smoothed TS

# Estimating best value of alpha - by least MSE

for (temp in c(1:9)) {
  pred_val <- ses(AirPassengers[1:131], 
                  h = 1,              
                  initial = "simple", 
                  alpha = temp/10)    
  pred_val <- as.data.frame(pred_val)
  print(mse(AirPassengers[132], pred_val[,1]))             # Least value of MSE is revealed at alpha = 0.5
}

# Direct method for in-depth (higher decimal) values of alpha

optimal_alpha <- function(x) {
  pred_val <- ses(AirPassengers[1:131], 
                  h = 1,              
                  initial = "simple", 
                  alpha = x)    
  pred_val <- as.data.frame(pred_val)
  return(mse(AirPassengers[132], pred_val[,1]))             
}

optimal_value <- fminbnd(optimal_alpha, 0, 1)
optimal_value$xmin                                    # Least value of MSE is revealed at alpha = 0.5104932

# Checking the MSE with new alpha

pred_val <- ses(AirPassengers[1:131], 
                h = 1,              
                initial = "simple", 
                alpha = optimal_value$xmin)    
pred_val <- as.data.frame(pred_val)
print(mse(AirPassengers[132], pred_val[,1]))


# -------------------------------------------------------------------
## Stationary TS data
# -------------------------------------------------------------------

# Use differencing to make a non-stationary TS into stationary one
# Diff(1) = TS[n] - TS[n-1]  |   Diff(2) = Diff(1)[n] - Diff(1)[n-1]

# Another term - Lag (delay in TS)
# Lag(1) = TS[n] - TS[n-1]   |   Lag(2) = TS[n] - TS[n-2]

AP <- AirPassengers[1:12]; AP          # original TS
diff(AP, differences = 1)              # Diff(1)
diff(AP, differences = 2)              # Diff(2)
diff(AP, lag = 1)                      # Lag(1) = Diff(1) {Always}
diff(AP, lag = 2)                      # Lag(2)

# If we differentiate the AirPassengers Data, its Trend will be lost and mean becomes constant
# Also, by taking the log of original data we can also make its variance constant.

autoplot(diff(log(AirPassengers)),
         ts.colour = "dodgerblue3",
         main = "I(1) of log(AirPassengers)",
         xlab = "Jan 1949 to Dec 1960",
         ylab = "Frequency of Passengers")

## Checking Stationarity of a TS using 
#Dickey-Fuller Test -----------------------

adf.test(hsales, alternative = "stationary")  # try with diff(log(AirPassengers))
# Since the p value is 0.01247 which is less than 0.05. Hence, TS is stationary.


# -------------------------------------------------------------------
## Auto-Regressive Model 
# -------------------------------------------------------------------

hsales_ar <- ar(hsales[1:252],          # Last two year values excluded
                order = 1)
predict(hsales_ar, 
        n.ahead = 12)                   # Yearly


# -------------------------------------------------------------------
## ACF and PACF
# -------------------------------------------------------------------

## ACF --------------------------------------------------------------

# Values gradually decay towards zero. Hence, stationary Series and TS not suitable for MA model
autoplot(acf(hsales[1:252]),
         ts.colour = "dodgerblue3",
         main = "ACF of HSales",
         xlab = "Lag",
         ylab = "ACF")

# Values doesn't decay towards zero. Hence, non-stationary series
autoplot(acf(log(AirPassengers[1:132])),
         ts.colour = "dodgerblue3",
         main = "ACF of log(AirPassengers)",
         xlab = "Lag",
         ylab = "ACF")

# -----------Differenciating above series to make it Stationary -----------------

# Values abrubptly decay towards zero after Lag 1. 
# Hence, stationary Series and suitable for MA(1) model. 

autoplot(acf(diff(log(AirPassengers[1:132]))),
         ts.colour = "dodgerblue3",
         main = "ACF of diff(log(AirPassengers))",
         xlab = "Lag",
         ylab = "ACF")

## PACF -------------------------------------------------------------------------

# Values abrubptly decay towards zero after Lag 2 or 3. 
# Hence, stationary Series and suitable for AR(2) or AR(3) model. 
autoplot(pacf(hsales[1:252]),
         ts.colour = "dodgerblue3",
         main = "PACF of HSales",
         xlab = "Lag",
         ylab = "PACF")

# Another example

# Values abrubptly decay towards zero after Lag 1 or 2. 
# Hence, stationary Series and suitable for AR(1) or AR(2) model. 
autoplot(pacf(diff(log(AirPassengers[1:132]))),
         ts.colour = "dodgerblue3",
         main = "PACF of diff(log(AirPassengers))",
         xlab = "Lag",
         ylab = "PACF")



# -------------------------------------------------------------------
## ARIMA Model
# -------------------------------------------------------------------

## Removing seasonality and trend
seasonal_diff <- diff(ts(log(AirPassengers), frequency = 12), 12)
seasonal_diff <- diff(seasonal_diff, 1)   # To remove trend completely
autoplot(seasonal_diff,
         ts.colour = "dodgerblue3",
         main = "I(1) of log(AirPassengers)",
         xlab = "Jan 1949 to Dec 1960",
         ylab = "Frequency of Passengers")

## ACF and PACF

# Right after lag 1 values went abruptly towards zero. 
# Hence considering MA(1) model.
autoplot(acf(seasonal_diff),
         ts.colour = "dodgerblue3",
         main = "ACF",
         xlab = "Lag",
         ylab = "ACF")

# After Lag 1 values abruptly goes towards zero. 
# Hence, considering AR(1) model.
autoplot(pacf(seasonal_diff),
         ts.colour = "dodgerblue3",
         main = "PACF",
         xlab = "Lag",
         ylab = "PACF")


## Building ARIMA Model (using by default function)
fit <- auto.arima(seasonal_diff)
fit

## Predicting values for year 1960
fit <- arima(log(AirPassengers[1:132]),
             order = c(1, 1, 1),
             seasonal = list(order = c(0, 1, 1),
                             period = 12))

pred_val <- exp(predict(fit, n.ahead = 12)$pred)
pred_val

## MSE
mse(AirPassengers[133:144], pred_val)

## Checking coefficients Confidence interval

# If the values crosses zero, then those coefficients are neglected
confint(fit)
# Only SMA model has coefficient with same polarity. Hence, it is to be kept, rest to be neglected.
# Add a new argument fixed = c(0, 0, NA) in fit and make new model.

# To find AIC use -> AIC(fit)


