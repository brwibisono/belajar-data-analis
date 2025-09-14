SELECT
  o.created_at AS tanggal_transaksi,
  EXTRACT(YEAR FROM o.created_at) AS tahun,
  EXTRACT(MONTH FROM o.created_at) AS bulan,
  EXTRACT(DAY FROM o.created_at) AS hari,
  DATE_DIFF(CURRENT_DATE(), DATE(o.created_at), DAY) order_terakhir,
  DATE_TRUNC(DATE(o.created_at), MONTH) AS awal_bulan

FROM brbelajardata.thelook_copy.orders o
ORDER BY tanggal_transaksi DESC
LIMIT 5;