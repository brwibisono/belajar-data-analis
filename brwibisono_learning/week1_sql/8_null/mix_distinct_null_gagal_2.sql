SELECT
  p.brand AS produk_brand,
    COALESCE(u.email, 'no_email@unknown.com') AS email_null,
  SUM(CASE WHEN u.email IS NULL THEN 1 ELSE 0 END) AS tanpa_email

FROM brbelajardata.thelook_copy.order_items oi
JOIN brbelajardata.thelook_copy.users u
  ON oi.user_id = u.id
JOIN brbelajardata.thelook_copy.products p
  ON oi.product_id = p.id
GROUP BY p.brand, email_null
ORDER BY p.brand
LIMIT 20;
