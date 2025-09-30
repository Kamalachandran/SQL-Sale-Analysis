CREATE DATABASE Sale;
use sale;
 
 CREATE TABLE Sale (
    order_number INT,
    quantity_ordered INT,
    price_each DECIMAL(10,2),
    order_line_number INT,
    sales DECIMAL(15,2),
    order_date DATE,
    status VARCHAR(50),
    quarter_id INT,
    month_id INT,
    year_id INT,
    product_line VARCHAR(100),
    msrp DECIMAL(10,2),
    product_code VARCHAR(100),
    customer_name VARCHAR(100),
    phone VARCHAR(30),
    address_line VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50),
    territory VARCHAR(50),
    contact_last_name VARCHAR(50),
    contact_first_name VARCHAR(50),
    deal_size VARCHAR(20)
);

-- total order per month and year
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    COUNT(CASE WHEN month_id = 1  THEN order_number END) AS "1",
    COUNT(CASE WHEN month_id = 2  THEN order_number END) AS "2",
    COUNT(CASE WHEN month_id = 3  THEN order_number END) AS "3",
    COUNT(CASE WHEN month_id = 4  THEN order_number END) AS "4",
    COUNT(CASE WHEN month_id = 5  THEN order_number END) AS "5",
    COUNT(CASE WHEN month_id = 6  THEN order_number END) AS "6",
    COUNT(CASE WHEN month_id = 7  THEN order_number END) AS "7",
    COUNT(CASE WHEN month_id = 8  THEN order_number END) AS "8",
    COUNT(CASE WHEN month_id = 9  THEN order_number END) AS "9",
    COUNT(CASE WHEN month_id = 10 THEN order_number END) AS "10",
    COUNT(CASE WHEN month_id = 11 THEN order_number END) AS "11",
    COUNT(CASE WHEN month_id = 12 THEN order_number END) AS "12"
FROM sale
GROUP BY year
ORDER BY year;



-- 1.top 10 customers with the highest sales
SELECT customer_name,sales
FROM sale
ORDER BY sales DESC
LIMIT 10;

-- 2.total number of orders placed from the Japan territory
SELECT 
	COUNT(order_number) as total_orders,
    territory
FROM sale
WHERE territory='japan';


-- 3. Average Sales per Order
SELECT state,
	   ROUND(AVG(sales),2) AS avg_sales
FROM sale
GROUP BY state
ORDER BY avg_sales;

-- 4. Revenue by Product Line
SELECT 
    product_line,
    SUM(sales) AS total_revenue
FROM sale
GROUP BY product_line
ORDER BY total_revenue DESC;

-- 5. Top 5 Countries by Revenue
SELECT 
    country,
    SUM(sales) AS total_sales
FROM sale
GROUP BY country
ORDER BY total_sales DESC;

-- 6. Orders by Deal Size
SELECT 
    deal_size,
    SUM(sales) AS total_sales
FROM sale 
GROUP BY deal_size;


-- 7. top 10 Product Performance
SELECT 
    product_code,
    SUM(quantity_ordered) AS total_quantity,
    SUM(sales) AS total_revenue
FROM sale
GROUP BY product_code
ORDER BY total_revenue DESC;