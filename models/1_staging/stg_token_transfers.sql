{{ config(materialized='view') }}

select
transaction_hash,
date,
token_address,
value
from {{ source('eth','token_transfers' )}}

-- {% if target.name == 'dev' %}
-- where date_trunc('MONTH', date) = date_trunc('MONTH', DATEADD('MONTH', -1, current_date))
-- {% endif %}