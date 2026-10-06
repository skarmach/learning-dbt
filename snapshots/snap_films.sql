{% snapshot snap_customers %}
{{
    config(
        target_schema='public',
        unique_key='customer_id',
        strategy='check',
        check_cols=['store_id', 'first_name', 'last_name', 'email', 'address_id', 'activebool'],
    )
}}
select * from {{ source('pagila', 'customer') }}
{% endsnapshot %}
