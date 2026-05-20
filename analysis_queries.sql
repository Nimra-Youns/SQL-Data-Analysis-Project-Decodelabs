-- ================================================================
-- SQL Data Analysis Project - Query Collection
-- Database: Project3
-- Table: Dataset
-- ================================================================

-- Use the Project3 database
USE Project3;
GO

-- ================================================================
-- QUERY 1: Overall Sales Summary
-- Description: Get total number of orders and total revenue
-- ================================================================
SELECT
    COUNT(OrderID) AS TotalOrders,
    CAST(SUM(TotalPrice) AS DECIMAL(10,2)) AS TotalRevenue
FROM Dataset;

GO

-- ================================================================
-- QUERY 2: Revenue Analysis by Product
-- Description: Shows which products generate the most revenue
-- Sorted in descending order of revenue
-- ================================================================
SELECT
    Product,
    COUNT(OrderID) AS TotalOrders,
    CAST(SUM(TotalPrice) AS DECIMAL(10,2)) AS TotalRevenue
FROM Dataset
GROUP BY Product
ORDER BY TotalRevenue DESC;

GO

-- ================================================================
-- QUERY 3: Top 5 Customers by Revenue
-- Description: Identifies the top 5 customers by total spending
-- ================================================================
SELECT TOP 5
    CustomerID,
    COUNT(OrderID) AS TotalOrderSold,
    CAST(SUM(TotalPrice) AS DECIMAL(10,2)) AS TotalRevenue
FROM Dataset
GROUP BY CustomerID
ORDER BY TotalRevenue DESC;

GO

-- ================================================================
-- QUERY 4: Revenue Analysis by Payment Method
-- Description: Shows order count and revenue breakdown by payment type
-- ================================================================
SELECT 
    PaymentMethod,
    COUNT(*) AS TotalOrders,
    CAST(SUM(TotalPrice) AS DECIMAL(10,2)) AS TotalRevenue
FROM Dataset
GROUP BY PaymentMethod
ORDER BY TotalRevenue DESC;

GO

-- ================================================================
-- QUERY 5: High-Value Google Referral Orders
-- Description: Filters orders from Google with quantity > 4
-- Shows top 5 results ordered by price (descending)
-- ================================================================
SELECT TOP 5 
    OrderID, 
    CustomerID, 
    Product, 
    Quantity,
    CAST(TotalPrice AS DECIMAL(10,2)) AS TotalPrice
FROM Dataset
WHERE ReferralSource = 'Google' AND Quantity > 4
ORDER BY TotalPrice DESC;

GO

-- ================================================================
-- QUERY 6: Referral Source Analysis
-- Description: Shows referral sources with more than 10 orders
-- Useful for identifying effective marketing channels
-- ================================================================
SELECT
    ReferralSource,
    COUNT(*) AS TotalOrders
FROM Dataset
GROUP BY ReferralSource
HAVING COUNT(*) > 10;

GO

-- ================================================================
-- QUERY 7: Top 5 Most Expensive Orders (Using CTE)
-- Description: Uses Common Table Expression to get top 5 orders
-- by price with complete order details
-- ================================================================
WITH Top5Records AS (
    SELECT TOP 5
        OrderID
    FROM Dataset
    ORDER BY TotalPrice DESC
)
SELECT
    s.OrderID,
    s.CustomerID,
    s.Product,
    s.Quantity,
    CAST(s.TotalPrice AS DECIMAL(10,2)) AS TotalPrice
FROM Dataset s
INNER JOIN Top5Records t ON s.OrderID = t.OrderID
ORDER BY s.TotalPrice DESC;

GO

-- ================================================================
-- ADDITIONAL ANALYSIS QUERIES (Bonus)
-- ================================================================

-- QUERY 8: Average Order Value by Product
SELECT
    Product,
    COUNT(OrderID) AS OrderCount,
    CAST(AVG(TotalPrice) AS DECIMAL(10,2)) AS AvgOrderValue,
    CAST(MIN(TotalPrice) AS DECIMAL(10,2)) AS MinPrice,
    CAST(MAX(TotalPrice) AS DECIMAL(10,2)) AS MaxPrice
FROM Dataset
GROUP BY Product
ORDER BY AvgOrderValue DESC;

GO

-- QUERY 9: Customer Count by Referral Source
SELECT
    ReferralSource,
    COUNT(DISTINCT CustomerID) AS UniqueCustomers,
    COUNT(*) AS TotalOrders,
    CAST(SUM(TotalPrice) AS DECIMAL(10,2)) AS TotalRevenue
FROM Dataset
GROUP BY ReferralSource
ORDER BY TotalRevenue DESC;

GO

-- QUERY 10: Orders by Quantity Range
SELECT
    CASE 
        WHEN Quantity = 1 THEN '1 Item'
        WHEN Quantity BETWEEN 2 AND 4 THEN '2-4 Items'
        WHEN Quantity BETWEEN 5 AND 10 THEN '5-10 Items'
        ELSE '10+ Items'
    END AS QuantityRange,
    COUNT(*) AS OrderCount,
    CAST(AVG(TotalPrice) AS DECIMAL(10,2)) AS AvgPrice
FROM Dataset
GROUP BY 
    CASE 
        WHEN Quantity = 1 THEN '1 Item'
        WHEN Quantity BETWEEN 2 AND 4 THEN '2-4 Items'
        WHEN Quantity BETWEEN 5 AND 10 THEN '5-10 Items'
        ELSE '10+ Items'
    END
ORDER BY OrderCount DESC;

GO

-- ================================================================
-- END OF QUERY COLLECTION
-- ================================================================
