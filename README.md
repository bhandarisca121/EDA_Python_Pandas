# Walmart Sales Analysis using SQL

## Project Overview

This project performs an **Exploratory Data Analysis (EDA)** on Walmart sales data using **SQL**. The objective is to analyze sales performance, customer behavior, product trends, and branch performance while demonstrating practical SQL skills commonly required for Data Analyst roles.

The analysis covers data exploration, aggregation, filtering, window functions, Common Table Expressions (CTEs), views, and business insights.

---

## Dataset

The dataset contains transactional sales records from Walmart stores.

### Sample Columns

| Column                  | Description                  |
| ----------------------- | ---------------------------- |
| Invoice_ID              | Unique transaction ID        |
| Branch                  | Walmart branch               |
| City                    | Store location               |
| Customer_type           | Member or Normal customer    |
| Gender                  | Customer gender              |
| Product_line            | Product category             |
| Unit_price              | Price per item               |
| Quantity                | Number of items purchased    |
| Tax                     | VAT amount                   |
| Total                   | Total transaction amount     |
| Date                    | Purchase date                |
| Time                    | Purchase time                |
| Payment                 | Payment method               |
| COGS                    | Cost of Goods Sold           |
| Gross_margin_percentage | Gross margin percentage      |
| Gross_income            | Gross profit                 |
| Rating                  | Customer satisfaction rating |

---

# 🎯 Project Objectives

* Explore the dataset structure
* Identify missing or duplicate records
* Analyze sales performance
* Compare branch performance
* Evaluate product performance
* Understand customer purchasing behavior
* Analyze payment preferences
* Discover sales trends over time
* Practice advanced SQL techniques
* Generate business recommendations

---

# 🛠️ Tools Used

* SQL
* DuckDB
* VS Code
* Git & GitHub

---

#  Project Structure

```
Walmart-Sales-SQL-EDA/
│
├── data/
│   └── Walmart_sales.csv
│
├── sql/
│   ├── 01_Data_Exploration.sql
│   ├── 02_Sales_Analysis.sql
│   ├── 03_Customer_Analysis.sql
│   ├── 04_Product_Analysis.sql
│   ├── 05_Time_Analysis.sql
│   ├── 06_Window_Functions.sql
│   ├── 07_CTEs.sql
│   ├── 08_Views.sql
│   └── 09_Business_Insights.sql
│
├── README.md
└── LICENSE
```

---

# SQL Skills Demonstrated

### Data Exploration

* Row and column count
* Data types
* Missing values
* Duplicate detection
* Distinct values
* Cardinality analysis

---

### Aggregate Functions

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()

---

### Filtering

* WHERE
* HAVING
* BETWEEN
* IN
* LIKE

---

### Grouping

* GROUP BY
* ORDER BY

---

### Joins

* INNER JOIN
* LEFT JOIN

*(Included as practice examples where applicable.)*

---

### Common Table Expressions (CTEs)

Examples include:

* Revenue analysis
* Branch comparisons
* Product rankings
* Above-average sales

---

### Window Functions

* ROW_NUMBER()
* RANK()
* DENSE_RANK()
* LAG()
* LEAD()
* SUM() OVER()
* AVG() OVER()

---

### Views

Created reusable views including:

* Monthly Sales Summary
* Branch Performance
* Product Performance
* Customer Insights
* Daily Sales Dashboard

---

# Analysis Performed

## 1. Data Exploration

* Number of records
* Data validation
* Duplicate checks
* Null value checks
* Cardinality analysis

---

## 2. Sales Analysis

* Total revenue
* Average transaction value
* Total products sold
* Monthly sales
* Daily sales
* Hourly sales

---

## 3. Branch Analysis

* Highest revenue branch
* Highest quantity sold
* Average customer rating
* Average basket value
* Number of transactions

---

## 4. Product Analysis

* Best-selling product lines
* Lowest-performing products
* Revenue contribution
* Product rankings

---

## 5. Customer Analysis

* Member vs Normal customers
* Gender comparison
* Purchase behavior
* Customer ratings

---

## 6. Payment Analysis

* Most popular payment method
* Revenue by payment type
* Average purchase by payment method

---

## 7. Time Analysis

* Sales by month
* Sales by weekday
* Sales by hour
* Weekend vs weekday comparison

---

## 8. Business Insights

Examples include:

* Best-performing branch
* Best-performing city
* Top product categories
* Customer purchasing trends
* Operational recommendations

---

# Business Questions Answered

Some of the business questions explored include:

* Which branch generates the highest revenue?
* Which city performs best?
* Which products sell the most?
* Which customer segment spends the most?
* Which payment method is most popular?
* What are the busiest shopping hours?
* Which product line has the highest customer satisfaction?
* Which branch should receive additional inventory?
* Which branch needs operational improvements?
