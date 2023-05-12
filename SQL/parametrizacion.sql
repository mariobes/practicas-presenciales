-- parametrizacion
INSERT INTO teams (name, stadium, city) VALUES ('Real Madrid', 'Santiago Bernabeu', 'Madrid');
INSERT INTO teams (name, stadium, city) VALUES ('Barcelona', 'Camp Nou', 'Barcelona');
INSERT INTO teams (name, stadium, city) VALUES ('Manchester United', 'Old Trafford', 'Manchester');
INSERT INTO teams (name, stadium, city) VALUES ('Bayern Munich', 'Allianz Arena', 'Munich');
INSERT INTO teams (name, stadium, city) VALUES ('Juventus', 'Allianz Stadium', 'Turin');

INSERT INTO players (name, lastname, position, ID_team) VALUES ('Cristiano', 'Ronaldo', 'attack', 1);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Lionel', 'Messi', 'attack', 2);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Neymar', 'Junior', 'attack', 2);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Kylian', 'Mbappé', 'attack', 2);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Robert', 'Lewandowski', 'attack', 4);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Manuel', 'Neuer', 'goalkeeper', 4);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Sergio', 'Ramos', 'defense', 1);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Mohamed', 'Salah', 'attack', 1);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Virgil', 'van Dijk', 'defense', 1);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Kevin', 'De Bruyne', 'midfield', 5);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Harry', 'Kane', 'attack', 5);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Antoine', 'Griezmann', 'attack', 2);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Jan', 'Oblak', 'goalkeeper', 1);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Sadio', 'Mane', 'attack', 2);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Eden', 'Hazard', 'attack', 2);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Thiago', 'Silva', 'defense', 2);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Ederson', 'Moraes', 'goalkeeper', 5);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Raheem', 'Sterling', 'attack', 5);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Marc-Andre', 'ter Stegen', 'goalkeeper', 2);
INSERT INTO players (name, lastname, position, ID_team) VALUES ('Toni', 'Kroos', 'midfield', 1);


INSERT INTO matches (ID_host_team, ID_visiting_team, goals_host_team, goals_visiting_team) VALUES (1, 2, 3, 2);
INSERT INTO matches (ID_host_team, ID_visiting_team, goals_host_team, goals_visiting_team) VALUES (2, 3, 1, 1);
INSERT INTO matches (ID_host_team, ID_visiting_team, goals_host_team, goals_visiting_team) VALUES (4, 5, 2, 0);
INSERT INTO matches (ID_host_team, ID_visiting_team, goals_host_team, goals_visiting_team) VALUES (5, 1, 1, 1);
INSERT INTO matches (ID_host_team, ID_visiting_team, goals_host_team, goals_visiting_team) VALUES (2, 4, 2, 2);
INSERT INTO matches (ID_host_team, ID_visiting_team, goals_host_team, goals_visiting_team) VALUES (5, 3, 3, 0);
INSERT INTO matches (ID_host_team, ID_visiting_team, goals_host_team, goals_visiting_team) VALUES (2, 3, 0, 1);
INSERT INTO matches (ID_host_team, ID_visiting_team, goals_host_team, goals_visiting_team) VALUES (2, 1, 2, 1);
INSERT INTO matches (ID_host_team, ID_visiting_team, goals_host_team, goals_visiting_team) VALUES (4, 1, 0, 0);
INSERT INTO matches (ID_host_team, ID_visiting_team, goals_host_team, goals_visiting_team) VALUES (3, 5, 1, 2);

INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (1, 1, 1, 10);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (2, 1, 2, 15);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (3, 2, 3, 30);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (4, 3, 4, 5);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (5, 3, 5, 60);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (6, 4, 6, 25);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (7, 4, 7, 75);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (9, 5, 9, 85);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (10, 6, 10, 55);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (11, 6, 11, 70);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (12, 7, 12, 5);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (13, 7, 13, 10);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (14, 8, 14, 35);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (15, 8, 15, 50);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (16, 9, 16, 15);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (17, 9, 17, 70);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (18, 10, 18, 25);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (19, 10, 19, 40);
INSERT INTO goals (ID, ID_match, ID_player, goal_minute) VALUES (20, 8, 5, 90);