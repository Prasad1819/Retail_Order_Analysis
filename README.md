# Retail_Order_Analysis

**Tech:** Python (Pandas, Matplotlib/Seaborn), MySQL, SQLAlchemy

**Summary:**  
This project analyzes retail order data (sourced from Kaggle) to uncover sales trends, profitability insights, and top-performing products.  
It demonstrates **end-to-end workflow**: Data Cleaning → SQL Storage → Analysis Queries.

## 📂 Repository Structure
- `notebooks/` — exploratory analysis (Jupyter)
- `scripts/` — reusable Python scripts (data prep, load to SQL, visualizations)
- `sql/` — DDL and analysis queries
- `reports/` — final PDF report
- `data/` — sample data or small extracts

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
5. Created **visualizations** using Matplotlib & Seaborn.

## 📊 Insights Generated
- Identified top products & categories driving revenue.
- Regional analysis showed product preferences differ by region.
- Profit growth analysis revealed most profitable sub-categories.
- Sales comparison highlighted trends across 2022 vs 2023.


