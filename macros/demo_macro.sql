{% macro money() -%}
::decimal(16,4)
{%- endmacro %}

{% macro dol_eur(colm, deci) -%}
    round( 0.93 * {{ colm }}, {{ deci }})
{%- endmacro %}

{% macro dol_ind(colm, deci) -%}
    round( 85 * {{ colm }}, {{ deci }})
{%- endmacro %}