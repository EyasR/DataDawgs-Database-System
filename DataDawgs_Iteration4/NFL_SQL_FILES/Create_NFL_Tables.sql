
CREATE TABLE TEAM (
team_name VARCHAR(30) NOT NULL UNIQUE,
state_represented VARCHAR(50) NULL,
PRIMARY KEY (team_name)
);

CREATE TABLE PLAYER (
player_ID INT NOT NULL UNIQUE,
team_name VARCHAR(30) NOT NULL,
player_name VARCHAR(50) NOT NULL,
position VARCHAR(5),
PRIMARY KEY(player_ID),
FOREIGN KEY(team_name) REFERENCES TEAM(team_name),
CHECK (position IN('C', 'CB', 'DB', 'DE', 'DE/LB', 'DL',
 'DT', 'FB', 'FS', 'G', 'ILB', 'K', 'KR', 'LB', 'LS', 'NT',
 'OL', 'OLB', 'OT', 'P', 'QB', 'RB', 'S', 'SS', 'T', 'TE', 'WR', 'LB', 'OG', 'MLB',  'SAF'))
);

CREATE TABLE STADIUM (
stadium_ID INT NOT NULL UNIQUE,
stadium_name VARCHAR(30) NOT NULL UNIQUE,
location_state VARCHAR(15),
location_city VARCHAR(15),
PRIMARY KEY(stadium_ID)
);

CREATE TABLE COACH (
team_name VARCHAR(30) NOT NULL UNIQUE,
coach_fname VARCHAR(15),
coach_lname VARCHAR(15),
coach_ID INT NOT NULL UNIQUE,
PRIMARY KEY(coach_ID),
FOREIGN KEY(team_name) REFERENCES TEAM(team_name)
);

CREATE TABLE GAME (
game_ID INT NOT NULL UNIQUE,
stadium_ID INT NOT NULL,
home_team_name VARCHAR(30) NOT NULL,
away_team_name VARCHAR(30) NOT NULL,
final_score VARCHAR(6) NOT NULL,
PRIMARY KEY (game_ID),
FOREIGN KEY (stadium_ID) REFERENCES STADIUM(stadium_ID),
FOREIGN KEY (home_team_name) REFERENCES TEAM(team_name),
FOREIGN KEY (away_team_name) REFERENCES TEAM(team_name)
);



CREATE TABLE OFFENSIVE_RANKING (
team_name VARCHAR(30) NOT NULL UNIQUE,
total_score INT,
yards_per_play DECIMAL(3,2),
total_yards SMALLINT,
turnovers INT,
penalties INT,
PRIMARY KEY(total_score, team_name),
FOREIGN KEY(team_name) REFERENCES TEAM(team_name)
);

CREATE TABLE DEFENSIVE_RANKING (
team_name VARCHAR(30) NOT NULL UNIQUE,
total_score INT,
yards_per_play DECIMAL(3,2),
total_yards SMALLINT,
turnovers INT,
Penalties INT,
PRIMARY KEY(total_score, team_name),
FOREIGN KEY(team_name) REFERENCES TEAM(team_name)
);

CREATE TABLE PARTICIPATES_IN (
home_team_name VARCHAR(30) NOT NULL,
away_team_name VARCHAR(30) NOT NULL,
game_ID INT NOT NULL UNIQUE,
game_date DATE,
PRIMARY KEY(home_team_name, away_team_name, game_ID),
FOREIGN KEY (home_team_name) REFERENCES TEAM(team_name),
FOREIGN KEY (away_team_name) REFERENCES TEAM(team_name),
FOREIGN KEY (game_ID) REFERENCES GAME(game_ID)
);
