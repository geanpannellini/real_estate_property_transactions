{{
    config(
        alias='rental_all_listings'
    )
}}

SELECT
    fp.listing_id,
    dp.housing_type,
    l.locality,
    dp.price,
    dp.sqfeet
FROM
    {{ ref('fact_rental_listings') }} AS fp
LEFT JOIN
   {{ ref('dim_property_characteristics')}} AS dp
   ON fp.property_char_key = dp.property_char_key
LEFT JOIN
   {{ ref('dim_locality')}} AS l
   ON fp.locality_key = l.locality_key