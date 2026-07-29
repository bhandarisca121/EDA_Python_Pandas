# Walmart Sales Analysis using Python & Pandas

## Project Overview

This project performs an **Exploratory Data Analysis (EDA)** on Walmart sales data using **Python and Pandas**.

The objective is to analyze sales performance, customer behavior, product trends, payment preferences, time-based patterns, and branch performance while demonstrating practical **Python, Pandas, NumPy, Matplotlib, and Seaborn** skills commonly required for Data Analyst and Data Scientist roles.

The analysis covers data exploration, data cleaning, aggregation, filtering, feature engineering, merging datasets, ranking, time-series analysis, visualization, and business insights.

---

# Dataset

The dataset contains transactional sales records from Walmart stores.

### Sample Columns

| Column                  | Description                  |
| ----------------------- | ---------------------------- |
| Invoice_ID              | Unique transaction ID        |
| Branch                  | Walmart branch               |
| City                    | Store location               |
| Customer_type           | Member or Normal customer    |
| Gender                  | Customer gender              |
| Product_line            | Product category             |
| Unit_price              | Price per item               |
| Quantity                | Number of items purchased    |
| Tax                     | VAT amount                   |
| Total                   | Total transaction amount     |
| Date                    | Purchase date                |
| Time                    | Purchase time                |
| Payment                 | Payment method               |
| COGS                    | Cost of Goods Sold           |
| Gross_margin_percentage | Gross margin percentage      |
| Gross_income            | Gross profit                 |
| Rating                  | Customer satisfaction rating |

---

# 🎯 Project Objectives

* Explore the dataset structure
* Identify missing values
* Detect duplicate records
* Analyze data types
* Perform data cleaning
* Analyze sales performance
* Compare branch performance
* Evaluate product performance
* Understand customer purchasing behavior
* Analyze payment preferences
* Discover sales trends over time
* Perform feature engineering
* Practice Pandas aggregation and transformation techniques
* Create meaningful visualizations
* Generate business recommendations

---

# 🛠️ Tools & Technologies

* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* Jupyter Notebook / Google Colab
* VS Code
* Git & GitHub

---

# 📁 Project Structure

```text
Walmart-Sales-Pandas-EDA/
│
├── data/
│   └── Walmart_sales.csv
│
├── notebooks/
│   └── Walmart_Sales_EDA.ipynb
│
├── src/
│   ├── data_cleaning.py
│   ├── sales_analysis.py
│   └── visualization.py
│
├── visualizations/
│   ├── monthly_sales.png
│   ├── branch_sales.png
│   ├── product_sales.png
│   └── payment_analysis.png
│
├── README.md
└── requirements.txt
```

---

# 🐍 Python & Pandas Skills Demonstrated

## Data Loading & Exploration

* `pd.read_csv()`
* `df.head()`
* `df.tail()`
* `df.shape`
* `df.info()`
* `df.describe()`
* `df.dtypes`
* `df.columns`

---

## Data Quality & Cleaning

* Missing value detection
* Duplicate detection
* Data type conversion
* Date/time conversion
* String cleaning
* Handling inconsistent values
* Renaming columns
* Dropping unnecessary columns

Examples:

```python
df.isnull().sum()

df.duplicated().sum()

df['Date'] = pd.to_datetime(df['Date'])

df.columns = df.columns.str.strip()
```

---

## Filtering & Selection

Pandas techniques used include:

* Boolean filtering
* Multiple conditions
* `.loc[]`
* `.iloc[]`
* `.isin()`
* `.between()`
* `.query()`
* String filtering with `.str.contains()`

Example:

```python
df[df['Quantity'] > 5]

df[df['City'].isin(['Yangon', 'Mandalay'])]

df[df['Rating'].between(7, 10)]
```

---

# 📊 Aggregation & Grouping

The project demonstrates:

* `groupby()`
* `sum()`
* `mean()`
* `count()`
* `min()`
* `max()`
* `median()`
* `nunique()`
* `agg()`

Example:

```python
df.groupby('Branch')['Total'].sum().sort_values(
    ascending=False
)
```

Multiple aggregations:

```python
df.groupby('Branch').agg(
    Total_Revenue=('Total', 'sum'),
    Average_Sales=('Total', 'mean'),
    Total_Quantity=('Quantity', 'sum'),
    Transactions=('Invoice_ID', 'nunique')
)
```

---

# 🔄 Merging & Combining Data

Pandas `merge()` is used to combine datasets when multiple tables are available.

Techniques include:

* `merge()`
* `concat()`
* `join()`

Examples:

```python
df_merged = pd.merge(
    sales_df,
    branch_df,
    on='Branch_ID',
    how='left'
)
```

The project also demonstrates:

* Inner joins
* Left joins
* Right joins
* Outer joins

---

# 📈 Advanced Pandas Techniques

## Ranking

Equivalent to SQL ranking functions:

```python
df['Revenue_Rank'] = (
    df['Total']
    .rank(method='dense', ascending=False)
)
```

---

## Transform

Used for group-level calculations while keeping the original DataFrame structure:

```python
df['Branch_Avg_Sales'] = (
    df.groupby('Branch')['Total']
      .transform('mean')
)
```

---

## Shift

Used for comparing current values with previous or next values:

```python
df['Previous_Day_Sales'] = df['Total'].shift(1)
```

---

## Cumulative Calculations

```python
df['Cumulative_Sales'] = df['Total'].cumsum()
```

Grouped cumulative calculations:

```python
df['Cumulative_Branch_Sales'] = (
    df.groupby('Branch')['Total']
      .cumsum()
)
```

---

## Rolling Calculations

Used for time-series analysis:

```python
df['7_Day_Moving_Average'] = (
    df['Total']
      .rolling(7)
      .mean()
)
```

---

# 📅 Date & Time Analysis

The project uses Pandas datetime functionality to analyze sales patterns.

Examples:

```python
df['Date'] = pd.to_datetime(df['Date'])

df['Year'] = df['Date'].dt.year
df['Month'] = df['Date'].dt.month
df['Month_Name'] = df['Date'].dt.month_name()
df['Day'] = df['Date'].dt.day
df['Day_Name'] = df['Date'].dt.day_name()
df['Day_of_Week'] = df['Date'].dt.dayofweek
```

Additional time features:

```python
df['Is_Weekend'] = df['Day_of_Week'] >= 5
```

---

# 📊 Analysis Performed

## 1. Data Exploration

* Number of rows and columns
* Dataset structure
* Data types
* Missing values
* Duplicate records
* Unique values
* Cardinality analysis
* Descriptive statistics

---

## 2. Sales Analysis

* Total revenue
* Average transaction value
* Total products sold
* Maximum transaction
* Minimum transaction
* Monthly sales
* Daily sales
* Hourly sales
* Cumulative revenue

Example:

```python
total_revenue = df['Total'].sum()

average_transaction = df['Total'].mean()

total_quantity = df['Quantity'].sum()
```

---

## 3. Branch Analysis

Analyze each Walmart branch based on:

* Total revenue
* Total quantity sold
* Average transaction value
* Number of transactions
* Average customer rating
* Gross income

Example:

```python
branch_analysis = df.groupby('Branch').agg(
    Revenue=('Total', 'sum'),
    Quantity=('Quantity', 'sum'),
    Avg_Transaction=('Total', 'mean'),
    Avg_Rating=('Rating', 'mean'),
    Transactions=('Invoice_ID', 'nunique')
)
```

---

## 4. Product Analysis

Analyze:

* Best-selling product lines
* Lowest-performing products
* Revenue contribution
* Quantity sold
* Average price
* Gross income
* Customer ratings

Example:

```python
product_analysis = df.groupby('Product_line').agg(
    Revenue=('Total', 'sum'),
    Quantity=('Quantity', 'sum'),
    Avg_Rating=('Rating', 'mean'),
    Gross_Income=('Gross_income', 'sum')
).sort_values(
    'Revenue',
    ascending=False
)
```

---

## 5. Customer Analysis

Analyze customer behavior based on:

* Member vs Normal customers
* Gender
* Purchase frequency
* Average transaction value
* Total revenue
* Quantity purchased
* Customer ratings

Example:

```python
customer_analysis = df.groupby('Customer_type').agg(
    Revenue=('Total', 'sum'),
    Avg_Spending=('Total', 'mean'),
    Quantity=('Quantity', 'sum'),
    Transactions=('Invoice_ID', 'nunique')
)
```

---

## 6. Payment Analysis

Analyze:

* Most popular payment method
* Revenue by payment type
* Number of transactions
* Average purchase value
* Payment preferences by customer type

Example:

```python
payment_analysis = df.groupby('Payment').agg(
    Revenue=('Total', 'sum'),
    Transactions=('Invoice_ID', 'nunique'),
    Avg_Transaction=('Total', 'mean')
).sort_values(
    'Revenue',
    ascending=False
)
```

---

## 7. Time Analysis

Analyze:

* Sales by year
* Sales by month
* Sales by day
* Sales by weekday
* Sales by hour
* Weekend vs weekday sales
* Peak shopping hours
* Monthly revenue trends

Example:

```python
monthly_sales = (
    df.groupby(df['Date'].dt.month)['Total']
      .sum()
      .sort_values(ascending=False)
)
```

Weekend vs weekday:

```python
df['Day_Type'] = np.where(
    df['Date'].dt.dayofweek >= 5,
    'Weekend',
    'Weekday'
)

weekend_analysis = (
    df.groupby('Day_Type')['Total']
      .agg(['sum', 'mean', 'count'])
)
```

---

# 📉 Data Visualization

The project uses **Matplotlib and Seaborn** to visualize business trends.

### Visualizations include:

* Revenue by branch
* Revenue by product line
* Monthly revenue trend
* Daily sales trend
* Sales by weekday
* Sales by hour
* Payment method distribution
* Customer type comparison
* Gender comparison
* Product performance
* Customer rating distribution
* Correlation heatmap

Example:

```python
sns.barplot(
    data=branch_analysis.reset_index(),
    x='Branch',
    y='Revenue'
)

plt.title('Revenue by Branch')
plt.xlabel('Branch')
plt.ylabel('Revenue')
plt.show()
```

---

# 🔎 Business Questions Answered

The analysis answers questions such as:

* Which branch generates the highest revenue?
* Which city performs best?
* Which product line generates the most revenue?
* Which product line sells the highest quantity?
* Which customer segment spends the most?
* Do Members or Normal customers have higher average spending?
* Which payment method is most popular?
* What are the busiest shopping hours?
* Which day of the week generates the most revenue?
* How do weekend sales compare with weekday sales?
* Which product line has the highest customer satisfaction?
* Which branch has the highest average transaction value?
* Which branch should receive additional inventory?
* Which product categories require more attention?
* Are sales increasing or decreasing over time?

---

# 💡 Business Insights

The final analysis converts the EDA results into actionable business recommendations.

Examples include:

* Identifying the highest-performing branch
* Identifying underperforming branches
* Identifying high-revenue product categories
* Identifying products requiring additional inventory
* Understanding customer purchasing behavior
* Optimizing staffing during peak shopping hours
* Understanding preferred payment methods
* Improving customer experience based on ratings
* Identifying seasonal or monthly sales patterns

---

# 🎯 Key Learning Outcomes

Through this project, I practiced:

* Python programming
* Pandas DataFrame manipulation
* NumPy
* Data cleaning
* Exploratory Data Analysis
* Feature engineering
* GroupBy and aggregation
* Filtering and sorting
* Merging datasets
* Time-series analysis
* Ranking and transformation
* Data visualization
* Business problem solving
* Communicating analytical findings
