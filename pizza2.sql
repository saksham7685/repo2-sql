CREATE DATABASE Pizza_Sales;
USE Pizza_Sales;
SELECT*FROM  pizza_data;

-- KPIs
-- Total revenue
SELECT SUM(total_price) AS Total_Revenuen FROM pizza_data; 

-- Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_data;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_data;

-- Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_data;

-- Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_data;

-- Hourly Trend for Pizzas Sold
SELECT HOUR( order_time) AS order_hours, SUM(quantity) AS total_pizzas_sold
FROM pizza_data
GROUP BY HOUR( order_time)
ORDER BY HOUR(order_time);

-- weekly trend for pizzas
SELECT 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Year,
    WEEK(STR_TO_DATE(order_date, '%d-%m-%Y')) AS WeekNumber,
    COUNT(DISTINCT order_id) AS Total_orders
FROM 
    pizza_data
GROUP BY 
    Year, WeekNumber
ORDER BY 
    Year, WeekNumber;
    
-- Sales %age of various pizza types
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_data) AS DECIMAL(10,2)) AS PCT
FROM pizza_data
GROUP BY pizza_category;

-- Sales %age of various pizza sizes
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_data) AS DECIMAL(10,2)) AS PCT
FROM pizza_data
GROUP BY pizza_size
ORDER BY pizza_size ;

-- total pizzas sold by pizza category
SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold
FROM pizza_data
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- top 5 pizzas by revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_data l
GROUP BY pizza_name
ORDER BY Total_Revenue DESC LIMIT 5;

-- bottom 5 pizzas by revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_data 
GROUP BY pizza_name
ORDER BY Total_Revenue LIMIT 5;

-- top 5 pizzas by quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_data
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC LIMIT 5;

-- bottom 5 pizzas by quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_data
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC LIMIT 5;

-- top 5 pizzas by total orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_data
GROUP BY pizza_name
ORDER BY Total_Orders DESC LIMIT 5;

-- bottom 5 pizzas by total orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_data
GROUP BY pizza_name
ORDER BY Total_Orders ASC LIMIT 5;

-- total orders by pizza category
SELECT pizza_category, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_data
GROUP BY pizza_category
ORDER BY Total_Orders ASC LIMIT 5;

SELECT pizza_category, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_data
GROUP BY pizza_category
ORDER BY Total_Orders ASC LIMIT 5;
 









