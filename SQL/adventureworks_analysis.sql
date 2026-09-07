create database adventureworks;
use adventureworks;

-- Q 0

CREATE TABLE CombinedSales AS
SELECT *FROM FactInternetSales
UNION ALL
SELECT *FROM Fact_Internet_Sales_New;

SELECT * FROM CombinedSales; -- ans

-- Q1

SELECT COUNT(*) FROM factinternetsales;
SELECT s.*, 
    p.EnglishProductName AS ProductName
FROM FactInternetSales s
LEFT JOIN DimProduct p ON s.ProductKey = p.ProductKey; -- ans 

-- Q2

SELECT s.*, 
    CONCAT(c.FirstName, ' ', COALESCE(c.MiddleName, ''), ' ', c.LastName) AS CustomerFullName,
    p.`Unit price` AS UnitPrice
FROM factinternetsales s
left JOIN dimcustomer c 
    ON s.CustomerKey = c.`ï»¿CustomerKey`
left JOIN dimproduct p 
    ON s.ProductKey = p.ProductKey; -- ans 

-- Q3

SELECT OrderDateKey,
    -- Step 1: Create a proper Date field from OrderDateKey (YYYYMMDD converted to DATE)
    STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d') AS OrderDate,
    
    -- Step 2: Extract required fields from the new Date field
    YEAR(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) AS OrderYear,
    MONTH(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) AS OrderMonth,
    MONTHNAME(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) AS MonthName,
    QUARTER(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) AS OrderQuarter,
    DAYNAME(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) AS DayName
FROM factinternetsales; -- ans 

-- Q4
 
SELECT OrderDateKey,
    -- Step 1: Create a proper Date field from OrderDateKey
    STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d') AS OrderDate,
    -- A. Year
    YEAR(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) AS Year,
    -- B. Monthno
    MONTH(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) AS Monthno,
    -- C. Monthfullname
    MONTHNAME(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) AS Monthfullname,
    -- D. Quarter (Q1, Q2, Q3, Q4)
    CONCAT('Q', QUARTER(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d'))) AS Quarter,
    -- E. YearMonth (YYYY-MMM)
    DATE_FORMAT(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d'), '%Y-%b') AS YearMonth,
    -- F. Weekdayno
    DAYOFWEEK(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) AS Weekdayno,
    -- G. Weekdayname
    DAYNAME(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) AS Weekdayname,
    -- H. FinancialMonth (Assuming Fiscal Year starts in April)
    CASE 
        WHEN MONTH(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) >= 4 THEN MONTH(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) - 3
        ELSE MONTH(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) + 9 
    END AS FinancialMonth,
    -- I. Financial Quarter
    CONCAT('FQ', 
        CASE 
            WHEN MONTH(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) IN (4,5,6) THEN 1
            WHEN MONTH(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) IN (7,8,9) THEN 2
            WHEN MONTH(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')) IN (10,11,12) THEN 3
            ELSE 4 
        END) AS Financial_Quarter
FROM FactInternetSales; -- ans 

-- Q5 

SELECT OrderQuantity,
    UnitPrice,
    UnitPriceDiscountPct,
    SalesAmount AS Actual_SalesAmount_In_Table,
    -- Calculated Sales Amount
    (UnitPrice * OrderQuantity) - ((UnitPrice * OrderQuantity) * UnitPriceDiscountPct) AS Calculated_SalesAmount
FROM FactInternetSales; -- ans 

-- Q6 
 
SELECT OrderQuantity,
    ProductStandardCost AS UnitCost,
    TotalProductCost AS Actual_TotalProductCost_In_Table,
    -- Calculated Production Cost
    (ProductStandardCost * OrderQuantity) AS Calculated_ProductionCost
FROM FactInternetSales; -- ans 

-- Question 7 

SELECT  SalesAmount,
    TotalProductCost,
    -- Calculated Profit (Sales Amount minus Total Product Cost)
    (SalesAmount - TotalProductCost) AS Profit
FROM FactInternetSales; -- ans 

-- Q8

SELECT FLOOR(OrderDateKey / 10000) AS Year,
    FLOOR(OrderDateKey / 100) % 100 AS Monthno,
    SUM(SalesAmount) AS TotalSales
FROM factinternetsales
WHERE FLOOR(OrderDateKey / 10000) = 2012
GROUP BY FLOOR(OrderDateKey / 10000),
    FLOOR(OrderDateKey / 100) % 100
ORDER BY Monthno; -- ans 

-- Q9

SELECT 
    FLOOR(OrderDateKey / 10000) AS `Year`,
    SUM(SalesAmount) AS `TotalSales`
FROM factinternetsales
GROUP BY FLOOR(OrderDateKey / 10000)
ORDER BY `Year`; -- ans 
    
    -- Q10
    
    SELECT 
    FLOOR(OrderDateKey / 100) % 100 AS `Monthno`,
    SUM(SalesAmount) AS `TotalSales`
FROM factinternetsales
GROUP BY FLOOR(OrderDateKey / 100) % 100
ORDER BY `Monthno`; -- ans 
    
    -- q11
    
SELECT CONCAT('Q', QUARTER(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d'))) AS `Quarter`,
    SUM(SalesAmount) AS `TotalSales`
FROM factinternetsales
GROUP BY CONCAT('Q', QUARTER(STR_TO_DATE(CAST(OrderDateKey AS CHAR), '%Y%m%d')))
ORDER BY `Quarter`; -- ans
    
    -- q13
    
    SELECT FLOOR(OrderDateKey / 10000) AS `Year`,
    SUM(SalesAmount) AS `TotalSales`,
    SUM(TotalProductCost) AS `TotalProductionCost`
FROM factinternetsales
GROUP BY FLOOR(OrderDateKey / 10000)
ORDER BY `Year`; -- ans 

    -- Q15

SELECT 
    COUNT(SalesOrderNumber) AS `TotalOrders`,
    SUM(SalesAmount) AS `TotalSales`,
    SUM(TotalProductCost) AS `TotalProductionCost`,
    SUM(SalesAmount - TotalProductCost) AS `TotalProfit`,
    SUM(OrderQuantity) AS `TotalQuantitySold`
FROM factinternetsales; -- ans 