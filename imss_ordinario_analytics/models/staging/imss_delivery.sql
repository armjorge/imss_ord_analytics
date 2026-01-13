select 
    DISTINCT noorden, noalta
from 
    {{source('IMSS_LANDING', 'IMSS_ALTAS_LANDING')}}
