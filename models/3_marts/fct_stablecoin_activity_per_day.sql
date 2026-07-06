{{ config(tags = ['daily']) }}

select
t.date,
t.token_address,
s.type,
s.symbol,
{{ conversion('t.value', 's.decimals') }} as total_usd_value
from {{ ref('stg_token_transfers') }} t
left join {{ ref('stablecoins') }} s
    on t.token_address = s.contract_address
--where lower(token_address) in ('0xdac17f958d2ee523a2206206994597c13d831ec7', '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48')
where s.contract_address is not null
group by 1,2,3,4