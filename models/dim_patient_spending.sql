{{ config(materialized='table') }}

with base as (
    select *
    from {{ ref('stg_insurance') }}
),

transformed as (
    select
        gender,
        region,
        smoker,
        charges,
        case
            when charges < 5000 then 'Low'
            when charges between 5000 and 15000 then 'Medium'
            else 'High'
        end as spending_bracket
    from base
)

select * from transformed

