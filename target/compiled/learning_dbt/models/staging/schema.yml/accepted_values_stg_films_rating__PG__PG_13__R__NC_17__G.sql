
    
    

with all_values as (

    select
        rating as value_field,
        count(*) as n_records

    from "dbt_practice"."public"."stg_films"
    group by rating

)

select *
from all_values
where value_field not in (
    'PG','PG-13','R','NC-17','G'
)


