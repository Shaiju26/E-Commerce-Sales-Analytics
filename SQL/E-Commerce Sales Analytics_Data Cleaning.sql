/*============================================================
 Project: E-Commerce Sales Analytics
 File: 01_data_cleaning.sql
 Description: Data Cleaning and Quality Checks
=============================================================*/

-- View Dataset
SELECT *
FROM master_dataset;

-------------------------------------------------------------
-- Total Records
-------------------------------------------------------------
SELECT COUNT(*) AS total_records
FROM master_dataset;

-------------------------------------------------------------
-- Check NULL Values
-------------------------------------------------------------
SELECT
COUNT(*) FILTER (WHERE "Customer Name" IS NULL) AS missing_customer,
COUNT(*) FILTER (WHERE "Product Name" IS NULL) AS missing_product,
COUNT(*) FILTER (WHERE "Promotion Name" IS NULL) AS missing_promotion,
COUNT(*) FILTER (WHERE "Net Sales" IS NULL) AS missing_sales,
COUNT(*) FILTER (WHERE "Profit" IS NULL) AS missing_profit
FROM master_dataset;

-------------------------------------------------------------
-- Check Duplicate Orders
-------------------------------------------------------------
SELECT
"Order ID",
COUNT(*)
FROM master_dataset
GROUP BY "Order ID"
HAVING COUNT(*) > 1;

-------------------------------------------------------------
-- Invalid Sales
-------------------------------------------------------------
SELECT *
FROM master_dataset
WHERE "Net Sales" <= 0;

-------------------------------------------------------------
-- Invalid Profit
-------------------------------------------------------------
SELECT *
FROM master_dataset
WHERE "Profit" < 0;

-------------------------------------------------------------
-- Distinct Product Lines
-------------------------------------------------------------
SELECT DISTINCT
"Product Line"
FROM master_dataset;

-------------------------------------------------------------
-- Distinct States
-------------------------------------------------------------
SELECT DISTINCT
"State"
FROM master_dataset;

-------------------------------------------------------------
-- Distinct Promotion Types
-------------------------------------------------------------
SELECT DISTINCT
"Promotion Name"
FROM master_dataset;

-------------------------------------------------------------
-- Date Range
-------------------------------------------------------------
SELECT
MIN("Date (dd/mm/yyyy)") AS start_date,
MAX("Date (dd/mm/yyyy)") AS end_date
FROM master_dataset;