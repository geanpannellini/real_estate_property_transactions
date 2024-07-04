{{
    config(
        alias='fact_rental_listings'
    )
}}

SELECT
        ptr.listing_id,
        l.locality_key,
        pc.property_char_key

FROM {{ ref('stg_real_estate_rental_transactions_informations') }} AS ptr
JOIN {{ ref('dim_property_characteristics') }} AS pc 
ON CAST(ptr.listing_id AS string) = pc.property_char_key
JOIN {{ ref('dim_locality') }} AS l 
ON upper(ptr.region) = upper(l.locality)