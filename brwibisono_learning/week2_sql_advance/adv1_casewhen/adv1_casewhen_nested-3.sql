SELECT -- tampilkan id, nama, harga retail
  p.id,
  p.name,
  p.retail_price,
  CASE --kategori harga
    WHEN p.retail_price < 50 THEN 'Low' --dibawah 50
    WHEN p.retail_price BETWEEN 50 AND 200 THEN 'Medium' --antara 50 sampai 200
    ELSE 'High' --diatas 200
  END AS price_category
FROM brbelajardata.thelook_copy.products p
ORDER BY
  CASE
    WHEN p.retail_price < 50 THEN 1 --jika dibawah 50 tampil pertama
    WHEN p.retail_price BETWEEN 50 AND 200 THEN 2 --tampil kedua
    ELSE 3 --tampil ketiga
  END;