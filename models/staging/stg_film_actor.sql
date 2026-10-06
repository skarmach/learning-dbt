with raw_film_actor as (
    select *
    from {{ source('pagila', 'film_actor') }}
)
select film_id, actor_id
from raw_film_actor
