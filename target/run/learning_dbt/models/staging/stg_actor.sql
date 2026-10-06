
  create view "dbt_practice"."public"."stg_actor__dbt_tmp"
    
    
  as (
    with raw_actor as (
    select * from "dbt_practice"."public"."actor"
)

select
    actor_id,
    initcap(first_name) as first_name,
    initcap(last_name) as last_name,
    last_update
from raw_actor
  );