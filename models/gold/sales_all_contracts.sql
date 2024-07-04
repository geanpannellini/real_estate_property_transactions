{{
    config(
        alias='sales_all_contracts'
    )
}}

SELECT
    fp.transaction_key,
    fp.date,
    dp.property,
    fp.sale_price
FROM
    {{ ref('fact_property_transactions') }} AS fp
LEFT JOIN
   {{ ref('dim_property')}} AS dp
   ON fp.property_key = dp.property_key
