with language as (
    select * from {{ source('pagila', 'language') }}
)
select * from language
