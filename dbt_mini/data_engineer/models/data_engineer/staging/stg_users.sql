{{ config(materialized='view') }}

select
    cast(user_id as integer)          as user_id,
    try_cast(signup_date as date)     as signup_date,
    lower(trim(city))                 as city
from {{ ref('users') }}
where user_id is not null
