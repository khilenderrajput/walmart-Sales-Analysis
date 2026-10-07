ALTER USER 'root'@'localhost'
IDENTIFIED BY 'Khilender@2026';

FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost'
IDENTIFIED BY 'Walmart@2026';

FLUSH PRIVILEGES;

USE walmart;

SHOW TABLES;

SELECT COUNT(*) FROM walmart_sales;

SELECT * FROM walmart_sales LIMIT 10;

--
select payment_method, count(*) from walmart_sales
group by payment_method;

--
select count(distinct Branch) from walmart_sales;

-- Bussiness Probem
-- Q1. Find the different payment method and no. of transactions, number of qty sold

select payment_method,
count(*) as no_payment,
sum(quantity) as total_qty
from walmart_sales
group by payment_method;

-- Q2: Identify the highest-rated category in each branch
-- Display the branch, category, and avg rating
SELECT branch, category, avg_rating
FROM (
    SELECT
        branch,
        category,
        AVG(rating) AS avg_rating,
        RANK() OVER (
            PARTITION BY branch
            ORDER BY AVG(rating) DESC
        ) AS rnk
    FROM walmart_sales
    GROUP BY branch, category
) AS ranked
WHERE rnk = 1;

-- Q3: Identify the busiest day for each branch based on the number of transactions
SELECT branch, day_name, no_transactions
FROM (
    SELECT 
        branch,
        DAYNAME(STR_TO_DATE(`DATE`, '%d,%m,%Y')) AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER (
            PARTITION BY branch
            ORDER BY COUNT(*) DESC
        ) AS rnk
    FROM walmart_sales
    GROUP BY branch, day_name
) AS ranked
WHERE rnk = 1;

-- Q4: Calculate the total quantity of items sold per payment method
select payment_method, sum(quantity)
from walmart_sales
group by payment_method;

-- Q5: Determine the average, minimum, and maximum rating of categories for each city

select category, city, 
avg(rating) as avg_rating,
max(rating) as max_rating,
min(rating) as min_rating
from walmart_sales
group by city, category;

-- Q6: Calculate the total profit for each category
select category, sum(profit_margin*unit_price*quantity) as total_profit
from walmart_sales
group by category
order by total_profit;

-- Q7: Determine the most common payment method for each branch
with cte as(
select payment_method, branch,
COUNT(*) AS total_transactions,
rank() over(partition by branch order by count(*) desc) as rnk
from walmart_sales
group by branch, payment_method
)
select branch,payment_method as preferred_payment
from cte
where rnk =1;

-- Q8: Categorize sales into Morning, Afternoon, and Evening shifts
select branch,
case
when hour(time(time)) < 12 then 'morning'
when hour(time(time)) between 12 and 17 then 'afternoon_time'
else 'evening_time'
end as shift,
count(*) as num_invoices
from walmart_sales
group by branch, shift
order by branch, num_invoices desc;

-- Q9: Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)

WITH revenue_2022 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart_sales
    WHERE YEAR(STR_TO_DATE(`DATE`, '%d,%m,%Y')) = 2022
    GROUP BY branch
),
revenue_2023 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart_sales
    WHERE YEAR(STR_TO_DATE(`DATE`, '%d,%m,%Y')) = 2023
    GROUP BY branch
)
SELECT 
    r2022.branch,
    r2022.revenue AS last_year_revenue,
    r2023.revenue AS current_year_revenue,
    ROUND(
        ((r2022.revenue - r2023.revenue) / r2022.revenue) * 100,
        2
    ) AS revenue_decrease_ratio
FROM revenue_2022 AS r2022
JOIN revenue_2023 AS r2023 
    ON r2022.branch = r2023.branch
WHERE r2022.revenue > r2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;