SELECT *
FROM (
    SELECT
        prei.*
        , ROW_NUMBER() OVER (
            PARTITION BY prei.folio_fiscal
            ORDER BY prei.file_timestamp DESC
        ) AS rn
    FROM {{ source('IMSS_LANDING', 'IMSS_PREI_LANDING') }} AS prei
) AS ranked_deliveries

WHERE rn = 1
