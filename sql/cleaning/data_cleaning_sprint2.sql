-- ShopSmart Data Cleaning Script
-- Analyst: TALLSOME24
-- Date: 11 March 2026
-- Sprint 2 - Task 2

USE ShopSmartDB;
GO

-- Fix 1: Inconsistent category casing
UPDATE dirty_sales
SET category = 'Electronics'
WHERE category = 'ELECTRONICS';

UPDATE dirty_sales
SET category = 'FMCG'
WHERE category = 'fmcg';

-- Fix 2: Inconsistent city casing
UPDATE dirty_sales
SET city = 'Abuja'
WHERE city = 'ABUJA';

-- Fix 3: Wrong date format
UPDATE dirty_sales
SET order_date = '2026-01-03'
WHERE order_date = '03-01-2026';

-- Fix 4: Negative revenue
UPDATE dirty_sales
SET revenue = 90250
WHERE order_id = 'ORD-060';

-- Fix 5: Zero quantity - invalid order
DELETE FROM dirty_sales
WHERE quantity = 0;

-- Fix 6: Missing customer ID
UPDATE dirty_sales
SET customer_id = 'CUST-UNKNOWN'
WHERE customer_id IS NULL;

-- Fix 7: Duplicate order ID
DELETE FROM dirty_sales
WHERE order_id = 'ORD-051'
AND customer_id = 'CUST-511';

-- Verify clean data
SELECT * FROM dirty_sales
ORDER BY order_date;