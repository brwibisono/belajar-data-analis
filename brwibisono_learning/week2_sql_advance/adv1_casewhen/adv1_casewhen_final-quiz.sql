WITH data_customer AS (
  SELECT
    u.id AS uid,
    CONCAT(u.first_name, ' ', u.last_name) AS nama_customer
  FROM brbelajardata.thelook_copy.users u
),

data_order AS (
  SELECT
    p.name AS nama_barang,
    oi.user_id AS uid,
    ROUND(SUM(oi.sale_price), 2) AS total_belanja
  FROM brbelajardata.thelook_copy.products p
  JOIN brbelajardata.thelook_copy.order_items oi
    ON oi.product_id = p.id
  GROUP BY nama_barang, uid
),

final AS (
  SELECT
    dc.uid,
    dc.nama_customer,
    do.nama_barang,
    do.total_belanja,
    CASE
      WHEN do.total_belanja >= 500 THEN 'High'
      WHEN do.total_belanja BETWEEN 200 AND 499 THEN 'Medium'
      ELSE 'Low'
  END AS klasifikasi_customer
  FROM data_customer dc
  JOIN data_order do
    ON dc.uid = do.uid
)

SELECT *
FROM final
ORDER BY
  CASE
    WHEN klasifikasi_customer = 'High' THEN 1
    WHEN klasifikasi_customer = 'Medium' THEN 2
    ELSE 3
  END, nama_customer
LIMIT 100;