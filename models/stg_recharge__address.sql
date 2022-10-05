
with base as (
    select
        *
    from
        {{ ref('stg_recharge__address_tmp') }}
)

, fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__address_tmp')),
                staging_columns = get_address_columns()
            )
        }}
    from 
        base
)

, final as (
select
    id as address_id
    , customer_id
    , first_name || ' ' || last_name as customer_full_name
    , address_1
    , address_2
    , city
    , province
    , zip
    , country
    , company
    , phone
    , cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at
    , cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at
    , _fivetran_deleted
    , cart_attribute_elevar_visitor_info as customer_visitor_info
    , cast(_fivetran_synced as {{ dbt_utils.type_timestamp() }}) as _fivetran_synced
from
    fields
)

select
    *
from
    final