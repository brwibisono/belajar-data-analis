SELECT  
  CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
  p.name,
  oi.sale_price,
  o.order_id,
  o.status,
  o.created_at
FROM `brbelajardata.thelook_copy.order_items` oi
JOIN brbelajardata.thelook_copy.orders o
  ON oi.order_id = o.order_id
JOIN brbelajardata.thelook_copy.users u
  ON o.user_id = u.id
JOIN brbelajardata.thelook_copy.products p
  ON oi.product_id = p.id
WHERE o.status = 'Complete'
ORDER BY o.created_at
LIMIT 10;