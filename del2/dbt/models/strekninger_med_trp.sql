SELECT s.*, trp.id as trp_id, trp.name as trp_navn, trp.geography as trp_koordinater FROM {{ source('oppgaver', 'strekninger_renset') }} s
LEFT JOIN {{ source('oppgaver', 'trafikkregistreringspunkt') }} trp
# Regner med at punktet gjelder for strekningen dersom avstanden er mindre enn 20m
ON ST_DISTANCE(geography, koordinater) < 20