WITH
-- Customer Agustus
aug AS (
  SELECT DISTINCT o.user_id AS uid
  FROM brbelajardata.thelook_copy.orders o
  WHERE EXTRACT(MONTH FROM o.created_at) = 8
),
-- Customer September
sep AS (
  SELECT DISTINCT o.user_id AS uid
  FROM brbelajardata.thelook_copy.orders o
  WHERE EXTRACT(MONTH FROM o.created_at) = 9
),
-- Customer Loyal
loyal AS (
  SELECT uid
  FROM aug
  INTERSECT DISTINCT
  SELECT uid
  FROM sep
),
-- Customer Baru
baru AS (
  SELECT uid
  FROM sep
  EXCEPT DISTINCT
  SELECT uid
  FROM aug
),
-- Customer Hilang
hilang AS (
  SELECT uid
  FROM aug
  EXCEPT DISTINCT
  SELECT uid
  FROM sep
)

SELECT
  (SELECT COUNT(*) FROM loyal) AS customer_loyal,
  (SELECT COUNT(*) FROM baru) AS customer_baru,
  (SELECT COUNT(*) FROM hilang) AS customer_hilang


