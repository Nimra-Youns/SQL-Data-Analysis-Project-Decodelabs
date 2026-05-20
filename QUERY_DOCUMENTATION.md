# SQL Query Documentation

## Overview
This document provides detailed explanations of each SQL query in the project, including the purpose, syntax breakdown, and expected outcomes.

---

## Query 1: Overall Sales Summary

**Purpose:** Get a high-level overview of business performance

**SQL Concepts Used:**
- `COUNT()` - Aggregate function to count rows
- `SUM()` - Aggregate function to sum values
- `CAST()` - Type conversion for formatting

**Query Breakdown:**
```sql
SELECT
    COUNT(OrderID) AS TotalOrders,          -- Counts all orders
    CAST(SUM(TotalPrice) AS DECIMAL(10,2)) -- Sums and formats revenue
FROM Dataset;
```

**Expected Output:**
| TotalOrders | TotalRevenue |
|-------------|--------------|
| 5000        | 1,234,567.89 |

**Use Case:** Quickly check overall business metrics without drilling down into details.

---

## Query 2: Revenue Analysis by Product

**Purpose:** Identify which products are most profitable

**SQL Concepts Used:**
- `GROUP BY` - Groups data by product
- `ORDER BY DESC` - Sorts in descending order
- Aggregate functions with grouping

**Query Breakdown:**
```sql
SELECT
    Product,                                  -- Product name
    COUNT(OrderID) AS TotalOrders,           -- Orders per product
    CAST(SUM(TotalPrice) AS DECIMAL(10,2)) AS TotalRevenue -- Revenue
FROM Dataset
GROUP BY Product                             -- Group by each product
ORDER BY TotalRevenue DESC;                  -- Sort highest revenue first
```

**Expected Output:**
| Product    | TotalOrders | TotalRevenue |
|------------|-------------|--------------|
| Electronics | 850        | 245,000.00   |
| Clothing   | 920        | 185,500.00   |
| Books      | 650        | 32,500.00    |

**Use Case:** Determine product portfolio performance and identify star performers.

---

## Query 3: Top 5 Customers by Revenue

**Purpose:** Identify VIP/high-value customers for retention strategies

**SQL Concepts Used:**
- `TOP` - Limits results to top N rows
- `GROUP BY` - Groups by customer
- `ORDER BY` - Sorts by revenue descending

**Query Breakdown:**
```sql
SELECT TOP 5                                 -- Get only top 5 rows
    CustomerID,
    COUNT(OrderID) AS TotalOrderSold,       -- Count orders per customer
    CAST(SUM(TotalPrice) AS DECIMAL(10,2)) AS TotalRevenue
FROM Dataset
GROUP BY CustomerID                          -- Group by each customer
ORDER BY TotalRevenue DESC;                  -- Sort by highest spenders first
```

**Expected Output:**
| CustomerID | TotalOrderSold | TotalRevenue |
|------------|----------------|--------------|
| CUST001    | 45             | 125,500.00   |
| CUST045    | 38             | 98,250.00    |
| CUST023    | 52             | 95,000.00    |
| CUST089    | 35             | 87,600.00    |
| CUST012    | 41             | 82,300.00    |

**Use Case:** Create loyalty programs or special offers for top customers.

---

## Query 4: Revenue Analysis by Payment Method

**Purpose:** Understand payment method preferences and their contribution

**SQL Concepts Used:**
- `GROUP BY` - Groups by payment method
- Multiple aggregate functions
- `COUNT(*)` - Counts all rows

**Query Breakdown:**
```sql
SELECT 
    PaymentMethod,                           -- Payment type (Credit Card, etc.)
    COUNT(*) AS TotalOrders,                -- Count of transactions
    CAST(SUM(TotalPrice) AS DECIMAL(10,2)) AS TotalRevenue
FROM Dataset
GROUP BY PaymentMethod                       -- Group by each payment type
ORDER BY TotalRevenue DESC;                  -- Sort by revenue
```

**Expected Output:**
| PaymentMethod | TotalOrders | TotalRevenue |
|--------------|-------------|--------------|
| Credit Card  | 2800        | 650,000.00   |
| Debit Card   | 1200        | 280,000.00   |
| PayPal       | 800         | 185,000.00   |
| Other        | 200         | 45,000.00    |

**Use Case:** Optimize payment processing and identify payment trends.

---

## Query 5: High-Value Google Referral Orders

**Purpose:** Analyze effectiveness of Google referral channel with quality filters

**SQL Concepts Used:**
- `WHERE` - Filters data with multiple conditions
- `AND` - Combines multiple conditions
- `TOP` - Limits results
- `ORDER BY` - Sorts results

**Query Breakdown:**
```sql
SELECT TOP 5 
    OrderID, 
    CustomerID, 
    Product, 
    Quantity,
    CAST(TotalPrice AS DECIMAL(10,2)) AS TotalPrice
FROM Dataset
WHERE ReferralSource = 'Google'              -- Filter for Google only
  AND Quantity > 4                           -- Filter for bulk orders
ORDER BY TotalPrice DESC;                    -- Show highest value first
```

**Expected Output:**
| OrderID | CustomerID | Product    | Quantity | TotalPrice |
|---------|-----------|-----------|----------|-----------|
| ORD5421 | CUST234   | Electronics | 8       | 8,950.00  |
| ORD5389 | CUST567   | Electronics | 6       | 7,200.00  |
| ORD5198 | CUST123   | Clothing   | 12      | 2,400.00  |

**Use Case:** Evaluate ROI on Google referral channel; understand high-value customer behavior.

---

## Query 6: Referral Source Analysis

**Purpose:** Identify effective marketing channels with minimum order threshold

**SQL Concepts Used:**
- `GROUP BY` - Groups by referral source
- `HAVING` - Filters groups (not rows)
- `COUNT(*)` - Counts rows per group

**Key Difference:** WHERE filters before grouping; HAVING filters after grouping

**Query Breakdown:**
```sql
SELECT
    ReferralSource,
    COUNT(*) AS TotalOrders
FROM Dataset
GROUP BY ReferralSource                      -- Group by source
HAVING COUNT(*) > 10;                        -- Only show sources with 10+ orders
```

**Expected Output:**
| ReferralSource | TotalOrders |
|---|---|
| Google         | 850         |
| Facebook       | 620         |
| Direct         | 450         |
| Referral       | 200         |

**Use Case:** Focus marketing budget on effective channels; eliminate underperforming sources.

---

## Query 7: Top 5 Most Expensive Orders (Using CTE)

**Purpose:** Get detailed information about premium orders using advanced SQL

**SQL Concepts Used:**
- **CTE (Common Table Expression)** - Creates temporary result set
- `WITH` - Defines CTE
- `INNER JOIN` - Joins two tables
- `AS` - Aliases for result sets

**Query Breakdown:**
```sql
WITH Top5Records AS (                        -- Define CTE: temporary result set
    SELECT TOP 5
        OrderID
    FROM Dataset
    ORDER BY TotalPrice DESC
)
SELECT                                       -- Main query
    s.OrderID,
    s.CustomerID,
    s.Product,
    s.Quantity,
    CAST(s.TotalPrice AS DECIMAL(10,2)) AS TotalPrice
FROM Dataset s                               -- Alias 's' for Dataset
INNER JOIN Top5Records t                     -- Join with CTE
    ON s.OrderID = t.OrderID                 -- Match by OrderID
ORDER BY s.TotalPrice DESC;
```

**Why Use CTE?**
- Improves readability
- Makes complex queries easier to maintain
- Can be reused within the same query
- Useful for hierarchical or recursive data

**Expected Output:**
| OrderID | CustomerID | Product     | Quantity | TotalPrice |
|---------|-----------|------------|----------|-----------|
| ORD5000 | CUST001   | Electronics | 20       | 25,000.00 |
| ORD4999 | CUST045   | Electronics | 18       | 22,500.00 |

**Use Case:** Analyze characteristics of premium orders; identify VIP transaction patterns.

---

## Bonus Queries

### Query 8: Average Order Value by Product
**Purpose:** Compare product profitability and price ranges
**Key Metrics:** Average, Min, and Max prices

### Query 9: Customer Count by Referral Source
**Purpose:** Understand customer acquisition effectiveness
**Key Metrics:** Unique customer count vs. total orders

### Query 10: Orders by Quantity Range
**Purpose:** Segment orders by volume
**Key Metrics:** Quantity categories and average pricing

---

## SQL Concepts Summary

| Concept | Purpose | Example |
|---------|---------|---------|
| SELECT | Choose columns | `SELECT OrderID, Product` |
| WHERE | Filter rows | `WHERE ReferralSource = 'Google'` |
| GROUP BY | Group data | `GROUP BY Product` |
| HAVING | Filter groups | `HAVING COUNT(*) > 10` |
| ORDER BY | Sort results | `ORDER BY TotalRevenue DESC` |
| COUNT | Count rows | `COUNT(OrderID)` |
| SUM | Sum values | `SUM(TotalPrice)` |
| AVG | Average values | `AVG(TotalPrice)` |
| TOP | Limit rows | `TOP 5` |
| CAST | Convert types | `CAST(value AS DECIMAL(10,2))` |
| JOIN | Combine tables | `INNER JOIN Table2 ON condition` |
| CTE | Temporary dataset | `WITH CTE AS (...)` |

---

## Performance Tips

1. **Use WHERE before GROUP BY** - Filter rows early for better performance
2. **Specify column names** - Avoid `SELECT *` for clarity and performance
3. **Use appropriate data types** - Use DECIMAL for money, not FLOAT
4. **Index filtered columns** - Add indexes on WHERE and JOIN columns
5. **Use CTEs for complex logic** - Improves readability and maintainability

---

## Next Steps

- Modify queries to answer your specific business questions
- Add additional aggregations (AVG, MIN, MAX)
- Create views for frequently used queries
- Build dashboards to visualize results
- Export results to Excel or other tools for further analysis

