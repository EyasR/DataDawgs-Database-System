/*Lists the locations of all NFL stadiums*/

SELECT stadium_name as Stadium, location_city AS City , location_state AS State
FROM STADIUM;

/*Lists the names of all coaches on the Seattle Seahawks*/

SElECT coach_fname, coach_lname
FROM COACH
INNER JOIN TEAM
ON COACH.team_name=TEAM.team_name
WHERE TEAM.team_name='Seattle Seahawks';

/*Lists the names and offensive total scores of all teams with offensive total scores of 150 or more*/

SELECT TEAM.team_name, OFFENSIVE_RANKING.total_score
FROM  TEAM, OFFENSIVE_RANKING
WHERE TEAM.team_name=OFFENSIVE_RANKING.team_name AND OFFENSIVE_RANKING.total_score >= 200;

/*Lists the the names of all Quarterbacks (QBs) in the NFL*/

SELECT player_name
FROM PLAYER
WHERE position='QB';

/*Lists the names of all teams and their defensive total score ordered by highest score to lowest*/

SELECT TEAM.team_name, DEFENSIVE_RANKING.total_score AS Defensive_Score
FROM  TEAM
INNER JOIN DEFENSIVE_RANKING
ON TEAM.team_name=DEFENSIVE_RANKING.team_name
ORDER BY DEFENSIVE_RANKING.total_score DESC;

/*Lists the names of all teams and their total offensive yards for teams with over 3200 offensive total yards ordered by most total yards to least*/

SELECT TEAM.team_name, OFFENSIVE_RANKING.total_yards
FROM TEAM
INNER JOIN OFFENSIVE_RANKING
ON TEAM.team_name=OFFENSIVE_RANKING.team_name
WHERE OFFENSIVE_RANKING.total_yards > 3200
ORDER BY OFFENSIVE_RANKING.total_yards DESC;

/*Lists the names of all players whos names start with a B*/

SELECT PLAYER.player_name AS Player
FROM PLAYER
WHERE PLAYER.player_name LIKE 'B%';

/*Lists the names of all players of the team with the best defensive ranking*/

SELECT player_name as Player
FROM PLAYER, TEAM, DEFENSIVE_RANKING
WHERE TEAM.team_name=PLAYER.team_name AND TEAM.team_name=DEFENSIVE_RANKING.team_name AND DEFENSIVE_RANKING.total_score in(
SELECT max(DEFENSIVE_RANKING.total_score)
FROM DEFENSIVE_RANKING);

/*Lists the home team, away team and final score of all games that happened on 2018-09-09*/

SELECT GAME.home_team_name AS Home_Team, GAME.away_team_name AS Away_Team, GAME.final_score AS Final_Score
FROM GAME
INNER JOIN PARTICIPATES_IN
ON GAME.game_ID=PARTICIPATES_IN.game_ID
WHERE PARTICIPATES_IN.game_date='2018-09-09';

/*Lists the team name, coaches and number of turnovers
 for the team with the most turnovers defensively and the most turnovers offensively*/
 
SELECT TEAM.team_name, coach_fname, coach_lname, OFFENSIVE_RANKING.turnovers AS Offensive_Turnovers, DEFENSIVE_RANKING.turnovers AS Defensive_turnovers
FROM TEAM, COACH, OFFENSIVE_RANKING, DEFENSIVE_RANKING
WHERE TEAM.team_name=COACH.team_name AND TEAM.team_name=OFFENSIVE_RANKING.team_name AND TEAM.team_name=DEFENSIVE_RANKING.team_name AND (OFFENSIVE_RANKING.turnovers=(
SELECT max(OFFENSIVE_RANKING.turnovers)
FROM OFFENSIVE_RANKING
)
OR DEFENSIVE_RANKING.turnovers=(
SELECT max(DEFENSIVE_RANKING.turnovers)
FROM DEFENSIVE_RANKING
));