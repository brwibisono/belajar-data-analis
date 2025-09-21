WITH rangked_product AS (
    SELECT
      p.category,
      p.name,
      SUM(oi.sale_price) AS total_sales,
      RANK() OVER (
          PARTITION BY p.category
          ORDER BY SUM(oi.sale_price) DESC
      ) AS rank_in_category
    FROM brbelajardata.thelook_copy.order_items oi
    JOIN brbelajardata.thelook_copy.products p
      ON oi.product_id = p.id
    GROUP BY p.category, p.name
)
SELECT *
FROM rangked_product
WHERE rank_in_category <= 3
ORDER BY category, rank_in_category;