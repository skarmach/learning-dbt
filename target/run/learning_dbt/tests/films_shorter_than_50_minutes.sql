
    
    select
      count(*) as failures,
      count(*) >0 as should_warn,
      count(*) >50 as should_error
    from (
      
        select *
        from "dbt_practice"."public_dbt_test__audit"."films_shorter_than_50_minutes"
    
      
    ) dbt_internal_test