SELECT
  u.id, 
  CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
  u.gender
FROM brbelajardata.thelook_copy.users u
WHERE u.gender = 'M'

UNION ALL

SELECT 
  u.id, 
  CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
  u.gender
FROM brbelajardata.thelook_copy.users u
WHERE u.gender = 'F'
LIMIT 20;