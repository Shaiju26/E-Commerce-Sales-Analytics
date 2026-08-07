/*============================================================
 Project: E-Commerce Sales Analytics
 File: 03_advanced_sql.sql
 Description: Advanced SQL Analysis
=============================================================*/

-------------------------------------------------------------
-- Product Ranking
-------------------------------------------------------------
SELECT
"Product Name",
SUM("Net Sales") AS sales,
RANK() OVER(
ORDER BY SUM("Net Sales") DESC
) AS product_rank
FROM master_dataset
GROUP BY "Product Name";

-------------------------------------------------------------
-- Customer Ranking
-------------------------------------------------------------
SELECT
"Customer Name",
SUM("Net Sales") AS sales,
DENSE_RANK() OVER(
ORDER BY SUM("Net Sales") DESC
) AS customer_rank
FROM master_dataset
GROUP BY "Customer Name";

-------------------------------------------------------------
-- Running Sales Total
-------------------------------------------------------------
SELECT
"Date (dd/mm/yyyy)",
"Net Sales",
SUM("Net Sales") OVER(
ORDER BY "Date (dd/mm/yyyy)"
) AS running_total
FROM master_dataset;

-------------------------------------------------------------
-- Profit by Month
-------------------------------------------------------------
SELECT
"Month",
SUM("Profit") AS total_profit,
AVG("Profit") AS average_profit
FROM master_dataset
GROUP BY "Month";

-------------------------------------------------------------
-- Sales Contribution %
-------------------------------------------------------------
SELECT
"Product Line",
SUM("Net Sales") AS sales,
ROUND(
SUM("Net Sales")*100/
SUM(SUM("Net Sales")) OVER(),2
) AS contribution_percentage
FROM master_dataset
GROUP BY "Product Line";

-------------------------------------------------------------
-- Highest Profit Product
-------------------------------------------------------------
SELECT
"Product Name",
SUM("Profit") AS total_profit
FROM master_dataset
GROUP BY "Product Name"
ORDER BY total_profit DESC
LIMIT 1;

-------------------------------------------------------------
-- Lowest Profit Product
-------------------------------------------------------------
SELECT
"Product Name",
SUM("Profit") AS total_profit
FROM master_dataset
GROUP BY "Product Name"
ORDER BY total_profit
LIMIT 1;

-------------------------------------------------------------
-- Monthly Running Profit
-------------------------------------------------------------
SELECT
"Date (dd/mm/yyyy)",
"Profit",
SUM("Profit") OVER(
ORDER BY "Date (dd/mm/yyyy)"
) AS cumulative_profit
FROM master_dataset;

-------------------------------------------------------------
-- Discount Categories
-------------------------------------------------------------
SELECT
CASE
WHEN "Discount Percentage" < 10 THEN 'Low'
WHEN "Discount Percentage" BETWEEN 10 AND 20 THEN 'Medium'
ELSE 'High'
END AS discount_category,
COUNT(*) AS total_orders,
SUM("Net Sales") AS total_sales
FROM master_dataset
GROUP BY discount_category;

-------------------------------------------------------------
-- Top 5 States by Profit
-------------------------------------------------------------
SELECT
"State",
SUM("Profit") AS total_profit
FROM master_dataset
GROUP BY "State"
ORDER BY total_profit DESC
LIMIT 5;