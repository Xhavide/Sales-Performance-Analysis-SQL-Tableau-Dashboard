# 📊 Sales Performance Analysis|SQL & Tableau Dashboard

### 📌 **Executive Summary**

This end-to-end data analysis project explores 10 years of sales performance using SQL Server and Tableau. The analysis uncovers revenue volatility, customer profitability concentration, regional performance trends, and product-level margin insights. The dashboard supports data-driven decision-making focused on growth, retention, and profitability optimization.

### 🔎 Project Overview

This project analyzes retail sales data using SQL for data validation, cleaning, and KPI calculation, and Tableau for interactive dashboard visualization.
The objective was to transform raw transactional data into structured insights through query design, performance metric calculation, and interactive dashboard development.




## 🖥️ Tableau Dashboard Preview


![Dashboard Overview](https://github.com/Xhavide/Sales-Performance-Analysis-SQL-Tableau-Dashboard/blob/main/Screenshot%202026-02-01%20004928(1).png
)

![Dashboard Overview](https://github.com/Xhavide/Sales-Performance-Analysis-SQL-Tableau-Dashboard/blob/main/Screenshot%202026-02-01%20004954(2).png
)

----------


## 🎯 Project Objectives

- Validate and clean raw sales data
- Develop key performance indicators (KPIs) using SQL
- Analyze 10-year sales trends and year-over-year growth
- Identify top-performing customers, regions, and product categories
- Evaluate profitability drivers at customer and product levels
- Detect loss-generating products
- Deliver interactive dashboard insights for business decision-making

---------


## 🧹Data Cleaning & Validation
### 🔎 Initial Data Assessment

During data validation, **501 fully empty rows** were identified.
These rows were introduced during the CSV import process and contained NULL values across all critical business columns.



### 🛠 Cleaning Steps Performed

**1.** Measured total row count before cleaning

**2.** Identified fully empty rows using NULL validation

**3.** Created a cleaned dataset excluding invalid records

**4.** Validated row count after cleaning to ensure accuracy



### ✅ Validation Results

- Total Rows Before Cleaning: **32985**

- Fully Empty Rows Identified: **501**

- Total Rows After Cleaning: **32484**

- Rows Removed: **501**

- Analysis performed on cleaned dataset (*Superstore_Cleaned*)

--------


### 📈 Key Performance Indicators (KPIs)

The following KPIs were engineered using SQL:

- 💰 Total Sales

- 📊 Total Profit

- 📦 Total Quantity Sold

- 🧾 Total Orders

- 👥 Total Unique Customers

- 🛒 Average Sales per Customer

-----------


## 📊 Analysis Performed
**🔹 Sales Analysis**

- Sales by Sub-Category
- Sales by Segment
- Revenue trends over time

**🔹 Profitability Analysis**

- Top 10 States by Profit
- Top 10 Customers by Profit
- Profit distribution across segments

**🔹 Customer Analysis**

- Orders per customer
- Customer distribution by purchase frequency
- Identification of high-value customers
-------------

## 🛠 Tools & Technologies

- SQL Server – Data validation, cleaning, and KPI calculations
- Tableau – Data visualization & interactive dashboard
- Superstore Dataset – Retail transactional data

------------
 ## 📊 Dashboard Overview

  The Tableau dashboard includes:
- Executive KPI summary panel
- Sales performance by category, sub-category and segment
- Regional profitability analysis
- Customer order distribution
- Top-performing customers and states

🔗 Live Dashboard: ( [Tableau Public](https://public.tableau.com/app/profile/xhavide.zymberi/viz/CUSTOMERSDASHBOARD/SUPERSTORESALESDASHBOARD)  )

------------
## 📊 Key Insights & Business Values


                                                                 

1️⃣ **Sales Performance Trends (10-Year Analysis)**              
🧠**Insight** 

- **Best Year:** 2021 with **+134.2% YoY growth**
- **Worst Year:** 2023 with **−49.6% decline**
  
 📈 **Business Value**:
 The sharp 49.6% decline in 2023 indicates high revenue sensitivity, emphasizing the need for forecasting models and demand monitoring.

-------------------------------------------------------------------------------------------------------------------------------

2️⃣ **Customer & Segment Performance**

🧠**Insight**

- **Top Segment:** Consumer (followed by Corporate)
- Revenue and profit are concentrated among top customers

📈**Business Value:**
  Customer retention strategies should prioritize high-profit customers. Consumer segment remains a strategic growth driver.

 ---------------------------------------------------------------------------------------------------------------------------  
3️⃣ **Regional & Geographic Insights**

🧠**Insight**

- **Top Region:** West
- **Leading State by Profit:** California (followed by New York)

📈**Business Value:**
Geographic profit concentration suggests expansion opportunities in underperforming regions while reinforcing strong markets.

-----------------------------------------------------------------------------------------------------------------------------

4️⃣ **Category & Sub-Category Performance**

🧠**Insight**


- **Strongest Category:** Technology (followed by Furniture)
- **Highest Sales Sub-Category:** Chairs, then Phones
- **Most Profitable Sub-Category:** Copiers, followed by Accessories
- **Loss-Generating Sub-Categories:** Tables and Machines


📈**Business Value:**
High sales do not always equal high profitability.
Strategic focus should include:

- Scaling high-margin products (Copiers, Accessories)
- Reviewing pricing and cost structures for loss-generating products
-----------------------------------------------------------------------------------------------------------------------------------------------

## 🚀 **Conclusion**

This project simulates real-world business analysis by transforming raw transactional data into actionable insights that support data-driven decisions related to growth optimization, margin improvement, and customer retention initiatives.




                                                                         

   



-----------

## 👩‍💻 Author

**Xhavide Zymberi Ebibi**

Data Analyst Enthusiast | SQL & Business Intelligence | Tableau | Marketing Professional

[GitHub]()

[LinkedIn](https://www.linkedin.com/in/xhavide-zymberi/) 

[Tableau Public](https://public.tableau.com/app/profile/xhavide.zymberi/vizzes) 


















