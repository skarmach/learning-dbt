
  create view "dbt_practice"."public"."stg_customer__dbt_tmp"
    
    
  as (
    with raw_customers as (
    select *
    from "dbt_practice"."public"."customer"
)
select customer_id,
    initcap(first_name) as first_name,
    initcap(last_name) as last_name,
    email,
    create_date as customer_since_date,
    activebool as is_active,
    address_id,
    store_id
from raw_customers
  );