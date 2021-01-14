{% macro sqlserver__hash(field) %}
    convert(varchar(50), hashbytes('md5', {{field}}), 2)
{% endmacro %}


{#
    Imagine an adapter plugin, dbt-synapse, that inherits from dbt-sqlserver.
    For the time being, we need to explicitly reimplement sqlserver__ macros
    as synapse__ macros.
    
    TODO: We can make a small change to dbt-core (https://github.com/fishtown-analytics/dbt/issues/2923)
    that will make the inheritance of dispatched macros work just like the 
    inheritance of other adapter objects, and render the following code redundant.
#}
{% macro synapse__hash(field) %}
    {% do return( tsql_utils.sqlserver__hash(field)) %}
{% endmacro %}