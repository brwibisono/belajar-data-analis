SELECT
  TRIM(p.name) AS nama_bersih,
  REPLACE(p.name, 'Cap', 'Topi') AS nama_replace
FROM brbelajardata.thelook_copy.products p
LIMIT 20;