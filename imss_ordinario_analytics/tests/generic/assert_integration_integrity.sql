-- This test checks for any fan-out in the integration model
WITH integrity_check AS (
    SELECT 
        noalta,
        noorden,
        uuid,
        COUNT(*) as row_multiplicity
    FROM {{ ref('imss_integration') }}
    GROUP BY 1, 2, 3
)

SELECT * FROM integrity_check 
WHERE row_multiplicity > 1