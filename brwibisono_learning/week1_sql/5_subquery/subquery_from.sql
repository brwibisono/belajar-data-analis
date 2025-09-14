SELECT 
  nama_produk,
  total_revenue
FROM (
  SELECT
  p.name AS nama_produk,
  SUM(oi.sale_price) AS total_revenue
  FROM `brbelajardata.thelook_copy.order_items` oi
  JOIN brbelajardata.thelook_copy.products p
    ON oi.product_id = p.id
  JOIN brbelajardata.thelook_copy.orders o
    ON oi.order_id = o.order_id
  WHERE o.status = 'Complete'
  GROUP BY p.name
) t
WHERE t.total_revenue > 2000
ORDER BY t.total_revenue DESC
LIMIT 20;
