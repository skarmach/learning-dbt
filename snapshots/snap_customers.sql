{% snapshot snap_films %}
{{
    config(
        target_schema='public',
        unique_key='film_id',
        strategy='check',
        check_cols=['title', 'description', 'release_year', 'language_id', 'rental_duration', 'rental_rate', 'length', 'replacement_cost', 'rating', 'special_features'],
    )
}}
select * from {{ source('pagila', 'film') }}
{% endsnapshot %}
