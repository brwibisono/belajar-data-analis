WITH order_perbulan AS (
  SELECT
    o.user_id AS user_id,
    DATE_TRUNC(DATE(o.created_at), MONTH) AS bulan_order,
    COUNT(*) AS total_order
  FROM brbelajardata.thelook_copy.orders o
  GROUP BY o.user_id, bulan_order
)
SELECT
  CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
  op.user_id,
  op.bulan_order,
  op.total_order
FROM order_perbulan op
JOIN brbelajardata.thelook_copy.users u
  ON op.user_id = u.id
ORDER BY op.total_order DESC
LIMIT 5;
