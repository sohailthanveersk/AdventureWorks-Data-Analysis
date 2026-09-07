# 📊 AdventureWorks Data Analysis

## 📌 Project Overview

AdventureWorks Data Analysis is an end-to-end data analytics project based on the AdventureWorks Cycles dataset.

The project focuses on analyzing sales performance, product performance, customer behavior, territories, production costs and profitability using SQL, Microsoft Excel, Power BI and Tableau.

The analysis includes data preparation, data transformation, calculated fields, KPI development, business analysis and interactive dashboard development.

---

## 🎯 Project Objectives

- Combine and prepare AdventureWorks sales data
- Perform product and customer lookups
- Create date-based analytical fields
- Calculate Sales Amount, Production Cost and Profit
- Analyze sales by year, month and quarter
- Analyze product and category performance
- Analyze customer performance
- Analyze regional and territory performance
- Build analytical dashboards
- Generate meaningful business insights

---

## 🗂️ Dataset

The project uses the AdventureWorks dataset containing customer, product, date, sales and territory information.

### Main Tables

| Table | Description |
|---|---|
| DimCustomer | Customer information |
| DimDate | Date dimension |
| DimProduct | Product information |
| DimProductCategory | Product category details |
| DimProductSubCategory | Product subcategory details |
| DimSalesTerritory | Sales territory information |
| FactInternetSales | Internet sales transactions |
| FactInternetSalesNew | Additional internet sales transactions |

---

## 🛠️ Tools & Technologies

- SQL
- MySQL
- Microsoft Excel
- Power BI
- Tableau
- Data Analysis
- Data Visualization
- Business Intelligence
- Dashboard Development

---

## 🔍 Data Analysis Performed

### 1. Data Preparation

- Union of FactInternetSales and FactInternetSalesNew
- Product name lookup
- Customer name lookup
- Unit price lookup
- Data transformation and preparation

### 2. Date Analysis

Created the following analytical fields:

- Year
- Month Number
- Month Name
- Quarter
- Year-Month
- Weekday Number
- Weekday Name
- Financial Month
- Financial Quarter

### 3. Sales & Profitability Analysis

Calculated:

- Sales Amount
- Production Cost
- Profit
- Order Quantity
- Total Sales
- Total Production Cost
- Total Profit

### 4. Business Analysis

Analyzed:

- Year-wise sales
- Month-wise sales
- Quarter-wise sales
- Product performance
- Product category performance
- Product subcategory performance
- Customer performance
- Country-wise sales
- Sales territory performance

---

## 📊 Dashboard & Visualization

The project includes dashboards developed using:

### Microsoft Excel

An Excel dashboard containing KPIs and sales analysis.

### Power BI

An interactive Power BI dashboard for analyzing sales, products, customers and regions.

### Tableau

A Tableau workbook for interactive business analysis and visualization.

---

## 📸 Dashboard Preview

### Excel Dashboard

![Excel Dashboard](Images/excel-dashboard.png)

### Power BI Dashboard

![Power BI Dashboard](Images/powerbi-dashboard.png)

### Tableau Dashboard

![Tableau Dashboard](Images/tableau-dashboard.png)

---

## 📈 Key Business Insights

The analysis provides insights into:

- Sales performance across different years
- Monthly and quarterly sales trends
- Product and category performance
- Customer purchasing behavior
- Regional and territory-level performance
- Production cost and profitability
- High-performing and low-performing products

---

## 📂 Project Deliverables

| Tool | Deliverable |
|---|---|
| SQL | Data analysis queries |
| Excel | Dashboard and KPI analysis |
| Power BI | Interactive dashboard |
| Tableau | Interactive visualization |
| PowerPoint | Project presentation |

---

## 📁 Repository Structure

```text
AdventureWorks-Data-Analysis/
│
├── Data/
│   ├── Dimcustomer.xlsx
│   ├── DimDate.xlsx
│   ├── DimProduct.xlsx
│   ├── DimProductCategory.xlsx
│   ├── DimProductSubCategory.xlsx
│   ├── DimSalesterritory.xlsx
│   ├── FactInternetSales.xlsx
│   └── Fact_Internet_Sales_New.xlsx
│
├── SQL/
│   └── adventureworks_analysis.sql
│
├── Excel/
│   └── Final_Presentation_Dashboard.xlsx
│
├── PowerBI/
│   └── POWERBI_PROJECT.pbix
│
├── Tableau/
│   └── AdventureWorks_Tableau.twbx
│
├── Presentation/
│   └── AdventureWorks_Project_Presentation.pptx
│
├── Documentation/
│   ├── AdventureWorks_Project_Details.docx
│   └── Questionnaire.xlsx
│
├── Images/
│   ├── excel-dashboard.png
│   ├── powerbi-dashboard.png
│   └── tableau-dashboard.png
│
├── README.md
└── .gitignore
