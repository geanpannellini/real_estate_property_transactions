{{
    config(
        alias='dim_locality'
    )
}}

WITH
dim_property_locality AS(
SELECT DISTINCT
    UPPER(locality) AS locality,
    'locality' AS id
FROM {{ ref('stg_real_estate_property_transactions_informations') }}
),

dim_rental_locality AS(
SELECT DISTINCT
    UPPER(region) AS locality,
    'locality' AS id
FROM {{ ref('stg_real_estate_rental_transactions_informations') }}
),

union_data_set AS(
SELECT locality FROM dim_property_locality UNION ALL
SELECT locality FROM dim_rental_locality
)

SELECT 
    locality,
    ROW_NUMBER() OVER() AS locality_key
FROM union_data_set