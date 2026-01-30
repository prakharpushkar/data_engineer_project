{{ config(materialized='view') }}

select
  cast(payment_id as integer)                      as payment_id,
  cast(order_id as integer)                        as order_id,
  lower(trim(payment_method))                      as payment_method,
  lower(trim(payment_status))                      as payment_status
from {{ ref('payments') }}
where payment_id is not null
