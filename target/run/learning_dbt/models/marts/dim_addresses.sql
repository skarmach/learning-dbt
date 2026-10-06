
      insert into "dbt_practice"."public"."dim_addresses" ("address_id", "address", "address_line_2", "district", "city", "country", "postal_code")
    (
        select "address_id", "address", "address_line_2", "district", "city", "country", "postal_code"
        from "dim_addresses__dbt_tmp152532090963"
    )


  