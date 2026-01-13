SELECT 
    altas.*,
    facturas.folio, 
    facturas.uuid
FROM
    {{ref('imss_delivery')}} altas
LEFT JOIN {{ref('recent_invoices')}} facturas ON altas.noalta = facturas.alta and altas.noorden = facturas.REFERENCIA 
