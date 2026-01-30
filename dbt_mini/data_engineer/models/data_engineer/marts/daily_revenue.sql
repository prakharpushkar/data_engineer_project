{{ config(materialized='table') }}

select
  order_date,
  coalesce(city, 'UNKNOWN')                       as city,
  count(distinct order_id)                        as orders_count,
  sum(case when is_refunded = false then coalesce(order_amount,0) else 0 end) as total_revenue,
  sum(case when is_refunded = true then 1 else 0 end)                        as refunded_count
from {{ ref('orders_joining') }}
where order_date is not null
group by 1,2
order by 1 desc, 2
