SELECT u.gender,
  COALESCE(u.gender, 'Unknown') AS gender_baru
FROM brbelajardata.thelook_copy.users u
LIMIT 10;