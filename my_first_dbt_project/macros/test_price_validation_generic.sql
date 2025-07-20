{% test price_validation_generic(model, column_name, where) %}

with validation as (
    select *
    from {{ model }}
    {% if where %}
    where {{ where }}
    {% endif %}
)

select *
from validation

{% endtest %}