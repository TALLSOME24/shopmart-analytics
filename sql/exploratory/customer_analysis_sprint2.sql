-- Top 5 customers by total spend

SELECT TOP 5
    customer_id,
    SUM(revenue) AS total_spent
FROM sales_transactions
GROUP BY customer_id
ORDER BY total_spent DESC

-- Customers who made only one purchase

SELECT 
	customer_id,
	COUNT(order_id)
FROM sales_transactions 
GROUP BY customer_id
HAVING COUNT(order_id) = 1

-- Total revenue and order count per customer

SELECT
	customer_id,
	SUM(revenue) AS total_revenue,
	COUNT(order_id) AS order_count
FROM sales_transactions 
GROUP BY customer_id
ORDER BY total_revenue DESC

-- Customers who spent above average order value

SELECT
    customer_id,
    order_id,
    revenue
FROM sales_transactions
WHERE revenue > (SELECT AVG(revenue) FROM sales_transactions)
ORDER BY revenue DESC

-- Most purchased category per city

SELECT
	city,
	category,
COUNT(order_id) AS order_count
FROM sales_transactions 
GROUP BY city, category
ORDER BY order_count DESC