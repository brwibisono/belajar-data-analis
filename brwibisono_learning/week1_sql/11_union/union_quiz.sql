SELECT *
FROM (
  SELECT
    p.name AS nama_produk,
    p.brand AS brand_produk,
    p.category AS kategori_produk
  FROM brbelajardata.thelook_copy.products p
  WHERE p.category = 'Leggings'
  ORDER BY p.brand DESC
  LIMIT 20
)

UNION DISTINCT

SELECT *
FROM (
  SELECT
    p.name AS nama_produk,
    p.brand AS brand_produk,
    p.category AS kategori_produk
  FROM brbelajardata.thelook_copy.products p
  WHERE p.category = 'Pants'
  ORDER BY p.brand DESC
  LIMIT 20
)