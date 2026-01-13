select 
    distinct contrato, orden
from 
    {{source('IMSS_LANDING', 'IMSS_ORDERS_LANDING')}}
