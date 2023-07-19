Select * from pizza_sales

---KPI's REQUIREMENT:

----> Q1. Total revenue?
Select Sum(total_price) as Total_Revenue from pizza_sales
----> Q2. Average order Value?
Select Sum(total_price) / Count(Distinct order_id) as Avg_order_value from pizza_sales
----> Q3. Total Pizzas sold?
Select Sum(quantity) as Total_price_sold from pizza_sales
----> Q4. Average Pizzas per Order?
Select cast(Cast(Sum(quantity) as decimal(10,2)) / cast(Count(Distinct order_id) as Decimal(10,2)) as decimal(10,2))
as Avg_Pizzas_per_order from pizza_sales

---CHARTS REQUIREMENTS:
Select * from pizza_sales

----> Q1. Daily Trend for Total Orders?
Select DATENAME(DW,order_date) as order_day, Count(Distinct order_id) as Total_orders from pizza_sales group by(DATENAME(DW,order_date))

---> Q2. Hourly Trend for Total Orders?
Select DATEPART(Hour,order_time) as order_hour,Count(Distinct order_id)as Total_orders from pizza_sales group by DATEPART(Hour,order_time)
order by DATEPART(Hour,order_time)

---> Q3. Percentage of sales by Pizza Category? 
Select pizza_category,Sum(total_price)as Total_Sales,Sum(total_price) * 100  / (select sum(total_price) from pizza_sales) 
from pizza_sales
Where Month(order_date)=1
group by pizza_category

---> Q4. Percentage of sales by Pizza Size?
Select pizza_size,cast(Sum(total_price) as decimal(10,2)) as Total_Sales, cast(Sum(total_price)) * 100  / select sum(total_price) from pizza_sales
WHERE Datepart(Quarter,order_date)=1)
as decimal(10,2)) as PCT
from pizza_sales
where Datepart(quarter,order_date)=1)
group by pizza_size 
order by PCT DESC

---> Q5. Total Pizzas Sold by Pizza Category?
Select pizza_category, sum(quantity) as Total_pizzas_sold
from pizza_sales
group by pizza_category

---> Q6. Top 5 best Sellers by Total Pizzas sold?
Select Top 5 pizza_name,Sum(quantity) as Total_pizzas_sold
from pizza_sales
group by pizza_name
order by Sum(quantity) DESC

---> Q7. Bottom 5 Worst Sellers by Total Pizzas Sold?
Select Top 5 pizza_name,Sum(quantity) as Total_pizzas_sold
from pizza_sales
where Month(order_date)=8
group by pizza_name
order by Sum(quantity) ASC
