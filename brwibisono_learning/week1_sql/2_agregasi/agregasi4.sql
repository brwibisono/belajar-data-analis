SELECT
customer_id,
SUM(quantity * price) as total_revenue
FROM `brbelajardata.basicsql.orders`
GROUP BY customer_id
ORDER BY total_revenue DESC