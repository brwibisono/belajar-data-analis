WITH revenue_per_produk AS (
  SELECT
    p.id AS produk_id,
    p.name AS nama_produk,
    p.category AS kategori_produk,
    SUM(oi.sale_price) AS total_revenue
    FROM brbelajardata.thelook_copy.order_items oi
    JOIN brbelajardata.thelook_copy.products p
      ON oi.product_id = p.id
    JOIN brbelajardata.thelook_copy.orders o 
      ON oi.order_id = o.order_id
    WHERE o.status = 'Complete'
    GROUP BY p.id, p.name, p.category
),

revenue_per_kategori AS (
  SELECT
    p.category AS kategori_produk,
    SUM(oi.sale_price) AS total_revenue_kategori
    FROM brbelajardata.thelook_copy.order_items oi
    JOIN brbelajardata.thelook_copy.products p
      ON oi.product_id = p.id
    JOIN brbelajardata.thelook_copy.orders o
      ON oi.order_id = o.order_id
    WHERE o.status = 'Complete'
    GROUP BY p.category
),

avg_revenue AS (
  SELECT AVG(total_revenue) AS rata2_revenue
  FROM revenue_per_produk
)

SELECT
  r.nama_produk,
  r.kategori_produk,
  ROUND(r.total_revenue, 2) AS total_revenue,
  ROUND(c.total_revenue_kategori,2) AS total_revenue_kategori,
  ROUND(a.rata2_revenue, 2) AS rata2_revenue
FROM revenue_per_produk r
JOIN revenue_per_kategori c
  ON r.kategori_produk = c.kategori_produk
CROSS JOIN avg_revenue a
ORDER BY r.total_revenue DESC
LIMIT 10;