# Data Dictionary

## E-Commerce Sales Analytics

This data dictionary describes the fields used in the e-commerce sales analytics project.

---

## Fact Table — Sales Transactions

| Column Name | Description | Data Type |
|---|---|---|
| Date (dd/mm/yyyy) | Date on which the transaction occurred | Date |
| CustomerID | Unique identifier for the customer | Integer / Text |
| PromotionID | Unique identifier for the promotion | Integer / Text |
| Product ID | Unique identifier for the product | Integer / Text |
| Units Sold | Number of units sold in the transaction | Numeric |
| Price Per Unit | Selling price per unit | Numeric |
| Total Sales | Gross sales amount before discounts | Numeric |
| Discount Percentage | Percentage of discount applied | Numeric |
| Discount Value | Monetary value of the discount | Numeric |
| Net Sales | Sales amount after applying discounts | Numeric |
| Profit | Profit generated from the transaction | Numeric |
| Order ID | Unique identifier for the order | Text |
| Year | Year extracted from transaction date | Integer |
| Quarter | Quarter extracted from transaction date | Text |
| Month | Month extracted from transaction date | Text |
| Weekday | Day of the week extracted from transaction date | Text |
| Profit Margin | Profit as a percentage of net sales | Numeric |

---

## Customer Dimension

| Column Name | Description | Data Type |
|---|---|---|
| Customer ID | Unique customer identifier | Integer / Text |
| Customer Name | Name of the customer | Text |
| City | Customer's city | Text |
| State | Customer's state | Text |
| Pincode | Customer's postal code | Text / Integer |
| EmailID | Customer email address | Text |
| Phone Number | Customer contact number | Text |

---

## Product Dimension

| Column Name | Description | Data Type |
|---|---|---|
| ProductID | Unique product identifier | Integer / Text |
| Product Name | Name of the product | Text |
| Product Line | Product category or product line | Text |
| Price (INR) | Product price in Indian Rupees | Numeric |

---

## Promotion Dimension

| Column Name | Description | Data Type |
|---|---|---|
| PromotionID | Unique promotion identifier | Integer / Text |
| Promotion Name | Name of the promotional campaign | Text |
| Ad Type | Type of advertisement used | Text |
| Coupon Code | Promotional coupon code | Text |
| Price Reduction Type | Type of price reduction or discount | Text |

---

## Derived Metrics

| Metric | Description |
|---|---|
| Total Sales | Gross revenue before discounts |
| Net Sales | Revenue after discounts |
| Total Profit | Total profit generated from sales |
| Profit Margin | Profit expressed as a percentage of net sales |
| Average Order Value | Net sales divided by the number of unique orders |
| Discount Value | Monetary reduction applied to the original sales value |

---

## Key Relationships

The dataset follows a dimensional/star-schema structure.

### Sales → Customer

```text
CustomerID → Customer ID