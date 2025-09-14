SELECT
  p.name,
  UPPER(p.name) AS nama_upper,
  LOWER(p.name) AS nama_lower
FROM brbelajardata.thelook_copy.products p
LIMIT 20;