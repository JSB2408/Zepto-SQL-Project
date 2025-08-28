drop table if exists zepto;
create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(120)NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

SELECT * FROM zepto
LIMIT 10;

--To check if there are empty spaces 
SELECT * FROM zepto 
WHERE category IS NULL OR
name IS NULL;

--Different product categories
SELECT DISTINCT category FROM zepto
ORDER BY category;

--products in stock vs outofstock
SELECT outofstock ,COUNT(sku_id)FROM zepto
GROUP BY outofstock;

--product names which came multiple times
SELECT name,COUNT(sku_id) as "Number Of SKU's"
FROM zepto 
GROUP BY name
HAVING COUNT(sku_id)>1
ORDER BY COUNT(sku_id)DESC;

--DATA CLEANING

--Show products with price=0

SELECT * FROM zepto
WHERE mrp=0 OR discountedSellingPrice=0;
--Now remove it
DELETE FROM zepto
WHERE mrp= 0;

--Convert paise to rupees

UPDATE zepto
SET mrp=mrp/100.0,
discountedSellingPrice= discountedSellingPrice/100.0;
SELECT mrp,discountedSellingPrice FROM zepto;


--Business Insights Queries


-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT name,mrp,discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

--Q2.What are the Products with High MRP but Out of Stock
SELECT name,mrp,outOfStock
FROM zepto
WHERE outOfStock=True AND mrp>300
ORDER BY mrp DESC;


--Q3.Calculate the Estimated Revenue for each category

SELECT category,
SUM(availableQuantity*discountedSellingPrice)as Total_Revenue
FROM zepto
GROUP BY category
ORDER BY Total_Revenue DESC;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

SELECT name,mrp,discountPercent FROM zepto
WHERE mrp>500 and discountPercent<10
ORDER BY mrp DESC,discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.

SELECT category,
ROUND(AVG(discountPercent),2)as Avgerage_Discounted_Percent
FROM zepto
GROUP BY category
ORDER BY Avgerage_Discounted_Percent DESC
LIMIT 5;


-- Q6. Find the price per gram for products above 100g and sort by best value.

SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2)as Price_per_G
FROM zepto
WHERE weightInGms>100
ORDER BY Price_per_G;



--Q7.Group the products into categories like Low, Medium, Bulk.

SELECT DISTINCT name,weightInGms,
CASE WHEN weightInGms<1000 then 'Low'
WHEN weightInGms<5000 then 'Medium'
ELSE 'Bulk'
END AS Weight_Category
FROM zepto;


--Q8.What is the Total Inventory Weight Per Category 

SELECT category,
SUM(availableQuantity*weightInGms)as Total_Inventory
FROM zepto
GROUP BY category
ORDER BY Total_Inventory;
