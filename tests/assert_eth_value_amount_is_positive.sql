SELECT SUM(value) AS total_amount
FROM {{ ref('int_transactions_enriched') }}
HAVING total_amount < 0