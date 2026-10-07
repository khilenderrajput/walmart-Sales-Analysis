# 🛒 Walmart Sales Data Analysis

<p align="center">
  <img src=""C:\Users\Om\Downloads\Walmart Sales Data Analysis Dashboard.png"" alt="Walmart Sales Data Analysis" width="100%">
</p>

<p align="center">
  <b>End-to-End Data Analysis using Python, Jupyter Notebook & MySQL</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-Data%20Analysis-blue?style=for-the-badge&logo=python&logoColor=white">
  <img src="https://img.shields.io/badge/Jupyter-Notebook-orange?style=for-the-badge&logo=jupyter&logoColor=white">
  <img src="https://img.shields.io/badge/MySQL-SQL%20Analysis-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
  <img src="https://img.shields.io/badge/Pandas-Data%20Cleaning-150458?style=for-the-badge&logo=pandas&logoColor=white">
</p>

---

## 📌 Project Overview

This project analyzes **Walmart sales data** using **Python, Jupyter Notebook and MySQL** to transform raw transactional data into meaningful business insights.

The project follows an end-to-end data analytics workflow:

**Raw Data → Data Cleaning → MySQL Database → SQL Analysis → Business Insights**

The analysis focuses on sales performance, customer purchasing behavior, payment methods, branch performance, product categories, profitability, ratings, and year-over-year revenue changes.

---

## 🎯 Business Objectives

* Analyze different payment methods and transaction volumes
* Identify the highest-rated product category for each branch
* Find the busiest day for every branch
* Analyze quantity sold by payment method
* Evaluate product ratings across cities
* Calculate total profit by product category
* Identify the most common payment method for each branch
* Analyze sales according to different time shifts
* Identify branches with the highest year-over-year revenue decrease

---

## 📊 Dataset & Data Cleaning

| Metric                 |                  Value |
| ---------------------- | ---------------------: |
| Raw Rows               |             **10,051** |
| Duplicate Rows Removed |                 **51** |
| Null Rows Removed      |                 **31** |
| Final Clean Rows       |              **9,969** |
| Original Columns       |                 **11** |
| Total Column           | **Added using Python** |

### Data Cleaning Process

1. Loaded the Walmart CSV dataset using Pandas
2. Removed duplicate records
3. Handled missing values
4. Cleaned the `unit_price` column
5. Converted price values into numeric format
6. Created the `total` sales column
7. Created the Walmart MySQL database
8. Loaded the cleaned dataset into MySQL
9. Verified the final record count using SQL

---

## 🐍 Part 1 — Python & Jupyter Notebook

The Jupyter Notebook is used for:

* Data loading
* Data exploration
* Data cleaning
* Duplicate removal
* Missing-value handling
* Data type conversion
* Feature creation
* MySQL data loading

### Key transformation

```python
df['unit_price'] = df['unit_price'].str.replace("$", "").astype(float)

df['total'] = df['unit_price'] * df['quantity']
```

📓 **[View Jupyter Notebook](./walmart.jupyter.ipynb)**

---

## 🗄️ Part 2 — MySQL & SQL Analysis

The cleaned data is loaded into a MySQL table:

```text
walmart_sales
```

The SQL analysis uses:

* `GROUP BY`
* Aggregate Functions
* `RANK()`
* Window Functions
* `PARTITION BY`
* CTEs
* Subqueries
* `CASE WHEN`
* `JOIN`
* `STR_TO_DATE()`
* `DAYNAME()`
* `YEAR()`
* `HOUR()`

📄 **[View SQL Queries](./walmart.sql)**

---

## 🔍 Key SQL Business Questions

### Q1 — Payment Methods

Identify different payment methods, transaction count and total quantity sold.

### Q2 — Highest-Rated Category

Find the highest-rated product category in each branch using `RANK()`.

### Q3 — Busiest Day

Identify the busiest day for each branch based on transaction volume.

### Q4 — Quantity by Payment Method

Calculate total quantity of items sold through each payment method.

### Q5 — Category Ratings

Analyze average, minimum and maximum ratings by city and category.

### Q6 — Category Profitability

Calculate total profit for each product category.

### Q7 — Preferred Payment Method

Find the most common payment method for every branch.

### Q8 — Sales Shifts

Categorize transactions into:

* 🌅 Morning
* ☀️ Afternoon
* 🌙 Evening

### Q9 — Revenue Decrease

Identify the **top 5 branches with the highest revenue decrease from 2022 to 2023**.

---

## 📈 Analysis Workflow

```text
              Walmart Sales Dataset
                       │
                       ▼
              ┌─────────────────┐
              │ Python / Pandas │
              │ Data Cleaning   │
              └────────┬────────┘
                       │
                       ▼
              ┌─────────────────┐
              │      MySQL      │
              │ Data Storage    │
              └────────┬────────┘
                       │
                       ▼
              ┌─────────────────┐
              │  SQL Analysis   │
              │ Business Qs     │
              └────────┬────────┘
                       │
                       ▼
              ┌─────────────────┐
              │ Business        │
              │ Insights        │
              └─────────────────┘
```

---

## 🧰 Tech Stack

| Technology          | Purpose                  |
| ------------------- | ------------------------ |
| 🐍 Python           | Data Analysis & Cleaning |
| 📓 Jupyter Notebook | Interactive Analysis     |
| 🐼 Pandas           | Data Manipulation        |
| 🗄️ MySQL           | Database & SQL Analysis  |
| 📊 SQL              | Business Problem Solving |

---

## 📁 Project Structure

```text
Walmart-Sales-Analysis/
│
├── 📓 walmart.jupyter.ipynb
├── 🗄️ walmart.sql
├── 📄 Walmart Sales Analysis – Python + MySQL.html
├── 📖 README.md
│
└── 📁 assets/
    └── 🖼️ walmart-sales-analysis.png
```

---

## 🌐 Project Report

A detailed HTML report containing the complete project workflow, dataset statistics, Python cleaning process, table schema and SQL business questions is also included.

👉 **[View Complete Project Report](./Walmart%20Sales%20Analysis%20%E2%80%93%20Python%20%2B%20MySQL.html)**

---

## 💡 Key Takeaway

This project demonstrates an end-to-end **Data Analytics workflow**, starting from raw data cleaning in Python and progressing to structured database analysis and business problem solving using SQL.

> **Data + Python + SQL = Business Insights 🚀**

---

## 👨‍💻 Author

**Khilender Rajput**

Aspiring Data Analyst | Data Analytics Engineer

<p align="center">
  ⭐ If you found this project useful, consider giving it a star!
</p>
