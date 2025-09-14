SELECT 
  o.user_id,
  o.order_id AS order_id,
  o.created_at AS waktu_transaksi,

  MIN(o.created_at) OVER(PARTITION BY o.user_id) AS transaksi_pertama,

  --Selisih hari
  DATE_DIFF(DATE(o.created_at),
       DATE(MIN(o.created_at) OVER(PARTITION by o.user_id)),
       DAY) AS hari_sejak_pertama_order,

  --selisih jam total
  TIMESTAMP_DIFF(o.created_at,
                MIN(o.created_at) OVER(PARTITION BY o.user_id),
                HOUR) AS jam_sejak_order_pertama
FROM brbelajardata.thelook_copy.orders o
WHERE o.user_id = 253
ORDER BY waktu_transaksi;