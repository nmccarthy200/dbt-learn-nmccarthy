with customers as (
 select * from {{ ref('stg_customers') }}
),
orders as (
  select * from {{ ref('stg_orders') }}
),
payment as (
    select * from {{ ref('stg_payment') }}
),
final as (
    select
    order_id,
    order_date,
    customer_id,
    amount
    from customers
    inner join orders using(customer_ID)
    inner join payment using(order_id)
)
select * from final 