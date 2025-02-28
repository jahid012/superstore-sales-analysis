-- RFM Segmentation

SELECT * FROM salesdata.salesdata;

SELECT 
    Customer_ID, 
    MAX(Order_Date) AS Last_Purchase_Date,  -- Recency
    COUNT(Order_ID) AS Purchase_Frequency,  -- Frequency
    SUM(Sales) AS Monetary_Value             -- Monetary
FROM SalesData
GROUP BY Customer_ID;

SELECT 
    Customer_ID, 
    DATEDIFF(NOW(), MAX(Order_Date)) AS Recency,  
    COUNT(Order_ID) AS Frequency,  
    SUM(Sales) AS Monetary,  
    NTILE(4) OVER (ORDER BY DATEDIFF(NOW(), MAX(Order_Date)) ASC) AS R_Score,
    NTILE(4) OVER (ORDER BY COUNT(Order_ID) DESC) AS F_Score,
    NTILE(4) OVER (ORDER BY SUM(Sales) DESC) AS M_Score
FROM SalesData
GROUP BY Customer_ID;

SELECT 
    Customer_ID,
    R_Score, F_Score, M_Score,
    CASE 
        WHEN R_Score = 1 AND F_Score = 1 AND M_Score = 1 THEN 'VIP'
        WHEN R_Score <= 2 AND F_Score >= 3 THEN 'Loyal'
        WHEN R_Score >= 3 AND F_Score = 1 THEN 'Big Spender'
        WHEN R_Score = 4 AND F_Score = 4 THEN 'Churned'
        ELSE 'Regular'
    END AS Customer_Category
FROM (
    SELECT 
        Customer_ID, 
        NTILE(4) OVER (ORDER BY DATEDIFF(NOW(), MAX(Order_Date)) ASC) AS R_Score,
        NTILE(4) OVER (ORDER BY COUNT(Order_ID) DESC) AS F_Score,
        NTILE(4) OVER (ORDER BY SUM(Sales) DESC) AS M_Score
    FROM SalesData
    GROUP BY Customer_ID
) AS RFM_Scores;




