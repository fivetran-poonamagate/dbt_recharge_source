
with subscription as (
    select
        *
    from
        {{ source('recharge','subscription') }}
)

select
    id as subscription_id
    , customer_id
    , address_id
    , to_timestamp(created_at) as created_at
    , product_title
    , variant_title
    , sku
    , price
    , quantity
    , status
    , next_charge_scheduled_at
    , charge_interval_frequency
    , expire_after_specific_number_of_charges
    , number_charges_until_expiration
    , order_interval_frequency
    , order_interval_unit
    , to_timestamp(updated_at) as updated_at
    , shopify_product_id
    , shopify_variant_id
    , to_timestamp(cancelled_at) as cancelled_at
    , cancellation_reason
    , cancellation_reason_comments
from
    subscription