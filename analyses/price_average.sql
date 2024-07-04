SELECT
    locality,
    housing_type,
    AVG(price) AS avg_rent

FROM {{ ref('rental_all_listings')}}
GROUP BY 1,2