{{
    config(
        alias='property_transactions_informations',
        materialized='incremental',
        partition_by={
            "field": "date",
            "data_type": "date"
        },
        unique_key='primary_id'
    )
}}

with source_data as (
    SELECT 
        date AS date,
        year AS year,
        locality AS locality,
        `Estimated Value` AS estimated_value,
        `Sale Price` AS sale_price,
        property AS property,
        residential AS residential,
        num_rooms AS number_of_rooms,
        num_bathrooms AS number_of_bathrooms,
        carpet_area AS carpet_area,
        property_tax_rate AS property_tax_rate,
        face AS face,
        CONCAT(CAST(date AS STRING), '_', locality, '_', CAST(`Sale Price` AS STRING), '_', property) AS primary_id 
    FROM {{ source('real_estate','property_transactions_informations') }}
)

SELECT * FROM source_data

{% if is_incremental() %}
WHERE date > (SELECT max(date) FROM {{ this }})
{% endif %}