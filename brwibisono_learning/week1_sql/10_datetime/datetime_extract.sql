SELECT 
  o.created_at,
  EXTRACT(YEAR FROM o.created_at) AS Tahun,
  EXTRACT(MONTH FROM o.created_at) AS Bulan,
  EXTRACT(DAY FROM o.created_at) AS Hari
FROM brbelajardata.thelook_copy.orders o
LIMIT 10;