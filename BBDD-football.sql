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
    CONSTRAINT FK_id_host_team_match FOREIGN KEY (ID_team) REFERENCES teams (ID) ON DELETE CASCADE,
    CONSTRAINT FK_id_visiting_team_match FOREIGN KEY (ID_team) REFERENCES teams (ID) ON DELETE CASCADE
);

CREATE TABLE goals (
    ID INT PRIMARY KEY,
    ID_match INT NOT NULL,
    ID_player INT NOT NULL,
    goal_minute INT,
    CONSTRAINT FK_id_match_goals FOREIGN KEY (ID_match) REFERENCES matches (ID) ON DELETE CASCADE,
    CONSTRAINT FK_id_player_goals FOREIGN KEY (ID_player) REFERENCES players (ID) ON DELETE CASCADE
);