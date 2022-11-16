SELECT *
FROM baseball..mlb_umpire_scorecard

-- Total Average Accuracy, Missed Class, and Runs Impacted
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard

-- Total Pitches, Total Incorrect, Total Correct
SELECT SUM(pitches_called) as Total_Pitches, SUM(incorrect_calls) as Incorrect, SUM(correct_calls) as Correct
FROM baseball..mlb_umpire_scorecard

-- Total Number of Games per Ump
SELECT umpire, COUNT(*) as Total_Games
FROM baseball..mlb_umpire_scorecard
GROUP BY umpire

--Average Accuracy on all Umpires with Total Games
SELECT umpire, AVG(accuracy) as Accuracy, COUNT(umpire) as Total_Games
FROM baseball..mlb_umpire_scorecard
GROUP BY umpire

-- Highest Game Called in top 1%
SELECT umpire, accuracy, date
FROM baseball..mlb_umpire_scorecard
WHERE accuracy >= 99

-- Lowest Game Called in bottom 15%
SELECT umpire, accuracy, date
FROM baseball..mlb_umpire_scorecard
WHERE accuracy <= 85

-- Highest Game Called in top 1% For 2022
SELECT umpire, accuracy, date,
CASE
	WHEN date >= '2022-10-07' then 'Playoff'
	WHEN date < '2022-10-07' then 'Regular Season'
END
FROM baseball..mlb_umpire_scorecard
WHERE accuracy > 99

-- Lowest Game Called in bottom 15% For 2022
SELECT umpire, accuracy, date,
CASE
	WHEN date >= '2022-10-07' then 'Playoff'
	WHEN date < '2022-10-07' then 'Regular Season'
END
FROM baseball..mlb_umpire_scorecard
WHERE accuracy < 85

---------------------------------------------------------------------------------------------------------------------------------------------
--Playoffs Stats 2022
SELECT *
FROM baseball..mlb_umpire_scorecard
WHERE date >= '2022-10-07'

--Playoffs Accuracy, Incorrect Calls, Total Runs
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE date >= '2022-10-07'

-- Regular Season Stats 2022
SELECT *
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2020-04-07' AND '2022-10-07'

--Regular Season Accuracy, Incorrect Calls, Total Runs
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2020-04-07' AND '2022-10-07'

---------------------------------------------------------------------------------------------------------------------------------------------
--Playoffs Stats 2021
SELECT *
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2021-10-05' AND '2021-11-02'

--Playoffs Accuracy, Incorrect Calls, Total Runs
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2021-10-05' AND '2021-11-02'

-- Regular Season Stats 2021
SELECT *
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2021-04-01' AND '2021-10-05'

--Regular Season Accuracy, Incorrect Calls, Total Runs
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2021-04-01' AND '2021-10-05'

---------------------------------------------------------------------------------------------------------------------------------------------
--Playoffs Stats 2020. COVID YEAR
SELECT *
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2020-09-29' AND '2020-10-27'

--Playoffs Accuracy, Incorrect Calls, Total Runs
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2020-09-29' AND '2020-10-27'

-- Regular Season Stats 2020
SELECT *
FROM baseball..mlb_umpire_scorecard
WHERE date < '2020-09-29'

--Regular Season Accuracy, Incorrect Calls, Total Runs
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2020-07-23' AND '2020-09-29'


---------------------------------------------------------------------------------------------------------------------------------------------
--Playoffs Stats 2019
SELECT *
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2019-10-01' AND '2019-10-30'

--Playoffs Accuracy, Incorrect Calls, Total Runs
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2019-10-01' AND '2019-10-30'

-- Regular Season Stats 2019
SELECT *
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2019-03-20' AND '2019-10-01'

--Regular Season Accuracy, Incorrect Calls, Total Runs
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2019-03-20' AND '2019-10-01'

---------------------------------------------------------------------------------------------------------------------------------------------
--Playoffs Stats 2018
SELECT *
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2018-10-02' AND '2018-10-28'

--Playoffs Accuracy, Incorrect Calls, Total Runs
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2018-10-02' AND '2018-10-28'

-- Regular Season Stats 2019
SELECT *
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2019-03-29' AND '2019-10-02'

--Regular Season Accuracy, Incorrect Calls, Total Runs
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2019-03-29' AND '2019-10-02'

---------------------------------------------------------------------------------------------------------------------------------------------

-- Reviewing individual years on metrics
SELECT AVG(accuracy) as '2015_Accuracy', AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE (lower(date) LIKE '%2015%');

SELECT AVG(accuracy) as '2016_Accuracy', AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE (lower(date) LIKE '%2016%');

SELECT AVG(accuracy) as '2017_Accuracy', AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE (lower(date) LIKE '%2017%');

SELECT AVG(accuracy) as '2018_Accuracy', AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE (lower(date) LIKE '%2018%');

SELECT AVG(accuracy) as '2019_Accuracy', AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE (lower(date) LIKE '%2019%');

SELECT AVG(accuracy) as '2020_Accuracy', AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE (lower(date) LIKE '%2020%');

SELECT AVG(accuracy) as '2021_Accuracy', AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE date LIKE '%2021%'

SELECT AVG(accuracy) as '2022_Accuracy', AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE (lower(date) LIKE '%2022%');

