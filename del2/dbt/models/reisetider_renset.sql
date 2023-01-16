
{{
    config(materialized='table', partition_by={"field": "<navn_på_partisjoneringsfelt>"})
}}

# Din SQL her