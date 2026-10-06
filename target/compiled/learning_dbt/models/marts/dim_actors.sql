with stg_actors as (
    select *
    from "dbt_practice"."public"."stg_actor"
)
select actor_id,
    first_name,
    last_name
from stg_actors