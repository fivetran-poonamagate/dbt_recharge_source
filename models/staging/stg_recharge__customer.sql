
with customer as (
    select
        *
    from
        {{ source('recharge','customer') }}
)

select
    id as customer_id
    , hash
    , shopify_customer_id
    , email
    , first_name || ' ' || last_name as customer_full_name
    , to_timestamp(created_at) as created_at
    , status as customer_status
    , to_timestamp(updated_at) as updated_at
    , to_timestamp(first_charge_processed_at) as first_charge_processed_at
    , number_active_subscriptions as active_subscriptions
    , number_subscriptions as total_subscriptions
    , billing_first_name || ' ' || billing_last_name as customer_billing_full_name
    , billing_company
    , billing_address_1 as billing_address_line_1
    , billing_address_2 as billing_address_line_2
    , billing_zip
    , billing_city
    , billing_province
    , billing_country
    , billing_phone
    , processor_type
    , has_valid_payment_method
    , reason_payment_method_not_valid
    , has_card_error_in_dunning
from
    customer