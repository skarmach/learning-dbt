with raw_store as (
    select * from {{ source('pagila', 'store') }}
)
select * from raw_store
