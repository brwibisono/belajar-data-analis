SELECT o.order_id,
  NULLIF(o.user_id, 0) AS user_id_baru
FROM brbelajardata.thelook_copy.orders o
LIMIT 10;