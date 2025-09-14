WITH leggings AS (
  SELECT
    p.name AS nama_produk,
    p.brand AS brand_produk
  FROM brbelajardata.thelook_copy.products p
  WHERE p.category = 'Leggings'
  LIMIT 20
),

pants AS (
  SELECT
    p.name AS nama_produk,
    p.brand AS brand_produk
  FROM brbelajardata.thelook_copy.products p
  WHERE p.category = 'Leggings'
  LIMIT 20
),

combined AS (
  SELECT * FROM leggings
  UNION ALL
  SELECT * FROM pants
)

SELECT
  nama_produk,
  brand_produk,
  COUNT(*) AS muncul_di
FROM combined
GROUP BY nama_produk, brand_produk
HAVING COUNT(*) > 1
ORDER BY muncul_di DESC;