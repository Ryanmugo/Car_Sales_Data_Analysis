
---                                                         CAR SALES PROJECT                                                                       ---


  -- Car Manufacturer with the HIGHEST AVERAGE HORSEPOWER across all models

SELECT  Manufacturer, AVG(TRY_CAST(Horsepower AS DECIMAL)) AS HIGHESTAVGHORSEPOWER, SUM(CAST(Sales_in_thousands AS DECIMAL)) AS TotalSales
FROM [Car_Sales].[dbo].[Car_sales]
GROUP BY Manufacturer
ORDER BY TotalSales DESC

-- Vehicle Types among different manufacturers

SELECT Manufacturer,Vehicle_type, COUNT(*) AS TotalCars, SUM(TRY_CAST(Sales_in_thousands AS DECIMAL)) AS TotalSales
FROM [Car_Sales].[dbo].[Car_sales]
GROUP BY Manufacturer,Vehicle_type


-- Relationship Between Engine Size and Average Sales for each manufacturer

SELECT Manufacturer, AVG(TRY_CAST(Engine_size AS DECIMAL)) AS AVERAGEENGINESIZE, AVG(TRY_CAST(Horsepower AS DECIMAL)) AS AVERAGEHORSEPOWER, SUM(TRY_CAST(Sales_in_thousands AS DECIMAL)) AS TotalSales
FROM [Car_Sales].[dbo].[Car_sales]
GROUP BY Manufacturer
ORDER BY TotalSales DESC

-- HOW DOES FUEL EFFICIENCY IMPACT SALES PERFORMANCE OF DIFFERENT CAR MANUFACTURERS??

SELECT Manufacturer,AVG(TRY_CAST(Fuel_efficiency AS DECIMAL)) AS FUELEFFICIENCY, SUM(TRY_CAST(Sales_in_thousands AS DECIMAL)) AS TOTALSALES
FROM [Car_Sales].[dbo].[Car_sales]
GROUP BY Manufacturer
ORDER BY TOTALSALES DESC

-- WHAT IS THE TREND IN THE NO. OF CAR MODELS LAUNCHED EACH YEAR? IS THERE A CORRELATION BETWEEN NUMBER OF MODELS LAUNCHED AND TOTAL SALES??

SELECT YEAR(Latest_Launch) as LaunchYear, COUNT(*) AS TotalModelsLaunched, SUM(TRY_CAST(Sales_in_thousands AS DECIMAL)) AS TotalSales
FROM [Car_Sales].[dbo].[Car_sales]
GROUP BY YEAR(Latest_Launch)
ORDER BY LaunchYear

-- ARE THERE ANY OUTLIERS IN TERMS OF POWER PERFORMANCE FACTOR AMONG DIFFERENT CAR MANUFACTURERS? HOW DO THESE OUTLIERS PERFORM IN TERMS OF SALES

SELECT Manufacturer, AVG(TRY_CAST(Power_perf_factor AS DECIMAL)) AS AVGPOWERPERFORMANCE, SUM(TRY_CAST(Sales_in_thousands AS DECIMAL)) AS TOTALSALES
FROM [Car_Sales].[dbo].[Car_sales]
GROUP BY Manufacturer
ORDER BY TOTALSALES DESC

-- CAR MODELS THAT HAVE THE HIGHEST AVERAGE SALES VALUES

SELECT TOP 10 Manufacturer, Model, AVG(TRY_CAST(Sales_in_thousands AS DECIMAL)) AS HIGHAVERAGESALES
FROM [Car_Sales].[dbo].[Car_sales]
GROUP BY Manufacturer,Model
ORDER BY HIGHAVERAGESALES DESC

-- CAR MODELS THAT HAVE THE LOWEST AVERAGE SALES VALUES

SELECT TOP 10 Manufacturer, Model, AVG(TRY_CAST(Sales_in_thousands AS DECIMAL)) AS HIGHAVERAGESALES
FROM [Car_Sales].[dbo].[Car_sales]
GROUP BY Manufacturer,Model
ORDER BY HIGHAVERAGESALES ASC

-- DISTRIBUTION OF SALES AMONG DIFFERENT MANUFACTURERS

SELECT Manufacturer, SUM(TRY_CAST(Sales_in_thousands AS DECIMAL)) AS TOTALSALES
FROM [Car_Sales].[dbo].[Car_sales]
GROUP BY Manufacturer
ORDER BY TOTALSALES DESC

-- ARE THERE ANY SEASONAL TRENDS IN CAR SALES BASED ON THE LAUNCH DATES OF MODELS? DOES SEASONALITY AFFECT SALES PERFORMANCE?

SELECT YEAR(Latest_Launch) AS LAUNCHDATE, SUM(TRY_CAST(Sales_in_thousands AS DECIMAL)) AS TOTALSALES
FROM [Car_Sales].[dbo].[Car_sales]
GROUP BY YEAR(Latest_Launch)
ORDER BY TOTALSALES 


-- HOW DO THE SALES PERFORMANCES OF MANUFACTURERS COMPARE IN TERMS OF THEIR CHEAPEST AND MOST EXPENSIVE MODELS??

--  TOP 10 EXPENSIVE CAR MODELS!!!! ---

SELECT TOP 10 Manufacturer, Model, AVG(TRY_CAST(Price_in_thousands AS DECIMAL)) AS PRICE, SUM(TRY_CAST(Sales_in_thousands AS DECIMAL)) AS TOTALSALES
FROM [Car_Sales].[dbo].[Car_sales]
GROUP BY Manufacturer, Model
ORDER BY PRICE DESC

-- TOP 10 CHEAPEST CAR MODELS!!! ---

SELECT TOP 10 Manufacturer, Model, AVG(TRY_CAST(Price_in_thousands AS DECIMAL)) AS PRICE, SUM(TRY_CAST(Sales_in_thousands AS DECIMAL)) AS TOTALSALES
FROM [Car_Sales].[dbo].[Car_sales]
GROUP BY Manufacturer, Model
ORDER BY PRICE ASC