{% macro sqlserver__limit_zero() %}
  {{ return('where 0=1') }} 
{% endmacro %}

{% macro synapse__limit_zero() %}
  {{ return( tsql_utils_dbt_utils_integration_tests.sqlserver__limit_zero() ) }} 
{% endmacro %}