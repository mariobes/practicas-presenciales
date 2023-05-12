-- se pueden calcular los puntos totales
CREATE TABLE IF NOT EXISTS teams(
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    stadium varchar(100) NOT NULL,
    city varchar(100) NOT NULL
);

-- se pueden calcular los goles totales
CREATE TABLE IF NOT EXISTS players(
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    lastname varchar(100) NOT NULL,
    position enum("goalkeeper", "midfield", "attack", "defense") NOT NULL DEFAULT "attack",
    ID_team INT NOT NULL,
    CONSTRAINT FK_id_team_player FOREIGN KEY (ID_team) REFERENCES teams (ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS matches(
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ID_host_team INT NOT NULL,
    ID_visiting_team INT NOT NULL,
    goals_host_team INT NOT NULL DEFAULT 0,
    goals_visiting_team INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_id_host_team_match FOREIGN KEY (ID_host_team) REFERENCES teams (ID) ON DELETE CASCADE,
    CONSTRAINT FK_id_visiting_team_match FOREIGN KEY (ID_visiting_team) REFERENCES teams (ID) ON DELETE CASCADE
);

CREATE TABLE goals (
    ID INT PRIMARY KEY,
    ID_match INT NOT NULL,
    ID_player INT NOT NULL,
    goal_minute INT,
    CONSTRAINT FK_id_match_goals FOREIGN KEY (ID_match) REFERENCES matches (ID) ON DELETE CASCADE,
    CONSTRAINT FK_id_player_goals FOREIGN KEY (ID_player) REFERENCES players (ID) ON DELETE CASCADE
);

CREATE OR REPLACE VIEW player_goals_count AS
SELECT p.ID AS player_id, CONCAT(p.name, ' ', p.lastname) AS player_name, COUNT(g.ID) AS total_goals
FROM players p
LEFT JOIN goals g ON p.ID = g.ID_player
GROUP BY p.ID, player_name;

CREATE OR REPLACE VIEW team_points_count AS
SELECT t.ID AS team_id, t.name AS team_name,
    SUM(CASE
        WHEN m.goals_host_team > m.goals_visiting_team THEN 3
        WHEN m.goals_host_team = m.goals_visiting_team THEN 1
        ELSE 0
    END) AS total_points
FROM teams t
LEFT JOIN matches m ON t.ID = m.ID_host_team OR t.ID = m.ID_visiting_team
GROUP BY t.ID, team_name;
