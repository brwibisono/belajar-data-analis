WITH sales_data AS (
  SELECT
    DATE(o.created_at) AS tanggal,
    o.created_at,
    p.category,
    oi.sale_price
  FROM brbelajardata.thelook_copy.orders o
  JOIN brbelajardata.thelook_copy.order_items oi
    ON o.order_id = oi.order_id
  JOIN brbelajardata.thelook_copy.products p
    ON oi.product_id = p.id
  WHERE o.created_at BETWEEN '2022-01-01' AND '2022-03-31'
)

SELECT
  category,
  ROUND(sale_price, 2) AS sale_price,
  ROUND(SUM(sale_price) OVER(PARTITION BY category ORDER BY tanggal), 2) AS kumulatif_penjualan,
  ROUND(AVG(sale_price) OVER(PARTITION BY category ORDER BY tanggal), 2) AS rata2_kumulatif,
  ROUND(sale_price - AVG(sale_price) OVER(PARTITION BY category ORDER BY tanggal), 2) AS selisih_vs_avg
FROM sales_data
QUALIFY ROW_NUMBER() OVER(PARTITION BY category ORDER BY tanggal DESC) = 1
ORDER BY category;