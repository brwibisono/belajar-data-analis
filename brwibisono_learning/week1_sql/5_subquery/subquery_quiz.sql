SELECT 
  nama_produk,
  ROUND(total_revenue, 2) AS total_revenue,

  (SELECT ROUND(AVG(total_revenue), 2) FROM(
    SELECT SUM(oi.sale_price) AS total_revenue
    FROM brbelajardata.thelook_copy.order_items oi
    JOIN brbelajardata.thelook_copy.orders o
      ON oi.user_id = o.user_id
    WHERE o.status = 'Complete'
    GROUP BY oi.product_id
  )) AS rata2_revenue,

  ROUND(total_revenue - (
      SELECT AVG(total_revenue) FROM (
        SELECT SUM(oi.sale_price) AS total_revenue
        FROM brbelajardata.thelook_copy.order_items oi
        JOIN brbelajardata.thelook_copy.orders o 
          ON oi.order_id = o.order_id
        WHERE o.status = 'Complete'
        GROUP BY oi.product_id
      )
  ), 2) AS selisih_revenue

FROM (
  SELECT
    p.name AS nama_produk,
    SUM(oi.sale_price) AS total_revenue
  FROM `brbelajardata.thelook_copy.order_items` oi
JOIN brbelajardata.thelook_copy.orders o
  ON oi.user_id = o.user_id
JOIN brbelajardata.thelook_copy.products p
  ON oi.product_id = p.id
    WHERE o.status = 'Complete'
    GROUP BY p.name
) t

WHERE total_revenue > (
  SELECT AVG(total_revenue) FROM (
      SELECT SUM(oi.sale_price) AS total_revenue
      FROM brbelajardata.thelook_copy.order_items oi
      JOIN brbelajardata.thelook_copy.orders o
        ON oi.order_id = o.order_id
      WHERE o.status = 'Complete'
      GROUP BY oi.product_id
  )
)
ORDER BY total_revenue DESC
LIMIT 10;