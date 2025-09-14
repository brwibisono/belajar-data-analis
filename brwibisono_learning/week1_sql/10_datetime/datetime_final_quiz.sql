SELECT
  CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
  o.user_id,
  DATE_TRUNC(DATE(o.created_at), MONTH) AS bulan_order,
  COUNT(*) AS total_order
FROM brbelajardata.thelook_copy.orders o
JOIN brbelajardata.thelook_copy.users u
  ON o.user_id = u.id
GROUP BY o.user_id, nama_customer, bulan_order
ORDER BY total_order DESC
LIMIT 5;
