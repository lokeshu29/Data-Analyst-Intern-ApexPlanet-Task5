import sqlite3
import pandas as pd

conn = sqlite3.connect("D:\\apexplanet-data-analytics\\database\\superstore.db")
cursor = conn.cursor()

df = pd.read_csv("D:\\apexplanet-data-analytics\\data\\cleaned_superstore.csv")

df.to_sql("superstore", conn, if_exists = "replace", index = False)

pd.read_sql("Select * From superstore limit 5", conn)

pd.read_sql("SELECT * FROM superstore", conn)

pd.read_sql("SELECT * FROM superstore WHERE \"Country/Region\" = 'United States'",conn)

pd.read_sql("SELECT * FROM superstore ORDER BY Sales DESC limit 10",conn)

pd.read_sql("SELECT Category, SUM(Sales) As TOTAL_SALES FROM superstore GROUP BY Category", conn)

pd.read_sql("SELECT Category, SUM(Sales) As TOTAL_SALES FROM superstore GROUP BY Category HAVING TOTAL_SALES > 300000", conn)

pd.read_sql("SELECT \"Product Name\", Sales FROM superstore WHERE Sales > (SELECT AVG(Sales) FROM superstore);", conn)

pd.read_sql("WITH high_sales AS (SELECT \"Order ID\", Sales, Profit FROM superstore WHERE Sales > 300) SELECT * FROM high_sales;", conn)

pd.read_sql("SELECT \"Order ID\", \"Customer Name\", Sales, ROW_NUMBER() OVER(PARTITION BY \"Customer Name\" ORDER BY Sales DESC) AS rowno FROM superstore" ,conn)

pd.read_sql("SELECT Category, Sales, RANK() OVER(ORDER BY Sales DESC) AS Sales_Rank FROM superstore" ,conn)

pd.read_sql("SELECT \"Order Date\", Sales, LAG(Sales,1) OVER(ORDER BY \"Order Date\" DESC) AS Past_Sale FROM superstore", conn)

pd.read_sql("SELECT \"Order Date\", Sales, LEAD(Sales,1) OVER(ORDER BY \"Order Date\") AS next_Sale FROM superstore", conn)

cursor.execute("""
CREATE VIEW Sales_view AS
SELECT Category,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category
""")
conn.commit()

pd.read_sql("SELECT * FROM Sales_view", conn)

