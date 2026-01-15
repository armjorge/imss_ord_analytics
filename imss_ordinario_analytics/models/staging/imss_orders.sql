SELECT DISTINCT
    contrato
    , orden
FROM
    {{ source('IMSS_LANDING', 'IMSS_ORDERS_LANDING') }}
