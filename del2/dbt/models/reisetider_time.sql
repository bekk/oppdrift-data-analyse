WITH reisetider_med_time AS (
    SELECT *, DATETIME_TRUNC(publiseringstidspunkt, HOUR) AS time FROM {{ ref('reisetider_med_navn') }}
)
SELECT time, strekningId, navn, AVG(reisetidVarighetSekunder) AS reisetidGjennomsnitt, COUNT(*) AS antallFemMinutt FROM reisetider_med_time GROUP BY time, strekningId, navn
HAVING COUNT(*) >= 10