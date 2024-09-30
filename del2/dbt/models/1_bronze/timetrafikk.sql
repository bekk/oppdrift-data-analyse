
{{
    config(
      materialized = 'table'
    )
}}

SELECT * FROM {{ source('oppgaver', 'timetrafikk') }}