SELECT --Tampilkan id, nama, harga retail
  p.id,
  p.name,
  p.retail_price,
  CASE --Kategorikan harga retail
    WHEN p.retail_price < 50 THEN 'Low'--dibawah 50
    WHEN p.retail_price BETWEEN 50 AND 200 THEN --antara 50 - 200
      CASE
        WHEN p.retail_price < 100 THEN 'Medium-low' --tapi dibawah 100
        ELSE 'Medium-High'
      END
    ELSE 'High' --di atas 200
  END AS price_category
FROM brbelajardata.thelook_copy.products p
LIMIT 10;