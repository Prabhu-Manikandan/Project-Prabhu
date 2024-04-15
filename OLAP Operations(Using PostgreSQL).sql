-- create table names as sales_sample
CREATE TABLE sales_sample(Product_Id Int PRIMARY KEY,Region Varchar(50),Date Date,Sales_Amount int);

-- Inserting sample records
INSERT INTO sales_sample VALUES
(101,'East','2024-01-28',20000),
(102,'West','2024-05-20',45000),
(103,'East','2024-02-10',100000),
(104,'South','2023-12-03',50000),
(105,'North','2022-10-25',75000),
(106,'East','2020-12-12',10000),
(107,'West','2024-10-10',250000),
(108,'North','2022-02-23',2000),
(109,'South','2023-03-30',5000),
(110,'West','2021-05-17',15000);

-- Perform Drill-Down operation
SELECT Region,Product_Id,Date,Sum(Sales_Amount) As Total_Sales
FROM sales_sample
GROUP BY Region,Product_Id
ORDER BY Region, Total_Sales DESC;

-- Perform Roll-Up Operation:
SELECT Region, SUM(Sales_Amount) As Total_Sales
from sales_sample
GROUP BY ROLLUP(Region)
ORDER BY Region;

-- Perform Cube Operation:
SELECT Product_Id,Region,Date
from sales_sample
GROUP BY CUBE(Product_Id,Region,Date);

-- Perform Slice Operation:
SELECT Region,Date,SUM(Sales_Amount) As Total_Sales
from sales_sample
WHERE Region = 'South'
GROUP BY Region,Date
ORDER BY Date;

-- Perform Dice Operation:
SELECT * FROM sales_sample
WHERE Product_Id = 104
AND Region = 'South'
AND Date = '2023-12-03';

SELECT Region,Product_ID,Date,SUM(Sales_Amount) As Total_Sales
from sales_sample
WHERE Region = 'East' AND Date BETWEEN '2021-01-01' AND '2024-12-30'
GROUP BY Region,Product_Id,Date
ORDER BY DATE;






