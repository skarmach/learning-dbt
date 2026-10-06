
      insert into "dbt_practice"."public"."dim_staff" ("staff_id", "first_name", "last_name", "email", "address_id", "store_id", "is_active", "username", "password")
    (
        select "staff_id", "first_name", "last_name", "email", "address_id", "store_id", "is_active", "username", "password"
        from "dim_staff__dbt_tmp152532742163"
    )


  