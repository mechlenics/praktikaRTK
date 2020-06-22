-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 22 2020 г., 19:53
-- Версия сервера: 10.3.9-MariaDB
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bez_reg`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`ID`, `admin`, `Password`) VALUES
(1, 'admin123', 'b9d11b3be25f5a1a7dc8ca04cd310b28');

-- --------------------------------------------------------

--
-- Структура таблицы `confirmation`
--

CREATE TABLE `confirmation` (
  `ID` int(11) NOT NULL,
  `search_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `data_user`
--

CREATE TABLE `data_user` (
  `ID` int(11) NOT NULL,
  `Password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `User_id` int(11) NOT NULL,
  `MYtrip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `day`
--

CREATE TABLE `day` (
  `ID` int(11) NOT NULL,
  `_date_` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `mytrip`
--

CREATE TABLE `mytrip` (
  `ID` int(11) NOT NULL,
  `Ticketing_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `of_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `passenger`
--

CREATE TABLE `passenger` (
  `ID` int(11) NOT NULL,
  `Passenger` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `profile`
--

CREATE TABLE `profile` (
  `ID` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `ID` int(11) NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`ID`, `role`) VALUES
(0, 'Рядовой'),
(1, 'Сержант'),
(2, 'Ветеран'),
(3, 'Admin'),
(4, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `search`
--

CREATE TABLE `search` (
  `ID` int(11) NOT NULL,
  `Where from_id` int(11) NOT NULL,
  `__Where__id` int(11) NOT NULL,
  `Day_id` int(11) NOT NULL,
  `Trip_id` int(11) NOT NULL,
  `Passenger_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `trip`
--

CREATE TABLE `trip` (
  `ID` int(11) NOT NULL,
  `Where from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `__Where__` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Day` date NOT NULL,
  `Arrivals` time NOT NULL,
  `Time in road` time NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `trip`
--

INSERT INTO `trip` (`ID`, `Where from`, `__Where__`, `Day`, `Arrivals`, `Time in road`, `price`) VALUES
(1, 'Санкт-Петербург', 'Москва', '2020-06-22', '06:00:00', '14:10:00', 1999);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Surname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`ID`, `email`, `login`, `password`, `name`, `Surname`, `role`) VALUES
(12, '2222222222222@mail.ru', 'sashka2020', '25d55ad283aa400af464c76d713c07ad', 'Александр', 'Минхаиров', 3),
(13, '$email', '$login', '$pass', '$name', NULL, 2),
(14, '$email', '$login', '$pass', '$name', NULL, 0),
(15, 'kakinin212@gmail.com', 'kakinin212', '25d55ad283aa400af464c76d713c07ad', 'Александр', 'Калинин', 2),
(16, 'dfgfgdfdd@mail.com', 'qwerjktytrr', '25d55ad283aa400af464c76d713c07ad', 'qwertyuhkjgkg', NULL, 0),
(17, 'test1@mail.com', 'test1111', '25d55ad283aa400af464c76d713c07ad', 'test1111', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `where from`
--

CREATE TABLE `where from` (
  `ID` int(11) NOT NULL,
  `Cite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `__where__`
--

CREATE TABLE `__where__` (
  `ID` int(11) NOT NULL,
  `Cite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `confirmation`
--
ALTER TABLE `confirmation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `search_id` (`search_id`);

--
-- Индексы таблицы `data_user`
--
ALTER TABLE `data_user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `mytrip_id` (`MYtrip_id`);

--
-- Индексы таблицы `day`
--
ALTER TABLE `day`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `mytrip`
--
ALTER TABLE `mytrip`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Ticketing_id` (`Ticketing_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Admin_id` (`Admin_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID`) USING BTREE;

--
-- Индексы таблицы `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Where from_id` (`Where from_id`),
  ADD KEY `Day_id` (`Day_id`),
  ADD KEY `Passenger_id` (`Passenger_id`),
  ADD KEY `trip_id` (`Trip_id`),
  ADD KEY `__Where__id` (`__Where__id`) USING BTREE;

--
-- Индексы таблицы `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `role` (`role`);

--
-- Индексы таблицы `where from`
--
ALTER TABLE `where from`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `__where__`
--
ALTER TABLE `__where__`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `mytrip`
--
ALTER TABLE `mytrip`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `confirmation`
--
ALTER TABLE `confirmation`
  ADD CONSTRAINT `confirmation_ibfk_1` FOREIGN KEY (`search_id`) REFERENCES `search` (`ID`);

--
-- Ограничения внешнего ключа таблицы `data_user`
--
ALTER TABLE `data_user`
  ADD CONSTRAINT `data_user_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `data_user_ibfk_2` FOREIGN KEY (`MYtrip_id`) REFERENCES `mytrip` (`ID`);

--
-- Ограничения внешнего ключа таблицы `mytrip`
--
ALTER TABLE `mytrip`
  ADD CONSTRAINT `mytrip_ibfk_1` FOREIGN KEY (`Ticketing_id`) REFERENCES `trip` (`ID`),
  ADD CONSTRAINT `mytrip_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`);

--
-- Ограничения внешнего ключа таблицы `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`Admin_id`) REFERENCES `admin` (`ID`),
  ADD CONSTRAINT `profile_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`ID`);

--
-- Ограничения внешнего ключа таблицы `search`
--
ALTER TABLE `search`
  ADD CONSTRAINT `search_ibfk_1` FOREIGN KEY (`Where from_id`) REFERENCES `where from` (`ID`),
  ADD CONSTRAINT `search_ibfk_2` FOREIGN KEY (`__Where__id`) REFERENCES `__where__` (`ID`),
  ADD CONSTRAINT `search_ibfk_3` FOREIGN KEY (`Day_id`) REFERENCES `day` (`ID`),
  ADD CONSTRAINT `search_ibfk_5` FOREIGN KEY (`Passenger_id`) REFERENCES `passenger` (`ID`),
  ADD CONSTRAINT `search_ibfk_7` FOREIGN KEY (`Trip_id`) REFERENCES `trip` (`ID`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
