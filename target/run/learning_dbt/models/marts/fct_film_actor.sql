
      insert into "dbt_practice"."public"."fct_film_actor" ("film_id", "actor_id")
    (
        select "film_id", "actor_id"
        from "fct_film_actor__dbt_tmp152532354596"
    )


  