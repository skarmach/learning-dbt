with raw_address as (
    select * from {{ source('pagila', 'address') }}
),
raw_city as (
    select * from {{ source('pagila', 'city') }}
),
raw_country as (
    select * from {{ source('pagila', 'country') }}
)
select
    address_id,
    initcap(address) as address_line_1,
    initcap(address2) as address_line_2,
    district,
    initcap(raw_city.city) as city,
    initcap(raw_country.country) as country,
    postal_code,
    phone
from raw_address
left join raw_city on raw_address.city_id = raw_city.city_id
left join raw_country on raw_city.country_id = raw_country.country_id
