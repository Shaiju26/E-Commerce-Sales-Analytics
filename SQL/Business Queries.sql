/*============================================================
 Project: E-Commerce Sales Analytics
 File: 02_business_queries.sql
 Description: Business Analysis Queries
=============================================================*/

-------------------------------------------------------------
-- Total Sales
-------------------------------------------------------------
SELECT
SUM("Total Sales") AS total_sales
FROM master_dataset;

-------------------------------------------------------------
-- Net Sales
-------------------------------------------------------------
SELECT
SUM("Net Sales") AS net_sales
FROM master_dataset;

-------------------------------------------------------------
-- Total Profit
-------------------------------------------------------------
SELECT
SUM("Profit") AS total_profit
FROM master_dataset;

-------------------------------------------------------------
-- Total Orders
-------------------------------------------------------------
SELECT
COUNT(DISTINCT "Order ID") AS total_orders
FROM master_dataset;

-------------------------------------------------------------
-- Monthly Sales
-------------------------------------------------------------
SELECT
"Month",
SUM("Net Sales") AS sales
FROM master_dataset
GROUP BY "Month"
ORDER BY sales DESC;

-------------------------------------------------------------
-- Quarterly Sales
-------------------------------------------------------------
SELECT
"Quarter",
SUM("Net Sales") AS sales
FROM master_dataset
GROUP BY "Quarter"
ORDER BY "Quarter";

-------------------------------------------------------------
-- Sales by Product Line
-------------------------------------------------------------
SELECT
"Product Line",
SUM("Net Sales") AS sales
FROM master_dataset
GROUP BY "Product Line"
ORDER BY sales DESC;

-------------------------------------------------------------
-- Top 10 Products
-------------------------------------------------------------
SELECT
"Product Name",
SUM("Net Sales") AS sales
FROM master_dataset
GROUP BY "Product Name"
ORDER BY sales DESC
LIMIT 10;

-------------------------------------------------------------
-- Top Customers
-------------------------------------------------------------
SELECT
"Customer Name",
SUM("Net Sales") AS sales
FROM master_dataset
GROUP BY "Customer Name"
ORDER BY sales DESC
LIMIT 10;

-------------------------------------------------------------
-- Sales by State
-------------------------------------------------------------
SELECT
"State",
SUM("Net Sales") AS sales
FROM master_dataset
GROUP BY "State"
ORDER BY sales DESC;

-------------------------------------------------------------
-- Promotion Performance
-------------------------------------------------------------
SELECT
"Promotion Name",
SUM("Net Sales") AS sales
FROM master_dataset
GROUP BY "Promotion Name"
ORDER BY sales DESC;

-------------------------------------------------------------
-- Ad Type Performance
-------------------------------------------------------------
SELECT
"Ad Type",
SUM("Net Sales") AS sales
FROM master_dataset
GROUP BY "Ad Type"
ORDER BY sales DESC;

-------------------------------------------------------------
-- Average Order Value
-------------------------------------------------------------
SELECT
ROUND(
SUM("Net Sales")/
COUNT(DISTINCT "Order ID"),2
) AS average_order_value
FROM master_dataset;

-------------------------------------------------------------
-- Profit Margin
-------------------------------------------------------------
SELECT
ROUND(
SUM("Profit")*100/SUM("Net Sales"),2
) AS profit_margin
FROM master_dataset;