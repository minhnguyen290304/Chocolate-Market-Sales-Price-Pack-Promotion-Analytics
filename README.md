# Chocolate Market Sales, Promotion & Price-Pack Analytics

<img width="1000" height="525" alt="image" src="https://github.com/user-attachments/assets/14251f39-b0c5-4e62-8f30-228ae2e31461" />

## Project Overview

The global chocolate industry is highly competitive, with brands continuously balancing pricing strategies, promotional campaigns, product innovation, and channel expansion to drive growth and profitability.

This project analyzes two years of chocolate sales transactions across multiple countries, brands, product formats, customer segments, and retail channels to understand the key drivers of commercial performance.

The analysis focuses on how product architecture, promotional strategies, customer demographics, and distribution channels influence revenue generation, profitability, and sales volume. The project demonstrates an end-to-end Data Analytics workflow, covering data preparation, dimensional modeling, business analysis, KPI development, and interactive dashboard design.

The objective is to demonstrate how commercial analytics can support pricing optimization, promotional planning, assortment management, and channel strategy decisions.

---

## Business Objectives

This project aims to evaluate commercial performance across products, brands, customers, and channels while identifying opportunities to improve profitability and sales effectiveness.

The analysis focuses on five key business questions:

1. Which brands contribute most to revenue, profit, and sales volume?

2. How do product characteristics such as cocoa percentage and package size influence customer demand and profitability?

3. What impact do promotional discounts have on revenue, quantity sold, and profit margins?

4. Which customer segments and geographic markets generate the highest business value?

5. Which retail channels deliver the strongest commercial performance?

---

## Dataset Overview

The dataset describes the operations of a multinational chocolate retailer selling products across multiple countries, customer segments, brands, and retail channels over a two-year period.

The analytical model was built from five core datasets representing sales transactions, products, customers, stores, and calendar information. These datasets were integrated into a dimensional star-schema structure to support commercial performance analysis across products, promotions, customer segments, geographic markets, and distribution channels.

Data Model

<img src="https://github.com/minhnguyen290304/Chocolate-Market-Sales-Price-Pack-Promotion-Analytics/blob/main/dashboard%20preview/data%20overview.png?raw=true" width="70%">

consists of:

Sales: transactional sales records containing revenue, profit, quantity sold, discounts, and pricing information.
Products: product attributes including brand, category, cocoa percentage, and package size.
Customers: customer demographic information such as age, gender, and loyalty membership status.
Stores: geographic and channel-related information including country and store type.
Calendar: date attributes used for trend and seasonality analysis.

---

# Project Workflow

```text
Raw CSV Files
      ↓
Data Validation & Transformation (SQL Server)
      ↓
Star Schema Data Modeling
      ↓
Business Analysis & KPI Development
      ↓
Interactive Dashboard Development (Power BI)
      ↓
Business Insights & Recommendations
```

The project begins by loading raw datasets into SQL Server, where data validation and transformation processes are performed to ensure data quality and consistency.

The datasets are then organized into a dimensional data model to support analytical reporting and KPI development. SQL is used to evaluate performance across products, brands, promotions, customer segments, countries, and retail channels.

Finally, the curated analytical model is connected to Power BI, where interactive dashboards are developed to visualize business performance and generate actionable insights.

### 🔧 Tools Used

| Tool | Purpose |
|------|----------|
| ![SQL Server](https://img.shields.io/badge/MS_SQL_Server-CC2927?style=flat-square&logo=microsoftsqlserver&logoColor=white) | Data validation, data transformation, dimensional modeling, and analytical queries |
| ![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=flat-square&logo=powerbi&logoColor=black) | KPI development, interactive dashboards, and business performance analysis |

---

# Executive Summary

The analysis reveals that chocolate sales generated more than **$30 million in revenue** and **$11.5 million in profit**, achieving an overall **profit margin of 38.5%** across the two-year period.

Revenue generation is concentrated among a small number of leading brands, while profitability varies significantly across product architectures and promotional strategies. Product composition, package size, discount intensity, customer demographics, and distribution channels all play important roles in influencing business outcomes.

Premium products with higher cocoa concentrations generate superior margins, while promotional campaigns drive a substantial proportion of overall sales performance. These findings provide actionable insights for pricing optimization, promotional planning, assortment management, and channel strategy decisions.

<img src="dashboard preview/executive summary.png" width="100%">

---

# 5. Analytical Findings

## 5.1 Sales Performance Analysis

The business generated approximately **$30.07M in revenue**, **$11.59M in profit**, and sold more than **3.35 million units** during the analysis period.

Revenue and profit remained relatively stable throughout the two-year period, with visible seasonal peaks occurring during promotional campaigns and key retail periods. Geographic analysis indicates that North American and European markets contribute the majority of overall commercial performance.

The overall profit margin of **38.53%** demonstrates strong profitability while maintaining substantial sales volume across multiple brands and channels.

---

## 5.2 Brand Performance Analysis

<img src="https://github.com/minhnguyen290304/Chocolate-Market-Sales-Price-Pack-Promotion-Analytics/blob/main/dashboard%20preview/brand%20perfomance.png?raw=true" width="100%">

Brand performance analysis reveals significant differences between revenue generation, sales volume, and profitability.

**Ferrero** generated the highest revenue and profit, establishing itself as the strongest overall performing brand within the portfolio. Meanwhile, **Mars** achieved the highest sales volume, indicating stronger penetration within mass-market customer segments.

Profitability analysis further highlights Ferrero's ability to balance both scale and margin performance, while several competing brands rely more heavily on volume-based growth strategies.

The findings suggest that premium positioning and operational scale contribute differently to overall business success.

---

## 5.3 Price-Pack Architecture Analysis

<img src="dashboard preview/price_pack architecture.png" width="100%">

Product architecture analysis evaluates the relationship between package size, cocoa concentration, pricing, and profitability.

The **100g package format** generated the highest revenue contribution, while **50g products** accounted for the highest sales volume.

Cocoa concentration demonstrates a strong relationship with profitability. Products containing **90% cocoa** achieved the highest profit margin at **43.41%**, despite lower purchase frequency than mainstream alternatives.

These findings suggest that premium product offerings provide significant profitability opportunities, while smaller package formats continue to support market penetration and customer acquisition.

---

## 5.4 Promotion & Discount Analysis

<img src="dashboard preview/promotion_discount analysis.png" width="100%">

Promotional activity plays a critical role in overall commercial performance.

Approximately **66% of total revenue** and more than **70% of total profit** were generated under promotional conditions. Customer demand demonstrates strong sensitivity to discount levels, with purchase quantities increasing consistently as discounts become more aggressive.

However, higher discount levels do not always maximize profitability. Moderate discount levels provide a more effective balance between sales growth and margin preservation.

The analysis highlights the importance of optimizing promotional strategies rather than relying solely on larger discounts.

---

## 5.5 Customer & Channel Analysis

<img src="dashboard preview/customer_channel analysis.png" width="100%">

Customer and channel performance varies substantially across demographic groups and distribution channels.

Customers under the age of 25 represent the largest customer segment and contribute the highest revenue share. Geographic analysis identifies the **United States** as the strongest-performing market across revenue and profit metrics.

Retail stores remain the dominant sales channel, generating the largest revenue contribution compared to Mall, Online, and Airport channels.

The findings indicate that customer demographics and channel strategy are important drivers of commercial success.

---

# 6. Key Business Insights

### Insight 1: Revenue Leadership Does Not Necessarily Indicate Market Dominance

Ferrero generates the highest revenue and profit, while Mars achieves the highest sales volume. This demonstrates that profitability and scale are not always driven by the same business strategy.

### Insight 2: Product Architecture Strongly Influences Profitability

Higher cocoa concentrations consistently generate stronger profit margins. Premium 90% cocoa products deliver the highest profitability despite lower purchasing frequency.

### Insight 3: Promotions Drive Growth but Require Optimization

Promotional activity contributes the majority of revenue and profit. However, moderate discount levels provide a better balance between volume growth and margin preservation than highly aggressive discounting.

### Insight 4: Customer Demographics and Channel Selection Matter

Younger customers and traditional retail channels contribute disproportionately to overall business performance, highlighting opportunities for targeted marketing and channel optimization.

---

# 7. Business Recommendations

### Optimize Product Portfolio

* Expand premium high-margin cocoa products.
* Prioritize 100g product formats due to superior revenue performance.
* Increase visibility of products with strong profitability potential.

### Improve Promotion Effectiveness

* Focus on moderate discount strategies.
* Reduce excessive discounting that unnecessarily erodes margins.
* Implement brand-specific promotional policies.

### Strengthen Channel Strategy

* Expand premium products in Mall and Airport channels.
* Increase Online penetration for mass-market brands.
* Align channel strategy with brand positioning.

### Enhance Customer Targeting

* Develop campaigns tailored to younger customer segments.
* Create country-specific marketing initiatives.
* Improve customer retention through personalized promotions.

---

## Power BI Dashboard

📊 **Download PBIX Dashboard**

[Download PBIX Dashboard](https://drive.google.com/file/d/1LphNjfOf90dHaRhCw4YPxHJY8Q6Oyi3V/view?usp=sharing)

---

## Author

**Minh Nguyen** 🐧

---

## 📫 Connect With Me

* LinkedIn: https://www.linkedin.com/in/minh-nguyen-9016a627a/
* Email: [minhnguyen29p304@gmail.com](mailto:minhnguyen29p304@gmail.com)

---

⭐ Nothing is impossible
💫 Learn, learn more, learn forever
