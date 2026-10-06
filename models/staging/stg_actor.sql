with raw_actor as (
    select * from {{ source('pagila', 'actor') }}
)

select
    actor_id,
    initcap(first_name) as first_name,
    initcap(last_name) as last_name,
    last_update
from raw_actor
