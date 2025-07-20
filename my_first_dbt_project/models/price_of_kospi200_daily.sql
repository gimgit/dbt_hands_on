select 
    t1.target_index_name,
    t1.ticker,
    t1.name,
    t1.date_kst,
    cast(t2.open as integer) as open,
    t2.high,
    t2.low,
    t2.close,
    t2.volume
from {{ ref('kospi200_consitituents_daily') }} as t1
left join {{ ref('price_daily_merged') }} as t2 
    on t1.ticker = t2.ticker 
    and t1.date_kst = t2.date_kst

