with raw_category as (
    select * from "dbt_practice"."public"."category"
)
select category_id, name, last_update
from raw_category