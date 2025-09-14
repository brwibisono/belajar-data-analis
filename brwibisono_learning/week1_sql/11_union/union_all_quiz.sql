SELECT *
FROM (
  SELECT
         u.id AS user_id,
         CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
         u.gender,
         o.created_at AS tanggal_order
  FROM brbelajardata.thelook_copy.orders o
  JOIN brbelajardata.thelook_copy.users u
    ON o.user_id = u.id
  WHERE u.gender = 'M'
  ORDER BY o.created_at DESC
  LIMIT 5
)

UNION ALL

SELECT *
FROM (
  SELECT
         u.id AS user_id,
         CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
         u.gender,
         o.created_at AS tanggal_order
  FROM brbelajardata.thelook_copy.orders o
  JOIN brbelajardata.thelook_copy.users u
    ON o.user_id = u.id
  WHERE u.gender = 'F'
  ORDER BY o.created_at DESC
  LIMIT 5
);