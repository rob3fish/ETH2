SELECT
  {{ dbt_utils.star(from=ref('int_transactions_enriched'), except=['new_field'], quote_identifiers=False, prefix='stg_') }}
FROM {{ ref('int_transactions_enriched') }}