DELIMITER ;
\! echo "\033[31m*** Delete Database if exist ***\033[m";
DROP DATABASE IF EXISTS cinemas_manager;

\! echo "\033[33m*** Create Database Hypnos ***\033[m";
Create DATABASE IF NOT EXISTS cinemas_manager CHARACTER SET = utf8mb4;

/* use cinemas_manager Database */
Use cinemas_manager;

/* Creating ROLES 
/* 'administrator' is ALL GRANTED
/* 'production' is for basic utilisation
*/
\! echo "\033[33m*** Create Role 'administrator' and 'production' Hypnos ***\033[m";
Create ROLE IF NOT EXISTS 'administrator', 'production';

\! echo "\033[33m*** Assign privileges ALL to administrator ***\033[m";
GRANT 
    ALL 
    ON cinemas_manager.* 
    TO 'administrator'@'%';

\! echo "\033[33m*** Assign privileges 'INSERT, SELECT, UPDATE, DELETE' to production ***\033[m";
GRANT 
    INSERT, SELECT, UPDATE, DELETE
    ON cinemas_manager.* 
    TO 'production'@'%';


\! echo "\033[33m*** Create user 'administrator' with role administrator ***\033[m";
Create USER IF NOT EXISTS
    administrator@'%'    
    IDENTIFIED BY '*adm$ze@y$'
    DEFAULT ROLE administrator;

\! echo "\033[33m*** Create user 'production' with role production  ***\033[m";
Create USER IF NOT EXISTS
    user@'%'    
    IDENTIFIED BY '*prod$sfg@df$'
    DEFAULT ROLE production;

\! echo "\033[33m*** Create Table 'cinemas'  ***\033[m";
CREATE TABLE IF NOT EXISTS cinemas
(
    id VARCHAR(36) NOT NULL UNIQUE PRIMARY KEY DEFAULT (UUID()),
    name VARCHAR(36) NOT NULL
) ENGINE = InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

\! echo "\033[33m*** Create Table 'employees'  ***\033[m";
CREATE TABLE IF NOT EXISTS employees
(
    id VARCHAR(36) NOT NULL UNIQUE PRIMARY KEY DEFAULT (UUID()),
    firstname VARCHAR(60) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    cinema_id VARCHAR(60),
    permission VARCHAR(20) NOT NULL DEFAULT 'level1',
    password VARCHAR(60) NOT NULL,
    FOREIGN KEY (cinema_id) REFERENCES cinemas(id) ON DELETE SET NULL
) ENGINE = InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

\! echo "\033[33m*** Create Table 'admins'  ***\033[m";
CREATE TABLE IF NOT EXISTS admins
(
    id VARCHAR(36) NOT NULL UNIQUE PRIMARY KEY DEFAULT(UUID()),
    employee_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

\! echo "\033[33m*** Create Table 'users'  ***\033[m";
CREATE TABLE IF NOT EXISTS users
(
    id VARCHAR(36) NOT NULL UNIQUE PRIMARY KEY DEFAULT(UUID()),
    firstname VARCHAR(60) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(60) NOT NULL
) ENGINE = InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

\! echo "\033[33m*** Create Table 'rooms'  ***\033[m";
CREATE TABLE IF NOT EXISTS rooms
(
    id VARCHAR(36) NOT NULL UNIQUE PRIMARY KEY DEFAULT(UUID()),
    cinema_id VARCHAR(36) NOT NULL,
    places INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (cinema_id) REFERENCES cinemas(id) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

\! echo "\033[33m*** Create Table 'movies'  ***\033[m";
CREATE TABLE IF NOT EXISTS movies
(
    id VARCHAR(36) NOT NULL UNIQUE PRIMARY KEY DEFAULT(UUID()),
    title VARCHAR(255) NOT NULL,
    synopsis TEXT NOT NULL,
    duration INT NOT NULL
) ENGINE = InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

\! echo "\033[33m*** Create Table 'sessions'  ***\033[m";
CREATE TABLE IF NOT EXISTS sessions
(
    id VARCHAR(36) NOT NULL PRIMARY KEY DEFAULT (UUID()),
    movie_id VARCHAR(36),
    room_id VARCHAR(36),
    date DATETIME,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;


\! echo "\033[33m*** Create Table 'prices'  ***\033[m";
CREATE TABLE IF NOT EXISTS prices
(
    id VARCHAR(36) NOT NULL PRIMARY KEY DEFAULT (UUID()),
    name VARCHAR(60) NOT NULL,
    price INT NOT NULL
) ENGINE = InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

\! echo "\033[33m*** Create function 'PlaceLeft'  ***\033[m";
DELIMITER $$
CREATE FUNCTION PlaceLeft(session_id VARCHAR(36), number INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE places INT;
    SELECT place_left INTO places FROM view_place_left;
    IF places>=number THEN RETURN 1;
    ELSE RETURN 0;
    END IF;

END$$

DELIMITER ;
\! echo "\033[33m*** Create Table 'tickets'  ***\033[m";
CREATE TABLE IF NOT EXISTS tickets
(
    id VARCHAR(36) NOT NULL PRIMARY KEY DEFAULT (UUID()),
    session_id VARCHAR(36) NOT NULL,
    user_id VARCHAR(36) NOT NULL,
    price_id VARCHAR(36) NOT NULL,
    number INT NOT NULL,
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    paid INT,    
    FOREIGN KEY (session_id) REFERENCES sessions(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (price_id) REFERENCES prices(id) ON DELETE CASCADE ON UPDATE CASCADE    
) ENGINE = InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

\! echo "\033[33m*** DROP View 'view_place_left'  ***\033[m";
DROP VIEW IF EXISTS view_place_left;
\! echo "\033[33m*** Create View 'view_place_left'  ***\033[m";
CREATE VIEW view_place_left
    AS SELECT sessions.id, 
    (SELECT (SELECT places FROM rooms,sessions WHERE rooms.id=sessions.room_id) - (SELECT IFNULL((SELECT SUM(number) 
FROM tickets, sessions WHERE tickets.session_id=sessions.id),0)) AS place_left) AS place_left FROM sessions;


\! echo "\033[33m*** Create trigger on 'tickets'  ***\033[m";
DELIMITER $$
CREATE TRIGGER check_places BEFORE INSERT ON tickets
    FOR EACH ROW
    BEGIN
        IF PlaceLeft(NEW.session_id, NEW.number) != 1 THEN SIGNAL sqlstate '45000' set message_text = "No enough places";
    END IF;
END$$
DELIMITER ;

