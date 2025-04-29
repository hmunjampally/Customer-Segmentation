#Goal to Replace Excel Pivot with SQL Queries


#1. Customers By Age Group
SELECT age_group, count(customer_id) as 'Customer Count' 
FROM customer_sales_summary GROUP BY age_group ORDER BY age_group;


#2. Total amount spent by customers in each store
SELECT shopping_mall, round(sum(total_spend),2) as Total_revenue 
FROM customer_sales_summary GROUP BY shopping_mall ORDER BY Total_revenue DESC;


#3. Category Sales by Mall
SELECT shopping_mall, category, round(sum(quantity),0) as Total_sales 
FROM customer_sales_summary GROUP BY shopping_mall, category ORDER BY shopping_mall, Total_sales DESC;


#4. Customers by Payment Method & Age Group
SELECT age_group, payment_method, count(DISTINCT customer_id) AS Customer_Count 
FROM customer_sales_summary GROUP BY age_group, payment_method ORDER BY payment_method, age_group;


#5. Monthly Revenue Trend
SELECT DATE_FORMAT(invoice_date, '%Y-%m') AS month,
  ROUND(SUM(total_spend), 2) AS monthly_revenue
FROM customer_sales_summary GROUP BY month ORDER BY month;



