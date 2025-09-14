SELECT
  p.name,
  LENGTH(p.name) AS nama_panjang
FROM brbelajardata.thelook_copy.products p
ORDER BY nama_panjang DESC
LIMIT 20;