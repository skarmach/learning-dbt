with film as (
    select * from "dbt_practice"."public"."film"
),
language as (
    select * from "dbt_practice"."public"."language"
),
film_category as (
    select * from "dbt_practice"."public"."film_category"
),
category as (
    select * from "dbt_practice"."public"."category"
)
select film.film_id,
    initcap(film.title) as title,
    film.description,
    film.release_year,
    language.name as language,
    film.rental_duration,
    film.rental_rate,
    film.length duration_in_minutes,
    case
        when film.length < 60 then 'Short'
        when film.length >= 60 and film.length < 120 then 'Medium'
        else 'Long'
    end as duration_category,
    film.replacement_cost,
    film.rating,
    film.special_features,
    film.fulltext,
    category.name as category
from film
left join language on film.language_id = language.language_id
left join film_category on film.film_id = film_category.film_id
left join category on film_category.category_id = category.category_id