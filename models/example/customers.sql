{{ config(
    materialized='table',
    partition_by={
      "field": "order_date",
      "data_type": "timestamp"
    }
)}}

-- with customers as (

--     select * from {{ ref('stg_customers') }}

-- ),

with orders as (

    select * from {{ ref('stg_orders') }}

),

customer_orders as (

    select
        count(distinct order_id) as count_orders,
        count(distinct customer_id) as users,
        order_date

    from orders

    group by 3

)


-- final as (

--     select
--         customers.customer_id,
--         customers.first_name,
--         customers.last_name,
--         customer_orders.first_order_date,
--         customer_orders.most_recent_order_date,
--         coalesce(customer_orders.number_of_orders, 0) as number_of_orders

--     from customers

--     left join customer_orders using (customer_id)

-- )

select * from customer_orders