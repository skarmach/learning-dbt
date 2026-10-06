with stg_rentals as (
    select *
    from {{ ref('stg_rentals') }}
)
select *
from stg_rentals
