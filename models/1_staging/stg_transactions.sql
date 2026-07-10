select
hash,
block_number,
date,
from_address,
to_address,
value,
receipt_contract_address,
input
from {{ source('eth', 'transactions') }}

-- {% if target.name == 'dev' %}
-- where date_trunc('MONTH', date) = date_trunc('MONTH', DATEADD('MONTH', -1, current_date))
-- {% endif %}