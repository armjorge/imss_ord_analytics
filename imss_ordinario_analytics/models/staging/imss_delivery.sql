SELECT
    ranked_deliveries.noalta
    , ranked_deliveries.fechaaltatrunc
    , ranked_deliveries.nocontrato
    , ranked_deliveries.noorden
    , ranked_deliveries.clave
    , ranked_deliveries.cantrecibida
    , ranked_deliveries.importe
    , ranked_deliveries.descunidad
    , ranked_deliveries.file_timestamp AS fecha_corte
FROM (
    SELECT
        altas.*
        , ROW_NUMBER() OVER (
            PARTITION BY altas.noorden, altas.noalta
            ORDER BY altas.file_timestamp DESC
        ) AS rn
    FROM {{ source('IMSS_LANDING', 'IMSS_ALTAS_LANDING') }} AS altas
) AS ranked_deliveries

WHERE ranked_deliveries.rn = 1
