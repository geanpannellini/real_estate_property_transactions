{{
    config(
        alias='dim_property_tax_rate'
    )
}}

SELECT DISTINCT
    property_tax_rate,
    ROW_NUMBER() OVER() AS property_tax_rate_key
FROM {{ ref('stg_real_estate_property_transactions_informations') }}
