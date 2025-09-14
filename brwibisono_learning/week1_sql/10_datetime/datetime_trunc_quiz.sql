SELECT
  o.user_id,
  DATE_TRUNC(DATE(o.created_at), MONTH) AS bulan_order,
  COUNT(*) AS total_order
FROM brbelajardata.thelook_copy.orders o
GROUP BY o.user_id, bulan_order
ORDER BY o.user_id, bulan_order;