SELECT
    {{ define_quarterly(date) }} AS quarter,
    count(transaction_key) AS total_transactions

FROM {{ ref('sales_all_contracts')}}
GROUP BY 1