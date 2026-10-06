
  create view "dbt_practice"."public"."stg_film_actor__dbt_tmp"
    
    
  as (
    with raw_film_actor as (
    select *
    from "dbt_practice"."public"."film_actor"
)
select film_id, actor_id
from raw_film_actor
  );