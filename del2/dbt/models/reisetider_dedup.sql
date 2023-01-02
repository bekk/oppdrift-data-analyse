
{{ config(materialized='view') }}

SELECT * FROM {{ source('raw', 'reisetider') }}
QUALIFY ROW_NUMBER() OVER (
    PARTITION BY publiseringstidspunkt, strekningId, strekningVersjon
    ORDER BY datexVersjon DESC, publiseringstidspunkt DESC
    ) =1
