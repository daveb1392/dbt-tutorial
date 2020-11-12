{% macro test(col1, col2, perc, amount) %}
  CASE WHEN {{ col1 }} > ({{ col2 }}*{{ perc }}) and {{ col1 }} > {{ amount }} THEN 
    "true"
  ELSE "false"
  end
{% endmacro %}