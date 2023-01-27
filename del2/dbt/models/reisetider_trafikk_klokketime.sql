WITH med_amerikansk_ukedag AS (
  SELECT *, EXTRACT(HOUR from time) klokketime, EXTRACT(DAYOFWEEK from time) AS amerikansk_ukedag FROM {{ref('reisetider_med_trafikk') }}
),
med_norsk_ukedag AS (
SELECT *, 
MOD(amerikansk_ukedag+5, 7)+1 AS ukedag,
IF(amerikansk_ukedag=1, 7, amerikansk_ukedag-1) AS ukedag2
 FROM med_amerikansk_ukedag
)

SELECT navn, ukedag, klokketime, AVG(reisetidGjennomsnitt) reisetidGjennomsnitt, AVG(trafikk) trafikkGjennomsnitt FROM med_norsk_ukedag GROUP BY ukedag, klokketime, navn