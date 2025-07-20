{% test price_range_generic(model, column_name, min_price, max_price) %}

with validation as (
    select *
    from {{ model }}
    where 
        {{ column_name }} < {{ min_price }} 
        or {{ column_name }} > {{ max_price }}
)

select *
from validation

{% endtest %} 