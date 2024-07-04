{{
    config(
        alias='rental_transactions_informations',
        materialized='incremental',
        unique_key='listing_id'
    )
}}

SELECT 
    id AS listing_id,
    url AS url,
    region AS region,
    region_url AS region_url,
    price AS price,
    type AS housing_type,
    sqfeet AS sqfeet,
    beds AS beds,
    baths AS baths,
    cats_allowed AS cats_allowed,
    dogs_allowed AS dogs_allowed,
    smoking_allowed AS smoking_allowed,
    wheelchair_access AS wheelchair_access,
    electric_vehicle_charge AS electric_vehicle_charge,
    comes_furnished AS comes_furnished,
    laundry_options AS laundry_options,
    parking_options AS parking_options,
    image_url AS image_url,
    description AS description,
    lat AS lat,
    long AS long,
    state AS state

FROM {{ source('real_estate','rental_transactions_informations') }} 