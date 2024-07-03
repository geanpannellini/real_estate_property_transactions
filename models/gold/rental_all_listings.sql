{{
    config(
        alias='rental_all_listings'
    )
}}

SELECT
    fp.listing_id,
    dp.region,
    dp.price
FROM
    {{ ref('fact_rental_listings') }} AS fp
LEFT JOIN
   {{ ref('dim_property_characteristics')}} AS dp
   ON fp.property_char_key = dp.property_char_key