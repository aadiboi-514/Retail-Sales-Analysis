-- SQL Retail Sales Analysis

SELECT *
FROM retail;

-- Data Cleaning
SELECT *
FROM retail
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR
    sale_time IS NULL
    OR
    customer_id IS NULL
    OR
    gender IS NULL
    OR
    age IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    price_per_unit IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL
    ;
--
DELETE FROM retail
WHERE 
    transactions_id IS NULL
    OR
    sale_date IS NULL
    OR
    sale_time IS NULL
    OR
    customer_id IS NULL
    OR
    gender IS NULL
    OR
    age IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    price_per_unit IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL
    ;

-- Data Exploration

-- 1. How many sales we had?

SELECT COUNT(*) as total_sales
FROM retail;

-- 2. How many unique customers we have?
SELECT COUNT( DISTINCT customer_id) as total_customers
FROM retail;

-- 3. How many unique categories we have?
SELECT  DISTINCT category as categories
FROM retail;

-- Data Analysis & Business Key Problems
-- 1. Write a sql query to retrive all columns for sales made on '2022-11-05'
SELECT *
FROM retail 
WHERE sale_date = '2022-11-05'
;

-- 2. Write a sql query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 
-- month of Nov-2022
SELECT *
FROM retail
WHERE category = 'Clothing'
AND 
sale_date LIKE '2022-11%'
AND quantity >='4'
;

-- 3. Write sql query to calculate total sales (total_sales) for each category.
SELECT category,
SUM(total_sale),
COUNT(total_sale) AS total_orders
FROM retail
GROUP BY 1; 

-- 4. Write the average age of customers who purchased items from the 'Beauty' category.
SELECT category,
ROUND(AVG(age),2) as avg_age
FROM retail
WHERE category = 'Beauty'; 

-- 5. Write a sql query to find all transactions where total_sale is greater than 1000.
 SELECT *
 FROM retail
 WHERE total_sale > '1000'
 ;
 
 -- 6. Write a sql query to find the total number of transactions(transaction_id) made by each gender in each category.
 SELECT
 category,
 gender,
 COUNT(*) AS total_transactions
 FROM retail
 GROUP BY 
 category,
 gender
 ORDER BY 1
 ;
 
 -- 7. Write a sql query to calculate the average sale for each month.Find out best selling month in each year.
 WITH monthly_avg AS (
 SELECT 
  YEAR(sale_date) AS year,
  MONTH(sale_date) AS month,
  ROUND(AVG(total_sale),2) AS avg_sale
FROM retail
GROUP BY 1,2),
ranked AS (
SELECT *
,RANK() OVER(PARTITION BY year ORDER BY avg_sale DESC) AS best_month
FROM monthly_avg
)
SELECT *
FROM ranked
WHERE best_month = '1'
ORDER BY 1,2;

-- 8. Write a sql query to find the top 5 customers based on its highest total sales.
SELECT 
customer_id,
SUM(total_sale) AS sum_total
FROM retail
GROUP BY customer_id
ORDER BY sum_total DESC
LIMIT 5;

-- 9. Write a sql query to find the unique customers who purchased items from each category.
SELECT 
category,
COUNT(DISTINCT customer_id) as unique_customers
FROM retail
GROUP BY category
;


-- 10. Write a sql query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17).
SELECT
     CASE
         WHEN HOUR(sale_time) <= 12 THEN 'Morning'
         WHEN HOUR(sale_time) BETWEEN 12 AND  17 THEN 'Afternoon'
         ELSE 'Evening'
    END as shift,
COUNT(*) AS order_count
FROM retail
GROUP BY shift
ORDER BY order_count DESC;
