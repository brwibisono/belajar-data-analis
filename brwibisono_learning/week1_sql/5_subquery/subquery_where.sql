SELECT  
  name AS nama_produk,
  retail_price
FROM `brbelajardata.thelook_copy.products` 
  WHERE retail_price > (
      SELECT AVG(retail_price) FROM brbelajardata.thelook_copy.products
  )
ORDER BY retail_price DESC
LIMIT 10;