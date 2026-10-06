
      
        
        
        delete from "dbt_practice"."public"."dim_customers" as DBT_INTERNAL_DEST
        where (customer_pk) in (
            select distinct customer_pk
            from "dim_customers__dbt_tmp152529619865" as DBT_INTERNAL_SOURCE
        );

    

    insert into "dbt_practice"."public"."dim_customers" ("customer_pk", "customer_id", "first_name", "last_name", "email", "customer_since_date", "is_active", "address_id", "store_id", "uuid", "valid_from", "valid_to")
    (
        select "customer_pk", "customer_id", "first_name", "last_name", "email", "customer_since_date", "is_active", "address_id", "store_id", "uuid", "valid_from", "valid_to"
        from "dim_customers__dbt_tmp152529619865"
    )
  