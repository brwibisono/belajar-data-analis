SELECT
  u.id AS customer_id,
  u.gender,
  NULLIF(u.gender, 'F') AS gender_mungkin_null,
  COALESCE(NULLIF(u.gender, 'F'), 'Unknown') AS gender_fix
FROM brbelajardata.thelook_copy.users u
LIMIT 20;