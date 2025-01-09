/*
Question #1:
What med did we spend the most money on in total?
*/
-- Q1 solution:

SELECT med_name
       ,SUM(total_value) AS total_spent
FROM `clinipet-project.clinipet_dataset.med_audit`
WHERE stock_movement = "stock in"
GROUP BY 1
ORDER BY 2 DESC
;

/*
Question #2:
What med had the highest monthly total_value spent on patients? At what month?
*/
-- Q2 solution:

SELECT med_name
       ,month
       ,SUM(total_value) AS total_spent
FROM `clinipet-project.clinipet_dataset.med_audit`
WHERE stock_movement = "stock out"
GROUP BY 1, 2
ORDER BY 3 DESC
;

/*
Question #3:
What month was the highest in packs of meds spent in vet clinic?
*/
-- Q3 solution:

SELECT month
       ,ROUND(SUM(total_packs), 2) AS packs_spent
FROM `clinipet-project.clinipet_dataset.med_audit`
WHERE stock_movement = "stock out"
GROUP BY 1
ORDER BY 2 DESC
;

/*
Question #4:
What’s an average monthly spent in packs of the med that generated the most revenue? 
*/
-- Q4 solution:

SELECT ROUND(AVG(total_packs), 2) AS avg_packs_spent
FROM `clinipet-project.clinipet_dataset.med_audit`
WHERE stock_movement = "stock out"
AND med_name = (SELECT med_name
                FROM `clinipet-project.clinipet_dataset.med_audit`
                WHERE stock_movement = "stock out"
                GROUP BY 1
                ORDER BY SUM(total_value) DESC
                LIMIT 1)
;
