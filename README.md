# Medicare Heart Failure Cost Analysis (2015)

## Overview
This project analyzes Medicare inpatient charge data to examine 
how heart failure hospitalization costs vary across U.S. states, 
and whether high hospital billing correlates with high actual costs.

## Data Source
CMS Medicare Inpatient Charges 2015, accessed via BigQuery public 
dataset (medicare_basic.inpatient_charges_2015). Analysis focused 
on DRGs 291-293 (Heart Failure & Shock across severity levels).

## Tools Used
- BigQuery (SQL analysis)
- Google Sheets (visualization)

## Key Findings
- New Jersey had the highest chargemaster ratio at 7.27, meaning 
  hospitals billed over 7x what Medicare actually paid
- Maryland was a outlier with a ratio near 1.0
- High billing charges showed low correlation with high actual 
  payments 
- Alaska and Hawaii had the highest actual payments, reflecting 
  genuine cost-of-care differences rather than billing inflation

## File Structure
/queries
  - exploration.sql        -- Initial data preview
  - drg_exploration.sql    -- Identifying heart failure DRG codes
  - drg.sql                -- Cost breakdown by state and DRG severity
  - nodrg.sql              -- State breakdown with rankings
  - nodrg_high_inflation.sql    -- Filtered to high inflation states only
  - nodrg_inflation_tiered.sql  -- CASE WHEN billing tier classification
/visuals
  - medicare_chart.png              -- Scatter plot of billed vs paid by state

## SQL Concepts Demonstrated
- Aggregations (AVG, SUM, ROUND)
- GROUP BY and ORDER BY
- Window functions RANK() OVER
- Common Table Expressions (CTEs)
- CASE WHEN classification
- LIKE filtering with LOWER()
