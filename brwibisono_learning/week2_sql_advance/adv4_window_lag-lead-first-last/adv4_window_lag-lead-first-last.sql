WITH customer_order AS (
  SELECT
    o.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
    o.order_id,
    DATE(o.created_at) AS tanggal,
    ROUND(SUM(oi.sale_price), 2) AS total_belanja
  FROM brbelajardata.thelook_copy.orders o
  JOIN brbelajardata.thelook_copy.order_items oi
    ON o.order_id = oi.order_id
  JOIN brbelajardata.thelook_copy.users u
    ON o.user_id = u.id
  GROUP BY o.user_id, nama_customer, o.order_id, tanggal
),

with_lag AS (
  SELECT
    user_id,
    nama_customer,
    order_id,
    tanggal,
    total_belanja,
    ROUND(LAG(total_belanja) OVER(PARTITION BY user_id ORDER BY tanggal), 2) AS belanja_sebelumnya,
    ROUND(LEAD(total_belanja) OVER(PARTITION BY user_id ORDER BY tanggal), 2) AS belanja_setelahnya,
    ROUND(FIRST_VALUE(total_belanja) OVER(PARTITION BY user_id ORDER BY tanggal), 2) AS belanja_pertama,
    ROUND(LAST_VALUE(total_belanja) OVER(PARTITION BY user_id ORDER BY tanggal), 2) AS belanja_terakhir,
  FROM customer_order
)

SELECT 
  user_id,
  nama_customer,
  order_id,
  tanggal,
  total_belanja,
  belanja_sebelumnya,
  belanja_setelahnya,
  belanja_pertama,
  belanja_terakhir
  -- COALESCE(belanja_sebelumnya, 0) AS belanja_sebelumnya,
  --ROUND(total_belanja - COALESCE(belanja_sebelumnya, 0), 2) AS selisih_belanja
FROM with_lag
ORDER BY user_id, tanggal
LIMIT 50;