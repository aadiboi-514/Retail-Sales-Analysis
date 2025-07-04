
# 🛒 Retail Sales Analysis (SQL Project)

This project involves cleaning, exploring, and analyzing retail sales data using **SQL**. It answers key business questions such as identifying top customers, best-selling periods, and customer behavior across categories and time.

## 📁 Dataset Overview

The dataset (`retail`) contains sales transaction data with the following key columns:

- `transactions_id`
- `sale_date` (DATE)
- `sale_time` (TIME)
- `customer_id`
- `gender`
- `age`
- `category` (e.g., Clothing, Beauty)
- `quantity`
- `price_per_unit`
- `cogs` (Cost of Goods Sold)
- `total_sale` (Revenue per transaction)

## ⚙️ SQL Tasks Performed

### 🧼 1. Data Cleaning
Removed rows with `NULL` values in essential fields.

```sql
DELETE FROM retail
WHERE ... IS NULL;
```

### 📊 2. Data Exploration

- **Total Sales**: `COUNT(*)`
- **Unique Customers**: `COUNT(DISTINCT customer_id)`
- **Unique Categories**: `DISTINCT category`

### 🔍 3. Business Questions Answered

| Query # | Question |
|--------|----------|
| 1 | Sales made on `'2022-11-05'` |
| 2 | Clothing category sales with quantity > 4 in November 2022 |
| 3 | Total sales and order count per category |
| 4 | Average age of customers who bought from the `Beauty` category |
| 5 | Transactions where `total_sale` > 1000 |
| 6 | Number of transactions by gender within each category |
| 7 | Monthly average sales and best-selling month per year |
| 8 | Top 5 customers by total sales |
| 9 | Unique customers per category |
| 10 | Shift-based order count: Morning, Afternoon, Evening |

## ⏱️ Shift Logic

Defined as:

- **Morning:** `sale_time` ≤ 12:00
- **Afternoon:** `12:01` – `17:00`
- **Evening:** after `17:00`

```sql
CASE
  WHEN HOUR(sale_time) <= 12 THEN 'Morning'
  WHEN HOUR(sale_time) BETWEEN 13 AND 17 THEN 'Afternoon'
  ELSE 'Evening'
END
```

## 📌 Tools & Compatibility

- SQL syntax compatible with **MySQL**
- Uses **CTEs**, `RANK()`, `GROUP BY`, `CASE`, and `AGGREGATE FUNCTIONS`
- Assumes `ONLY_FULL_GROUP_BY` is enabled (best SQL practices)

## 📈 Sample Insights

- Evening is the most active sales shift
- Top customers generate significantly more revenue than the average
- Clothing and Electronics categories dominate in customer engagement

## 🚀 Next Steps (Optional Enhancements)

- 📊 Visualize results in dashboards (Power BI, Tableau)
- 🔁 Automate ETL pipeline using Python or Airflow
- 📈 Analyze seasonality trends over time
- 🧠 Predict high-value customers using SQL scoring models
