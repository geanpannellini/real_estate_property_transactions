{{
    config(
        alias='fact_property_transactions'
    )
}}

SELECT
    CONCAT(CAST(ptr.date AS STRING), '_', ptr.locality, '_', CAST(ptr.sale_price AS STRING), '_', ptr.property) AS transaction_key,
    ptr.date,
    estimated_value AS estimated_value,
    sale_price AS sale_price,
    l.locality_key,
    p.property_key,
    r.residential_key,
    pc.property_char_key,
    ptx.property_tax_rate_key
FROM {{ ref('stg_real_estate_property_transactions_informations') }} AS ptr
JOIN {{ ref('dim_locality') }} AS l 
ON upper(ptr.locality) = upper(l.locality)
JOIN {{ ref('dim_property') }} AS p 
ON ptr.property = p.property
JOIN {{ ref('dim_residential') }} AS r 
ON ptr.residential = r.residential
JOIN {{ ref('dim_property_characteristics') }} AS pc 
ON (CONCAT(CAST(ptr.date AS STRING), '_', ptr.locality, '_', CAST(ptr.sale_price AS STRING), '_', ptr.property)) = pc.property_char_key
JOIN {{ ref('dim_property_tax_rate') }} AS ptx 
ON ptr.property_tax_rate = ptx.property_tax_rate