SELECT
 o.created_at,
 DATE_DIFF(CURRENT_DATE(), DATE(o.created_at), DAY) AS hari_sejak_order
FROM brbelajardata.thelook_copy.orders o
ORDER BY hari_sejak_order DESC
LIMIT 10;