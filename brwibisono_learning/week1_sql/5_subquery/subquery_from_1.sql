SELECT
  nama_produk,
  total_revenue,
  (SELECT ROUND(AVG(total_revenue), 2) FROM (
      SELECT SUM(oi.sale_price) AS total_revenue
      FROM `brbelajardata.thelook_copy.order_items` oi
      JOIN brbelajardata.thelook_copy.orders o
        ON oi.order_id = o.order_id
      WHERE o.status = 'Complete'
  )) AS rata2_revenue
FROM (
  SELECT
    p.name AS nama_produk,
    SUM(oi.sale_price) AS total_revenue
  FROM brbelajardata.thelook_copy.order_items oi
  JOIN brbelajardata.thelook_copy.products p
    ON oi.product_id = p.id
  JOIN brbelajardata.thelook_copy.orders o
    ON oi.order_id = o.order_id
  WHERE o.status = 'Complete'
  GROUP BY p.name
) t
ORDER BY t.total_revenue DESC
LIMIT 10;