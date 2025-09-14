SELECT
  p.name,
  SUBSTR(p.name, 1, 8) AS nama_pendek
FROM brbelajardata.thelook_copy.products p
LIMIT 20;