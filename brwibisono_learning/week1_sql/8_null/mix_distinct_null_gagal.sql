WITH cleaned_orders AS (
  SELECT
    oi.product_id,
    oi.user_id,
    COALESCE(u.email, 'no_email@unknown.com') AS email_fix
  FROM brbelajardata.thelook_copy.order_items oi
  JOIN brbelajardata.thelook_copy.users u
    ON oi.user_id = u.id
)

SELECT
  p.brand AS produk_brand,
  c.email_fix,
  SUM(CASE WHEN c.email_fix = 'no_email@unknown.com' THEN 1 ELSE 0 END) AS tanpa_email
FROM cleaned_orders c
LEFT JOIN brbelajardata.thelook_copy.products p
  ON c.product_id = p.id
GROUP BY p.brand, c.email_fix
ORDER BY p.brand
LIMIT 20;