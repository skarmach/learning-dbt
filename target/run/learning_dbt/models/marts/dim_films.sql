
  
    

  create  table "dbt_practice"."public"."dim_films__dbt_tmp"
  
  
    as
  
  (
    
with language as (
    select * from "dbt_practice"."public"."language"
),
film_category as (
    select * from "dbt_practice"."public"."film_category"
),
category as (
    select * from "dbt_practice"."public"."category"
),
aggregated_category as (
    select
        film.film_id,
        jsonb_agg(category.name) as categories
    from film
    left join film_category on film.film_id = film_category.film_id
    left join category on film_category.category_id = category.category_id
    group by film.film_id
)
select film.dbt_scd_id as film_pk,
    film.film_id,
    initcap(film.title) as title,
    film.description,
    film.release_year,
    language.name as language,
    film.rental_duration,
    film.rental_rate,
    film.length as duration_in_minutes,
    case
        when film.length < 60 then 'Short'
        when film.length >= 60 and film.length < 120 then 'Medium'
        else 'Long'
    end as duration_category,
    film.replacement_cost,
    film.rating,
    film.special_features,
    film.fulltext,
    coalesce(aggregated_category.categories, '[]'::jsonb) as categories,
    film.dbt_valid_from as valid_from,
    coalesce(film.dbt_valid_to, '9999-12-31'::timestamp) as valid_to
from "dbt_practice"."public"."snap_films" as film
left join language on film.language_id = language.language_id
left join aggregated_category on film.film_id = aggregated_category.film_id


  );
  