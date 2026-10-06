with stg_store as (
    select * from "dbt_practice"."public"."stg_store"
)
select * from stg_store