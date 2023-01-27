SELECT s.strekning, t.* FROM {{ ref('strekning_trp') }} s
JOIN {{ source('oppgaver', 'timetrafikk') }} t ON t.trp_id = s.trp_id AND t.retning = s.retning
