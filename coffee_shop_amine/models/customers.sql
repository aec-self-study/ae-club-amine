{{ config(
    materialized='table'
 ) }}

select o.customer_id, c.name, c.email, MIN(o.created_at) AS first_order_at, COUNT(o.id) AS number_of_orders
from `analytics-engineers-club.coffee_shop.customers` c
left join `analytics-engineers-club.coffee_shop.orders` o on c.id = o.customer_id
GROUP BY o.customer_id, c.name, c.email 
order by first_order_at
