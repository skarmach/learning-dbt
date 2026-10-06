with raw_staff as (
    select *
    from {{ source('pagila', 'staff') }}
)
select
    staff_id,
    initcap(first_name) as first_name,
    initcap(last_name) as last_name,
    email,
    address_id,
    store_id,
    active as is_active,
    username,
    password
from raw_staff
