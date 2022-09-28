
with order_line_item as (
    select
        *
    from
        {{ source('recharge','order_line_item') }}
)

select
    order_id
    , index as order_line_item_index
    , subscription_id
    , shopify_product_id
    , product_title as product_title_1
    , title as product_title_2
    , variant_title product_variant_title
    , sku
    , quantity
    , grams
    , price
    , property_charge_interval_unit_type
    , property_charge_interval_frequency
    , property_shipping_interval_unit_type
    , property_shipping_interval_frequency
    , property_title
    , property_type
    , property_price
from
    order_line_item