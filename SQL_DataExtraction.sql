/*
Objectives
Come up with flu shots dashboard for 2022 that does the following

1.) Total % of patients getting flu shots stratified by
    a.) Age
    b.) Race
    c.) County (On a Map)
    d.) Overall

2.) Running Total of Flu Shots (Seasonal Flu Vaccine - Code 5302) over the course of 2022
3.) Total number of Flu shots given in 2022
4.) A list of Patients that show whether or not they received the flu shots


Consideration: Patient that are 6 months and older can receive the flu shot


Requirements:

Patients must have been "Active at our hospital". This will be determined by 2 conditions:
1)They should be alive
2)The patients have not moved away or stopped seeing us in the hospital or outpatient clinics in the past 2-3 years (If patient has 
had an encounter in the last 3 years (from 2020), then we can consider them active, else we won't)
*/


/*
Fetch the list of active patients
*/
with active_patients as
(
select distinct patient 
from encounters as e
join patients as p
on e.patient = p.id
where start between '2020-01-01 00:00' and '2022-12-31 23:59'     --Patients have an encounter in last 3 years 
and p.deathdate is null											   --Patients are alive
and extract(month from age('2022-12-31', p.birthdate)) >= 6       --Patients are atleast 6 months old         
),


/*
Fetch the patients that have taken the flushot vaccine in 2022
*/
flu_shot_2022 as 
(
select patient, min(date) as earliest_flu_shot_date
from immunizations
where code = '5302'
and   date between '2022-01-01 00:00' and '2022-12-31 23:59'
group by patient
)

/*
Fetch all the required details that would be helpful to create dashboard in Tableau as per requirements
*/
select p.id,
	   p.birthdate,
	   p.first,
	   p.last,
	   p.race,
	   p.county,
	   f.earliest_flu_shot_date,
	   f.patient,
	   case when f.patient is not null then 1
	   else 0
	   end as flu_shot_2022
from patients as p
left join flu_shot_2022 as f
on p.id = f.patient
where p.id in (select patient from active_patients)
