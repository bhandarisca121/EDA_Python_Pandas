CREATE TABLE IF NOT EXISTS walmart_sales AS SELECT * FROM './data/WalmartSalesData.csv'; --- IGNORE ---

SHOW TABLES;

-- Describe the table to see the column names and data types
DESCRIBE walmart_sales;

-- Check number of rows in the table 

SELECT COUNT(*) AS total_rows FROM walmart_sales;

-- Count the numbers of columns in the table
SELECT COUNT(*) AS column_count
FROM duckdb_columns -- this is for duckdb, for the SQL server we need to use sys.columns
WHERE table_name = 'walmart_sales';

-- Check the column names
SELECT column_name, data_type
FROM duckdb_columns
WHERE table_name = 'walmart_sales';-- this is for duckdb, for the SQL server we need to use sys.columns

-- Count null values in each columns 

SELECT
    SUM(CASE WHEN 'Invoice ID' IS NULL THEN 1 else 0 END ) AS Invoice_ID_null_count,
    SUM(CASE WHEN 'City' IS NULL THEN 1 else 0 END ) AS City_null_count,
    SUM(CASE WHEN 'State' IS NULL THEN 1 else 0 END ) AS State_null_count,
    SUM(CASE WHEN 'Date' IS NULL THEN 1 else 0 END ) AS Date_null_count
FROM walmart_sales;


-- Check Duplicates

SELECT "Invoice ID",
    COUNT(*) AS duplicate_count
FROM walmart_sales
GROUP BY "Invoice ID"
HAVING COUNT(*) > 1;

-- Count distinct values in every Categorical column

SELECT COUNT(DISTINCT "Invoice ID") AS distinct_count_Invoice_ID,
    COUNT(DISTINCT "City") AS distinct_count_city
FROM walmart_sales;


-- check the total revenue

SELECT  SUM("Total") AS total_revenue
FROM walmart_sales;


-- Chcek the total revenuew another way 

SELECT SUM(("Unit Price"* "Quantity")+"Tax 5%") AS total_revenue
FROM walmart_sales;

-- Chcek the total revenue by City

SELECT "City", SUM("Total") AS total_revenue_by_city
FROM walmart_sales
GROUP BY "City";


-- Check the total revenue by Gender

SELECT "Gender", SUM("Total") AS total_revenue_by_gender
FROM walmart_sales
GROUP BY Gender;


-- check the total revenue by Payment Method

SELECT "Payment", SUM("Total") AS total_revenue_by_payment_method
FROM walmart_sales
Group BY "Payment";


-- Check the total revenue by Product Line
SELECT "Product line", SUM("Total") AS total_revenue_by_product_line
FROM walmart_sales
GROUP BY "Product line";

-- Check the total revenue by customer type

SELECT "Customer type", SUM("Total") AS total_revenue_by_customer_type
FROM walmart_sales
GROUP BY "Customer type";


-- check the total revenue by Branch

SELECT "Branch", SUM("Total") AS total_revenue_by_branch
FROM walmart_sales
GROUP BY "Branch"
ORDER BY total_revenue_by_branch DESC;


-- Check the total revenue by Date

SELECT "Date", SUM("Total") AS total_revenue_by_date
FROM walmart_sales
GROUP BY "Date"
ORDER BY total_revenue_by_date DESC
LIMIT 5;

-- Using TOP method to get the top 5 dates with highest revenue

SELECT TOP 5 "Date", SUM("Total") AS total_revenue_by_date. -- this doesn't work for the DUCKDB, but works for SQL Server
FROM walmart_sales
GROUP BY "Date"
ORDER BY total_revenue_by_date DESC;


-- What is the average sales amount 

SELECT "Date", AVG("Total") AS average_sales_amount
FROM walmart_sales
GROUP BY "Date"
ORDER BY average_sales_amount DESC
LIMIT 5;


-- Which product line the most sold in terms of quantity

SELECT "Product Line", SUM("Quantity") AS total_quantity_sold
FROM walmart_sales
GROUP BY "Product Line"
ORDER BY total_quantity_sold DESC
LIMIT 5;


-- which product line has the highest price tag

SELECT "Product Line", MAX("Unit Price") AS highest_unit_price
FROM walmart_sales
GROUP BY "Product Line"
ORDER BY highest_unit_price DESC
LIMIT 5;



-- What is the minimum, maximum and average Unit Price of the products sole

SELECT "Product line",MIN("Unit PRice") AS minimum_unit_price,
    MAX("Unit Price") AS maximum_unit_price,
    AVG("Unit Price") AS average_unit_price
FROM walmart_sales
GROUP BY "Product line";




-- How many total products were sold in each branch

SELECT "Branch", SUM("Quantity") AS total_number_product_sales
FROM walmart_sales
GROUP BY "Branch";


-- What is the average customer rating

SELECT "Product line", AVG("Rating") AS average_customer_rating
FROM walmart_sales
GROUP BY "Product line"
ORDER BY average_customer_rating DESC;


-- what is the average tax collected?

SELECT "Product Line", AVG("Tax 5%") AS average_tax_collected
FROM walmart_sales
GROUP BY "Product Line"
ORDER BY average_tax_collected DESC;


-- Which branch has the highest revenue
SELECT "Branch", SUM("Total") AS total_revenue_by_branch
FROM walmart_sales
GROUP BY "Branch"
ORDER BY total_revenue_by_branch DESC
LIMIT 1;


-- Which Branch sold to most items
SELECT "Branch", SUM("Quantity") AS total_items_sold
FROM walmart_sales
GROUP BY "Branch"
ORDER BY total_items_sold DESC
LIMIT 1;


-- Which Branch has the highest average transaction value

SELECT "Branch", AVG("Total") AS average_transaction_value
FROM walmart_sales
GROUP BY "Branch"
ORDER BY average_transaction_value DESC
LIMIT 1;

-- Which City generated the highest revenue

SELECT "City", SUM("Total") AS total_revenue_by_city
FROM walmart_sales
GROUP BY "City"
ORDER BY total_revenue_by_city DESC;


-- Which product line generated the lowest revenue

SELECT "Product line", SUM("Total") AS total_revenue_by_product_line
FROM walmart_sales
GROUP BY "Product line"
ORDER BY total_revenue_by_product_line ASC
LIMIT 1;


-- Rank all the product lines based on their total revenue

SELECT "Product line", SUM("Total") AS total_revenue_by_product_line
FROM walmart_sales
GROUP BY "Product line"
ORDER BY total_revenue_by_product_line DESC;    



-- Which customer type give better rating

SELECT "Customer type", AVG("Rating") AS average_rating_by_customer_type
FROM walmart_sales
GROUP BY "Customer type"
ORDER BY average_rating_by_customer_type DESC;


-- Which month generated the hidghest salee?

SELECT STRFTIME('%m', "Date") AS month, STRFTIME('%y', "Date") AS year, SUM("Total") AS total_revenue_by_month
FROM walmart_sales
GROUP BY month, year
ORDER BY total_revenue_by_month DESC
LIMIT 5;

-- Which day of the week generated the highest revenue?

SELECT STRFTIME('%w', "Date") AS day_of_week, SUM("Total") AS total_revenue_by_day_of_week
FROM walmart_sales
GROUP BY day_of_week
ORDER BY total_revenue_by_day_of_week DESC
LIMIT 5;


-- Which is the busiest day of the week in terms of number of transactions?

SELECT STRFTIME('%w',"Date") AS day_of_week, COUNT(*) AS total_transactions_by_day_of_week
FROM walmart_sales
GROUP BY day_of_week
ORDER BY total_transactions_by_day_of_week DESC
LIMIT 5; -- 0 Sunday, 1 Monday, 2 Tuesday, 3 Wednesday, 4 Thursday, 5 Friday, 6 Saturday...seems saturday is the busiest day of the week in terms of number of transactions 

-- Compare weekday vs weekend sales revenue
SELECT
    CASE 
        WHEN STRFTIME('%w', "Date") IN ('0', '5', '6') THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    SUM("Total") AS total_revenue
FROM walmart_sales
GROUP BY day_type
ORDER BY total_revenue DESC;



-- Which month has the highest average basket size (average transaction value)?

SELECT STRFTIME('%m', "Date") AS month, STRFTIME('%y', "Date") AS year, AVG("Total") AS average_basket_size
FROM walmart_sales
GROUP BY month, year
ORDER BY average_basket_size DESC
LIMIT 5;


-- Find the top 5 products with the highest total sales revenue
SELECT "Product line", SUM("Total") AS total_sales_revenue
FROM walmart_sales
GROUP BY "Product line"
ORDER BY total_sales_revenue DESC
LIMIT 5;


-- Find custome type whose purchases are above average transaction value

SELECT "Customer type", AVG("Total") AS average_transaction_value
FROM walmart_sales
GROUP BY "Customer type"
HAVING AVG("Total") > (SELECT AVG("Total") FROM walmart_sales)
ORDER BY average_transaction_value DESC;


-- Case statement 
SELECT "City",
        SUM("Total") AS total_revenue,
    CASE
        WHEN "Quantity" > 100 THEN 'High Quantity'
        WHEN "Quantity" BETWEEN 50 AND 100 THEN 'Medium Quantity'
        ELSE 'Low Quantity'
        END AS quantity_category,
    CASE 
        WHEN SUM("Total") > 10000 THEN 'High Revenue'
        WHEN SUM("Total") BETWEEN 5000 AND 10000 THEN 'Medium Revenue'
        ELSE 'Low Revenue'
    END AS revenue_category
    FROM walmart_sales
    GROUP BY "City", "Total", "Quantity"
    ORDER BY "total_revenue" DESC;

-- Case statement by male and female customers

SELECT 
    SUM("Total") AS total_revenue,
    COUNT(CASE WHEN "Gender" = 'Male' THEN 1 END) AS male_customers,
    COUNT(CASE WHEN "Gender" = 'Female' THEN 1 END) AS female_customers
FROM walmart_sales;


-- Find the customer type whose purchases are above average transaction ( Use CTE)
WITH average_transaction AS (
    SELECT AVG("Total") AS avg_transaction_value
    FROM walmart_sales
)
SELECT "Customer type", AVG("Total") AS avg_transaction_value
FROM walmart_sales
GROUP BY "Customer type"
HAVING AVG("Total") > (SELECT avg_transaction_value FROM average_transaction)
ORDER BY avg_transaction_value DESC;

-- Create view for the gender summary of total revenue and average transaction value

CREATE VIEW gender_summary AS
SELECT 
    SUM("Total") AS total_revenue,
    COUNT(CASE WHEN "Gender" = 'Male' THEN 1 END) AS male_customers,
    COUNT(CASE WHEN "Gender" = 'Female' THEN 1 END) AS female_customers
FROM walmart_sales;
-- Run the 
SELECT * FROM gender_summary;

-- check all the view presented in the database 
SHOW ALL TABLES;


-- create a store procedure to get the total revenue by product line --- this doesn't support DuckDB
CREATE PROCEDURE get_total_revenue_by_product_line()
BEGIN
    SELECT "Product line", SUM("Total") AS total_revenue_by_product_line
    FROM walmart_sales
    GROUP BY "Product line"
    ORDER BY total_revenue_by_product_line DESC
    END;




-- Rank branches based on their total revenue

SELECT "Branch", SUM("Total") AS total_revenue_by_branch,
    RANK() OVER (ORDER BY SUM("Total") DESC) AS revenue_rank
FROM walmart_sales
GROUP BY "Branch"
ORDER BY revenue_rank;

-- Dense rank branches based on their total revenue
SELECT "Branch", SUM("Total") AS total_revenue_by_branch,
    DENSE_RANK() OVER (ORDER BY SUM("Total") DESC) AS revenue_dense_rank
FROM walmart_sales
GROUP BY "Branch"
ORDER BY revenue_dense_rank;

-- Floor rank branches based on their total revenue
SELECT "Branch", SUM("Total") AS total_revenue_by_branch,
    FLOOR(RANK() OVER (ORDER BY SUM("Total") DESC)) AS revenue_floor_rank
FROM walmart_sales
GROUP BY "Branch"
ORDER BY revenue_floor_rank;


-- Find the second highest revenue generating branch

SELECT "Branch", SUM("Total") AS total_revenue_by_branch
FROM walmart_sales
GROUP BY "Branch"
ORDER BY total_revenue_by_branch DESC
LIMIT 1 OFFSET 1; -- This will give the second highest revenue generating branch


-- Calculate the cumulative revenue by branch

SELECT "Branch", SUM("Total") AS total_revenue_by_branch,
    SUM(SUM("Total")) OVER (ORDER BY SUM("Total") DESC) AS cumulative_revenue
FROM walmart_sales
GROUP BY "Branch"
ORDER BY cumulative_revenue DESC;


-- Calculate running total revenue by date
SELECT "Date", SUM("Total") AS total_revenue_by_date,
    SUM(SUM("Total")) OVER (ORDER BY "Date" ASC) AS running_total_revenue
FROM walmart_sales
GROUP BY "Date"
ORDER BY "Date" ASC; 


-- Calculate the moving average of revenue by date (3-day moving average)
SELECT "Date", SUM("Total") AS total_revenue_by_date,
    AVG(SUM("Total")) OVER (ORDER BY "Date" ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_average_revenue
FROM walmart_sales
GROUP BY "Date"
ORDER BY "Date" ASC;


-- Find top-rated product lines based on average customer rating
SELECT "Product line", AVG("Rating") AS average_rating
FROM walmart_sales  
GROUP BY "Product line"
ORDER BY average_rating DESC;

-- Finding the product purchased together (market basket analysis) using self join
SELECT a."Product line" AS product_a, b."Product line" AS product_b,
    COUNT(*) AS times_purchased_together
FROM walmart_sales a
JOIN walmart_sales b ON a."Invoice ID" = b."Invoice ID" AND a."Product line" <> b."Product line"
GROUP BY a."Product line", b."Product line"
ORDER BY times_purchased_together DESC
LIMIT 10;


-- compare the revenue of two branches on the same date using self join

SELECT 
    a."Date",
    a."Branch" AS branch_A,
    a."Total" AS revenue_A,
    b."Branch" AS branch_B,
    b."Total" AS revenue_B
FROM walmart_sales AS a
INNER JOIN walmart_sales AS b
    ON a."Date" = b."Date"
    AND a."Branch" != b."Branch" -- Ensures you are comparing different branches
LIMIT 10;
