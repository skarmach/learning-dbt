with stg_store as (
    select * from {{ ref('stg_store') }}
)
select * from stg_store
