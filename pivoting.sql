CREATE OR REPLACE VIEW customer_sales_summary AS
SELECT 
    c.customer_id,
    c.gender,
    c.age,
    CASE
        WHEN c.age < 25 THEN '<25'
        WHEN c.age BETWEEN 25 AND 40 THEN '25-40'
        WHEN c.age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60+'
    END AS age_group,
    c.payment_method,
    
    s.invoice_no,
    s.invoice_date,
    s.category,
    s.quantity,
    s.price,
    s.quantity * s.price AS total_spend,
    s.shopping_mall,
    
    CASE 
        WHEN WEEKDAY(s.invoice_date) IN (5,6) THEN 'Weekend'
        ELSE 'Weekday'
    END AS weekend_flag,
    
    CASE 
        WHEN MONTH(s.invoice_date) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN MONTH(s.invoice_date) BETWEEN 4 AND 6 THEN 'Q2'
        WHEN MONTH(s.invoice_date) BETWEEN 7 AND 9 THEN 'Q3'
        ELSE 'Q4'
    END AS sales_quarter,
    
    CASE 
        WHEN (s.quantity * s.price) > 500 THEN 'High Spender'
        WHEN (s.quantity * s.price) BETWEEN 200 AND 500 THEN 'Medium Spender'
        ELSE 'Low Spender'
    END AS spending_category,
    
    m.location,
    m.store_count,
    m.area_sqm
FROM sales_data s
JOIN Customer_data c ON s.customer_id = c.customer_id
JOIN Shopping_Mall m ON s.shopping_mall = m.shopping_mall;



SELECT * FROM customer_sales_summary;


SELECT COUNT(*) 
FROM sales_data s
JOIN Customer_data c ON s.customer_id = c.customer_id;


SELECT COUNT(*) 
FROM sales_data s
JOIN Shopping_Mall m ON s.shopping_mall = m.shopping_mall;



