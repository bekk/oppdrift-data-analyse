{{
    config(partition_by={"field": "publiseringstidspunkt", "data_type": "datetime", "granularity": "day"})
}}

SELECT 
r.*,
s.navn
FROM {{ ref('reisetider_renset') }}  r
JOIN {{ source( 'oppgaver', 'strekninger_renset') }} s
ON strekningId = id