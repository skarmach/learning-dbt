{{
    config(
        materialized='incremental',
        unique_key='customer_pk'
    )
}}
select dbt_scd_id as customer_pk,
    customer_id,
    initcap(first_name) as first_name,
    initcap(last_name) as last_name,
    email,
    create_date as customer_since_date,
    activebool as is_active,
    address_id,
    store_id,
    uuid,
    dbt_valid_from as valid_from,
    coalesce(dbt_valid_to, '9999-12-31'::timestamp) as valid_to
from {{ ref('snap_customers') }}

{% if is_incremental() %}
where dbt_updated_at > (select max(valid_from) from {{ this }})
{% endif %}
