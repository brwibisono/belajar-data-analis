SELECT 
  p.name AS nama_produk,
  ROUND(SUM(oi.sale_price), 2) AS total_revenue,
  CASE
    WHEN ROUND(SUM(oi.sale_price), 2) < 8000 THEN 'Rendah'
    WHEN ROUND(SUM(oi.sale_price), 2) BETWEEN 9000 and 12500 THEN 'Sedang'
    ELSE 'Tinggi'
  END AS kategori_revenue
  FROM `brbelajardata.thelook_copy.order_items` oi
  JOIN brbelajardata.thelook_copy.products p
    ON oi.product_id = p.id
  GROUP BY p.name
  ORDER BY total_revenue DESC
  LIMIT 5