{% test assert_value_amount_is_positive(model, column_name, field) %}

SELECT {{ field }}
, SUM( {{ column_name }} ) AS total_amount
FROM {{ model }}
GROUP BY 1
HAVING total_amount < 0

{% endtest %}
