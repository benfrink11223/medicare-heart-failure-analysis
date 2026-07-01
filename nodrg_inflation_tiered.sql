--Analyzes Medicare inpatient charges with rankings and chargemaster inflation tier
WITH heart_failure_by_state AS (
    SELECT 
        provider_state,
        SUM(total_discharges) AS total_patients,
        ROUND(AVG(average_covered_charges), 2) AS avg_billed,
        ROUND(AVG(average_total_payments), 2) AS avg_payment,
        ROUND(AVG(average_covered_charges) / AVG(average_total_payments), 2) AS chargemaster_ratio,
        RANK() OVER (ORDER BY AVG(average_covered_charges) DESC) AS billed_rank,
        RANK() OVER (ORDER BY AVG(average_total_payments) DESC) AS payment_rank
    FROM `medicare_basic.inpatient_charges_2015`
    WHERE LOWER(drg_definition) LIKE '%heart failure%'
    GROUP BY provider_state
)
SELECT *, 
CASE WHEN chargemaster_ratio <= 2 THEN 'Low'
WHEN chargemaster_ratio > 2 AND chargemaster_ratio <= 4 THEN 'Moderate'
WHEN chargemaster_ratio > 4 THEN 'High' END AS inflation
FROM heart_failure_by_state
