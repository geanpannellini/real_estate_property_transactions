{% macro define_monthly(date) %}
    EXTRACT(MONTH FROM CAST(date AS TIMESTAMP)) 
{% endmacro %}

{% macro define_quarterly(date) %}
    CASE 
        WHEN EXTRACT(MONTH FROM CAST(date AS TIMESTAMP)) BETWEEN 1 AND 3 THEN 1
        WHEN EXTRACT(MONTH FROM CAST(date AS TIMESTAMP)) BETWEEN 4 AND 6 THEN 2
        WHEN EXTRACT(MONTH FROM CAST(date AS TIMESTAMP)) BETWEEN 7 AND 9 THEN 3
        ELSE 4
    END
{% endmacro %}

{% macro define_semiannually(date) %}
    CASE 
        WHEN EXTRACT(MONTH FROM CAST(date AS TIMESTAMP)) BETWEEN 1 AND 6 THEN 1
        ELSE 2
    END
{% endmacro %}