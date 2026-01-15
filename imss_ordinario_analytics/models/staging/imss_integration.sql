SELECT
    altas.*
    , facturas.folio
    , facturas.uuid
    , prei.contra_recibo
    , prei.estado_c_r
FROM
    {{ ref('imss_delivery') }} AS altas
LEFT JOIN {{ ref('imss_invoices') }} AS facturas ON altas.noalta = facturas.alta AND altas.noorden = facturas.referencia
LEFT JOIN {{ ref('imss_prei') }} AS prei ON facturas.uuid = prei.folio_fiscal
