{{ config(materialized='view') }}

select
address,
block_number,
block_timestamp,
bytecode,
date,
last_modified
from {{ source('eth', 'contracts') }}

-- {% if target.name == 'dev' %}
-- where date_trunc('MONTH', date) = date_trunc('MONTH', DATEADD('MONTH', -1, current_date))
-- {% endif %}