SELECT --tampilkan id, total order, total pengeluaran
  oi.user_id,
  COUNT(oi.order_id) AS total_order,
  ROUND(SUM(oi.sale_price), 2) AS total_spent,
  CASE --kategori total order
    WHEN COUNT(oi.order_id) >= 5 AND SUM (oi.sale_price) >= 1000 THEN 'Loyal Premium' --5 atau lebih + spent 1000 atau lebih
    WHEN COUNT(oi.order_id) >= 5 THEN 'Loyal' --5 atau sama kurang dari 1000
    WHEN COUNT(oi.order_id) BETWEEN 2 AND 4 THEN 'Active' --2 sampai 4
    ELSE 'New'--1x order
  END AS customer_segment
FROM brbelajardata.thelook_copy.order_items oi
GROUP BY oi.user_id
ORDER BY total_spent DESC
LIMIT 10;
