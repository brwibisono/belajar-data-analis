SELECT
  p.name AS nama_produk,
  p.retail_price,
  ROUND(SUM(oi.sale_price), 2) AS total_revenue,
  CASE
    WHEN p.retail_price > 760 THEN 'Rendah'
    WHEN p.retail_price BETWEEN 800 AND 900 THEN 'Sedang'
    ELSE 'Tinggi'
  END AS kategori_harga
FROM brbelajardata.thelook_copy.order_items oi
JOIN brbelajardata.thelook_copy.products p
  ON oi.product_id = p.id
GROUP BY p.name,p.retail_price
HAVING SUM(oi.sale_price) > 10000
ORDER BY total_revenue DESC
LIMIT 10;