-- ============================================
-- ShopSmart 2024 Sales Analysis
-- Analyst: TALLSOME24
-- Date: 10 March 2026
-- Sprint 1 - Task 1
-- ============================================

USE ShopSmartDB;
GO

-- Q1: Total revenue generated in 2024
SELECT 
    SUM(revenue) AS total_revenue
FROM sales_transactions;

-- Q2: Revenue by month (highest to lowest)
SELECT 
    MONTH(order_date) AS month_number,
    SUM(revenue) AS total_revenue
FROM sales_transactions
GROUP BY MONTH(order_date)
ORDER BY total_revenue DESC;

-- Q3: Revenue by product category
SELECT 
    category,
    SUM(revenue) AS total_revenue
FROM sales_transactions
GROUP BY category
ORDER BY total_revenue DESC;

-- Q4: Number of orders by city
SELECT 
    city,
    COUNT(order_id) AS total_orders
FROM sales_transactions
GROUP BY city
ORDER BY total_orders DESC;

-- Q5: Average order value
SELECT 
    AVG(revenue) AS avg_order_value
FROM sales_transactions;