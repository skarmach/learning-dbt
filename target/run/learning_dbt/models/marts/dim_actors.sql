
      insert into "dbt_practice"."public"."dim_actors" ("actor_id", "first_name", "last_name")
    (
        select "actor_id", "first_name", "last_name"
        from "dim_actors__dbt_tmp152531899460"
    )


  