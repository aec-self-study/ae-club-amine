-- models/monthly_users.sql
 select
  date_trunc(first_order_at, month) AS date_order,
  count(*) AS records
 
from {{ ref('customers') }}
 
group by 1