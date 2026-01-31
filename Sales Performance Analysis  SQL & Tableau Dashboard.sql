
/*
Project: Sales Performance Analysis | SQL & Tableau Dashboard
Author: Xhavide Zymberi
Description: SQL queries used to generate KPIs and analytical datasets 
for Tableau dashboard visualization.
*/

  SELECT*
  FROM [Portfolio Project 2].[dbo].[[Superstore Dataset]]]

 /*
===========================================================
NULL VALUE CHECK – DATA QUALITY VALIDATION
Objective: Identify rows containing NULL values 
across critical business columns.
===========================================================
*/

SELECT COUNT(*) AS count_null_values
FROM [Portfolio Project 2].[dbo].[[Superstore Dataset]]]
     WHERE [Order ID] IS NULL
     AND [Order Date] IS NULL
         AND [Ship Date] IS NULL
            AND [Ship Mode] IS NULL
               AND [Customer ID] IS NULL
                  AND [Customer Name] IS NULL
                     AND [Segment] IS NULL
                       AND [Country] IS NULL
                          AND [City] IS NULL
                       AND [State] IS NULL
                     AND [Postal Code] IS NULL
                   AND [Region] IS NULL
                AND [Product ID] IS NULL
             AND [Category] IS NULL
          AND [Sub-Category] IS NULL
       AND [Product Name] IS NULL
    AND [Sales] IS NULL
 AND [Quantity] IS NULL
 AND [Discount] IS NULL
 AND [Profit] IS NULL;

/*
===========================================================
COLUMN-LEVEL NULL ANALYSIS
Objective: Measure missing values per column 
to assess overall data quality.
===========================================================
*/

SELECT 
    SUM(CASE WHEN [Order ID] IS NULL THEN 1 ELSE 0 END) AS OrderID_Nulls,
	SUM(CASE WHEN [Order Date] IS NULL THEN 1 ELSE 0 END) AS OrderDate_Nulls,
	SUM(CASE WHEN [Ship Date] IS NULL THEN 1 ELSE 0 END) AS ShipDate_Nulls,
	SUM(CASE WHEN [Ship Mode] IS NULL THEN 1 ELSE 0 END) AS ShipMode_Nulls,
    SUM(CASE WHEN [Customer ID] IS NULL THEN 1 ELSE 0 END) AS CustomerID_Nulls,
	SUM(CASE WHEN [Customer Name] IS NULL THEN 1 ELSE 0 END) AS CustomerName_Nulls,
	SUM(CASE WHEN [Segment] IS NULL THEN 1 ELSE 0 END) AS Segment_Nulls,
	SUM(CASE WHEN [Country] IS NULL THEN 1 ELSE 0 END) AS Country_Nulls,
	SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END) AS City_Nulls,
	SUM(CASE WHEN [State] IS NULL THEN 1 ELSE 0 END) AS State_Nulls,
	SUM(CASE WHEN [Postal Code] IS NULL THEN 1 ELSE 0 END) AS PostalCode_Nulls,
	SUM(CASE WHEN [Region] IS NULL THEN 1 ELSE 0 END) AS Region_Nulls,
	SUM(CASE WHEN [Product ID] IS NULL THEN 1 ELSE 0 END) AS ProductID_Nulls,
	SUM(CASE WHEN [Category] IS NULL THEN 1 ELSE 0 END) AS Category_Nulls,
	SUM(CASE WHEN [Sub-Category] IS NULL THEN 1 ELSE 0 END) AS Sub_Category_Nulls,
	SUM(CASE WHEN [Product Name] IS NULL THEN 1 ELSE 0 END) AS ProductName_Nulls,
    SUM(CASE WHEN [Sales] IS NULL THEN 1 ELSE 0 END) AS Sales_Nulls,
    SUM(CASE WHEN [Profit] IS NULL THEN 1 ELSE 0 END) AS Profit_Nulls,
	SUM(CASE WHEN [Quantity] IS NULL THEN 1 ELSE 0 END) AS Quantity_Nulls,
	SUM(CASE WHEN [Discount] IS NULL THEN 1 ELSE 0 END) AS Discount_Nulls
    FROM [Portfolio Project 2].[dbo].[[Superstore Dataset]]]


/*  Confirm They Are Completely Empty */

SELECT *
FROM [Portfolio Project 2].[dbo].[[Superstore Dataset]]]
WHERE [Order ID] IS NULL
       AND [Customer ID] IS NULL
       AND [Sales] IS NULL
       AND [Profit] IS NULL;


/* Row Count Validation (Before & After Cleaning) */

/* Step 1 - Check Total Rows Before Cleaning 

===========================================================
DATA VALIDATION – ROW COUNT BEFORE CLEANING
Objective: Establish baseline record count before removing 
fully empty rows.
===========================================================
*/

 SELECT COUNT(*) AS Total_Rows_Before_Cleaning
 FROM  [Portfolio Project 2].[dbo].[[Superstore Dataset]]]


/* Step 2 — Count Fully Empty Rows 
Identify rows where key business fields are NULL ( Expected result: 501 rows )
*/

SELECT COUNT(*) AS Fully_Empty_Rows
FROM [Portfolio Project 2].[dbo].[[Superstore Dataset]]]
WHERE 
    [Order ID] IS NULL
    AND [Customer ID] IS NULL
    AND [Sales] IS NULL
    AND [Profit] IS NULL;


/* Step 3 — Create Cleaned Table

===========================================================
DATA CLEANING – REMOVE FULLY EMPTY ROWS
Objective: Create cleaned dataset excluding blank rows
introduced during CSV import.
===========================================================
*/

SELECT *
INTO Superstore_Cleaned
FROM [Portfolio Project 2].[dbo].[[Superstore Dataset]]]
WHERE [Order ID] IS NOT NULL;


/* Step 4 — Validate Row Count After Cleaning

===========================================================
DATA VALIDATION – ROW COUNT AFTER CLEANING
Objective: Confirm successful removal of fully empty rows.
===========================================================
*/

SELECT COUNT(*) AS Total_Rows_After_Cleaning
FROM Superstore_Cleaned;


/* Show Difference in One Query */

SELECT 
    (SELECT COUNT(*) FROM [Portfolio Project 2].[dbo].[[Superstore Dataset]]]) AS Rows_Before,
    (SELECT COUNT(*) FROM Superstore_Cleaned) AS Rows_After,
    (SELECT COUNT(*) FROM [Portfolio Project 2].[dbo].[[Superstore Dataset]]]) 
    - (SELECT COUNT(*) FROM Superstore_Cleaned) AS Rows_Removed;


SELECT *
FROM Superstore_Cleaned;

ALTER TABLE Superstore_Cleaned
DROP COLUMN [Row ID];

/* 
=========================================================
SQL queries used to generate KPIs and analytical datasets 
   for Tableau dashboard visualization.
=========================================================
*/
 
  --1. Calculate the Total Sales for each year (Total revenue generated)

SELECT 
     YEAR([Order Date]) AS Year,
       ROUND(SUM(Sales),2) AS Total_Sales
     FROM Superstore_Cleaned
  GROUP BY YEAR([Order Date])
ORDER BY Total_Sales DESC;


--2. Find the Total Sales for each Region and Segment

SELECT 
     [Region],
	 [Segment],
     ROUND(SUM(Sales),2) AS Total_Sales
FROM  Superstore_Cleaned
	 GROUP BY [Region],[Segment]
	 ORDER BY Total_Sales DESC;


--3. Calculate the Total Sales for each Category

SELECT [Region],[Category], 
       ROUND(SUM(Sales),2) AS Total_Sales
	 FROM Superstore_Cleaned
  GROUP BY Region,Category
ORDER BY Total_Sales DESC;


--4. Calculate the Total Profit for each Year (Net profit across all transactions)

 SELECT
      YEAR([Order Date]) AS [Year],
         ROUND(SUM([Profit]), 2) AS Total_Profit
          FROM Superstore_Cleaned
            GROUP BY YEAR([Order Date])
            ORDER BY Total_Profit DESC;


-- 5. Calculate the Total Sales and Profit for each Sub-category

SELECT [Sub-Category],
        ROUND(SUM(Sales),2) AS Total_Sales,
           ROUND(SUM([Profit]),2) AS Total_Profit
	     FROM Superstore_Cleaned
        GROUP BY  [Sub-Category]
	ORDER BY Total_Sales DESC;


--6. Calculate the YOY change of Sales and Profit for 2024 vs 2023 in each Sub-Category 

--a) YOY change of Sales

With CTE AS
         (SELECT [Sub-Category],
            YEAR([Order Date]) AS Sales_Year,
			   ROUND(SUM(Sales),2) AS Total_Sales
		FROM Superstore_Cleaned
GROUP BY [Sub-Category],YEAR([Order Date]) 
)

SELECT [Sub-Category],
       Sales_Year,
	   Total_Sales,
	    LAG(Total_Sales, 1) OVER (ORDER BY Sales_Year) AS Previous_Year_Sales,
           ROUND(
                ((Total_Sales - LAG(Total_Sales, 1) OVER (ORDER BY Sales_Year)) *1.0
                /NULLIF(LAG(Total_Sales, 1) OVER (ORDER BY Sales_Year), 0) ), 2) * 100
		    AS YOY_Growth_Percent
        FROM CTE
ORDER BY YOY_Growth_Percent DESC;


--b) YOY change of Profit

With CTE AS
         (SELECT [Sub-Category],
             YEAR([Order Date]) AS Profit_Year,
				ROUND(SUM([Profit]),2) AS Total_Profit
		FROM Superstore_Cleaned
        GROUP BY [Sub-Category],YEAR([Order Date]) 
)

SELECT [Sub-Category],
       Profit_Year,
	   Total_Profit,
	    LAG(Total_Profit, 1) OVER (ORDER BY  Profit_Year) AS Previous_Year_Profit,
    ROUND(
        ((Total_Profit - LAG(Total_Profit, 1) OVER (ORDER BY Profit_Year))* 1.0 
        / NULLIF(LAG(Total_Profit, 1) OVER (ORDER BY Profit_Year), 0)),  
    2)* 100 AS YOY_Growth_Percent 
FROM CTE 
ORDER BY YOY_Growth_Percent DESC;


-- 7. Retrieve the Sub-Categories with negative (loss) profit

SELECT [Sub-Category],
       YEAR([Order Date]) AS Profit_Year,
		ROUND(SUM([Profit]),2) AS Total_Profit
		    FROM Superstore_Cleaned
	    GROUP BY [Sub-Category],YEAR([Order Date]) 
     HAVING ROUND(SUM([Profit]),2) < 0
 ORDER BY Total_Profit ASC;


--8. Retrieve the top 10 States with the Highest Total Profit


SELECT TOP 10 [State],
          ROUND(CAST(SUM([Profit])AS int), 2) AS Total_Profit
			   FROM Superstore_Cleaned
          GROUP BY  [State]
      ORDER BY Total_Profit  DESC;

--9. Calculate the Total Quantity for each year


SELECT YEAR([Order Date]) AS [Year],
         SUM([Quantity]) AS Total_Quantity
FROM Superstore_Cleaned
          GROUP BY YEAR([Order Date])
      ORDER BY Total_Quantity DESC;


--10. Calculate the Total Orders for each year (Unique transactions)

SELECT
     YEAR([Order Date]) AS [Year],
      COUNT(DISTINCT [Order ID]) AS Total_Orders
      FROM Superstore_Cleaned
GROUP BY YEAR([Order Date])
ORDER BY Total_Orders DESC;


--11. Calculate the Total Customers for each year (Unique customer base)

SELECT
    YEAR([Order Date]) AS [Year],
       COUNT(DISTINCT [Customer ID]) AS Total_Customers
       FROM Superstore_Cleaned
GROUP BY YEAR([Order Date])
ORDER BY Total_Customers DESC;


/*
===========================================================
CUSTOMER DISTRIBUTION BY NUMBER OF ORDERS
Objective: Understand how customers are distributed 
based on purchase frequency.
===========================================================
*/
--12. Calculate the Number of Orders per Customer for '2024'


 WITH CustomerOrderCounts AS(	 
          SELECT 
			   [Customer ID],
               COUNT(DISTINCT [Order ID]) AS Total_Orders
               FROM Superstore_Cleaned
          WHERE YEAR([Order Date]) = '2024'
  GROUP BY [Customer ID]
  )

 SELECT 
      total_orders,
      COUNT([Customer ID]) AS Number_of_Customers
      FROM CustomerOrderCounts
 GROUP BY total_orders
 ORDER BY Number_of_Customers DESC;

 /*
===========================================================
13. CALCULATE TOTAL SALES PER CUSTOMER
Objective: Calculate total revenue generated by each customer.

Business Value:
- Identify high-value customers
- Support customer segmentation
- Assist in targeted marketing strategies
===========================================================
*/

SELECT
     YEAR([Order Date]) AS [Year],
        ROUND(SUM(Sales) / COUNT(DISTINCT [Customer ID]),2) AS Sales_Per_Customer
      FROM Superstore_Cleaned
    GROUP BY YEAR([Order Date])
ORDER BY Sales_Per_Customer DESC


/*
===========================================================
TOP 10 CUSTOMERS BY PROFIT
Objective: Identify the most profitable customers 
based on total profit contribution.

Business Value:
- Highlight high-value customers
- Support retention strategies
- Analyze profit concentration
===========================================================
*/
--14. List the Top 10 Customers by Profit for '2024'


 WITH Customer_Profit AS (
           SELECT 
                [Customer ID],
                [Customer Name],
                ROUND(SUM([Profit]),2) AS Total_Profit
          FROM Superstore_Cleaned
	      WHERE [Order Date] >= '2024-01-01'
            AND [Order Date] <  '2025-01-01'
     GROUP BY 
            [Customer ID],
            [Customer Name]
)
SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY Total_Profit DESC) AS Profit_Rank 
    FROM Customer_Profit
) Ranked_Customers 
WHERE Profit_Rank <= 10
ORDER BY Profit_Rank;


--15. Calculate the Average Number of Days to Ship by Region and Ship mode


SELECT 
     [Region],
     [Ship Mode],
         AVG(DATEDIFF(DAY, [Order Date], [Ship Date])+1) AS AverageShippingDays
         FROM Superstore_Cleaned
GROUP BY [Region], [Ship Mode]
ORDER BY AverageShippingDays ASC;
    



 
 













