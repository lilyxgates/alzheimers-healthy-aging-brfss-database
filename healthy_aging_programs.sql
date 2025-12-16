/* VIEW 1 */
# View 1: View all of the distinct questions asked, regions studied, and the corresponding demographics asked
# Contains: JOIN
USE puebla;
DROP VIEW IF EXISTS all_ques_and_demog;

CREATE VIEW all_ques_and_demog AS

	SELECT DISTINCT year, loc_desc, q_cat, q_topic, question, demog_cat, demog_spec
	FROM data d
	JOIN year_loc yl
		ON d.year_loc_id_FK = yl.year_loc_id_PK
	JOIN year y
		ON yl.year_id_FK = y.year_id_PK
	JOIN location l
		ON yl.loc_id_FK = l.loc_id_PK
	JOIN questions q
		ON d.q_id_FK = q.q_id_PK
	JOIN age_demog ad
		ON d.age_demog_id_FK = ad.age_demog_id_PK
	JOIN age a
		ON ad.age_id_FK = age_id_PK
	JOIN demog
		ON ad.demog_id_FK = demog.demog_id_PK
	ORDER BY q_cat, q_topic, demog_cat, demog_spec;
    
SELECT * FROM all_ques_and_demog;
/* PURPOSE of View 1
"What questions were asked to specific demographic groups?"
This view displays the year the questions were asked, location surveyed, question category, question topic, question itself, and the demographics surveyed.
This view is a great initial start for anyone new to using this database so they can explore the questions asked, which can help tailor their subsequent queries.
*/

/* VIEW 2 */
# View 2: View the maximum, minimum, and average data values in the U.S. region overall for each question 
# Contains: JOIN, Filter Clauses (WHERE), Aggregate Functions (MIN, MAX, AVG)
USE puebla;
DROP VIEW IF EXISTS usa_data_values;

CREATE VIEW usa_data_values AS
SELECT question, MIN(data_value) AS min_value, MAX(data_value) AS max_value, AVG(data_value) as average_value
FROM data d
	JOIN year_loc yl
		ON d.year_loc_id_FK = yl.year_loc_id_PK
	JOIN year y
		ON yl.year_id_FK = y.year_id_PK
	JOIN location l
		ON yl.loc_id_FK = l.loc_id_PK
	JOIN questions q
		ON d.q_id_FK = q.q_id_PK
	JOIN age_demog ad
		ON d.age_demog_id_FK = ad.age_demog_id_PK
	JOIN age a
		ON ad.age_id_FK = age_id_PK
	JOIN demog
		ON ad.demog_id_FK = demog.demog_id_PK
	WHERE loc_desc = 'United States, DC & Territories'
GROUP BY question;

SELECT * FROM usa_data_values;
/* PURPOSE of View 2
"What were the minimum, maximum, and average data values for each question in the United States as a whole in 2021?"
This view calculates and displays the minimum, maximum, and average data values for each question.
The inputted data comes from all races and genders surveyed in the 'United States, DC & Territories' region.
*/

/* VIEW 3 */
# View 3: View demographics with high prevalence of negative health indicators
# Contains: JOIN, Filter Clauses (WHERE, HAVING), Aggregate Functions (AVG)

USE puebla;
DROP VIEW IF EXISTS high_risk_demographics;

CREATE VIEW high_risk_demographics AS
SELECT 
    loc_desc,
    q_cat, 
    question, 
    demog_spec, 
    AVG(adjusted_avg_value) AS avg_risk
FROM (
    SELECT 
        q.q_cat, 
        q.question, 
        demog.demog_spec,
        l.loc_desc,
        CASE
            WHEN q.q_cat = 'Overall Health' THEN (100 - d.data_value) 
            ELSE d.data_value
        END AS adjusted_avg_value
    FROM data d
    JOIN year_loc yl ON d.year_loc_id_FK = yl.year_loc_id_PK
    JOIN year y ON yl.year_id_FK = y.year_id_PK
    JOIN location l ON yl.loc_id_FK = l.loc_id_PK
    JOIN questions q ON d.q_id_FK = q.q_id_PK
    JOIN age_demog ad ON d.age_demog_id_FK = ad.age_demog_id_PK
    JOIN age a ON ad.age_id_FK = a.age_id_PK
    JOIN demog ON ad.demog_id_FK = demog.demog_id_PK
    WHERE q.q_cat IN (
        'Nutrition/Physical Activity/Obesity', 
        'Screenings and Vaccines', 
        'Mental Health', 
        'Smoking and Alcohol Use', 
        'Overall Health'
    )
) AS high_health_risk
GROUP BY loc_desc, q_cat, question, demog_spec
HAVING AVG(adjusted_avg_value) > 50
ORDER BY q_cat, question, avg_risk DESC;

SELECT * FROM high_risk_demographics;

/* PURPOSE of View 3
"In what categories do the majority of demographic groups exhibit negative health indicators"
This view displays the demographic groups in which the average data value is greater than 50% for negative health indicator questions
*/

/* VIEW 4 */
# View 4: Comparative regional health indicators across different demographics
# Contains: Subquery, Filter Clauses (WHERE, HAVING), JOINs
USE puebla;
DROP VIEW IF EXISTS regional_health_trends;

CREATE VIEW regional_health_trends AS
WITH health_metrics AS (
    SELECT 
        l.loc_cat,
        l.loc_desc,
        q.q_cat,
        q.question,
        demog.demog_spec,
        AVG(d.data_value) AS avg_data_value
    FROM data d
    JOIN year_loc yl ON d.year_loc_id_FK = yl.year_loc_id_PK
    JOIN location l ON yl.loc_id_FK = l.loc_id_PK
    JOIN questions q ON d.q_id_FK = q.q_id_PK
    JOIN age_demog ad ON d.age_demog_id_FK = ad.age_demog_id_PK
    JOIN demog ON ad.demog_id_FK = demog.demog_id_PK
    WHERE 
        l.loc_cat IN ('region', 'all_usa') AND 
        demog.demog_spec != 'overall' AND
        q.q_cat IN ('Overall Health', 'Mental Health', 'Nutrition/Physical Activity/Obesity')
    GROUP BY 
        l.loc_cat, 
        l.loc_desc, 
        q.q_cat, 
        q.question, 
        demog.demog_spec
)
SELECT 
    loc_cat,
    loc_desc,
    q_cat,
    question,
    demog_spec,
    avg_data_value,
    (SELECT AVG(avg_data_value) 
     FROM health_metrics hm2 
     WHERE hm2.q_cat = hm1.q_cat) AS category_avg,
    ROUND(
        (avg_data_value - (SELECT AVG(avg_data_value) 
                           FROM health_metrics hm2 
                           WHERE hm2.q_cat = hm1.q_cat)) / 
        (SELECT AVG(avg_data_value) 
         FROM health_metrics hm2 
         WHERE hm2.q_cat = hm1.q_cat) * 100, 
    2) AS percent_diff_from_category_avg
FROM health_metrics hm1
HAVING 
    ABS(percent_diff_from_category_avg) > 10
ORDER BY 
    q_cat, 
    ABS(percent_diff_from_category_avg) DESC;

SELECT * FROM regional_health_trends;

/* PURPOSE of View 4
"How do health indicators vary across different regions and demographics?"
This view provides a comprehensive comparison of health metrics across regions, highlighting significant deviations from the average in key health categories.
*/


###############################################################

/* PROCEDURE 1 */
DELIMITER $$

USE puebla$$

DROP PROCEDURE IF EXISTS comparing_race_by_topic;

CREATE PROCEDURE comparing_race_by_topic(
    IN selected_topic VARCHAR(255)
)
BEGIN
    SELECT 
        q.q_topic AS topic,
        y.year AS data_year,
        dm.demog_spec AS race,
        ROUND(AVG(d.data_value), 2) AS average_value,
        ROUND(AVG(d.low_conf_lim), 2) AS low_confidence_limit,
        ROUND(AVG(d.high_conf_lim), 2) AS high_confidence_limit,
        COUNT(*) AS data_points
    FROM 
        data d
    JOIN questions q ON d.q_id_FK = q.q_id_PK
    JOIN year_loc yl ON d.year_loc_id_FK = yl.year_loc_id_PK
    JOIN year y ON yl.year_id_FK = y.year_id_PK
    JOIN age_demog ad ON d.age_demog_id_FK = ad.age_demog_id_PK
    JOIN demog dm ON ad.demog_id_FK = dm.demog_id_PK
    WHERE 
        q.q_topic LIKE selected_topic
        AND dm.demog_cat = 'race'
    GROUP BY 
        q.q_topic, 
        y.year, 
        race
    ORDER BY 
        topic, 
        data_year, 
        race;
END$$
DELIMITER ;

/* The above procedure takes the input of a topic such as "Prevalence of sufficient sleep"
	and produces a table of the average_value with low and high confidences + number of data points
    by race.*/
    
    /* This allows the user to examin the differences in spcific conditions between 
		different races inorder to determine possible outliers and any other observations */ 

/* Example usages of this procedure is bellow */
CALL comparing_race_by_topic('%');
CALL comparing_race_by_topic('Current smoking');
CALL comparing_race_by_topic('Obesity');

/* PROCEDURE 2 */

DELIMITER $$

USE puebla$$

DROP PROCEDURE IF EXISTS get_highest_avg_topic_for_region$$

CREATE PROCEDURE get_highest_avg_topic_for_region (
    IN loc_reg_input VARCHAR(10)
)
BEGIN
    SELECT 
        q.q_topic AS Top_Topic, 
        AVG(d.data_value) AS avg_for_topic
    FROM data d
    JOIN year_loc yl ON d.year_loc_id_FK = yl.year_loc_id_PK
    JOIN location loc ON yl.loc_id_FK = loc.loc_id_PK
    JOIN questions q ON d.q_id_FK = q.q_id_PK
    WHERE loc.loc_cat = 'region' 
      AND loc.loc_desc = loc_reg_input
    GROUP BY q.q_topic
    ORDER BY avg_for_topic DESC;
END $$

DELIMITER ;

/* This procedure allows for a user to input a region and get the topics and the averages for that region in decending order */

/* Examples: */
CALL get_highest_avg_topic_for_region('Northeast');
CALL get_highest_avg_topic_for_region('West');
CALL get_highest_avg_topic_for_region('South');


####################################################


/* FUNCTION 1 */
DELIMITER $$

USE puebla$$

DROP FUNCTION IF EXISTS get_percent_smoking_responders_above_50$$

CREATE FUNCTION get_percent_smoking_responders_above_50 (
    loc_reg_input VARCHAR(10)
)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE total_responders INT;
    DECLARE responders_above_50 INT;
    DECLARE proportion DECIMAL(5,2);

    -- Count the total number of responders for the "Current smoking" topic in the given region
    SELECT COUNT(DISTINCT d.response_id_PK)
    INTO total_responders
    FROM data d
    JOIN year_loc yl ON d.year_loc_id_FK = yl.year_loc_id_PK
    JOIN location loc ON yl.loc_id_FK = loc.loc_id_PK
    JOIN questions q ON d.q_id_FK = q.q_id_PK
    WHERE loc.loc_cat = 'region' 
      AND loc.loc_desc = loc_reg_input
      AND q.q_topic = 'Current smoking';

    SELECT COUNT(DISTINCT d.response_id_PK)
    INTO responders_above_50
    FROM data d
    JOIN year_loc yl ON d.year_loc_id_FK = yl.year_loc_id_PK
    JOIN location loc ON yl.loc_id_FK = loc.loc_id_PK
    JOIN questions q ON d.q_id_FK = q.q_id_PK
    WHERE loc.loc_cat = 'region' 
      AND loc.loc_desc = loc_reg_input
      AND q.q_topic = 'Current smoking'
      AND d.data_value >= 50;

    IF total_responders > 0 THEN
        SET proportion = (responders_above_50 / total_responders) * 100;
    ELSE
        SET proportion = 0;
    END IF;

    RETURN proportion;
END $$

DELIMITER ;

/* Allows the user to input a region and get the percent of respondents that answered 50 or over when asked
	if they have smoked more than 100 times in the past and are currently smoking*/

/* Examples: */
SELECT get_percent_smoking_responders_above_50('Northeast');
SELECT get_percent_smoking_responders_above_50('South');
SELECT get_percent_smoking_responders_above_50('West');
SELECT get_percent_smoking_responders_above_50('Midwest');

/* FUNCTION 2 */
DELIMITER $$

USE puebla$$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS get_second_highest_avg_topic_for_region_race$$

CREATE PROCEDURE get_second_highest_avg_topic_for_region_race (
    IN loc_reg_input VARCHAR(10),   -- The region
    IN race_input VARCHAR(50)       -- The race (e.g., 'black', 'white', etc.)
)
BEGIN
    -- Select the second-highest average data_value for the given region and race
    SELECT q.q_topic AS top_topic, AVG(d.data_value) AS avg_for_topic
    FROM data d
    JOIN year_loc yl ON d.year_loc_id_FK = yl.year_loc_id_PK
    JOIN location loc ON yl.loc_id_FK = loc.loc_id_PK
    JOIN questions q ON d.q_id_FK = q.q_id_PK
    JOIN age_demog ad ON d.age_demog_id_FK = ad.age_demog_id_PK
    JOIN demog dem ON ad.demog_id_FK = dem.demog_id_PK
    WHERE loc.loc_cat = 'region'
      AND loc.loc_desc = loc_reg_input
      AND dem.demog_spec = race_input
    GROUP BY q.q_topic
    ORDER BY avg_for_topic DESC
    LIMIT 1 OFFSET 1;  -- Skip the highest (OFFSET 1) and get the second-highest
END $$

DELIMITER ;

/* This function allows the user to input a region and a race to obtain the 
	second highest reported topic for both of the specified categories. It 
    was decided to do the second highest as the highest among the large majority
    of both regions and races was High Blood pressure ever. */ 

/* Example usages: */

CALL get_second_highest_avg_topic_for_region_race('Northeast', 'black');
CALL get_second_highest_avg_topic_for_region_race('West', 'white');
CALL get_second_highest_avg_topic_for_region_race('South', 'asian');