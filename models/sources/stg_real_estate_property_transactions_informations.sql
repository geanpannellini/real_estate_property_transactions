{{
    config(
        alias='property_transactions_informations'
    )
}}

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
    face AS face

FROM {{ source('real_estate','property_transactions_informations') }} 