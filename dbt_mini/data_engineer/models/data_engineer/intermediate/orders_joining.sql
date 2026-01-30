{{ config(materialized='view') }}

with o as ( select * from {{ ref('stg_orders') }} ),
     u as ( select * from {{ ref('stg_users') }} ),
     p as ( select * from {{ ref('stg_payments') }} )

select
  o.order_id,
  o.user_id,
  u.city,
  o.order_date,
  o.amount                 as order_amount,
  o.status                 as order_status,
  o.is_refunded,
  p.payment_id,
  p.payment_method,
  p.payment_status
from o
left join u on o.user_id = u.user_id
left join p on o.order_id = p.order_id
