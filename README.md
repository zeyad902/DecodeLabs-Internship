# 📊 E-Commerce Sales & Customer Behavior Analysis 

**Prepared by:** Zeyad Mohamed Goda  
**Domain:** Data Analytics | **Program:** DecodeLabs Internship

## 📑 Executive Summary
This project is an end-to-end Data Analytics pipeline focusing on an e-commerce sales dataset. The primary objective is to extract actionable business intelligence regarding product performance, customer acquisition channels, fulfillment health, and revenue generation. The project encompasses rigorous data cleaning, exploratory data analysis (EDA), and advanced SQL querying to answer critical business questions.

---

## 📂 Repository Structure
The project is divided into three main analytical phases, logically organized into the following directories:

* 📁 **`1-Data_Cleaning_Zeyad_Mohamed_goda/`** - Python scripts and notebooks for data preprocessing and validation.
* 📁 **`2-EDA_Project_Zeyad_Mohamed_goda/`** - Statistical analysis and data visualizations uncovering underlying trends.
* 📁 **`3-SQL-Analysis_Zeyad_Mohamed_goda/`** - Database dump and SQL scripts addressing targeted business logic.

---

## 🛠️ Phase 1: Data Cleaning & Preprocessing
Raw data is rarely ready for analysis. Using **Python (Pandas)**, the dataset underwent a strict cleansing pipeline to ensure high data integrity.

### **Key Metrics & Transformations:**
* **Initial Dataset:** 1,200 records, 14 columns.
* **Missing Value Handling:** Identified and resolved 309 missing entries in the `CouponCode` column (imputed with `No_coupon`). Achieved **0 null values** across the dataset.
* **Duplicate Removal:** Verified dataset uniqueness (**0 duplicates** found).
* **Feature Engineering:** * Created a dynamic `discount_amount` column based on coupon logic (`SAVE10` = 10%, `WINTER15` = 15%, `FREESHIP` = 0%).
  * Engineered a `net_total` column to calculate accurate final revenue per transaction.
* **Standardization:** Normalized all column names (lowercased, stripped whitespace, replaced spaces with underscores) for seamless SQL integration.

---

## 📈 Phase 2: Exploratory Data Analysis (EDA)
Using **Matplotlib** and **Seaborn**, univariate and bivariate analyses were conducted to understand data distributions and categorical dominance.

### **Key Business Insights Extracted:**
1. **Fulfillment Crisis (Critical Insight):** The order status breakdown revealed a severe operational bottleneck. **20.8%** of orders were *Cancelled*, and **20.6%** were *Returned*. This means **~41.4% of total potential revenue is lost** post-checkout. Only 19.2% of orders successfully reach the *Delivered* status.
2. **Revenue Distribution:** The `gross_total` column exhibited a right-skewed distribution (Mean: \$1,053 | Median: \$823), indicating that a subset of high-value transactions disproportionately drives overall revenue.
3. **Product Performance:** Categories like "Chair" and "Monitor" are top revenue drivers, with Chairs generating over \$185,379 in gross revenue and maintaining an Average Order Value (AOV) of >\$1,000.



---

## 🗄️ Phase 3: SQL Data Analysis & Business Intelligence
The cleaned dataset was migrated to a **MySQL** relational database. Advanced SQL queries were developed to answer specific, high-impact business questions. 

**Core Business Questions Answered via SQL:**
1. **Order Fulfillment:** What are all *Delivered* orders, sorted by the highest net total?
2. **Product Demand:** How many orders were placed for each specific product?
3. **Revenue Profiling:** What is the total and average revenue generated per product?
4. **Acquisition:** Which referral source brings in the highest volume of orders?
5. **Promotional Impact:** What is the total monetary discount given per coupon code?
6. **High-Value Customer Behavior:** Which payment methods are most utilized on high-value orders (`net_total` > $1,500)?
7. **Premium Products:** Which products maintain an average order value above $1,000?
8. **Revenue Leakage:** Exactly how much revenue was lost to *Cancelled* and *Returned* orders, grouped by product?
9. **Temporal Trends:** What is the monthly order count and total revenue trajectory across the year?
10. **Marketing ROI:** Which referral source generates the highest average net revenue (filtered for sources with a high confidence interval of >200 orders)?

---

## 💻 Tech Stack
* **Programming Languages:** Python, SQL
* **Libraries:** Pandas, NumPy, Matplotlib, Seaborn
* **Database Management:** MySQL Workbench
* **Environment:** Jupyter Notebook

---

## 🚀 Strategic Recommendations
Based on the data extracted across the three phases, the following actions are recommended to the business:
* **Investigate the 41.4% Churn:** Immediate audit required on the supply chain and product quality. The extreme rates of Returns and Cancellations are bleeding revenue. 
* **Optimize Marketing Spend:** Reallocate marketing budgets toward the referral sources proven (via SQL query #10) to generate the highest *net* revenue, not just the highest order volume.
* **Review Discount Strategy:** Assess the profitability of the `WINTER15` and `SAVE10` coupons against the Customer Acquisition Cost (CAC).
