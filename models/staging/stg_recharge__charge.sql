
with charge as (
    select
        *
    from
        {{ source('recharge','charge') }}
)

select
    id as charge_id
    , customer_id
    , customer_hash
    , first_name || ' ' || last_name as customer_full_name
    , email
    , to_timestamp(created_at) as created_at
    , type as charge_type
    , status as charge_status
    , to_timestamp(updated_at) as updated_at
    , note
    , subtotal_price
    , tax_lines
    , total_discounts
    , total_line_items_price
    , total_tax
    , total_price
    , total_refunds
    , total_weight
    , to_timestamp(scheduled_at) as scheduled_at
    , to_timestamp(processed_at) as processed_at
    , processor_name
    , transaction_id
    , shopify_order_id
    , shipments_count
    , has_uncommited_changes
    , to_timestamp(last_charge_attempt_date) as last_charge_attempt_date
    , to_timestamp(retry_date) as retry_date
    , error_type
    , number_times_tried as times_retried
    , address_id
    , billing_address_first_name || ' ' || billing_address_last_name as billing_address_full_name
    , billing_address_address_1 as billing_address_line_1
    , billing_address_address_2 as billing_address_line_2
    , billing_address_city
    , billing_address_province
    , billing_address_zip
    , billing_address_country
    , billing_address_company
    , billing_address_phone
    , shipping_address_first_name || ' ' || shipping_address_last_name as shipping_address_full_name
    , shipping_address_address_1 as shipping_address_line_1
    , shipping_address_address_2 as shipping_address_line_2
    , shipping_address_city
    , shipping_address_province
    , shipping_address_zip
    , shipping_address_country
    , shipping_address_company
    , shipping_address_phone
    , client_details_browser_ip
    , client_details_user_agent
from
    charge