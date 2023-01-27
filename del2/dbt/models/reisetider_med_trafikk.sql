SELECT r.*, t.tidspunkt, t.trafikk FROM {{ ref('reisetider_time') }} r
JOIN {{ ref('timetrafikk_strekning') }} t
ON t.strekning = r.navn AND r.time = DATETIME(t.tidspunkt, "Europe/Oslo")