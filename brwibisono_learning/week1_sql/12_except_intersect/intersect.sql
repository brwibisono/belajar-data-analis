SELECT
  u.email,
  CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
FROM brbelajardata.thelook_copy.users u
WHERE gender = 'M'

INTERSECT DISTINCT

SELECT
  u.email,
  CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
FROM brbelajardata.thelook_copy.users u
WHERE gender = 'F'
