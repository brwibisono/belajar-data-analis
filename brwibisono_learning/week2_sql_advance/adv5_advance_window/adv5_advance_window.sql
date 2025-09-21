WITH sales AS (
  SELECT '2025-09-01' AS order_date, 'C001' AS cust_id, 100 AS total_purc UNION ALL
  SELECT '2025-09-02', 'C002', 150 UNION ALL
  SELECT '2025-09-03', 'C003', 200 UNION ALL
  SELECT '2025-09-04', 'C004', 50 UNION ALL
  SELECT '2025-09-05', 'C005', 300 UNION ALL
  SELECT '2025-09-06', 'C006', 120 UNION ALL
  SELECT '2025-09-07', 'C007', 180 UNION ALL
  SELECT '2025-09-08', 'C008', 220 UNION ALL
  SELECT '2025-09-09', 'C009', 90 UNION ALL
  SELECT '2025-09-10', 'C010', 160
), 

ntile_func AS (
  SELECT
    cust_id,
    total_purc,
    NTILE(4) OVER (ORDER BY total_purc DESC) AS quartile
  FROM sales
),

cum_rank_func AS(
  SELECT
    cust_id,
    total_purc,
    CUME_DIST() OVER(ORDER BY total_purc DESC) AS cum_dist,
    PERCENT_RANK() OVER(ORDER BY total_purc DESC) perc_rank
  FROM sales
),

runn_total AS (
  SELECT
    order_date,
    cust_id,
    total_purc,
    SUM(total_purc) OVER(ORDER BY order_date) AS running_total
  FROM sales
),

mov_avg AS (
  SELECT
    order_date,
    cust_id,
    total_purc,
    AVG(total_purc) OVER (
      ORDER BY order_date
      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_3day
  FROM sales
),

cohort AS (
  SELECT
    cust_id,
    DATE_TRUNC(DATE(order_date), MONTH) AS cohort_month,
  FROM sales
),

cohort_total AS(
  SELECT
    cohort_month,
    COUNT(DISTINCT cust_id) AS cohort_total_customer
  FROM cohort
  GROUP BY cohort_month
)

SELECT
  s.order_date,
  s.cust_id,
  s.total_purc,
  nf.quartile,
  crf.cum_dist,
  crf.perc_rank,
  rt.running_total,
  ma.moving_avg_3day,
  ch.cohort_total_customer
FROM sales s
JOIN ntile_func nf
  ON s.cust_id = nf.cust_id
JOIN cum_rank_func crf
  ON s.cust_id = crf.cust_id
JOIN runn_total rt
  ON s.cust_id = rt.cust_id AND s.order_date = rt.order_date
JOIN mov_avg ma
  ON s.cust_id = ma.cust_id AND s.order_date = ma.order_date
JOIN cohort c
  ON s.cust_id = c.cust_id
JOIN cohort_total ch
  ON c.cohort_month = ch.cohort_month
ORDER BY s.order_date;