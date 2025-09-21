WITH product_sales AS (
  SELECT
    p.category,
    p.name,
    SUM(oi.sale_price) AS total_sales
  FROM brbelajardata.thelook_copy.order_items oi
  JOIN brbelajardata.thelook_copy.products p
    ON oi.product_id = p.id
  GROUP BY p.category, p.name
)

SELECT
  category,
  name,
  total_sales,
  DENSE_RANK() OVER (
      PARTITION BY category
      ORDER BY total_sales DESC
  ) AS sales_rank
FROM product_sales ps
LIMIT 50;