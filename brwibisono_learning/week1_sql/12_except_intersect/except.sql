SELECT
  u.id,
  CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
  u.gender
FROM brbelajardata.thelook_copy.users u
WHERE gender = 'M'

EXCEPT DISTINCT

SELECT
  u.id,
  CONCAT(u.first_name, ' ', u.last_name) AS nama_customer,
  u.gender
FROM brbelajardata.thelook_copy.users u
WHERE gender = 'F';
