
{{
    config(partition_by={"field": "publiseringstidspunkt", "data_type": "datetime", "granularity": "day"})
}}

# Din SQL her

SELECT * EXCEPT(publiseringstidspunkt, version),
  DATETIME(publiseringstidspunkt, "Europe/Oslo") as publiseringstidspunkt 
  FROM {{ source('oppgaver', 'reisetider') }}
  WHERE version = "2"
  AND (reisetidVarighetSekunder is null or reisetidVarighetSekunder / reisetidFriFlytVarighetSekunder < 70 )
  AND publiseringstidspunkt >= "2022-01-01"