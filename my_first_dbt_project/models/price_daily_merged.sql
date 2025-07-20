{{ 
    config(
        materialized='table',
        tags=['price', 'merged'],
        owner='dpe',
        meta={
            'maturity': 'develop'
        }
    ) 
}}

with _source_a as (
    select * from {{ source('main', 'price_daily1') }}  
),

_source_b as (
    select * from {{ source('main', 'price_daily2') }}
),

_merged as (
    select * from _source_a
    union all
    select * from _source_b
)

select 
    ticker,
    date_kst,
    median(open) as open,
    median(high) as high,
    median(low) as low,
    median(close) as close,
    median(volume) as volume
from _merged
where volume > 0
group by 1, 2