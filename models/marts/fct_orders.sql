with 

payments as (
select * from {{ref('stg_payment')}}
),
orders as (
  select * from {{ ref('stg_orders') }}
),

order_payments as (

    select
        order_id,
        sum(amount) as amount

    from payments

    group by 1

),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        coalesce(order_payments.amount, 0) as amount

    from orders

    left join order_payments using (order_id)

)

select * from final