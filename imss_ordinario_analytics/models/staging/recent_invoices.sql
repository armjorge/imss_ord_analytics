select 
    folio,
    TRIM(REGEXP_REPLACE(REPLACE(referencia, ',', ''), '\\.[0-9]+', '')) as referencia,
    alta,
    TRIM(uuid) as UUID,
    file_timestamp
from 
    {{source('IMSS_LANDING', 'IMSS_INVOCES_LANDING')}}
qualify 
    row_number() over (
        partition by folio, uuid 
        order by file_timestamp desc
    ) = 1
