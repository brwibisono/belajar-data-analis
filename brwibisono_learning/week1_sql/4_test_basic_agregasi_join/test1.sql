SELECT 
  order_id,
  user_id,
  status AS order_status,
  created_at

 FROM `brbelajardata.thelook_copy.orders`
 WHERE status = 'Complete'
 ORDER BY created_at
 Limit 10;