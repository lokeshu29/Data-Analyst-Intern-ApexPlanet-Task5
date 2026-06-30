import pandas as pd
import os

print("Loading dataset...")

df = pd.read_csv("D:\\apexplanet-data-analytics\\data\\sample_-_superstore.csv")

print("Dataset loaded successfully.")

print("Cleaning data...")

# Remove duplicate rows
df.drop_duplicates(inplace=True)

# Remove rows with missing values
df.dropna(inplace=True)

# Convert date columns
df["Order Date"] = pd.to_datetime(df["Order Date"])
df["Ship Date"] = pd.to_datetime(df["Ship Date"])

print("Data cleaned successfully.")

cleaned_file = "D:\\apexplanet-data-analytics\\data\\cleaned_superstore.csv"

df.to_csv(cleaned_file, index=False)

print("Cleaned dataset saved.")

print("Calculating KPIs...")

total_sales = df["Sales"].sum()

total_profit = df["Profit"].sum()

total_orders = df["Order ID"].nunique()

total_customers = df["Customer ID"].nunique()

average_sales = df["Sales"].mean()

average_profit = df["Profit"].mean()

kpi_df = pd.DataFrame({

    "KPI": [

        "Total Sales",

        "Total Profit",

        "Total Orders",

        "Total Customers",

        "Average Sales",

        "Average Profit"

    ],

    "Value": [

        total_sales,

        total_profit,

        total_orders,

        total_customers,

        average_sales,

        average_profit

    ]

})

output_file = "D:\\apexplanet-data-analytics\\scripts\\KPI_Report.xlsx"

kpi_df.to_excel(output_file, index=False)

print("KPI report exported successfully.")

print("--------------------------------")

print("Automation Pipeline Completed")

print("--------------------------------")