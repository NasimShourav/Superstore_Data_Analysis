SELECT * 
from Superstore_Data_Analysis..Superstore_Data

--What are total sales and total profits of each year?

select	Order_Date_Year, 
		SUM(sales) as Total_sales_in_Year, 
		SUM(Profit) as Total_Profit_in_Year 
from Superstore_Data_Analysis..Superstore_Data
Group By Order_Date_Year
Order By Order_Date_Year

--What are the total profits and total sales per quarter?

select	Order_Date_Quarter, 
		SUM(sales) as Total_sales, 
		SUM(Profit) as Total_Profit 
from Superstore_Data_Analysis..Superstore_Data
Group By Order_Date_Quarter
Order By Order_Date_Quarter

--What region generates the highest sales and profits 

select	Region, 
		SUM(sales) as Total_sales, 
		SUM(Profit) as Total_Profit
from Superstore_Data_Analysis..Superstore_Data
group by Region

--What state and city brings in the highest sales and profits ?

select	State, 
		SUM(sales) as Total_sales, 
		SUM(Profit) as Total_Profit
from Superstore_Data_Analysis..Superstore_Data
group by State
Order By Total_Profit

select	City, 
		SUM(sales) as Total_sales, 
		SUM(Profit) as Total_Profit
from Superstore_Data_Analysis..Superstore_Data
group by City


--The relationship between discount and sales and the total discount per category

select	Discount_in_Percentage, 
		AVG(Sales) as Avg_Sales
from Superstore_Data_Analysis..Superstore_Data
Group By Discount_in_Percentage
order by Discount_in_Percentage

select	Category, 
		SUM(Discount_in_Percentage) AS Total_Discount
from Superstore_Data_Analysis..Superstore_Data
Group By Category
Order By Total_Discount

select	Category,
		Sub_Category, 
		SUM(Discount_in_Percentage) AS Total_Discount
from Superstore_Data_Analysis..Superstore_Data
Group By Category,Sub_Category
Order By Total_Discount


--What category generates the highest sales and profits in each region and state ?

select	Category, 
		ROUND(SUM(Sales),2) AS Total_sale, 
		ROUND(SUM(Profit),2) AS Total_profit, 
		ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
from Superstore_Data_Analysis..Superstore_Data
group by Category

select	Region, 
		Category, 
		ROUND(SUM(Sales),2) AS Total_Sales, 
		ROUND(SUM(Profit),2) AS Total_Profit, 
		ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
from Superstore_Data_Analysis..Superstore_Data
Group By Region, Category

select	State, 
		Category, 
		ROUND(SUM(Sales),2) AS Total_Sales, 
		ROUND(SUM(Profit),2) AS Total_Profit, 
		ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
from Superstore_Data_Analysis..Superstore_Data
Group By State, Category
Order By Total_Profit 


--What subcategory generates the highest sales and profits in each region and state ?

select	Sub_Category, 
		ROUND(SUM(Sales),2) AS Total_Sales, 
		ROUND(SUM(Profit),2) AS Total_Profit, 
		ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
from Superstore_Data_Analysis..Superstore_Data
Group By Sub_Category
Order By profit_margin DESC

select	Region, 
		Sub_Category, 
		ROUND(SUM(Sales),2) AS Total_Sales, 
		ROUND(SUM(Profit),2) AS Total_Profit, 
		ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
from Superstore_Data_Analysis..Superstore_Data
Group By Region, Sub_Category
Order By Total_Profit DESC

select	State, 
		Sub_Category, 
		ROUND(SUM(Sales),2) AS Total_Sales, 
		ROUND(SUM(Profit),2) AS Total_Profit, 
		ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
from Superstore_Data_Analysis..Superstore_Data
Group By State, Sub_Category
Order By Total_Profit 


--What are the names of the products that are the most and least profitable to us?

Select	Product_Name, 
		Category, 
		ROUND(SUM(Sales),2) AS Total_Sales, 
		ROUND(SUM(Profit),2) AS Total_Profit, 
		ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
from Superstore_Data_Analysis..Superstore_Data
group by Product_Name, Category
order by Total_Profit DESC


--What segment makes the most of our profits and sales?

select	Segment, 
		ROUND(SUM(Sales),2) AS Total_Sales, 
		ROUND(SUM(Profit),2) AS Total_Profit, 
		ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
from Superstore_Data_Analysis..Superstore_Data
group by Segment
order by Total_Profit DESC


--How many customers do we have (unique customer IDs) in total and how much per region and state?

select	COUNT (DISTINCT Customer_ID) as Total_unique_client, 
		Region
from Superstore_Data_Analysis..Superstore_Data
group by Region

select	COUNT (DISTINCT Customer_ID) as Total_unique_client, 
		State
from Superstore_Data_Analysis..Superstore_Data
group by State 
Order by Total_unique_client


--Customer rewards program

select	DISTINCT Customer_ID AS Unique_Cust_Id, 
		ROUND(SUM(Sales),2) AS Total_Sales, 
		ROUND(SUM(Profit),2) AS Total_Profit, 
		ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
from Superstore_Data_Analysis..Superstore_Data
group by Customer_ID
order by Total_Profit DESC


