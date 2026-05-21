# Database Schema Documentation

## 📊 Project3 Database Overview

**Database Name:** `Project3`  
**Primary Table:** `Dataset`  
**Records:** ~5000 e-commerce orders  
**Data Type:** Transactional/Sales Data

---

## 🗂️ Table: Dataset

### **Schema Definition**

```sql
CREATE TABLE Dataset (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(50) NOT NULL,
    Product VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    TotalPrice DECIMAL(10,2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    ReferralSource VARCHAR(100) NOT NULL
);
```

---

## 📋 Column Details

### **1. OrderID**
- **Data Type:** INT
- **Constraint:** PRIMARY KEY (Unique identifier)
- **Range:** 1 - 5000+
- **Example:** 12345, 54321
- **Purpose:** Uniquely identifies each order

### **2. CustomerID**
- **Data Type:** VARCHAR(50)
- **Constraint:** NOT NULL
- **Format:** CUST001, CUST002, etc.
- **Unique Values:** ~2000 customers
- **Purpose:** Links orders to customers

### **3. Product**
- **Data Type:** VARCHAR(100)
- **Constraint:** NOT NULL
- **Sample Values:**
  - Electronics
  - Clothing
  - Books
  - Home & Garden
  - Sports Equipment
- **Unique Values:** ~10-15 products
- **Purpose:** Identifies product category/name

### **4. Quantity**
- **Data Type:** INT
- **Constraint:** NOT NULL
- **Range:** 1 - 20 units
- **Average:** ~4-5 units per order
- **Purpose:** Number of items ordered

### **5. TotalPrice**
- **Data Type:** DECIMAL(10,2)
- **Constraint:** NOT NULL
- **Range:** $10.00 - $50,000.00
- **Precision:** Exactly 2 decimal places (cents)
- **Format:** Always includes cents (e.g., $99.99)
- **Purpose:** Total order value

### **6. PaymentMethod**
- **Data Type:** VARCHAR(50)
- **Constraint:** NOT NULL
- **Sample Values:**
  - Credit Card (most common)
  - Debit Card
  - PayPal
  - Apple Pay
  - Google Pay
  - Bank Transfer
- **Unique Values:** ~6-8 methods
- **Purpose:** Shows customer payment preference

### **7. ReferralSource**
- **Data Type:** VARCHAR(100)
- **Constraint:** NOT NULL
- **Sample Values:**
  - Google (organic search)
  - Facebook (social media)
  - Direct (typed URL)
  - Referral (word of mouth)
  - Instagram
  - LinkedIn
  - Email Campaign
  - Affiliate
- **Unique Values:** ~8-12 sources
- **Purpose:** Marketing attribution - how customer found you

---

## 📊 Data Statistics

| Metric | Value |
|--------|-------|
| **Total Orders** | ~5000 |
| **Total Unique Customers** | ~2000 |
| **Total Products** | ~12 |
| **Total Revenue** | ~$1.2M |
| **Avg Order Value** | ~$250 |
| **Date Range** | [TBD] |

---

## 🔗 Key Relationships

### **One-to-Many: Customer to Orders**
```
1 Customer ──→ Many Orders
(CUST001 has 20+ orders)
```

### **One-to-Many: Product to Orders**
```
1 Product ──→ Many Orders
(Electronics appears in 800+ orders)
```

### **One-to-Many: Payment Method to Orders**
```
1 Payment Method ──→ Many Orders
(Credit Card used in 2800+ orders)
```

### **One-to-Many: Referral Source to Orders**
```
1 Referral Source ──→ Many Orders
(Google drives 850+ orders)
```

---

## 📈 Sample Data

| OrderID | CustomerID | Product | Quantity | TotalPrice | PaymentMethod | ReferralSource |
|---------|-----------|---------|----------|-----------|----------------|----------------|
| 1001 | CUST001 | Electronics | 2 | 599.98 | Credit Card | Google |
| 1002 | CUST045 | Clothing | 5 | 249.95 | PayPal | Facebook |
| 1003 | CUST123 | Books | 1 | 29.99 | Debit Card | Direct |
| 1004 | CUST089 | Electronics | 8 | 4,799.92 | Credit Card | Referral |
| 1005 | CUST234 | Home & Garden | 3 | 149.97 | Credit Card | Google |

---

## 🔍 Data Quality Notes

### **Valid Ranges**
- **Quantity:** Always 1 or greater
- **TotalPrice:** Always positive, includes decimal cents
- **OrderID:** Unique, sequential
- **All columns:** No NULL values

### **Data Characteristics**
- **No duplicates** in OrderID
- **Case sensitivity:** Product names are consistent
- **Referral sources:** Standardized values
- **Payment methods:** Limited to known types

---

## 📝 SQL Data Types Used

| Data Type | Column | Why This Type? |
|-----------|--------|---|
| INT | OrderID, Quantity | Whole numbers only |
| VARCHAR(50) | CustomerID, PaymentMethod | Variable length text, reasonable limit |
| VARCHAR(100) | Product, ReferralSource | More space for longer values |
| DECIMAL(10,2) | TotalPrice | Financial data requires precision |

**Note:** DECIMAL(10,2) means:
- 10 total digits
- 2 digits after decimal point
- Max value: 99,999,999.99

---

## 🔐 Data Security Considerations

- **No sensitive data** like phone numbers, emails, addresses
- **No PII (Personal Identifiable Information)**
- **Safe for learning/portfolio projects**
- **Realistic for e-commerce analysis**

---

## 📊 Common Analysis Dimensions

### **By Product**
- Total orders per product
- Revenue per product
- Average order value per product

### **By Customer**
- Customer lifetime value
- Repeat purchase rate
- Most valuable customers

### **By Payment Method**
- Payment method preferences
- Average transaction value per method
- Payment method trends

### **By Referral Source**
- Cost per acquisition
- Conversion by source
- Customer quality by source

### **By Order Value**
- Small orders (< $100)
- Medium orders ($100 - $1,000)
- Large orders (> $1,000)

---

## 💾 Backup & Export

### **Export to CSV**
```sql
-- In SSMS: Right-click results → Export to CSV
```

### **Backup Database**
```sql
BACKUP DATABASE Project3
TO DISK = 'C:\Backups\Project3.bak'
GO
```

### **Restore Database**
```sql
RESTORE DATABASE Project3
FROM DISK = 'C:\Backups\Project3.bak'
GO
```

---

## 🚀 Future Enhancements

Potential columns to add:
- `OrderDate` - When order was placed
- `ShippingAddress` - Delivery location
- `CustomerEmail` - Contact information
- `ProductCategory` - Sub-categorization
- `DiscountApplied` - Promotional discounts
- `ShippingCost` - Additional delivery fees

---

**Data Schema Last Updated:** 2026

