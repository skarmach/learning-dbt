
  create view "dbt_practice"."public"."stg_store__dbt_tmp"
    
    
  as (
    with raw_store as (
    select * from "dbt_practice"."public"."store"
)
select * from raw_store
  );