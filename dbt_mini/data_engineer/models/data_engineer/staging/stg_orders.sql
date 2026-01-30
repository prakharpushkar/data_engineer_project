{{ config(materialized='view') }}

select
  cast(order_id as integer)                        as order_id,
  cast(user_id  as integer)                        as user_id,
  try_cast(order_date as date)                     as order_date,
  cast(amount as double)                           as amount,
  lower(trim(status))                              as status,
  case when lower(trim(status)) in ('refunded') 
  then true 
  else false 
  end as is_refunded
from {{ ref('orders') }}
where order_id is not null