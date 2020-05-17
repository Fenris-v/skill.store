-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 17 2020 г., 14:15
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `store_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `name`, `url`) VALUES
(1, 'Главная', '/'),
(2, 'Товары', '/admin/products/'),
(3, 'Заказы', '/admin/orders/'),
(4, 'Выйти', '?logout=yes');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `url`) VALUES
(1, 'Все', '/'),
(2, 'Женщины', '/women/'),
(3, 'Мужчины', '/men/'),
(4, 'Дети', '/children/'),
(5, 'Аксессуары', '/accessories/');

-- --------------------------------------------------------

--
-- Структура таблицы `config`
--

CREATE TABLE `config` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `config`
--

INSERT INTO `config` (`name`, `value`, `image_id`) VALUES
('charset', 'utf-8', NULL),
('cost_delivery', '280', NULL),
('description', 'Fashion - интернет-магазин', NULL),
('favicon', NULL, 11),
('keywords', 'Fashion, интернет-магазин, одежда, аксессуары', NULL),
('lang', 'ru', NULL),
('logo', NULL, 10),
('logo-footer', NULL, 12),
('min_dilevery', '2000', NULL),
('theme-color', '#393939', NULL),
('title', 'Fashion', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `delivery`
--

INSERT INTO `delivery` (`id`, `type`) VALUES
(1, 'Самовывоз'),
(2, 'Курьерная доставка');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) NOT NULL DEFAULT 0,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `new` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `name`, `desc`, `price`, `sale`, `new`) VALUES
(1, 'Платье со складками', NULL, '2999', 1, 0),
(2, 'Шорты и рубашка', NULL, '2999', 1, 0),
(3, 'Часы мужские', NULL, '2999', 1, 0),
(4, 'Штаны полосатые', NULL, '2999', 1, 0),
(5, 'Сумка кожаная', NULL, '2999', 1, 0),
(6, 'Очки красные', NULL, '2999', 1, 0),
(7, 'Плащ женский', NULL, '2999', 1, 0),
(8, 'Джинсы женские', NULL, '2999', 1, 1),
(9, 'Туфли женские', NULL, '2999', 1, 1),
(17, 'Рубашка на завязках', 'Модная мужская рубашка свободного покроя. Застежка выполнена в виде завязок спереди. На рубашке имеется воротник-стойка.', '5000', 1, 1),
(18, 'Шляпка с лентой', 'Женская шляпка из сатина, выполнена в светлых тонах, в то время как черная шелковая лента создаёт прекрасный цветовой контраст. ', '1300', 1, 1),
(19, 'Туфли бежевые', NULL, '4000', 1, 0),
(20, 'Худи серое', 'Красивое худи приятного светло-серого цвета. Подойдёт как для домашних посиделок', '3000', 0, 0),
(21, 'Мужская толстовка(хаки)', NULL, '3000', 0, 0),
(22, 'Жакет джинсовый(бежевый)', NULL, '5000', 0, 0),
(23, 'Футболка с надписью', NULL, '1500', 0, 0),
(24, 'Школьная форма для девочки', 'Комлект школьной формы', '6000', 0, 0),
(25, 'Комплект платье и снуд', NULL, '8000', 0, 0),
(26, 'Спортивная куртка-безрукавка для мальчика', NULL, '4000', 0, 1),
(27, 'Пышное платье', NULL, '1800', 1, 1),
(28, 'Туфли с блёстками', 'Туфли с блёстками', '5000', 1, 1),
(29, 'Классический женский пиджак', NULL, '4000', 1, 1),
(30, 'Платье с бантиком', NULL, '3000', 1, 1),
(31, 'Костюм для гимнастики', 'Отлично подойдёт для занятий гимнастикой и йогой.', '3500', 1, 0),
(32, 'Сапоги монгольские мужские', NULL, '9000', 1, 0),
(33, 'Сапоги резиновые зимние', NULL, '4500', 1, 0),
(34, 'Кожаные ботинки', NULL, '11000', 1, 0),
(35, 'Сапоги с медведем', NULL, '5000', 1, 0),
(36, 'Рубашка атласная', NULL, '6000', 1, 0),
(37, 'Гавайская рубашка', NULL, '3500', 1, 0),
(38, 'Белые брюки', NULL, '4000', 1, 1),
(39, 'Брюки со стрелкой', NULL, '4000', 0, 1),
(40, 'Блузка с кружевом', NULL, '7000', 0, 1),
(41, 'Зеленая рубашка', NULL, '4000', 0, 1),
(42, 'Топ Puma', NULL, '3500', 0, 1),
(43, 'Платье с розочками', NULL, '4000', 0, 1),
(44, 'Платье Today My Way', NULL, '4500', 0, 1),
(49, 'Футболка Серфер', NULL, '1200', 0, 1),
(101, 'Tesla Roadster', NULL, '14999', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `goods_orders`
--

CREATE TABLE `goods_orders` (
  `good_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `good_category`
--

CREATE TABLE `good_category` (
  `good_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `good_category`
--

INSERT INTO `good_category` (`good_id`, `category_id`) VALUES
(1, 2),
(2, 2),
(3, 3),
(3, 5),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(17, 3),
(18, 2),
(18, 5),
(19, 2),
(19, 5),
(20, 2),
(21, 3),
(22, 3),
(23, 3),
(24, 4),
(25, 2),
(26, 4),
(27, 4),
(28, 2),
(28, 5),
(29, 2),
(30, 4),
(31, 4),
(32, 3),
(32, 5),
(33, 4),
(33, 5),
(34, 2),
(34, 5),
(35, 4),
(35, 5),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 2),
(41, 2),
(42, 2),
(43, 4),
(44, 4),
(49, 4),
(101, 2),
(101, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `good_image`
--

CREATE TABLE `good_image` (
  `good_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `good_image`
--

INSERT INTO `good_image` (`good_id`, `image_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(17, 13),
(18, 14),
(19, 15),
(19, 42),
(19, 48),
(20, 16),
(21, 17),
(22, 18),
(22, 43),
(22, 49),
(23, 19),
(23, 44),
(23, 50),
(24, 20),
(25, 21),
(26, 22),
(27, 23),
(28, 24),
(29, 25),
(29, 45),
(29, 51),
(30, 26),
(31, 27),
(31, 46),
(31, 52),
(32, 28),
(33, 29),
(34, 30),
(35, 31),
(36, 32),
(36, 47),
(36, 53),
(37, 33),
(38, 34),
(39, 35),
(40, 36),
(41, 37),
(42, 38),
(43, 39),
(44, 40),
(49, 41),
(101, 85);

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `name`) VALUES
(1, 'Администратор'),
(2, 'Покупатель');

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `link`, `alt`) VALUES
(1, '/templates/img/products/product-1.jpg', NULL),
(2, '/templates/img/products/product-2.jpg', NULL),
(3, '/templates/img/products/product-3.jpg', NULL),
(4, '/templates/img/products/product-4.jpg', NULL),
(5, '/templates/img/products/product-5.jpg', NULL),
(6, '/templates/img/products/product-6.jpg', NULL),
(7, '/templates/img/products/product-7.jpg', NULL),
(8, '/templates/img/products/product-8.jpg', NULL),
(9, '/templates/img/products/product-9.jpg', NULL),
(10, '/templates/img/logo.svg', 'Fashion'),
(11, '/templates/img/favicon.png', NULL),
(12, '/templates/img/logo--footer.svg', NULL),
(13, '/templates/img/products/azian.jpg', NULL),
(14, '/templates/img/products/cream-hat.jpg', NULL),
(15, '/templates/img/products/cream-shoes.jpg', NULL),
(16, '/templates/img/products/gray.jpg', NULL),
(17, '/templates/img/products/haki.jpg', NULL),
(18, '/templates/img/products/jacket.jpg', NULL),
(19, '/templates/img/products/man.jpg', NULL),
(20, '/templates/img/products/school-dress.jpg', NULL),
(21, '/templates/img/products/snood.jpg', NULL),
(22, '/templates/img/products/sport-jacket.jpg', NULL),
(23, '/templates/img/products/white.jpg', NULL),
(24, '/templates/img/products/sparkles-shoes.jpg', NULL),
(25, '/templates/img/products/strong.jpg', NULL),
(26, '/templates/img/products/white-dress.jpg', NULL),
(27, '/templates/img/products/yoga.jpg', NULL),
(28, '/templates/img/products/mongol.jpg', NULL),
(29, '/templates/img/products/winter-shoes.jpg', NULL),
(30, '/templates/img/products/skin.jpg', NULL),
(31, '/templates/img/products/bear.jpg', NULL),
(32, '/templates/img/products/atlas.jpg', NULL),
(33, '/templates/img/products/ghavai.jpg', NULL),
(34, '/templates/img/products/white-pants.jpg', NULL),
(35, '/templates/img/products/string.jpg', NULL),
(36, '/templates/img/products/kruj.jpg', NULL),
(37, '/templates/img/products/green.jpg', NULL),
(38, '/templates/img/products/puma.jpg', NULL),
(39, '/templates/img/products/rose.jpg', NULL),
(40, '/templates/img/products/today.jpg', NULL),
(41, '/templates/img/products/serf.jpg', NULL),
(42, '/templates/img/products/pretty-shoes.jpg', NULL),
(43, '/templates/img/products/black-orange.jpg', NULL),
(44, '/templates/img/products/error.jpg', NULL),
(45, '/templates/img/products/striped-jacket.jpg', NULL),
(46, '/templates/img/products/stretch-blue.jpg', NULL),
(47, '/templates/img/products/blue.jpg', NULL),
(48, '/templates/img/products/legs-shoes.jpg', NULL),
(49, '/templates/img/products/jacket-light.jpg', NULL),
(50, '/templates/img/products/made.jpg', NULL),
(51, '/templates/img/products/blondie.jpg', NULL),
(52, '/templates/img/products/usa.jpg', NULL),
(53, '/templates/img/products/suit.jpg', NULL),
(85, '/templates/img/new/roadster-earth.png', NULL),
(86, '/templates/img/new/spacex.jpeg', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `int` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`int`, `name`, `url`) VALUES
(1, 'Главная', '/'),
(2, 'Новинки', '/?new=on'),
(3, 'Sale', '/?sale=on'),
(4, 'Доставка', '/delivery/');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `patronymic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods` int(11) NOT NULL,
  `sum` int(11) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `surname`, `name`, `patronymic`, `phone`, `mail`, `delivery_id`, `city`, `street`, `home`, `app`, `payment_id`, `comment`, `goods`, `sum`, `completed`) VALUES
(8, 'Ivanov', 'Ivan', 'Ivanovich', '+79999999999', 'test@gmail.com', 1, NULL, NULL, NULL, NULL, 1, 'New comment', 36, 6000, 1),
(9, 'Петров', 'Петр', 'Петрович', '+79999999999', 'petrovich@gmail.com', 2, 'Санкт-Петербург', 'Средний проспект В.О.', '10', '15', 1, 'Доставить побыстрее', 32, 9000, 0),
(10, 'Дмитриенко', 'Виктория', 'Вячеславовна', '+79999999999', 'vika@mail.ru', 2, 'Таганчик', 'Греческая', '33', '13', 1, '', 39, 4000, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `payment`
--

INSERT INTO `payment` (`id`, `type`) VALUES
(1, 'Наличные'),
(2, 'Банковской картой');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `groups` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `groups`) VALUES
(1, 'Петрович', 'petrovich@gmail.com', '$2y$10$Ud6g3G6VoEroksmn4Yo4rOblhPYHPtqoO1JAaNLB/k9xh.vX4QwOG', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user_group`
--

CREATE TABLE `user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `config`
--
ALTER TABLE `config`
  ADD UNIQUE KEY `config_name_uindex` (`name`),
  ADD KEY `config_images_id_fk` (`image_id`);

--
-- Индексы таблицы `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `goods_orders`
--
ALTER TABLE `goods_orders`
  ADD PRIMARY KEY (`good_id`,`order_id`),
  ADD KEY `goods_orders_orders_id_fk` (`order_id`);

--
-- Индексы таблицы `good_category`
--
ALTER TABLE `good_category`
  ADD PRIMARY KEY (`good_id`,`category_id`),
  ADD KEY `good_category_categories_id_fk` (`category_id`);

--
-- Индексы таблицы `good_image`
--
ALTER TABLE `good_image`
  ADD PRIMARY KEY (`good_id`,`image_id`),
  ADD KEY `good_image_images_id_fk` (`image_id`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`int`),
  ADD UNIQUE KEY `menu_name_uindex` (`name`),
  ADD UNIQUE KEY `menu_url_uindex` (`url`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_delivery_id_fk` (`delivery_id`),
  ADD KEY `orders_payment_id_fk` (`payment_id`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_uindex` (`email`),
  ADD KEY `users_groups_id_fk` (`groups`);

--
-- Индексы таблицы `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `user_group_groups_id_fk` (`group_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `int` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `config`
--
ALTER TABLE `config`
  ADD CONSTRAINT `config_images_id_fk` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `goods_orders`
--
ALTER TABLE `goods_orders`
  ADD CONSTRAINT `goods_orders_goods_id_fk` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `goods_orders_orders_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `good_category`
--
ALTER TABLE `good_category`
  ADD CONSTRAINT `good_category_categories_id_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `good_category_goods_id_fk` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `good_image`
--
ALTER TABLE `good_image`
  ADD CONSTRAINT `good_image_goods_id_fk` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `good_image_images_id_fk` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_groups_id_fk` FOREIGN KEY (`groups`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `user_group_groups_id_fk` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_group_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
