-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 30 2026 г., 19:15
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kvasna_lavka`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Квас'),
(2, 'Концентрати'),
(3, 'Посуд та сувеніри');

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `phone_number`, `email`) VALUES
(1, 'Іван', 'Петров', '+38 096 556 6655', 'ivan@gmail.com'),
(2, 'Марія', 'Сидорова', '+38 068 223 6577', 'maria@gmail.com'),
(3, 'Олексій', 'Попов', '+38 095 551 1212', 'alex@gmail.com'),
(4, 'Ольга', 'Коломієць', '+38 095 455 4333', 'olga@gmail.com'),
(5, 'Дмитро', 'Солодов', '+38 068 782 1319', 'dima@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `delivery_types`
--

CREATE TABLE `delivery_types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `delivery_types`
--

INSERT INTO `delivery_types` (`id`, `name`, `price`) VALUES
(1, 'Самовивіз', 0.00),
(2, 'Кур\'єром по місту', 50.00),
(3, 'Нова пошта', 140.00),
(4, 'Укрпошта', 70.00);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `delivery_type_id` int(11) DEFAULT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `o_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'новий',
  `total_amount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `delivery_type_id`, `payment_type_id`, `o_date`, `status`, `total_amount`) VALUES
(1, 1, 1, 1, '2026-05-30 17:12:29', 'новий', 378.00),
(2, 2, 3, 3, '2026-05-30 17:12:29', 'виконано', 369.00),
(3, 3, 2, 2, '2026-05-30 17:12:29', 'в роботі', 305.00),
(4, 1, 4, 4, '2026-05-30 17:12:29', 'доставляється', 310.00),
(5, 2, 1, 1, '2026-05-30 17:12:29', 'новий', 453.00),
(6, 4, 3, 3, '2026-05-30 17:12:29', 'виконано', 180.00),
(7, 5, 2, 2, '2026-05-30 17:12:29', 'в роботі', 546.00),
(8, 3, 1, 4, '2026-05-30 17:12:29', 'скасовано', NULL),
(9, 4, 4, 3, '2026-05-30 17:12:29', 'новий', 686.00),
(10, 5, 2, 1, '2026-05-30 17:12:29', 'доставляється', 265.00);

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(10,3) NOT NULL CHECK (`quantity` > 0),
  `price_at_time` decimal(10,2) NOT NULL CHECK (`price_at_time` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price_at_time`) VALUES
(1, 1, 1, 2.000, 65.00),
(2, 1, 2, 1.000, 68.00),
(3, 1, 16, 1.000, 180.00),
(4, 2, 3, 3.000, 75.00),
(5, 2, 4, 2.000, 72.00),
(6, 3, 9, 1.000, 125.00),
(7, 3, 16, 1.000, 180.00),
(8, 4, 1, 2.000, 65.00),
(9, 4, 16, 1.000, 180.00),
(10, 5, 5, 3.000, 78.00),
(11, 5, 6, 2.000, 82.00),
(12, 5, 13, 1.000, 55.00),
(13, 6, 16, 1.000, 180.00),
(14, 7, 7, 4.000, 74.00),
(15, 7, 18, 1.000, 250.00),
(16, 9, 10, 2.000, 118.00),
(17, 9, 14, 1.000, 450.00),
(18, 10, 8, 3.000, 70.00),
(19, 10, 13, 1.000, 55.00);

-- --------------------------------------------------------

--
-- Структура таблицы `payment_types`
--

CREATE TABLE `payment_types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `payment_types`
--

INSERT INTO `payment_types` (`id`, `name`) VALUES
(1, 'Готівкою кур\'єру'),
(2, 'Карткою кур\'єру'),
(3, 'Післяплата'),
(4, 'Онлайн оплата на сайті');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `image_url`) VALUES
(1, 1, 'Квас темний класичний 1л', 65.00, NULL),
(2, 1, 'Квас білий класичний 1л', 68.00, NULL),
(3, 1, 'Квас березовий', 75.00, NULL),
(4, 1, 'Квас горобиновий', 72.00, NULL),
(5, 1, 'Квас вишневий', 78.00, NULL),
(6, 1, 'Квас медовий', 82.00, NULL),
(7, 1, 'Квас журавлиний', 74.00, NULL),
(8, 1, 'Квас буряковий', 70.00, NULL),
(9, 2, 'Концентрат \"Жовта бочка\" 0.5л', 125.00, NULL),
(10, 2, 'Концентрат \"Білий\" 0.5л', 118.00, NULL),
(11, 2, 'Концентрат \"Журавлиний\" 0.5л', 122.00, NULL),
(12, 2, 'Концентрат \"Медовий\" 0.5л', 128.00, NULL),
(13, 3, 'Магніт \"Квас\"', 55.00, NULL),
(14, 3, 'Футболка \"Квасне товариство\"', 450.00, NULL),
(15, 3, 'Брелок бочка', 65.00, NULL),
(16, 3, 'Квасник 1л', 180.00, NULL),
(17, 3, 'Бокал для кваса 0.3л', 95.00, NULL),
(18, 3, 'Графін 2л', 250.00, NULL),
(19, 3, 'Дерев\'яна кружка 0.4л', 160.00, NULL),
(20, 3, 'Набір гранених стаканів', 140.00, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `stock`
--

CREATE TABLE `stock` (
  `product_id` int(11) NOT NULL,
  `quantity` decimal(12,3) NOT NULL DEFAULT 0.000,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `stock`
--

INSERT INTO `stock` (`product_id`, `quantity`, `last_updated`) VALUES
(1, 150.000, '2026-05-30 17:12:29'),
(2, 90.000, '2026-05-30 17:12:29'),
(3, 60.000, '2026-05-30 17:12:29'),
(4, 45.000, '2026-05-30 17:12:29'),
(5, 40.000, '2026-05-30 17:12:29'),
(6, 35.000, '2026-05-30 17:12:29'),
(7, 80.000, '2026-05-30 17:12:29'),
(8, 25.000, '2026-05-30 17:12:29'),
(9, 50.000, '2026-05-30 17:12:29'),
(10, 45.000, '2026-05-30 17:12:29'),
(11, 30.000, '2026-05-30 17:12:29'),
(12, 25.000, '2026-05-30 17:12:29'),
(13, 100.000, '2026-05-30 17:12:29'),
(14, 20.000, '2026-05-30 17:12:29'),
(15, 60.000, '2026-05-30 17:12:29'),
(16, 35.000, '2026-05-30 17:12:29'),
(17, 50.000, '2026-05-30 17:12:29'),
(18, 15.000, '2026-05-30 17:12:29'),
(19, 30.000, '2026-05-30 17:12:29'),
(20, 12.000, '2026-05-30 17:12:29');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD KEY `idx_customers_phone` (`phone_number`);

--
-- Индексы таблицы `delivery_types`
--
ALTER TABLE `delivery_types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `delivery_type_id` (`delivery_type_id`),
  ADD KEY `payment_type_id` (`payment_type_id`),
  ADD KEY `idx_orders_customer` (`customer_id`),
  ADD KEY `idx_orders_status` (`status`),
  ADD KEY `idx_orders_date` (`o_date`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_order_items_order` (`order_id`),
  ADD KEY `idx_order_items_product` (`product_id`);

--
-- Индексы таблицы `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `idx_products_category` (`category_id`);

--
-- Индексы таблицы `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `delivery_types`
--
ALTER TABLE `delivery_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`delivery_type_id`) REFERENCES `delivery_types` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`id`);

--
-- Ограничения внешнего ключа таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
