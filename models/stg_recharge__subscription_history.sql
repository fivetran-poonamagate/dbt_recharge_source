
with base as (
    select
        *
    from
        {{ ref('stg_recharge__subscription_history_tmp') }}
)

, fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__subscription_history_tmp')),
                staging_columns = get_subscription_history_columns()
            )
        }}
    from 
        base
)

, final as (
    select
        subscription_id
        , customer_id
        , address_id
        , cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at
        , shopify_product_id
        , product_title
        , shopify_variant_id
        , variant_title
        , sku
        , price
        , quantity
        , status
        , property_charge_interval_unit_type as charge_interval_unit_type
        , charge_interval_frequency
        , order_interval_unit
        , order_interval_frequency
        , order_day_of_month
        , order_day_of_week
        , property_shipping_interval_unit_type as shipping_interval_unit_type
        , property_shipping_interval_frequency as shipping_interval_frequency
        , expire_after_sepcific_number_of_charges,
        , number_charges_until_expiration
        , cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at
        , cast(next_charge_scheduled_at as {{ dbt_utils.type_timestamp() }}) as next_charge_scheduled_at
        , cast(cancelled_at as {{ dbt_utils.type_timestamp() }}) as cancelled_at
        , cancellation_reason
        , cancellation_reason_comments
        , _fivetran_deleted
    from
fields
)

select
    *
from
    final