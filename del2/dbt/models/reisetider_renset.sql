
{{
    config(materialized='table', partition_by={"field": "<navn_på_partisjonseringsfelt>", "data_type": "datetime", "granularity": "day"})
}}