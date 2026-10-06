with stg_rentals as (
    select *
    from "dbt_practice"."public"."stg_rentals"
)
select *
from stg_rentals