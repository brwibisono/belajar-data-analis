WITH sample_data AS (
    SELECT '2025-01-01' AS tanggal, 'A' AS produk, 100 AS sales UNION ALL
    SELECT '2025-01-02', 'A', 200 UNION ALL
    SELECT '2025-01-03', 'A', 150 UNION ALL
    SELECT '2025-01-01', 'B', 300 UNION ALL
    SELECT '2025-01-02', 'B', 200 UNION ALL
    SELECT '2025-01-03', 'B', 400
),
calc AS (
  SELECT
    tanggal,
    produk,
    sales,
    SUM(sales) OVER(PARTITION BY produk ORDER BY tanggal) AS total_penjualan_produk,
    AVG(sales) OVER(PARTITION BY produk ORDER BY tanggal) AS rata2_kumulatif,
    MAX(sales) OVER(PARTITION BY produk ORDER BY tanggal) AS max_sales
  FROM sample_data
)

SELECT
  tanggal,
  produk,
  sales,
  total_penjualan_produk,
  rata2_kumulatif,
  max_sales,
  sales - rata2_kumulatif AS selisih_sales_max
FROM calc;