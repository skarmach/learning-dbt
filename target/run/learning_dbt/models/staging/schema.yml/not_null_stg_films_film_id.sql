
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from "dbt_practice"."public_dbt_test__audit"."not_null_stg_films_film_id"
    
      
    ) dbt_internal_test