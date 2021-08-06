with dbt_test as (

    select
        client_user_id as client_id
        calculation_type as type
        created_at as date

    from {{ source('money_check', 'sub_calculations') }}

),


final as (

    select
        dbt_test.client_id,
        dbt_test.type,
        dbt_test.date

    from dbt_test
)

select * from final
