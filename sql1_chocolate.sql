-- CREATE DATABASE

CREATE DATABASE ChocolateSales_;
GO

USE ChocolateSales_;
GO

-- IMPORT FILES

/*
customers.csv
products.csv
stores.csv
sales5.csv
*/

SELECT *
FROM sales


-- PHASE 1 — DATA QUALITY 

-- 1. Check row count

SELECT COUNT(*) FROM sales;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM stores;

-- 2. Check NULL values

-- Sales

SELECT *
FROM Sales
WHERE profit IS NULL

UPDATE Sales
SET profit = revenue - cost
WHERE profit IS NULL;

UPDATE Sales
SET discount = ROUND(discount, 2);

SELECT
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_null,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS order_date_null,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS product_id_null,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_null,
    SUM(CASE WHEN store_id IS NULL THEN 1 ELSE 0 END) AS store_id_null,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS quantity_null,
    SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) AS unit_price_null,
    SUM(CASE WHEN discount IS NULL THEN 1 ELSE 0 END) AS discount_null,
    SUM(CASE WHEN revenue IS NULL THEN 1 ELSE 0 END) AS revenue_null,
    SUM(CASE WHEN cost IS NULL THEN 1 ELSE 0 END) AS cost_null,
    SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END) AS profit_null
FROM sales;


-- Products

SELECT
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS product_id_null,
    SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS product_name_null,
    SUM(CASE WHEN brand IS NULL THEN 1 ELSE 0 END) AS brand_null,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS category_null,
    SUM(CASE WHEN cocoa_percent IS NULL THEN 1 ELSE 0 END) AS cocoa_percent_null,
    SUM(CASE WHEN weight_g IS NULL THEN 1 ELSE 0 END) AS weight_g_null

FROM products;


-- Customers

SELECT
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_null,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS age_null,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender_null,
    SUM(CASE WHEN loyalty_member IS NULL THEN 1 ELSE 0 END) AS loyalty_member_null,
    SUM(CASE WHEN join_date IS NULL THEN 1 ELSE 0 END) AS join_date_null
FROM customers;


-- Stores

SELECT
    SUM(CASE WHEN store_id IS NULL THEN 1 ELSE 0 END) AS store_id_null,
    SUM(CASE WHEN store_name IS NULL THEN 1 ELSE 0 END) AS store_name_null,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS city_null,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS country_null,
    SUM(CASE WHEN store_type IS NULL THEN 1 ELSE 0 END) AS store_type_null

FROM stores;



-- 3. Check Duplicates

SELECT
    order_id,
    COUNT(*) AS sales_dup_count
FROM sales
GROUP BY order_id
HAVING COUNT(*) > 1;


SELECT
    product_id,
    COUNT(*) AS product_dup_count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;


SELECT
    customer_id,
    COUNT(*) AS customer_dup_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;


SELECT
    store_id,
    COUNT(*) AS store_dup_count
FROM stores
GROUP BY store_id
HAVING COUNT(*) > 1;


-- 4. Referential Integrity Check

SELECT COUNT(*) AS orphan_products
FROM sales s
LEFT JOIN products p
ON s.product_id = p.product_id
WHERE p.product_id IS NULL;

SELECT COUNT(*) AS orphan_customers
FROM sales s
LEFT JOIN customers c
ON s.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT COUNT(*) AS orphan_stores
FROM sales s
LEFT JOIN stores st
ON s.store_id = st.store_id
WHERE st.store_id IS NULL;


-- PHASE 2 — BUILD FACT TABLE

SELECT
    s.order_id,
    s.order_date,

    s.product_id,
    s.customer_id,
    s.store_id,

    p.product_name,
    p.brand,
    p.cocoa_percent,
    p.weight_g,

    c.gender,
    c.age,

    st.city,
    st.country,
    st.store_type,

    s.quantity,
    s.unit_price,
    s.discount,
    s.revenue,
    s.cost,
    s.profit

INTO fact_sales

FROM sales s
LEFT JOIN products p
    ON s.product_id = p.product_id
LEFT JOIN customers c
    ON s.customer_id = c.customer_id
LEFT JOIN stores st
    ON s.store_id = st.store_id;


SELECT TOP 20 *
FROM fact_sales


-- Validate Fact Table 

SELECT COUNT(*) FROM sales;
SELECT COUNT(*) FROM fact_sales;


SELECT SUM(revenue)
FROM sales;
SELECT SUM(revenue)
FROM fact_sales;


SELECT SUM(revenue)
FROM sales;
SELECT SUM(revenue)
FROM fact_sales;


-- CREATE SUMMARY TABLES

-- 1. monthly_sales

SELECT
    YEAR(order_date) AS year_num,
    MONTH(order_date) AS month_num,

    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(quantity) AS quantity,

    SUM(profit) * 1.0 /
    NULLIF(SUM(revenue),0) AS margin

INTO monthly_sales

FROM fact_sales

GROUP BY
    YEAR(order_date),
    MONTH(order_date);


-- Check:

SELECT *
FROM monthly_sales
ORDER BY year_num, month_num;


-- 2. brand_performance

SELECT
    brand,

    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    SUM(quantity) AS quantity,

    AVG(unit_price) AS avg_price,

    SUM(profit) * 1.0 /
    NULLIF(SUM(revenue),0) AS margin

INTO brand_performance

FROM fact_sales

GROUP BY brand;

-- Check:

SELECT *
FROM brand_performance
ORDER BY revenue DESC;


-- 3. product_performance

SELECT
    product_name,

    brand,

    SUM(quantity) AS quantity_sold,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit

INTO product_performance

FROM fact_sales

GROUP BY
    product_name,
    brand;

-- Check:

SELECT *
FROM product_performance
ORDER BY profit DESC;


-- 4. country_performance

SELECT
    country,

    SUM(revenue) revenue,
    SUM(profit) profit,
    SUM(quantity) quantity

INTO country_performance

FROM fact_sales

GROUP BY country;


-- Check:

SELECT *
FROM country_performance
ORDER BY quantity DESC;


-- 5. customer_segment

SELECT

    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,

    gender,

    SUM(revenue) revenue,
    SUM(profit) profit,
    SUM(quantity) quantity

INTO customer_segment

FROM fact_sales

GROUP BY

    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END,

    gender;


-- Check:

SELECT *
FROM customer_segment
ORDER BY quantity DESC;


-- 6. discount_analysis

SELECT
    discount,

    COUNT(*) AS orders_count,

    AVG(quantity) AS avg_quantity,

    SUM(revenue) AS revenue,
    SUM(profit) AS profit,

    SUM(profit) * 1.0 /
    NULLIF(SUM(revenue),0) AS margin

INTO discount_analysis

FROM fact_sales

GROUP BY discount;



-- Check:

SELECT *
FROM discount_analysis
ORDER BY margin DESC;


-- 7. cocoa_analysis

SELECT
    cocoa_percent,

    AVG(unit_price) avg_price,
    AVG(quantity) avg_quantity,

    SUM(revenue) revenue,
    SUM(profit) profit

INTO cocoa_analysis

FROM fact_sales

GROUP BY cocoa_percent;


-- Check:

SELECT *
FROM cocoa_analysis
ORDER BY profit DESC;


-- 8. Price-Pack Analysis

SELECT
    weight_g,

    AVG(unit_price) avg_price,
    AVG(quantity) avg_quantity,

    SUM(revenue) revenue,
    SUM(profit) profit

INTO weight_analysis

FROM fact_sales

GROUP BY weight_g;


-- Check:

SELECT *
FROM weight_analysis
ORDER BY profit DESC;


-- 9. Store Type Analysis

SELECT
    store_type,

    SUM(revenue) revenue,
    SUM(profit) profit,
    SUM(quantity) quantity

INTO storetype_analysis

FROM fact_sales

GROUP BY store_type;


-- Check:

SELECT *
FROM storetype_analysis
ORDER BY profit DESC;