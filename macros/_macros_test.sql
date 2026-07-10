{% macro log_message(message_text) %}
    {{ log(message_text, info=true) }}
{% endmacro %}

{% macro log_token_count() %}
    {% set token_count_query %}
        SELECT COUNT(DISTINCT token_address) AS token_count
        FROM {{ ref('stg_token_transfers') }}
    {% endset %}
    {{ log("query count: " ~ token_count_query, info=true) }}

    {% if execute %}
        {% set result = run_query(token_count_query) %}
        {{ log("result count: " ~ result.columns[0][0], info=true) }}
    {% endif %}
{% endmacro %}

{% macro log_token_list() %}
    {% set token_list_query %}
        SELECT DISTINCT token_address AS token_list
        FROM {{ ref('stg_token_transfers') }}
        LIMIT 10
    {% endset %}
    {{ log("query list: " ~ token_list_query, info=true) }}

    {% if execute %}
        {% set result = run_query(token_list_query) %}
        {% set result_list = result.columns[0].values() %}
        {{ log("result list: " ~ result_list, info=true) }}

        {% set result_array = [] %}
        {% for i in result_list %}
            {% do result_array.append(i)%}
        {% endfor %}
        {{ log("result array: " ~ result_array, info=True)}}

        {% set result_array = [] %}
        {% for i in result_list %}
            {% do result_array.append("'" ~ i ~ "'")%}
        {% endfor %}
        {{ log("result array join: ())" ~ result_array | join(', ') ~ ")", info=True)}}
        
        {{ return(result_list) }}
    {% endif %}
{% endmacro %}

