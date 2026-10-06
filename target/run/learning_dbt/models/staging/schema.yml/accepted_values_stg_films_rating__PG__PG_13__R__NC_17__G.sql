
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from "dbt_practice"."public_dbt_test__audit"."accepted_values_stg_films_rating__PG__PG_13__R__NC_17__G"
    
      
    ) dbt_internal_test