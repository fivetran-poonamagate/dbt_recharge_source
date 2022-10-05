
with base as (
    select
        *
    from
        {{ ref('stg_recharge__charge_discount_code') }}
)

, fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_recharge__charge_discount_code')),
                staging_columns = get_charge_discount_code_columns()
            )
        }}
    from 
        base
)

, final as (
    select
        id as charge_id
        , index
        , discount_id
        , amount
        , cast(_fivetran_synced as {{ dbt_utils.type_timestamp() }}) as _fivetran_synced
    from
        fields
)

select
    *
from
    final