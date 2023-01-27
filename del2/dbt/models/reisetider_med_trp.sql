SELECT r.*, s.trp_id FROM {{ ref('reisetider_med_navn') }} r
JOIN {{ ref('strekninger_med_trp')}} s
ON strekningId = id