-- Explore and Clean the Data

SELECT * FROM salesdata.salesdata;

SELECT 
    *
FROM
    SalesData
WHERE
    Order_Priority IS NULL
        OR Discount IS NULL
        OR Customer_Name IS NULL
        OR Product_Name IS NULL;
    
SELECT 
    Order_ID, COUNT(*)
FROM
    SalesData
GROUP BY Order_ID
HAVING COUNT(*) > 1

SET SQL_SAFE_UPDATES = 0;

UPDATE SalesData 
SET Order_Date = STR_TO_DATE(Order_Date, '%m/%d/%Y'),
    Ship_Date = STR_TO_DATE(Ship_Date, '%m/%d/%Y');

