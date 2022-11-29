SELECT *
FROM baseball..mlb_umpire_scorecard

-- Total Average Accuracy, Missed Class, and Runs Impacted
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard

-- Total Pitches, Total Incorrect, Total Correct
SELECT SUM(pitches_called) as Total_Pitches, SUM(incorrect_calls) as Incorrect, SUM(correct_calls) as Correct
FROM baseball..mlb_umpire_scorecard

-- Create a View for the data points above
CREATE VIEW Key_Metrics AS
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted,
SUM(pitches_called) as Total_Pitches, SUM(incorrect_calls) as Incorrect, SUM(correct_calls) as Correct
FROM baseball..mlb_umpire_scorecard

SELECT *
FROM Key_Metrics
-------------------------------------------------------------------

-- Total Number of Games per Ump
SELECT umpire, COUNT(*) as Total_Games
FROM baseball..mlb_umpire_scorecard
GROUP BY umpire

--Average Accuracy on all Umpires with Total Games
SELECT umpire, AVG(accuracy) as Accuracy, COUNT(umpire) as Total_Games
FROM baseball..mlb_umpire_scorecard
GROUP BY umpire
ORDER BY Accuracy ASC

-- Highest Game Called in top 1%
SELECT umpire, accuracy, date
FROM baseball..mlb_umpire_scorecard
WHERE accuracy >= 99

-- Lowest Game Called in bottom 15%
SELECT umpire, accuracy, date
FROM baseball..mlb_umpire_scorecard
WHERE accuracy <= 85
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

-- Regular Season Stats 2018
SELECT *
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2018-03-29' AND '2018-10-02'

--Regular Season Accuracy, Incorrect Calls, Total Runs
SELECT AVG(accuracy) as Accuracy, AVG(incorrect_calls) as Incorrect_Calls, AVG(total_run_impact) as Total_Runs_Impacted
FROM baseball..mlb_umpire_scorecard
WHERE date BETWEEN '2018-03-29' AND '2018-10-02'

---------------------------------------------------------------------------------------------------------------------------------------------

-- Reviewing individual years on metrics
-- Create a Temp Table to review data points for each year
CREATE TABLE #yearly_metrics(
Season int,
Accuracy varchar(100),
Incorrect_calls varchar(100),
Total_Runs_Impacted varchar(100)
)

INSERT INTO #yearly_metrics VALUES
('2015','90.471074043938','14.3820179007323','1.81747762408462'),
('2016','90.9492871690428','14.044399185336','1.82425254582485'),
('2017','92.7521596051007','11.3249691484986','1.47427396133279'),
('2018','90.471074043938','14.3820179007323','1.81747762408462'),
('2019','93.0166802943582','11.0314799672935','1.45538430089942'),
('2020','93.3093684210525','10.5210526315789','1.43849473684211'),
('2021','93.5874441284031','9.75863470134092','1.30397399431126'),
('2022','93.8108316430019','9.34036511156187','1.24209736308316')

SELECT *
FROM #yearly_metrics
---------------------------------------------------------------------------------------------------------------------------------------------

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

---------------------------------------------- THEORY ------------------------------------------------------------------------------------
--Testing Theory: Does a Home Field advantage impact overall umpire performance 
SELECT umpire, home, home_team_runs, away, away_team_runs, incorrect_calls, correct_calls, accuracy, favor_home
FROM baseball..mlb_umpire_scorecard

-- Created view to test theory 
CREATE VIEW home_vs_away_games AS(
SELECT umpire, home, home_team_runs, away, away_team_runs, incorrect_calls, correct_calls, accuracy, date, 
CASE
	WHEN home_team_runs > away_team_runs THEN 'Home'
	WHEN away_team_runs > home_team_runs THEN 'Away'
	WHEN home_team_runs = away_team_runs THEN 'Tied'
	END as Winner
FROM baseball..mlb_umpire_scorecard
)
-------------------- Reveiwing Theory --------------------
SELECT *
FROM home_vs_away_games
ORDER by Winner

-- General Stats
SELECT COUNT(Winner) as Home_Wins, AVG(incorrect_calls) as incorrect, AVG(correct_calls) as correct
FROM home_vs_away_games
WHERE Winner = 'Home'
-- 9753

SELECT COUNT(Winner) as Away_Wins, AVG(incorrect_calls) as incorrect, AVG(correct_calls) as correct
FROM home_vs_away_games
WHERE Winner = 'Away'
-- 8459

SELECT MAX(home_team_runs) as max_home_team_runs, MAX(away_team_runs) as max_away_team_runs, 
AVG(home_team_runs) as avg_home_team_runs, AVG(away_team_runs) as avg_away_team_runs,
MIN(home_team_runs) as min_home_team_runs, MIN(away_team_runs) as min_away_team_runs
FROM home_vs_away_games
-- MAX 29h & 28a -- AVG 4.55h & 4.43a -- MIN 0h & 0a

----------------------------------------------------------------------------------------------------------------------------------
-- General Stats for home wins and away wins

CREATE VIEW home_stats AS(
SELECT AVG(accuracy) as avg_home_accuracy, AVG(incorrect_calls) as avg_home_incorrect, AVG(correct_calls) as avg_home_correct,
MAX(accuracy) as max_home_accuracy, MAX(incorrect_calls) as max_home_incorrect, MAX(correct_calls) as max_home_correct,
MIN(accuracy) as min_home_accuracy, MIN(incorrect_calls) as min_home_incorrect, MIN(correct_calls) as min_home_correct
FROM home_vs_away_games
WHERE Winner = 'Home'
)

CREATE VIEW away_stats AS(
SELECT AVG(accuracy) as avg_away_accuracy, AVG(incorrect_calls) as avg_away_incorrect, AVG(correct_calls) as avg_away_correct,
MAX(accuracy) as max_away_accuracy, MAX(incorrect_calls) as max_away_incorrect, MAX(correct_calls) as max_away_correct,
MIN(accuracy) as min_away_accuracy, MIN(incorrect_calls) as min_away_incorrect, MIN(correct_calls) as min_away_correct
FROM home_vs_away_games
WHERE Winner = 'Away'
)

SELECT *
FROM home_stats

SELECT *
FROM away_stats
----------------------------------------------------------------------------------------------------------------------------------
-- 1 score difference
SELECT AVG(accuracy) as avg_home_accuracy, AVG(incorrect_calls) as avg_home_incorrect, AVG(correct_calls) as avg_home_correct,
MAX(accuracy) as max_home_accuracy, MAX(incorrect_calls) as max_home_incorrect, MAX(correct_calls) as max_home_correct,
MIN(accuracy) as min_home_accuracy, MIN(incorrect_calls) as min_home_incorrect, MIN(correct_calls) as min_home_correct
FROM home_vs_away_games
WHERE Winner = 'Home' 
and (home_team_runs - away_team_runs) = 1 


SELECT AVG(accuracy) as avg_away_accuracy, AVG(incorrect_calls) as avg_away_incorrect, AVG(correct_calls) as avg_away_correct,
MAX(accuracy) as max_away_accuracy, MAX(incorrect_calls) as max_away_incorrect, MAX(correct_calls) as max_away_correct,
MIN(accuracy) as min_away_accuracy, MIN(incorrect_calls) as min_away_incorrect, MIN(correct_calls) as min_away_correct
FROM home_vs_away_games
WHERE Winner = 'Away' 
and (away_team_runs - home_team_runs) = 1


-- Using 10 runs as "High" Scoring Game
SELECT AVG(accuracy) as avg_home_accuracy, AVG(incorrect_calls) as avg_home_incorrect, AVG(correct_calls) as avg_home_correct,
MAX(accuracy) as max_home_accuracy, MAX(incorrect_calls) as max_home_incorrect, MAX(correct_calls) as max_home_correct,
MIN(accuracy) as min_home_accuracy, MIN(incorrect_calls) as min_home_incorrect, MIN(correct_calls) as min_home_correct
FROM home_vs_away_games
WHERE Winner = 'Home' and home_team_runs > 10 AND away_team_runs > 10

SELECT AVG(accuracy) as avg_away_accuracy, AVG(incorrect_calls) as avg_away_incorrect, AVG(correct_calls) as avg_away_correct,
MAX(accuracy) as max_away_accuracy, MAX(incorrect_calls) as max_away_incorrect, MAX(correct_calls) as max_away_correct,
MIN(accuracy) as min_away_accuracy, MIN(incorrect_calls) as min_away_incorrect, MIN(correct_calls) as min_away_correct
FROM home_vs_away_games
WHERE Winner = 'Away' and home_team_runs > 10 AND away_team_runs > 10
