with stg_addresses as (
    select *
    from {{ ref('stg_address') }}
)
select address_id,
    address_line_1 as address,
    address_line_2 as address_line_2,
    district,
    city as city,
    country as country,
    postal_code as postal_code
from stg_addresses
