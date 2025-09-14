SELECT
  o.created_at,
  DATE_ADD(DATE(o.created_at), INTERVAL 7 DAY) AS plus_7_hari,
  DATE_SUB(DATE(o.created_at), INTERVAL 1 MONTH) AS minus_1_bulan
FROM brbelajardata.thelook_copy.orders o
LIMIT 10;