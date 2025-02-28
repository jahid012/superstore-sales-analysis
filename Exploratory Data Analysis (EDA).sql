-- Exploratory Data Analysis (EDA)

SELECT * FROM salesdata.salesdata;


-- Total Sales and Profit
SELECT SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit 
FROM SalesData;

--  Top 5 Sold Products
SELECT Product_Name, SUM(Quantity_ordered_new) AS Total_Quantity
FROM SalesData
GROUP BY Product_Name
ORDER BY Total_Quantity DESC
LIMIT 5;

-- Customer Segments Distribution
SELECT Customer_Segment, COUNT(*) AS Customer_Count
FROM SalesData
GROUP BY Customer_Segment;




