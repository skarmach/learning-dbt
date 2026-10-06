
  create view "dbt_practice"."public"."stg_language__dbt_tmp"
    
    
  as (
    with language as (
    select * from "dbt_practice"."public"."language"
)
select * from language
  );