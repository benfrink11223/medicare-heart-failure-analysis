--Analyzes average Medicare inpatient charges for DRGs 291-293
--Uses CTE to make future queries easier
--Compares avg covered charges to avg total payments to get chargemaster ratio 
WITH heart_failure_by_state AS (
    SELECT 
        provider_state, drg_definition,
        SUM(total_discharges) AS total_patients,
        ROUND(AVG(average_covered_charges), 2) AS avg_billed,
        ROUND(AVG(average_total_payments), 2) AS avg_payment,
        ROUND(AVG(average_covered_charges) / AVG(average_total_payments), 2) AS chargemaster_ratio
      FROM `medicare_basic.inpatient_charges_2015`
    WHERE LOWER(drg_definition) LIKE '%heart failure%'
    GROUP BY provider_state, drg_definition
)
SELECT *
FROM heart_failure_by_state