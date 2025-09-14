SELECT
  o.order_id,
  o.user_id,
  o.created_at AS tanggal_transaksi,
  FORMAT_TIMESTAMP('%Y-%m-%d', o.created_at) AS tahun_bulan_hari,
  DATE_DIFF(DATE(o.created_at),
    DATE(MIN(o.created_at) OVER(PARTITION BY o.user_id)),
    DAY) AS hari_sejak_order_pertama,
  DATE_TRUNC(DATE(o.created_at), MONTH) AS awal_bulan

FROM brbelajardata.thelook_copy.orders o
WHERE o.user_id = 253
ORDER BY tanggal_transaksi;