# 🛒 Zepto MySQL Project – Data Cleaning & Business Insights

This project uses **MySQL** to clean, explore, and analyze a mock dataset inspired by **Zepto**, a quick-commerce grocery delivery platform. It focuses on real-world SQL operations including data cleaning, exploratory analysis, and generating business insights for retail and inventory-based businesses.

---

## 📦 Dataset Overview

The dataset simulates product-level information and includes:

- `sku_id`: Unique product identifier  
- `category`: Product category  
- `name`: Product name  
- `mrp`: Maximum Retail Price  
- `discountPercent`: Discount applied  
- `availableQuantity`: Quantity in stock  
- `discountedSellingPrice`: Final selling price  
- `weightInGms`: Product weight  
- `outOfStock`: Stock status (True/False)  
- `quantity`: Display quantity  

---

## 🧹 Data Cleaning Tasks

- Removed records with MRP = 0 or discountedSellingPrice = 0  
- Converted price values from paise to rupees  
- Checked and removed NULL or duplicate entries  
- Identified products with repeated names  

---

## 📊 Business Insight Queries

- **Top 10 Best Discounted Products**  
- **High MRP Products That Are Out of Stock**  
- **Estimated Revenue by Category**  
- **Low Discount, High MRP Products**  
- **Top 5 Categories by Average Discount**  
- **Best Value by Price per Gram**  
- **Weight-Based Categorization (Low / Medium / Bulk)**  
- **Total Inventory Weight per Category**

These insights mimic real-world analysis done by data analysts in retail and e-commerce companies to improve decision-making.

---

## 🚀 How to Use

1. Clone this repository  
2. Open the SQL file in your MySQL client (MySQL Workbench, pgAdmin, etc.)  
3. Run the queries step-by-step to explore and analyze the dataset  

---

## 🎯 Who Is This For?

- SQL beginners and intermediate learners  
- Anyone interested in retail/e-commerce data analysis  
- Students building SQL projects for portfolios  

---

## 📌 Project Status

✅ Completed – All queries tested and working  
🛠️ Future Work – Adding joins, views, and stored procedures for advanced insights

---

## 📥 Contributions

Feel free to fork and enhance the project with more datasets, visualizations, or advanced SQL features.

---
