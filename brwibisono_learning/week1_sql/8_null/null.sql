SELECT COUNT(*) AS transaksi_tanpa_customer
FROM `brbelajardata.thelook_copy.orders` o
WHERE o.user_id IS NULL