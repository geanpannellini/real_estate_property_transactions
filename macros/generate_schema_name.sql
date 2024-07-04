{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    {% set config_meta = node.config.get('meta') %}

    {% if config_meta and config_meta is mapping %}
        {% if target.name == 'prod' %}
            {% set schema_name = config_meta.get('schema_name') %}
            {% if schema_name and schema_name is string %}
                {{ return(schema_name) }}
            {% endif %}
        {% elif target.name == 'dev' %}
            {% set schema_name = config_meta.get('schema_name') %}
            {% if schema_name and schema_name is string %}
                {{ return(schema_name) }}
            {% endif %}
        {%- else -%}
            {% set schema_name = config_meta.get('schema_name') + '_' + target.name %}
            {% if schema_name and schema_name is string %}
                {{ return(schema_name) }}
            {% endif %}
        {% endif %}
    {%- else -%}
        {{ generate_schema_name_for_env(custom_schema_name, node) }}
    {%- endif -%}
{%- endmacro %}