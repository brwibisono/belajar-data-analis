SELECT
  o.user_id,
  o.order_id,
  o.created_at,
  ROW_NUMBER() OVER ( --ROW_NUMBER() nomor unik(1,2,3..) untuk setiap order si customer itu
      PARTITION BY o.user_id --bagi per customer
      ORDER BY o.created_at --kasih nomor sesuai urutan waktu
  ) AS order_number
FROM brbelajardata.thelook_copy.orders o
LIMIT 20;