SELECT
  name AS nama_produk,
  ROUND(retail_price, 2) AS harga_produk,
  (SELECT ROUND(AVG(retail_price), 2) FROM brbelajardata.thelook_copy.products) AS rata2_global
FROM brbelajardata.thelook_copy.products
WHERE retail_price > (
  SELECT AVG(retail_price) FROM brbelajardata.thelook_copy.products
)
LIMIT 10;