-- ============================================
-- ShopSmart Advanced Analysis
-- Analyst: TALLSOME24
-- Date: 12 March 2026
-- Sprint 3 - Task 1
-- ============================================

USE ShopSmartDB;
GO

-- Q1 cumulative revenue month by month
SELECT
    MONTH(order_date) AS month_number,
    SUM(revenue) AS monthly_revenue,
    SUM(SUM(revenue)) OVER (ORDER BY MONTH(order_date)) AS running_total
FROM sales_transactions
GROUP BY MONTH(order_date)
ORDER BY month_number;

-- Q2: Rank products by revenue within each category
SELECT 
    category,
    product_name,
    SUM(revenue) AS total_revenue,
    RANK() OVER (PARTITION BY category ORDER BY SUM(revenue) DESC) AS rank_in_category
FROM sales_transactions
GROUP BY category, product_name
ORDER BY category, rank_in_category;

-- Q3: Month over Month revenue growth
SELECT
    month_number,
    monthly_revenue,
    LAG(monthly_revenue) OVER (ORDER BY month_number) AS prev_month_revenue,
    monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY month_number) AS mom_growth
FROM (
    SELECT
        MONTH(order_date) AS month_number,
        SUM(revenue) AS monthly_revenue
    FROM sales_transactions
    GROUP BY MONTH(order_date)
) AS monthly_data
ORDER BY month_number;

-- Q4: Best performing product per category
WITH ranked_products AS (
    SELECT 
        category,
        product_name,
        SUM(revenue) AS total_revenue,
        RANK() OVER (PARTITION BY category ORDER BY SUM(revenue) DESC) AS rank_in_category
    FROM sales_transactions
    GROUP BY category, product_name
)
SELECT *
FROM ranked_products
WHERE rank_in_category = 1
ORDER BY category;

-- Q5: Revenue contribution per category
SELECT
    category,
    SUM(revenue) AS category_revenue,
    ROUND(SUM(revenue) * 100.0 / (SELECT SUM(revenue) FROM sales_transactions), 2) AS revenue_percentage
FROM sales_transactions
GROUP BY category
ORDER BY revenue_percentage DESC;