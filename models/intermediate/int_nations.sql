{{
    config(
        materialized= 'incremental',
        unique_key= 'nation_id'
        
    )
}}



with nations as (
    select nation_id,
    region_id,
    name,
    comment,
    loaded_time as created_date

    from {{ ref('stg_nations') }}
    {% if is_incremental()   %}
        where loaded_time> (select max(created_date) from {{this}})
    {% endif %}

)

select * from nations