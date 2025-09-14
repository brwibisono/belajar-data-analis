SELECT 
  p.name AS nama_produk,
  ROUND(SUM(oi.sale_price), 2) AS total_revenue
  FROM `brbelajardata.thelook_copy.order_items` oi
  JOIN brbelajardata.thelook_copy.products p
    ON oi.product_id = p.id
  GROUP BY p.name
  ORDER BY total_revenue DESC
  LIMIT 5