WITH monthly_spending AS (
  SELECT
    u.id AS user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
    FORMAT_DATE('%Y-%b', o.created_at) AS bulan,
    SUM(oi.sale_price) AS total_spending
  FROM brbelajardata.thelook_copy.order_items oi
  JOIN brbelajardata.thelook_copy.orders o
    ON oi.order_id = o.order_id
  JOIN brbelajardata.thelook_copy.users u
    ON oi.user_id = u.id
  GROUP BY user_id, nama_customer, bulan
),

ranked_spending AS (
  SELECT
   *,
   RANK() OVER (
      PARTITION BY bulan
      ORDER BY total_spending DESC
    ) AS rank_spending,
   DENSE_RANK() OVER(
     PARTITION BY bulan
     ORDER BY total_spending DESC
   ) AS dense_rank_spending,
   ROW_NUMBER() OVER (
     PARTITION BY bulan
     ORDER BY total_spending DESC
   ) AS row_number_spending
  FROM monthly_spending
)

SELECT *
FROM ranked_spending
WHERE rank_spending <= 3
LIMIT 50;