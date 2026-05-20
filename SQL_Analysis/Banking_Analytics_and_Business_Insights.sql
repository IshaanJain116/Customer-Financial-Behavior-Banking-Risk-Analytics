Use banking_case;

-- Q1 How are customers distributed across income levels?
SELECT CASE WHEN `Estimated Income` < 100000 THEN 'Low' WHEN `Estimated Income` BETWEEN 100000 AND 300000 THEN 'Medium' ELSE 'High' END AS Income_Band,
COUNT(Customer_ID) AS Customer_Count  FROM customer  GROUP BY Income_Band;

-- Q2 Which occupation has the highest average income?
SELECT `Occupation`, AVG(`Estimated Income`) AS Avg_Income FROM customer GROUP BY `Occupation` ORDER BY Avg_Income DESC;

-- Q3 Identify high-risk customers (high loan + low income)
SELECT  Customer_ID,`Occupation`,`Estimated Income`,`Bank Loans`,`Risk Weighting` FROM customer WHERE `Bank Loans` > 200000  AND `Estimated Income` < 100000;

-- Q4 What is the total amount of deposits vs loans in the bank?
SELECT SUM(`Bank Deposits`) AS Total_Deposits, SUM(`Bank Loans`) AS Total_Loans FROM customer;

-- Q5 How does credit card usage vary by income level?
SELECT CASE WHEN `Estimated Income` < 100000 THEN 'Low' WHEN `Estimated Income` BETWEEN 100000 AND 300000 THEN 'Medium' ELSE 'High' END AS Income_Band,
AVG(`Credit Card Balance`) AS Avg_CC_Balance FROM customer GROUP BY Income_Band;

-- Q6 Top 10 valuable customers based on total account balance
SELECT Customer_ID,`Occupation`,`Nationality`,(`Bank Deposits` + `Saving Accounts` + `Checking Accounts`) AS Total_Value FROM customer ORDER BY Total_Value DESC
LIMIT 10;

-- Q7 Which nationality contributes the most to bank deposits?
SELECT `Nationality`, SUM(`Bank Deposits`) AS Total_Deposits FROM customer GROUP BY `Nationality` ORDER BY Total_Deposits DESC;

-- Q8 How are customers distributed across loyalty classifications?
SELECT `Loyalty Classification`, COUNT(Customer_ID) AS Total_Customers, AVG(`Bank Deposits`) AS Avg_Deposits FROM customer GROUP BY `Loyalty Classification`;

-- Q9 Do customers with more properties have higher income?
SELECT `Properties Owned`, COUNT(Customer_ID) AS Total_Customers, AVG(`Estimated Income`) AS Avg_Income FROM customer
GROUP BY `Properties Owned` ORDER BY `Properties Owned`;

-- Q10 How many customers have multiple account types?
SELECT COUNT(Customer_ID) AS Multi_Account_Customers FROM customer WHERE `Saving Accounts` > 0 AND `Checking Accounts` > 0 AND `Foreign Currency Account` > 0;
