with stg_actors as (
    select *
    from {{ ref('stg_actor') }}
)
select actor_id,
    first_name,
    last_name
from stg_actors
