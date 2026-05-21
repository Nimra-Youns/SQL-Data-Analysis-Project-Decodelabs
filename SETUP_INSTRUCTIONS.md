# How to Use This Project

## 📋 Prerequisites

Before running the queries, ensure you have:
- **SQL Server** (Express or Enterprise Edition)
- **SQL Server Management Studio (SSMS)** - Download from [Microsoft](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
- **The Dataset Excel file** - `Dataset_for_Data_Analytics.xlsx`

---

## 🚀 Step-by-Step Setup

### **Step 1: Create the Database**

Open SQL Server Management Studio and run:

```sql
CREATE DATABASE Project3;
GO
```

### **Step 2: Import the Excel Dataset**

1. Right-click on **Project3** database → **Tasks** → **Import Data**
2. Choose **Excel** as the data source
3. Select `Dataset_for_Data_Analytics.xlsx`
4. Create a new table named **Dataset**
5. Complete the import wizard

**Alternative:** Use SQL Server Import/Export Wizard

### **Step 3: Open the Queries File**

1. Open SSMS
2. File → Open → Select `analysis_queries.sql`

### **Step 4: Run the Queries**

Execute queries one by one:

```sql
-- Run Query 1 first (Overall Summary)
USE Project3;
SELECT COUNT(OrderID) AS TotalOrders, ...

-- Then run Query 2, 3, etc.
```

---

## 📊 Understanding the Data

**Database Name:** `Project3`  
**Table Name:** `Dataset`  
**Total Records:** ~5000 orders  
**Date Range:** [Your date range]

### **Table Columns:**
- **OrderID** - Unique order identifier (Primary Key)
- **CustomerID** - Customer identifier
- **Product** - Product name/category
- **Quantity** - Order quantity (1-20 units)
- **TotalPrice** - Total order price (DECIMAL)
- **PaymentMethod** - Credit Card, Debit Card, PayPal, etc.
- **ReferralSource** - Google, Facebook, Direct, Referral, etc.

---

## 🔍 Running Individual Queries

### **Query 1: Overall Sales Summary**
```sql
USE Project3;
GO
SELECT
    COUNT(OrderID) AS TotalOrders,
    CAST(SUM(TotalPrice) AS DECIMAL(10,2)) AS TotalRevenue
FROM Dataset;
```
**Purpose:** Get total orders and revenue across entire business

---

### **Query 2: Revenue by Product**
```sql
SELECT
    Product,
    COUNT(OrderID) AS TotalOrders,
    CAST(SUM(TotalPrice) AS DECIMAL(10,2)) AS TotalRevenue
FROM Dataset
GROUP BY Product
ORDER BY TotalRevenue DESC;
```
**Purpose:** Identify which products generate most revenue

---

### **Query 3: Top 5 Customers**
```sql
SELECT TOP 5
    CustomerID,
    COUNT(OrderID) AS TotalOrderSold,
    CAST(SUM(TotalPrice) AS DECIMAL(10,2)) AS TotalRevenue
FROM Dataset
GROUP BY CustomerID
ORDER BY TotalRevenue DESC;
```
**Purpose:** Find high-value customers for retention strategies

---

**Continue with Queries 4-10 from `analysis_queries.sql`**

---

## 💡 Tips

1. **Execute one query at a time** - Use GO to separate queries
2. **Read results carefully** - Look for trends and patterns
3. **Modify WHERE clauses** - Change filters to ask different questions
4. **Add your own queries** - Practice with your own analytical questions
5. **Export results** - Right-click results → Export to Excel

---

## ❓ Troubleshooting

| Problem | Solution |
|---------|----------|
| "Cannot find database" | Verify database name is `Project3` |
| "Invalid column name" | Ensure table is named `Dataset` |
| "Conversion failed" | Check data types in CAST function |
| "Login failed" | Verify SQL Server is running |

---

## 🎓 Learning Resources

- **T-SQL Documentation:** https://docs.microsoft.com/en-us/sql/t-sql/language-reference
- **SQL Tutorials:** https://www.w3schools.com/sql/
- **GROUP BY Guide:** https://docs.microsoft.com/en-us/sql/t-sql/queries/select-group-by-transact-sql

---

**Happy analyzing! 🚀**
