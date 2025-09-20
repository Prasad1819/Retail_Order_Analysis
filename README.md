# Retail_Order_Analysis

<img width="800" height="500" alt="e5ab1fb9-8030-4bc8-9d0c-07953884818b" src="https://github.com/user-attachments/assets/dbfcdef4-0192-4a2a-a8de-9ad205f32ea0" />

**Tech:** Python (Pandas, Matplotlib/Seaborn), MySQL, SQLAlchemy

**Summary:**  
This project analyzes retail order data (sourced from Kaggle) to uncover sales trends, profitability insights, and top-performing products.  
It demonstrates **end-to-end workflow**: Data Cleaning → SQL Storage → Analysis Queries.

## 📂 Repository Structure
- `data/` — sample data in csv file 
- `python Script/` — exploratory analysis (Jupyter)
- `sql/` — DDL and analysis queries


## ⚙️ Steps Performed
1. Downloaded dataset from Kaggle (`ankitbansal06/retail-orders`).
2. Cleaned data using **Pandas**:
   - Handled null values, renamed columns, created derived columns (discount, sale_price, profit).
   - Dropped unnecessary columns.
3. Loaded cleaned data into **MySQL** using SQLAlchemy.
4. Wrote **SQL queries** for:
   - Top 10 revenue generating products.
   - Top 5 products per region.
   - Month-over-month sales growth (2022 vs 2023).
   - Highest sales month by category.
   - Sub-category with highest profit growth.

## 📊 Insights Generated
- Identified top products & categories driving revenue.
- Regional analysis showed product preferences differ by region.
- Profit growth analysis revealed most profitable sub-categories.
- Sales comparison highlighted trends across 2022 vs 2023.

  -- find top 10 highest reveue generating products 
SELECT product_id,sum(sale_price) AS sales
FROM df_orders
GROUP BY product_id
ORDER BY sales DESC
LIMIT 10;
<img width="245" height="131" alt="image" src="https://github.com/user-attachments/assets/479e1401-29aa-4c4c-94e6-d654621890b2" />


