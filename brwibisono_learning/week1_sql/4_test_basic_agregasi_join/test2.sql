SELECT  
  CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
  o.order_id,
  o.status,
  o.created_at
FROM `brbelajardata.thelook_copy.orders` o
INNER JOIN brbelajardata.thelook_copy.users u
  ON o.user_id = u.id
WHERE status = 'Complete'
ORDER BY o.created_at
LIMIT 10;