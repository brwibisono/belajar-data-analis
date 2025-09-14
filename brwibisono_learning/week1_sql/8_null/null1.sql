SELECT
  SUM(CASE WHEN o.user_id IS NULL THEN 1 ELSE 0 END) AS order_tanpa_id
FROM brbelajardata.thelook_copy.orders o
