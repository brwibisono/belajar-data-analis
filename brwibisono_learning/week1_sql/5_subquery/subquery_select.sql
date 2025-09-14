SELECT
  name AS nama_produk,
  ROUND(retail_price, 2),
  (SELECT ROUND(AVG(retail_price), 2) FROM brbelajardata.thelook_copy.products) AS rata2_harga
FROM `brbelajardata.thelook_copy.products` 
LIMIT 10;