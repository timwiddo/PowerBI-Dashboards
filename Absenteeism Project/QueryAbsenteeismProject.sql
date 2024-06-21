-- Query used to retrieve the important Data from the Database

USE AbsenteeismProject;

SELECT 
    a.ID,
    r.Reason,
    Body_mass_index AS BMI,
    CASE 
        WHEN Body_mass_index < 18.5 THEN 'underweight'
        WHEN Body_mass_index BETWEEN 18.5 AND 25 THEN 'healthy weight'
        WHEN Body_mass_index BETWEEN 25 and 30 THEN 'overweight'
        WHEN Body_mass_index > 30 THEN 'obese'
        ELSE 'unknown'
    END AS BMI_category,
    CASE 
        WHEN Month_of_absence IN (12,1,2) THEN 'winter'
        WHEN Month_of_absence IN (3,4,5) THEN 'spring'
        WHEN Month_of_absence IN (6,7,8) THEN 'summer'
        WHEN Month_of_absence IN (9,10,11) THEN 'autumn'
        ELSE 'unknown'
    END AS season_names,
    Seasons,
    Month_of_absence,
    Day_of_the_week,
    Transportation_expense,
    Education,
    Son,
    Social_drinker,
    Social_smoker,
    Pet,
    Disciplinary_failure,
    Age,
    Work_load_Average_day,
    Absenteeism_time_in_hours
FROM 
    Absenteeism_at_work a
LEFT JOIN 
    compensation c ON a.ID = c.ID
LEFT JOIN 
    Reasons r ON a.Reason_for_absence = r.Number;
