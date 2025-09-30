
# 📊 SQL Sale Analysis Queries

This project demonstrates SQL queries for analyzing **sales data** such as customer performance, product revenue, deal size, and time-based insights.

---

## 📂 Database & Table Setup

```sql
CREATE DATABASE Sale;
USE Sale;

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
```

---

## 📈 Analysis Queries

### 1. Total Orders per Month and Year
```sql
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
```

---

### 2. Top 10 Customers with the Highest Sales
```sql
SELECT customer_name, sales
FROM sale
ORDER BY sales DESC
LIMIT 10;
```

---

### 3. Total Number of Orders from Japan Territory
```sql
SELECT 
    COUNT(order_number) AS total_orders,
    territory
FROM sale
WHERE territory='japan';
```

---

### 4. Average Sales per Order (by State)
```sql
SELECT state,
       ROUND(AVG(sales),2) AS avg_sales
FROM sale
GROUP BY state
ORDER BY avg_sales;
```

---

### 5. Revenue by Product Line
```sql
SELECT 
    product_line,
    SUM(sales) AS total_revenue
FROM sale
GROUP BY product_line
ORDER BY total_revenue DESC;
```

---

### 6. Top 5 Countries by Revenue
```sql
SELECT 
    country,
    SUM(sales) AS total_sales
FROM sale
GROUP BY country
ORDER BY total_sales DESC
LIMIT 5;
```

---

### 7. Orders by Deal Size
```sql
SELECT 
    deal_size,
    SUM(sales) AS total_sales
FROM sale 
GROUP BY deal_size;
```

---

### 8. Top 10 Product Performance
```sql
SELECT 
    product_code,
    SUM(quantity_ordered) AS total_quantity,
    SUM(sales) AS total_revenue
FROM sale
GROUP BY product_code
ORDER BY total_revenue DESC
LIMIT 10;
```

---

## 🚀 Key Insights
- Track **monthly & yearly orders** for trend analysis.  
- Identify **top customers** and **countries** contributing to revenue.  
- Analyze **product line performance** and **deal size distribution**.  
- Discover **best-performing products** based on revenue and quantity sold.  

---

## 🛠️ Requirements
- MySQL / MariaDB  
- Basic SQL knowledge  

---

## 📌 Author
**SQL Sales Analysis Queries** - for practice and business insights.
