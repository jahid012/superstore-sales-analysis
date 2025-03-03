-- Exploratory Data Analysis (EDA)

SELECT * FROM superstore_sales.sales;


-- Total Sales and Profit
SELECT SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit 
FROM sales;

--  Top 5 Sold Products
SELECT Product_Name, SUM(Quantity_ordered_new) AS Total_Quantity
FROM sales
GROUP BY Product_Name
ORDER BY Total_Quantity DESC
LIMIT 5;

-- Customer Segments Distribution
SELECT Customer_Segment, COUNT(*) AS Customer_Count
FROM sales
GROUP BY Customer_Segment;




