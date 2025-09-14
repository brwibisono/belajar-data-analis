SELECT
  p.name,
  REGEXP_CONTAINS(p.name, r'Shirt') AS nama_shirt
FROM brbelajardata.thelook_copy.products p
ORDER BY nama_shirt DESC
LIMIT 20;