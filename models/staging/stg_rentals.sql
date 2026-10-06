with raw_rentals as (
    select *
    from {{ source('pagila', 'rental') }}
),
raw_customers as (
    select *
    from {{ source('pagila', 'customer') }}
),
raw_inventory as (
    select *
    from {{ source('pagila', 'inventory') }}
),
raw_films as (
    select *
    from {{ source('pagila', 'film') }}
),
raw_stores as (
    select *
    from {{ source('pagila', 'store') }}
)
select
    raw_rentals.rental_id,
    raw_rentals.rental_date,
    raw_films.film_id,
    raw_stores.store_id,
    raw_rentals.customer_id,
    raw_rentals.staff_id,
    raw_rentals.return_date
from raw_rentals
left join raw_customers on raw_rentals.customer_id = raw_customers.customer_id
left join raw_inventory on raw_rentals.inventory_id = raw_inventory.inventory_id
left join raw_films on raw_inventory.film_id = raw_films.film_id
left join raw_stores on raw_inventory.store_id = raw_stores.store_id
