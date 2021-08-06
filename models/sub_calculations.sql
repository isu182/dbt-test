with dbt_test as (

    select
        client_user_id as c_id
        calculation_type as c_type
        created_at as c_date

    from {{ source('money_check', 'sub_calculations') }}

),


final as (

    select
        dbt_test.c_id,
        dbt_test.c_type,
        dbt_test.c_date

    from dbt_test
)

select * from final
