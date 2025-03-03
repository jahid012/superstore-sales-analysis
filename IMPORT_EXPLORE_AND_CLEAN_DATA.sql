-- mysql --local-infile=1 -u root -p
-- LOAD DATA LOCAL INFILE 'C:\\Users\\JAHID\\Downloads\\sales.csv' 
-- INTO TABLE sales 
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"' 
-- LINES TERMINATED BY '\n' 
-- IGNORE 1 ROWS;


-- --------
USE superstore_sales;

-- ---------
-- CREATE A TABLE IN THE MYSQL SERVER TO IMPORT DATA
-- ---------
CREATE TABLE sales(
`Row ID` INT PRIMARY KEY,
`Order Priority` VARCHAR(30),
`Discount` DOUBLE(10,2),
`Unit Price` DOUBLE(10,2),
`Shipping Cost` DOUBLE(10,2),
`Customer ID` INT,
`Customer Name` VARCHAR(40),
`Ship Mode` VARCHAR(20),
`Customer Segment` VARCHAR(20),
`Product Category` VARCHAR(50),
`Product Sub-Category` VARCHAR(50),
`Product Container` VARCHAR(20),
`Product Name` VARCHAR(100),
`Product Base Margin` DOUBLE(10,5),
`Region` VARCHAR(30),
`Manager` VARCHAR(30),
`State or Province` VARCHAR(50),
`City` VARCHAR(30),
`Postal Code` VARCHAR(30),
`Order Date` VARCHAR(30),
`Ship Date` VARCHAR(30),
`Profit` DOUBLE(10,2),
`Quantity ordered new` INT,
`Sales` VARCHAR(30),
`Order ID` VARCHAR(30),
`Return Status` VARCHAR(30)
);

-- ------
-- CHECK THE ROW COUNT
-- ------
select count(*) as `Row Count` from sales;


--  Preview the First Few Rows

SELECT * FROM sales LIMIT 10;

-- Check for NULL or Missing Values

select * from sales WHERE
`Order ID` IS NULL OR
`Order Priority` IS NULL OR
`Discount` IS NULL OR
`Unit Price` IS NULL;

-- Check the table structure:

DESCRIBE sales;

-- Modify the date columns to the original datetime type

SELECT `Order Date`, `Ship Date` FROM sales;

SET SQL_SAFE_UPDATES = 0;
UPDATE sales SET `Ship Date` = DATE_ADD('1899-12-30', INTERVAL `Ship Date` DAY);
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE sales MODIFY COLUMN `Ship Date` DATE;
ALTER TABLE sales MODIFY COLUMN `Order Date` DATE;

-- Explanatory Analysis Recency (R), Frequency (F), Monetary (M)
SELECT 
	`Customer Name`,
    MAX(`Order Date`) as LAST_ORDER_DATE,
    datediff((SELECT MAX(`Order Date`) FROM sales), MAX(`Order Date`)) as RECENCY
FROM sales GROUP BY `Customer Name`
ORDER BY RECENCY DESC

