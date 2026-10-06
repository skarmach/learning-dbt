{{
    config(
        materialized='incremental',
        unique_key='film_pk',
        on_schema_change='sync_all_columns'
    )
}}
with language as (
    select * from {{ source('pagila', 'language') }}
),
film_category as (
    select * from {{ source('pagila', 'film_category') }}
),
category as (
    select * from {{ source('pagila', 'category') }}
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
from {{ ref('snap_films') }} as film
left join language on film.language_id = language.language_id
left join aggregated_category on film.film_id = aggregated_category.film_id

{% if is_incremental() %}
where film.dbt_updated_at > (select max(valid_from) from {{ this }})
{% endif %}
