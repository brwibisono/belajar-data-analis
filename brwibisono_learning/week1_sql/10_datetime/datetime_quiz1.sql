SELECT
  o.user_id,
  o.order_id AS order_id,
  o.created_at AS tanggal_transaksi,
      MIN(o.created_at) OVER(PARTITION BY o.user_id) AS transaksi_pertama,
      MAX(o.created_at) OVER(PARTITION BY o.user_id) AS transaksi_terakhir,
      DATE_DIFF(DATE(o.created_at),
                DATE(MIN(o.created_at) OVER(PARTITION BY o.user_id)),
                DAY) AS selisih_hari
FROM brbelajardata.thelook_copy.orders o
ORDER BY o.user_id
LIMIT 10;