{{ config(
    severity = 'error',
    warn_if = '>0',
    error_if = '>50'
) }}

select *
from {{ ref('stg_films') }}
where duration_in_minutes < 50
