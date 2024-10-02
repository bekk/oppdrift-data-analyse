
{{
    config(
      materialized = 'view'
    )
}}

SELECT * FROM {{ source('oppgaver', 'timetrafikk') }}