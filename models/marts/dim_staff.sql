with stg_staff as (
    select * from {{ ref('stg_staff') }}
)
select * from stg_staff
