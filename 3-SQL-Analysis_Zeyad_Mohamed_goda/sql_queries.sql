CREATE DATABASE decodelabs_project3;
USE decodelabs_project3;

SELECT COUNT(*) FROM orders; 
SELECT * FROM orders ;

# 1- What are all Delivered orders, sorted by highest net_total?
SELECT 
    order_id,
    date,
    customer_id,
    product,
    quantity,
    net_total
FROM orders
WHERE order_status = 'Delivered'
ORDER BY net_total DESC
LIMIT 10;

# 2-How many orders were placed for each product?
SELECT 
    product,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY product
ORDER BY total_orders DESC;

# 3-What is the total and average revenue per product?
SELECT 
    product,
    COUNT(order_id)          AS total_orders,
    ROUND(SUM(net_total), 2) AS total_revenue,
    ROUND(AVG(net_total), 2) AS avg_order_value
FROM orders
GROUP BY product
ORDER BY total_revenue DESC;


#4-Which referral source brings the most orders? 

SELECT 
    referral_source,
    COUNT(order_id) AS total_orders,
    ROUND(COUNT(order_id) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS percentage_of_total
FROM orders
GROUP BY referral_source
ORDER BY total_orders DESC;

#5-What is the total discount given per coupon code? 

SELECT 
    coupon_code,
    COUNT(order_id)                AS times_used,
    ROUND(SUM(discount_amount), 2) AS total_discount_given,
    ROUND(AVG(discount_amount), 2) AS avg_discount_per_order
FROM orders
GROUP BY coupon_code
ORDER BY total_discount_given DESC;
#6-Which payment methods are used on high-value orders (net_total > 1500)? 

SELECT 
    payment_method,
    COUNT(order_id)          AS high_value_orders,
    ROUND(SUM(net_total), 2) AS total_revenue,
    ROUND(AVG(net_total), 2) AS avg_order_value
FROM orders
WHERE net_total > 1500
GROUP BY payment_method
ORDER BY high_value_orders DESC;


#7-Which products have an average order value above $1000? 
SELECT 
    product,
    COUNT(order_id)          AS total_orders,
    ROUND(AVG(net_total), 2) AS avg_order_value,
    ROUND(SUM(net_total), 2) AS total_revenue
FROM orders
GROUP BY product
HAVING AVG(net_total) > 1000
ORDER BY avg_order_value DESC;


#8-How much revenue was lost to Cancelled and Returned orders per product? 
SELECT 
    product,
    COUNT(order_id)          AS problem_orders,
    ROUND(SUM(net_total), 2) AS revenue_lost,
    ROUND(AVG(net_total), 2) AS avg_lost_per_order
FROM orders
WHERE order_status IN ('Cancelled', 'Returned')
GROUP BY product
ORDER BY revenue_lost DESC;


#9-What is the monthly order count and total revenue for each month? 
SELECT 
    DATE_FORMAT(date, '%Y-%m')   AS order_month,
    COUNT(order_id)              AS total_orders,
    ROUND(SUM(net_total), 2)     AS monthly_revenue,
    ROUND(AVG(net_total), 2)     AS avg_order_value
FROM orders
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY order_month ASC;


#10-Which referral source generates the highest average net revenue — only for sources with more than 200 orders? 
SELECT 
    referral_source,
    COUNT(order_id)                AS total_orders,
    ROUND(AVG(net_total), 2)       AS avg_order_value,
    ROUND(SUM(net_total), 2)       AS total_revenue,
    ROUND(AVG(discount_amount), 2) AS avg_discount
FROM orders
GROUP BY referral_source
HAVING COUNT(order_id) >= 200
ORDER BY avg_order_value DESC;