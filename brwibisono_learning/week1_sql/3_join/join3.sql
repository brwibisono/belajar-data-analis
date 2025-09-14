SELECT 
  o.order_id,
  c.customer_name,
  o.product
 FROM brbelajardata.basicsql.orders o
 RIGHT JOIN brbelajardata.basicsql.customers c
   ON o.customer_id = c.customer_id