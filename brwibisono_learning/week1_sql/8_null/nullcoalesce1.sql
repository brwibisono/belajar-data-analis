SELECT
  u.id AS customer_id,
  u.gender,
  COALESCE(u.gender, 'Unknown') AS gender_fix
FROm brbelajardata.thelook_copy.users u
LIMIT 20;