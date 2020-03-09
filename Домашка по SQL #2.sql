
CREATE DATABASE IF NOT EXISTS `Biletskyi`;
USE `Biletskyi`;


CREATE TABLE `users` (
  `id` int(3) NOT NULL,
  `login` varchar(30) NOT NULL,
  `PASSWORD` varchar(32) NOT NULL
);


INSERT INTO `users` (`id`, `login`, `PASSWORD`) VALUES
(1, 'bobik', '111111'),
(2, 'tomik', '121212'),
(3, 'conorik', '123112'),
(4, 'tonik', '123321'),
(5, 'alexik', '342156'),
(6, 'michalik', '23erh4'),
(7, 'katik', '23ebv5'),
(8, 'rusla', 'ty56h4'),
(9, 'lisik', 'hjerh4'),
(10, 'ritik', '2y6rh4'),
(11, 'lorik', '239865'),
(12, 'chepchik', '987012'),
(13, 'kylek', '564787'),
(14, 'rama', '454323'),
(15, 'kara', '888222');



CREATE TABLE `profiles` (
  `id` int(3) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `age` int(3)
);


INSERT INTO `profiles` (`id`, `first_name`, `last_name`, `email`, `age`) VALUES
(1, 'Bob', 'Broun', 'katia@gmail.com', 29),
(2, 'Tom', 'Smith', 'maks@gmail.com', 40),
(3, 'Conor', 'Cody', 'irina@gmail.com', NULL),
(4, 'Tony', 'Black', 'inacentiy@gmail.com', NULL),
(5, 'Alex', 'Sherman', 'Vladimir@gmail.com', NULL),
(6, 'Michael', 'While', 'natasha@gmail.com', 20),
(7, 'Kate', 'Argent', 'Denis@gmail.cm', 28),
(8, 'Ruslan', 'Cruise', 'Varvara@gmail.com', 18),
(9, 'Lisa', 'Polen', 'sasha@gmail.com', 56),
(10, 'Rita', 'Noby', 'Evgenia@gmail.com', 42);



CREATE TABLE `games` (
  `id` int(3) NOT NULL,
  `first_player_id` int(2) NOT NULL,
  `second_player_id` int(2) NOT NULL
  );

INSERT INTO `games` (`id`, `first_player_id`, `second_player_id`) VALUES
(1, 2, 5),
(2, 3, 2),
(3, 10, 3),
(4, 9, 7),
(5, 5, 1),
(6, 4, 8),
(7, 7, 5),
(8, 3, 4),
(9, 2, 9),
(10, 6, 3);


CREATE TABLE `game_results` (
  `id` int(3) NOT NULL,
  `result_value` set('WIN','LOSE','DRAW','') NOT NULL
);


INSERT INTO `game_results` (`id`, `result_value`) VALUES
(1, 'WIN'),
(2, 'LOSE'),
(3, 'LOSE');


DELETE FROM users WHERE id = 15;
DELETE FROM users WHERE id = 14;
UPDATE game_results SET result_value = 'DRAW' WHERE game_results.id = 3;
UPDATE `profiles` SET `first_name`='bob' WHERE profiles.id = 5;



CREATE TABLE `achievements` (
  `id` int(2) NOT NULL,
  `achiev_name` varchar(20)
);


INSERT INTO `achievements` (`id`, `achiev_name`) VALUES
(1, 'newbie'),
(2, 'newbie'),
(3, 'master'),
(4, 'specialist'),
(5, 'newbie'),
(6, 'master');



CREATE TABLE `player_achievs` (
  `id` int(2) NOT NULL,
  `player_id` int(2),
  `achiev_id` int(2)
);


INSERT INTO `player_achievs` (`id`, `player_id`, `achiev_id`) VALUES
(1, 3, 5),
(2, 3, 4),
(3, 3, 1),
(4, 1, 6),
(5, 8, 3),
(6, 10, 2);


CREATE TABLE `player_result` (
  `id` int(2) NOT NULL,
  `player_id` int(2),
  `result_id`int(2)
);

INSERT INTO `player_result` (`id`, `player_id`, `result_id`) VALUES
(1, 4, 2),
(2, 6, 1),
(3, 4, 2),
(4, 9, 3),
(5, 5, 3),
(6, 1, 2),
(7, 3, 1);


ALTER TABLE games ADD column  winner_id int(2);

UPDATE games SET winner_id = 2 WHERE games.id = 1;
UPDATE games SET winner_id = 9 WHERE games.id = 4;
UPDATE games SET winner_id = 4 WHERE games.id = 6;
UPDATE games SET winner_id = 7 WHERE games.id = 7;
UPDATE games SET winner_id = 5 WHERE games.id = 5;

ALTER TABLE `users` ADD PRIMARY KEY (`id`);

ALTER TABLE `profiles` ADD CONSTRAINT `P_U` FOREIGN KEY (`id`) REFERENCES `users`(`id`);

ALTER TABLE `games` ADD CONSTRAINT `G_first_P` FOREIGN KEY (`first_player_id`) REFERENCES `profiles`(`id`);

ALTER TABLE `games` ADD CONSTRAINT `G_second_P` FOREIGN KEY (`second_player_id`) REFERENCES `profiles`(`id`);

ALTER TABLE `games` ADD CONSTRAINT `G_winner_P` FOREIGN KEY (`winner_id`) REFERENCES `profiles`(`id`);


ALTER TABLE `player_achievs` ADD CONSTRAINT `P_player_P` FOREIGN KEY (`player_id`) REFERENCES `profiles`(`id`);

ALTER TABLE `achievements` ADD PRIMARY KEY (`id`);

ALTER TABLE `player_achievs` ADD CONSTRAINT `P_achiev_A` FOREIGN KEY (`achiev_id`) REFERENCES `achievements`(`id`);

ALTER TABLE `player_result` ADD CONSTRAINT `P_player_r_P` FOREIGN KEY (`player_id`) REFERENCES `profiles`(`id`);

ALTER TABLE `game_results` ADD PRIMARY KEY (`id`);

ALTER TABLE `player_result` ADD CONSTRAINT `P_result_G` FOREIGN KEY (`result_id`) REFERENCES `game_results`(`id`);



