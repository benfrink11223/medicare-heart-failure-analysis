--Focused on looking at heart related DRGs
SELECT DISTINCT drg_definition
FROM `medicare_basic.inpatient_charges_2015`
WHERE LOWER(drg_definition) LIKE '%heart%'
   OR LOWER(drg_definition) LIKE '%card%'
   OR LOWER(drg_definition) LIKE '%coronary%'
ORDER BY drg_definition