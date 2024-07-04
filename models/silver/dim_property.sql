{{
    config(
        alias='dim_property'
    )
}}

SELECT DISTINCT
    property,
    ROW_NUMBER() OVER() AS property_key
FROM {{ ref('stg_real_estate_property_transactions_informations') }}
