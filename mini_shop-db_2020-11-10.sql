-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1:3306
-- 產生時間： 2020-11-10 05:32:36
-- 伺服器版本： 8.0.18
-- PHP 版本： 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `mini_shop`
--

-- --------------------------------------------------------

--
-- 資料表結構 `bill`
--

CREATE TABLE `bill` (
  `bill_sn` mediumint(8) UNSIGNED NOT NULL COMMENT '帳單編號',
  `user_sn` mediumint(8) UNSIGNED NOT NULL COMMENT '購買人',
  `bill_total` mediumint(8) UNSIGNED NOT NULL COMMENT '總金額',
  `bill_date` datetime NOT NULL COMMENT '購買日期',
  `bill_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '處理狀態'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `bill`
--

INSERT INTO `bill` (`bill_sn`, `user_sn`, `bill_total`, `bill_date`, `bill_status`) VALUES
(1, 1224, 5000, '2020-11-03 06:37:54', '已出貨'),
(2, 1224, 25000, '2020-11-09 06:27:46', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `bill_detail`
--

CREATE TABLE `bill_detail` (
  `bill_sn` mediumint(8) UNSIGNED NOT NULL COMMENT '帳單編號',
  `goods_sn` mediumint(8) UNSIGNED NOT NULL COMMENT '商品編號',
  `goods_amount` tinyint(3) UNSIGNED NOT NULL COMMENT '購買數量',
  `goods_total` mediumint(8) UNSIGNED NOT NULL COMMENT '小計'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `bill_detail`
--

INSERT INTO `bill_detail` (`bill_sn`, `goods_sn`, `goods_amount`, `goods_total`) VALUES
(1, 3, 1, 5000),
(2, 3, 1, 5000),
(2, 2, 1, 10000),
(2, 1, 1, 10000);

-- --------------------------------------------------------

--
-- 資料表結構 `goods`
--

CREATE TABLE `goods` (
  `goods_sn` mediumint(8) UNSIGNED NOT NULL COMMENT '商品編號',
  `goods_title` varchar(255) NOT NULL COMMENT '商品名稱',
  `goods_content` text NOT NULL COMMENT '商品說明',
  `goods_price` mediumint(8) UNSIGNED NOT NULL COMMENT '商品價錢',
  `goods_counter` smallint(5) UNSIGNED NOT NULL COMMENT '人氣',
  `goods_date` datetime NOT NULL COMMENT '上架日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `goods`
--

INSERT INTO `goods` (`goods_sn`, `goods_title`, `goods_content`, `goods_price`, `goods_counter`, `goods_date`) VALUES
(6, '香蕉貼牆上', '<p>如附圖所示</p>\r\n', 10000000, 1, '2020-11-09 06:54:15'),
(5, '星空', '', 10000000, 1, '2020-11-09 06:51:15'),
(4, '貓', '', 10000, 1, '2020-11-09 06:49:30');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `user_sn` mediumint(8) UNSIGNED NOT NULL COMMENT '使用者編號',
  `user_name` varchar(255) NOT NULL COMMENT '使用者姓名',
  `user_id` varchar(255) NOT NULL COMMENT '使用者帳號',
  `user_passwd` varchar(255) NOT NULL COMMENT '使用者密碼',
  `user_email` varchar(255) NOT NULL COMMENT '使用者信箱',
  `user_sex` enum('先生','女士') NOT NULL COMMENT '使用者性別',
  `user_tel` varchar(255) NOT NULL COMMENT '使用者電話',
  `user_zip` varchar(255) NOT NULL COMMENT '使用者郵遞區號',
  `user_county` varchar(255) NOT NULL COMMENT '使用者縣市',
  `user_district` varchar(255) NOT NULL COMMENT '使用者鄉鎮市區',
  `user_address` varchar(255) NOT NULL COMMENT '使用者地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`user_sn`, `user_name`, `user_id`, `user_passwd`, `user_email`, `user_sex`, `user_tel`, `user_zip`, `user_county`, `user_district`, `user_address`) VALUES
(1223, 'mark', 'mark', '123456', '107b33536@gmail.com', '先生', '00-0000000000', 'sdad', 'asdasd', 'sadas', 'sdasdd'),
(1224, '林祐群', 'bcatqq', '$2y$10$PAkDiUn13kFLXHmFOfGOwuHeEZHJ.t/sLt8dIvj6Rd6lkzXVIzZ.y', 'bcatsddpoq@gmail.com', '先生', '049878741', '696', '南投縣', '南投市', '長大路1號');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_sn`);

--
-- 資料表索引 `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`bill_sn`,`goods_sn`);

--
-- 資料表索引 `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`goods_sn`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_sn`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_sn` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '帳單編號', AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `goods`
--
ALTER TABLE `goods`
  MODIFY `goods_sn` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品編號', AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `user_sn` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '使用者編號', AUTO_INCREMENT=1225;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
