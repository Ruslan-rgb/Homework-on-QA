-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:8889
-- Время создания: Янв 31 2020 г., 20:58
-- Версия сервера: 5.7.26
-- Версия PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Biletskyi`
--
CREATE DATABASE IF NOT EXISTS `Biletskyi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Biletskyi`;

-- --------------------------------------------------------

--
-- Структура таблицы `games`
--

CREATE TABLE `games` (
  `Уникальный номер` int(3) NOT NULL,
  `Уникальный номер первого игрока` int(2) NOT NULL,
  `Уникальный номер второго игрока` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `games`
--

INSERT INTO `games` (`Уникальный номер`, `Уникальный номер первого игрока`, `Уникальный номер второго игрока`) VALUES
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

-- --------------------------------------------------------

--
-- Структура таблицы `game_results`
--

CREATE TABLE `game_results` (
  `Уникальный номер` int(3) NOT NULL,
  `Результат игры` set('WIN','LOSE','DRAW') CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `game_results`
--

INSERT INTO `game_results` (`Уникальный номер`, `Результат игры`) VALUES
(1, 'WIN'),
(2, 'WIN'),
(3, 'WIN'),
(4, 'DRAW'),
(5, 'LOSE'),
(6, 'LOSE'),
(7, 'DRAW'),
(8, 'DRAW'),
(9, 'LOSE'),
(10, 'DRAW');

-- --------------------------------------------------------

--
-- Структура таблицы `profiles`
--

CREATE TABLE `profiles` (
  `id` int(3) NOT NULL,
  `Имя` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `Фамилия` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `Электронный адрес` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `Возраст` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `profiles`
--

INSERT INTO `profiles` (`id`, `Имя`, `Фамилия`, `Электронный адрес`, `Возраст`) VALUES
(1, 'Катерина', 'Желанная', 'katia@gmail.com', 29),
(2, 'Макс', 'Раздолбаев', 'maks@gmail.com', 40),
(3, 'Ирина', 'Перина', 'irina@gmail.com', NULL),
(4, 'Инакентий', 'Скорострел', 'inacentiy@gmail.com', NULL),
(5, 'Владимир', 'Ненасытный', 'Vladimir@gmail.com', NULL),
(6, 'Наташа', 'Всегданаша', 'natasha@gmail.com', 20),
(7, 'Денис', 'Нутакое', 'Denis@gmail.cm', 28),
(8, 'Варвара', 'Завсегдатай', 'Varvara@gmail.com', 18),
(9, 'Саша', 'Суралмаша', 'Sasha@gmail.com', 56),
(10, 'Евгения', 'Хорошеенастроение', 'Evgenia@gmail.com', 42);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `Уникальный номер` int(3) UNSIGNED NOT NULL,
  `Имя` varchar(30) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `Пароль` varchar(32) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`Уникальный номер`, `Имя`, `Пароль`) VALUES
(1, 'Рома', '111111'),
(2, 'Анна', '121212'),
(3, 'Дима', '123112'),
(4, 'Борис', '123321'),
(5, 'Генадий', '342156'),
(6, 'Алексей', '23erh4'),
(7, 'Джон', '23ebv5'),
(8, 'Ирина', 'ty56h4'),
(9, 'Гоша', 'hjerh4'),
(10, 'Лариса', '2y6rh4'),
(11, 'Пончик', '23erh4'),
(12, 'Павел', '345rh4'),
(13, 'Наташа', '2ieru4');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`Уникальный номер`),
  ADD KEY `games_ibfk_1` (`Уникальный номер первого игрока`),
  ADD KEY `second_player_id` (`Уникальный номер второго игрока`);

--
-- Индексы таблицы `game_results`
--
ALTER TABLE `game_results`
  ADD PRIMARY KEY (`Уникальный номер`);

--
-- Индексы таблицы `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Уникальный номер`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `games`
--
ALTER TABLE `games`
  MODIFY `Уникальный номер` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `Уникальный номер` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`Уникальный номер первого игрока`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `games_ibfk_2` FOREIGN KEY (`Уникальный номер второго игрока`) REFERENCES `profiles` (`id`);

--
-- Ограничения внешнего ключа таблицы `game_results`
--
ALTER TABLE `game_results`
  ADD CONSTRAINT `game_results_ibfk_1` FOREIGN KEY (`Уникальный номер`) REFERENCES `games` (`Уникальный номер`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
