
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

### 1. Top 10 Customers with the Highest Sales

### 2. Total Number of Orders from Japan Territory

### 3. Average Sales per Order (by State)

### 4. Revenue by Product Line

### 5. Top 5 Countries by Revenue

### 6. Orders by Deal Size

### 7. Top 10 Product Performance

### 8. Total Orders per Month and Year

## 🚀 Key Insights
- Track **monthly & yearly orders** for trend analysis.  
- Identify **top customers** and **countries** contributing to revenue.  
- Analyze **product line performance** and **deal size distribution**.  
- Discover **best-performing products** based on revenue and quantity sold.  

---

## 🛠️ Requirements
- MySQL   
- Basic SQL knowledge  

---

## 📌 Author
**SQL Sales Analysis Queries** - for practice and business insights.
