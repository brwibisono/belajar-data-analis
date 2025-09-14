SELECT 
  p.name AS nama_produk,
  ROUND(SUM(oi.sale_price), 2) AS total_revenue,
  COUNT(oi.order_id) AS total_transaksi,
  AVG(oi.sale_price) AS rata2_harga_jual
FROM `brbelajardata.thelook_copy.order_items` oi
JOIN brbelajardata.thelook_copy.products p
  ON oi.product_id = p.id
JOIN brbelajardata.thelook_copy.orders o
  ON oi.order_id = o.order_id
WHERE o.status = 'Complete'
GROUP BY nama_produk
HAVING SUM(oi.sale_price) > 2000
ORDER BY total_revenue DESC
LIMIT 10;