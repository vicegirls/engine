﻿-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Vært: localhost
-- Genereringstid: 14. 10 2010 kl. 19:36:01
-- Serverversion: 5.1.36
-- PHP-version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tuxxedo`
--

-- --------------------------------------------------------

ALTER TABLE `styles` ADD `templateids` mediumtext NOT NULL;