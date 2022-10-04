
with product as (
    select
        *
    from
        {{ source('recharge','product') }}
)

select
    id as product_id
    , title as product_title
    , discount_amount
    , discount_type
    , handle
    , large_image
    , medium_image
    , original_image
    , small_image
    , subscription_defaults_charge_interval_frequency as charge_interval_frequency
    , subscription_defaults_cutoff_day_of_month as cutoff_day_of_month
    , subscription_defaults_cutoff_day_of_week as cutoff_day_of_week
    , subscription_defaults_expire_after_specific_number_of_charges as expire_after_specific_number_of_charges
    , subscription_defaults_modifiable_properties as modifiable_properties
    , subscription_defaults_number_charges_until_expiration as number_charges_until_expiration
    , subscription_defaults_order_day_of_month as order_day_of_month
    , subscription_defaults_order_day_of_week as order_day_of_week
    , subscription_defaults_order_interval_frequency_options as order_interval_frequency_options
    , subscription_defaults_order_interval_unit as order_interval_unit
    , subscription_defaults_storefront_purchase_options as storefront_purchase_options
    , collection_id
    , shopify_product_id
    , created_at
    , updated_at
    , is_deleted
from
    product