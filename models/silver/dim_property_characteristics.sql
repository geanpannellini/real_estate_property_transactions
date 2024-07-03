{{
    config(
        alias='dim_property_characteristics'
    )
}}

WITH
dim_property_characteristics AS(
SELECT DISTINCT 

    CONCAT(CAST(date AS STRING), '_', locality, '_', CAST(sale_price AS STRING), '_', property) AS property_char_key,
    number_of_rooms,
    number_of_bathrooms,
    carpet_area,
    face,
    CAST(null AS string) AS region,
    CAST(null AS string) AS region_url,
    CAST(null AS INTEGER) AS price,
    CAST(null AS string) AS housing_type,
    CAST(null AS INTEGER) AS sqfeet,
    CAST(null AS INTEGER) AS beds,
    CAST(null AS INTEGER) AS baths,
    CAST(null AS INTEGER) AS cats_allowed,
    CAST(null AS INTEGER) AS dogs_allowed,
    CAST(null AS INTEGER) AS smoking_allowed,
    CAST(null AS INTEGER) AS wheelchair_access,
    CAST(null AS INTEGER) AS electric_vehicle_charge,
    CAST(null AS INTEGER) AS comes_furnished,
    CAST(null AS string) AS laundry_options,
    CAST(null AS string) AS parking_options,
    CAST(null AS string) AS image_url,
    CAST(null AS string) AS description,
    CAST(null AS string) AS state
FROM {{ ref('stg_real_estate_property_transactions_informations') }}
),

dim_rental_characteristics AS(
SELECT DISTINCT
    CAST(listing_id AS STRING) AS property_char_key,
    null AS number_of_rooms,
    null AS number_of_bathrooms,
    null AS carpet_area,
    CAST(null AS string) AS face,
    region,
    region_url,
    price,
    housing_type,
    sqfeet,
    beds,
    baths,
    cats_allowed,
    dogs_allowed,
    smoking_allowed,
    wheelchair_access,
    electric_vehicle_charge,
    comes_furnished,
    laundry_options,
    parking_options,
    image_url,
    description,
    state
FROM {{ ref('stg_real_estate_rental_transactions_informations') }}
)

SELECT * FROM dim_property_characteristics UNION ALL 
SELECT * FROM dim_rental_characteristics