{{
    config(
        alias='dim_residential'
    )
}}

SELECT DISTINCT
    residential,
    ROW_NUMBER() OVER() AS residential_key
FROM {{ ref('stg_real_estate_property_transactions_informations') }}
