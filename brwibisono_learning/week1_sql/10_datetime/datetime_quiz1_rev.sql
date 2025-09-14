SELECT
  o.user_id,
  MIN(o.created_at) AS transaksi_pertama,
  MAX(o.created_at) AS transaksi_terakhir,
  DATE_DIFF(MAX(o.created_at), MIN(o.created_at), DAY) AS selisih_hari
FROM brbelajardata.thelook_copy.orders o
GROUP BY o.user_id
ORDER BY selisih_hari DESC
LIMIT 10;
