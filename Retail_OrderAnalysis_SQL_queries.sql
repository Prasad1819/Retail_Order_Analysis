-- SELECT * FROM abhansal.df_orders;
-- Drop Table df_orders

-- use DDL to create a Table 

CREATE TABLE df_orders (
  `order_id` INT PRIMARY KEY,
  `order_date` DATE,
  `ship_mode` VARCHAR(20),
  `segment` VARCHAR(20),
  `country` VARCHAR(20),
  `city` VARCHAR(20),
  `state` VARCHAR(20),
  `postal_code` VARCHAR(20),
  `region` VARCHAR(20),
  `category` VARCHAR(20),
  `sub_category` VARCHAR(20),
  `product_id` VARCHAR(20),
  `quantity` INT,
  `discount` DECIMAL(7,2),
  `sale_price` DECIMAL(7,2),
  `profit` DECIMAL(7,2)
);
-- now execute append line in python code 
SELECT * FROM df_orders;

-- find top 10 highest reveue generating products 
SELECT product_id,sum(sale_price) AS sales
FROM df_orders
GROUP BY product_id
ORDER BY sales DESC
LIMIT 10;

-- Find top 5 highest selling products in each region
WITH cte AS (
  SELECT region, product_id, SUM(sale_price) AS sales
  FROM df_orders
  GROUP BY region, product_id
)
SELECT region, product_id, sales
FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY region ORDER BY sales DESC) AS rn
  FROM cte
) AS ranked
WHERE rn <= 5;

-- Find month over month growth comparison for 2022 and 2023 sales (e.g. Jan 2022 vs Jan 2023)
WITH cte AS (
  SELECT YEAR(order_date) AS order_year,
         MONTH(order_date) AS order_month,
         SUM(sale_price) AS sales
  FROM df_orders
  GROUP BY order_year, order_month
)
SELECT order_month,
       SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
       SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
FROM cte
GROUP BY order_month
ORDER BY order_month;

-- For each category, which month had highest sales
WITH cte AS (
  SELECT category,
         DATE_FORMAT(order_date, '%Y%m') AS order_year_month,
         SUM(sale_price) AS sales
  FROM df_orders
  GROUP BY category, order_year_month
)
SELECT category, order_year_month, sales
FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY category ORDER BY sales DESC) AS rn
  FROM cte
) AS ranked
WHERE rn = 1;

-- Which sub-category had highest growth by profit in 2023 compared to 2022
WITH cte AS (
  SELECT sub_category,
         YEAR(order_date) AS order_year,
         SUM(profit) AS profit
  FROM df_orders
  GROUP BY sub_category, order_year
),
cte2 AS (
  SELECT sub_category,
         SUM(CASE WHEN order_year = 2022 THEN profit ELSE 0 END) AS profit_2022,
         SUM(CASE WHEN order_year = 2023 THEN profit ELSE 0 END) AS profit_2023
  FROM cte
  GROUP BY sub_category
)
SELECT sub_category,
       profit_2022,
       profit_2023,
       (profit_2023 - profit_2022) AS profit_growth
FROM cte2
ORDER BY profit_growth DESC
LIMIT 1;