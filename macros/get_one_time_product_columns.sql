
{% macro get_one_time_product_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "address_id", "datatype": dbt_utils.type_int()},
    {"name": "customer_id", "datatype": dbt_utils.type_int()},
    {"name": "is_deleted", "datatype": "boolean"},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "next_charge_scheduled_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "product_title", "datatype": dbt_utils.type_string()},
    {"name": "variant_title", "datatype": dbt_utils.type_string()},
    {"name": "price", "datatype": dbt_utils.type_int()},
    {"name": "quantity", "datatype": dbt_utils.type_int()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "shopify_variant_id", "datatype": dbt_utils.type_int()},
    {"name": "recharge_product_id", "datatype": dbt_utils.type_int()},
    {"name": "sku", "datatype": dbt_utils.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}