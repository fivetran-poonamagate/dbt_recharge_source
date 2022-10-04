
{% macro get_product_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "title", "datatype": dbt_utils.type_string()},
    {"name": "discount_amount", "datatype": dbt_utils.type_float()},
    {"name": "discount_type", "datatype": dbt_utils.type_float()},
    {"name": "handle", "datatype": dbt_utils.type_string()},
    {"name": "large_image", "datatype": dbt_utils.type_string()},
    {"name": "medium_image", "datatype": dbt_utils.type_string()},
    {"name": "original_image", "datatype": dbt_utils.type_string()},
    {"name": "small_image", "datatype": dbt_utils.type_string()},
    {"name": "subscription_defaults_charge_interval_frequency", "datatype": dbt_utils.type_int()},
    {"name": "subscription_defaults_cutoff_day_of_month", "datatype": dbt_utils.type_string()},
    {"name": "subscription_defaults_cutoff_day_of_week", "datatype": dbt_utils.type_string()},
    {"name": "subscription_defaults_expire_after_specific_number_of_charges", "datatype": dbt_utils.type_string()},
    {"name": "subscription_defaults_modifiable_properties", "datatype": dbt_utils.type_string()},
    {"name": "subscription_defaults_number_charges_until_expiration", "datatype": dbt_utils.type_int()},
    {"name": "subscription_defaults_order_day_of_month", "datatype": dbt_utils.type_string()},
    {"name": "subscription_defaults_order_day_of_week", "datatype": dbt_utils.type_string()},
    {"name": "subscription_defaults_order_interval_frequency_options", "datatype": dbt_utils.type_string()},
    {"name": "subscription_defaults_order_interval_unit", "datatype": dbt_utils.type_string()},
    {"name": "subscription_defaults_storefront_purchase_options", "datatype": dbt_utils.type_string()},
    {"name": "collection_id", "datatype": dbt_utils.type_int()},
    {"name": "shopify_product_id", "datatype": dbt_utils.type_int()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "is_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}