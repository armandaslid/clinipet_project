# CliniPet Project @ Masterschool

## **Tasks**:
### **Task 1.1: Clean data in registration form and create `registration_clean` table**  
  Write a query that will fix the problems in the columns in `healthtail_reg_cards`, in particular: 
  - Apply standardisation on column patient_name;
  - Remove non-numeric data from column owner_phone;
  - Replace missing values in column breed with “Unknown”.
### **Task 1.2: Creat `med_audit` table**  
  The new table, `med_audit`, should track the movement of medications in stock—indicating "in" when medications are purchased and "out" when 
  they are used in procedures. It should contain the following columns:
  month, med_name, total_packs, total_value, stock_movement.
### **Task 2: Answering Research Questions**  
1. What med did we spend the most money on in total?
2. What med had the highest monthly total_value spent on patients? At what month?
3. What month was the highest in packs of meds spent in vet clinic?
4. What’s an average monthly spent in packs of the med that generated the most revenue?
### **Task 3: Creating interactive report in Looker Studio**
  Key concerns that HealthTail managers would like addressed in the dashboard:
  - What are the most common diagnoses and diseases overall? How do they break down by pet type?
  - Which diseases are most prevalent among specific breeds?
  - Which diseases incur the highest spending, and how frequently do they appear in the data?
  - Are certain pet types (e.g., dogs, cats) more susceptible to specific diseases or associated with higher treatment costs?
  - How does age influence the prevalence of certain diseases?
  - How does spending on medications change over time?
  - Is there an increase in diagnoses of certain types over time?

Data provided by the client HealthTail: [healthtail_reg_cards.csv](https://github.com/armandaslid/clinipet_project/blob/main/project_files/healthtail_reg_cards.csv), [invoices.csv](https://github.com/armandaslid/clinipet_project/blob/main/project_files/invoices.csv), [visits.csv](https://github.com/armandaslid/clinipet_project/blob/main/project_files/visits.csv).


## *Results*:
- [SQL Code: Data Cleaning and Aggregation](https://github.com/armandaslid/clinipet_project/blob/main/project_files/step_1.sql)
- [SQL Code: Answering Research Questions](https://github.com/armandaslid/clinipet_project/blob/main/project_files/step_2.sql)
- [Looker Studio Report](404)
