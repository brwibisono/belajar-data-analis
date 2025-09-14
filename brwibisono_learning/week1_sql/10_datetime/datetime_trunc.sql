SELECT
  o.created_at,
  DATE_TRUNC(DATE(o.created_at), MONTH) AS awal_bulan
FROM brbelajardata.thelook_copy.orders o
LIMIT 10;