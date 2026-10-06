
      insert into "dbt_practice"."public"."dim_stores" ("store_id", "manager_staff_id", "address_id", "last_update")
    (
        select "store_id", "manager_staff_id", "address_id", "last_update"
        from "dim_stores__dbt_tmp152533003409"
    )


  