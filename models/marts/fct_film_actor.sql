with stg_film_actor as (
    select *
    from {{ ref('stg_film_actor') }}
)
select *
from stg_film_actor
