select *
from {{ ref('fct_stablecoin_activity_per_day', v=2)}}
where type = 'fiat-backed'