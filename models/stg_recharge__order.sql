
with order_cte as (
    select
        *
    from
        {{ source('recharge','order_temp') }}
)

select
    id as order_id
    , shopify_order_id
    , shopify_order_number
    , customer_id
    , first_name || ' ' || last_name as customer_full_name
    , email
    , to_timestamp(created_at) as order_created_at
    , status as order_status
    , to_timestamp(updated_at) as order_updated_at
    , charge_id
    , transaction_id
    , charge_status
    , is_prepaid
    , payment_processor
    , total_price
    , type as order_type
    , to_timestamp(processed_at) as order_processed_at
    , to_timestamp(scheduled_at) as order_scheduled_at
    , to_timestamp(shipped_date) as order_shipped_date
    , address_id
    , address_is_active
    , billing_address_first_name || ' ' || billing_address_last_name as billing_address_full_name
    , billing_address_address_1 as billing_address_line_1
    , billing_address_address_2 as billing_address_line_2
    , billing_address_city
    , billing_address_province
    , billing_address_country
    , billing_address_zip
    , billing_address_company
    , billing_address_phone
    , shipping_address_first_name || ' ' || shipping_address_last_name as shipping_address_full_name
    , shipping_address_address_1 as shipping_address_line_1
    , shipping_address_address_2 as shipping_address_line_2
    , shipping_address_city
    , shipping_address_province
    , shipping_address_country
    , shipping_address_zip
    , shipping_address_company
    , shipping_address_phone
from
    order_cte