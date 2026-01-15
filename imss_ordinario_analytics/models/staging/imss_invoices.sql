SELECT
    folio
    , alta
    , file_timestamp
    , TRIM(REGEXP_REPLACE(REPLACE(referencia, ',', ''), '\\.[0-9]+', '')) AS referencia
    , TRIM(uuid) AS uuid
FROM
    {{ source('IMSS_LANDING', 'IMSS_INVOCES_LANDING') }}
QUALIFY
    ROW_NUMBER() OVER (
        PARTITION BY uuid
        ORDER BY file_timestamp DESC
    ) = 1
