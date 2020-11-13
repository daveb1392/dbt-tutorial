{{ config(
    materialized='table'
)}}


select
    id as order_id,
    user_id as customer_id,
    TIMESTAMP(order_date) as order_date,
    status

from `dbt-tutorial`.jaffle_shop.orders
