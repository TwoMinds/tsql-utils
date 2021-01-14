{% macro sqlserver__safe_cast(field, type) %}
    try_cast({{field}} as {{type}})
{% endmacro %}

{% macro synapse__safe_cast(field, type) %}
    {% do return( tsql_utils.sqlserver__safe_cast(field, type)) %}
{% endmacro %}
