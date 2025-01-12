-- Cleaning the data (Task 1.1):

SELECT patient_id                                                                                   -- Leaving same columns + cleaned columns
       ,owner_id
       ,owner_name
       ,pet_type
       ,IFNULL(breed, 'Unknown') AS breed                                                           -- Changing NULL values with 'Unknown'
       ,CONCAT(UPPER(SUBSTR(patient_name, 1, 1)), LOWER(SUBSTR(patient_name, 2))) AS patient_name   -- Making pet names start with a capital letter
       ,gender
       ,patient_age
       ,date_registration
       ,REGEXP_REPLACE(owner_phone, r'[^0-9]', '') AS owner_phone                                   -- Cleaning phone numbers and leaving only digits
FROM `clinipet-project.clinipet_dataset.healthtail_reg_cards`
;

-- Aggregating the data (Task 1.2):

WITH medication_recieved_monthly AS                     -- Temporary table with aggregated packs and values in recieved medication (invoices table)
(
SELECT month_invoice AS month
       ,med_name
       ,ROUND(SUM(packs), 2) AS total_packs
       ,ROUND(SUM(total_price), 2) AS total_value
       ,"stock in" AS stock_movement
FROM `clinipet-project.clinipet_dataset.invoices`
GROUP BY 1, 2
),

medication_spent_monthly AS                            -- Temporary table with aggregated packs and values in spent medication (visits table)
(
SELECT DATE_TRUNC(visit_datetime, MONTH) AS month
       ,med_prescribed AS med_name
       ,ROUND(SUM(med_dosage), 2) AS total_packs
       ,ROUND(SUM(med_cost), 2) AS total_value
       ,"stock out" AS stock_movement
FROM `clinipet-project.clinipet_dataset.visits`
GROUP BY 1, 2
)

SELECT *                                               -- Merging both temporary tables to create main 'med_audit' table
FROM medication_recieved_monthly
UNION ALL
SELECT *
FROM medication_spent_monthly
;
