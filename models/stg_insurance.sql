{{ config(materialized='view') }}

with source as (
    select
        age,
        gender,
        bmi_value,
        children,
        smoker,
        region,
        charges
    from {{ source('healthcare', 'insurance_raw') }}
)

select * from source
