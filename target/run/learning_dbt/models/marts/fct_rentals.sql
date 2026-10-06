
      insert into "dbt_practice"."public"."fct_rentals" ("rental_id", "rental_date", "film_id", "store_id", "customer_id", "staff_id", "return_date")
    (
        select "rental_id", "rental_date", "film_id", "store_id", "customer_id", "staff_id", "return_date"
        from "fct_rentals__dbt_tmp152532544953"
    )


  