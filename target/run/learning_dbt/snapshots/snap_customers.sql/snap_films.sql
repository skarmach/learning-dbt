
      update "dbt_practice"."public"."snap_films"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "snap_films__dbt_tmp110252054504" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "dbt_practice"."public"."snap_films".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      
        and "dbt_practice"."public"."snap_films".dbt_valid_to is null;
      


    insert into "dbt_practice"."public"."snap_films" ("film_id", "title", "description", "release_year", "language_id", "original_language_id", "rental_duration", "rental_rate", "length", "replacement_cost", "rating", "last_update", "special_features", "fulltext", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."film_id",DBT_INTERNAL_SOURCE."title",DBT_INTERNAL_SOURCE."description",DBT_INTERNAL_SOURCE."release_year",DBT_INTERNAL_SOURCE."language_id",DBT_INTERNAL_SOURCE."original_language_id",DBT_INTERNAL_SOURCE."rental_duration",DBT_INTERNAL_SOURCE."rental_rate",DBT_INTERNAL_SOURCE."length",DBT_INTERNAL_SOURCE."replacement_cost",DBT_INTERNAL_SOURCE."rating",DBT_INTERNAL_SOURCE."last_update",DBT_INTERNAL_SOURCE."special_features",DBT_INTERNAL_SOURCE."fulltext",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "snap_films__dbt_tmp110252054504" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  