\! echo "\033[32m*** ADD cinemas ***\033[m";
INSERT INTO cinemas (
    name
)
VALUES
("the magnific"),
("the Holywood"),
("the Bolywood"),
("the Merval Studio"),
("the Desnay Studio");


\! echo "\033[32m*** ADD employees ***\033[m";

INSERT INTO employees (
    firstname,
    lastname,
    email,
    cinema_id,
    permission,
    password
) VALUES
("John", "DO", 'john@example.com', (SELECT id from cinemas WHERE name="the magnific"), "employee", "$2y$10$a8oRYdNo7e.eFTdaFGADUuXRMAAr3YS/DLiRIQN4ZKemJ7d74SC3."),
("Jack", "RABBIT", 'jack@example.com', (SELECT id from cinemas WHERE name="the Holywood"), "employee", "$2y$10$hfxcRijVCYo8maEbUGhZf.qfWo7emWek2rcdLKh0oT5ZZXezmYmlq"),
("John", "SNOW", 'snow@example.com', (SELECT id from cinemas WHERE name="the Bolywood"), "employee", "$2y$10$L2HyNRsgBATiO0vZNpO0z.9KGFiqWpfxayuHO4TOueKrhjOshMetu"),
("Jesse", "PINCKMAN", 'jesse@example.com', (SELECT id from cinemas WHERE name="the Merval Studio"), "employee", "$2y$10$HjiqrluhJ2egqCuCY9pvruWINGpPdnwS2QyDf86pqUvDmC3L43etq"),
("Dexter", "MORGAN", 'dexter@example.com', (SELECT id from cinemas WHERE name="the Desnay Studio"), "employee", "$2y$10$LQFfuOChQ9Zk8J.lLJSL5urGSJEV.cWmyDvSGCIWxLjLih7Rqsn7e");

\! echo "\033[32m*** ADD 'administrator' ***\033[m";
INSERT INTO admins ( employee_id )
VALUES ((SELECT id from employees WHERE firstname="Dexter"));

\! echo "\033[32m*** ADD 'rooms' ***\033[m";
INSERT INTO rooms (cinema_id, places, name) VALUES
((SELECT id from cinemas WHERE name="the magnific"), 350, "Chicago"),
((SELECT id from cinemas WHERE name="the magnific"), 500, "New York"),
((SELECT id from cinemas WHERE name="the magnific"), 250, "Whashington"),
((SELECT id from cinemas WHERE name="the Holywood"), 600, "Philadelphie"),
((SELECT id from cinemas WHERE name="the Holywood"), 350, "Forth Worth"),
((SELECT id from cinemas WHERE name="the Holywood"), 450, "Dallas"),
((SELECT id from cinemas WHERE name="the Bolywood"), 650, "Bombay"),
((SELECT id from cinemas WHERE name="the Bolywood"), 250, "Nagpur"),
((SELECT id from cinemas WHERE name="the Bolywood"), 300, "New Delhi"),
((SELECT id from cinemas WHERE name="the Merval Studio"), 450, "Wakanda"),
((SELECT id from cinemas WHERE name="the Merval Studio"), 845, "Thanos"),
((SELECT id from cinemas WHERE name="the Merval Studio"), 240, "Xandar"),
((SELECT id from cinemas WHERE name="the Desnay Studio"), 240, "Agra"),
((SELECT id from cinemas WHERE name="the Desnay Studio"), 240, "Corona"),
((SELECT id from cinemas WHERE name="the Desnay Studio"), 240, "Arendelle");

\! echo "\033[32m*** ADD 'movies' ***\033[m";
INSERT INTO movies (title, synopsis, duration) VALUES
    ("Gemini Man", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 115),
    ("Seul contre tous", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 122),
    ("Bad Boys", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 113),
    ("Focus", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 104),
    ("After earth", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 100),
    ("Sept vies", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 123),
    ("Fury", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 124),
    ("Troie", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 196),
    ("Fight Club", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 132),
    ("Ocean's Eleven", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 130),
    ("Ocean's Twelve", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 126),
    ("Ocean's Thirteen", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 113),
    ("Ocean's Twelve", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 126),
    ("Une nuit en enfer", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsum, reprehenderit?", 108),
    ("ac metus vitae velit egestas","mattis semper, dui lectus rutrum urna, nec luctus",136),
    ("mi tempor lorem, eget mollis","Phasellus nulla. Integer vulputate, risus a",114),
    ("hendrerit consectetuer, cursus et, magna.","id risus quis diam luctus",193),
    ("erat volutpat. Nulla dignissim. Maecenas","arcu. Sed et",116),
    ("sem, consequat nec, mollis vitae,","eu sem. Pellentesque ut",120),
    ("felis. Donec tempor, est ac","feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus",131),
    ("eu neque pellentesque massa lobortis","Suspendisse aliquet molestie tellus. Aenean",106),
    ("risus. Quisque libero lacus, varius","orci. Phasellus dapibus",162),
    ("quam, elementum at, egestas a,","dolor sit amet, consectetuer",139),
    ("turpis. Aliquam adipiscing lobortis risus.","libero nec ligula consectetuer rhoncus. Nullam velit dui, semper",117),
    ("libero nec ligula consectetuer rhoncus.","sem",124),
    ("Etiam imperdiet dictum magna. Ut","magnis dis parturient montes,",170),
    ("Phasellus dolor elit, pellentesque a,","tortor nibh sit amet orci. Ut sagittis lobortis",133),
    ("sit amet ornare lectus justo","torquent per conubia",131),
    ("risus a ultricies adipiscing, enim","sapien, gravida non, sollicitudin a, malesuada id,",104),
    ("dolor dapibus gravida. Aliquam tincidunt,","Fusce aliquam, enim nec tempus scelerisque,",146),
    ("Curabitur dictum. Phasellus in felis.","id, libero. Donec consectetuer mauris id sapien. Cras",155),
    ("Duis risus odio, auctor vitae,","a nunc. In at pede.",130),
    ("nascetur ridiculus mus. Proin vel","at, velit. Pellentesque ultricies dignissim",163),
    ("est. Nunc ullamcorper, velit in","leo, in",146),
    ("dolor dapibus gravida. Aliquam tincidunt,","Fusce aliquam, enim nec tempus scelerisque,",146),
    ("Curabitur dictum. Phasellus in felis.","id, libero. Donec consectetuer mauris id sapien. Cras",155),
    ("Duis risus odio, auctor vitae,","a nunc. In at pede.",130),
    ("nascetur ridiculus mus. Proin vel","at, velit. Pellentesque ultricies dignissim",163),
    ("est. Nunc ullamcorper, velit in","leo, in",146),
    ("ullamcorper, velit in aliquet lobortis,","commodo tincidunt nibh. Phasellus nulla.",123),
    ("Donec non justo. Proin non","Donec egestas. Duis ac arcu. Nunc mauris. Morbi non",117),
    ("faucibus orci luctus et ultrices","dignissim. Maecenas ornare egestas ligula.",135),
    ("Phasellus elit pede, malesuada vel,","nonummy ultricies ornare, elit elit fermentum risus, at",97),
    ("Suspendisse aliquet, sem ut cursus","erat. Sed nunc est, mollis non, cursus non, egestas a,",123),
    ("arcu. Vestibulum ante ipsum primis","elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis",143);

\! echo "\033[32m*** ADD 'prices' ***\033[m";
INSERT INTO prices (name, price) VALUES ("main", 920), ("student", 760), ("childs", 590);

\! echo "\033[32m*** ADD 'users' ***\033[m";
INSERT INTO users (
    email,
    firstname,
    lastname,
    password
    )
    VALUES
    ( "john.doe@example.com", "john", "Doe", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"),
    ( "jack@example.com", "jack", "Sparrow", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"),
    ( "bruce@example.com", "Bruce", "Wayne", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"),
    ( "frodon@example.com", "Frodon", "baggins", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"),
    ( "sauron@example.com", "Sauron", "the magic daemon", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"),
    ( "gandalf@example.com", "gandalf", "the magician", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"),
    ( "ragnar@example.com", "ragnar", "lothbrokes", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"),
    ( "kirk@example.com", "kirk", "hammett", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"),
    ( "alexi@example.com", "Alexi", "Laiho", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"),
    ( "david@example.com", "david", "moi", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"), -- 12345678
    ( "jeff@example.com", "Jeff", "Loomis", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"),
    ( "warrel@example.com", "Warrel", "Dane", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"),
    ( "Danny@example.com", "Danny", "Ocean", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"),
    ( "Rusty@example.com", "Rusty", "Ryan", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a"),
    ( "Jordan@example.com", "Jordan", "Belfort", "$2y$10$rJdi/EQoVOI40Zqvb9A5s.SRPUWFSx72bdxZ70/V8IrTpX7lKZ16a");

\! echo "\033[32m*** ADD 'sessions' ***\033[m";
INSERT INTO sessions (movie_id, room_id, date)
    VALUES
    ((SELECT id FROM movies WHERE title="Gemini Man"), (SELECT id FROM rooms WHERE name="Chicago"), "2022-04-25 14:00");

\! echo "\033[32m*** ADD 'tickets' ***\033[m";
INSERT INTO tickets (session_id, user_id, price_id, number, paid)
    VALUES
    ((SELECT id FROM sessions WHERE date="2022-04-25 14:00"), (SELECT id FROM users WHERE firstname="Bruce"),(SELECT id from prices WHERE name="student"), 5, 1);

\! echo "\033[32m*** ADD too much 'tickets' ***\033[m";
INSERT INTO tickets (session_id, user_id, price_id, number, paid)
    VALUES
    ((SELECT id FROM sessions WHERE date="2022-04-25 14:00"), (SELECT id FROM users WHERE firstname="Bruce"),(SELECT id from prices WHERE name="student"), 350, 1);

