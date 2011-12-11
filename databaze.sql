-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vygenerováno: Středa 15. prosince 2010, 22:06
-- Verze MySQL: 5.1.36
-- Verze PHP: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Databáze: `dt`
--

DROP DATABASE IF EXISTS dt;
CREATE DATABASE dt;

USE dt;

-- --------------------------------------------------------

--
-- Struktura tabulky `druh_akce`
--

CREATE TABLE IF NOT EXISTS `druh_akce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazev` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `druh_akce`
--

INSERT INTO `druh_akce` (`id`, `nazev`) VALUES
(1, 'Jednodenní akce'),
(2, 'Vícedenní akce'),
(3, 'Schůzka');

-- --------------------------------------------------------

--
-- Struktura tabulky `druh_schuzky`
--

CREATE TABLE IF NOT EXISTS `druh_schuzky` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazev` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `druh_schuzky`
--

INSERT INTO `druh_schuzky` (`id`, `nazev`) VALUES
(1, 'organizační'),
(2, 'programová');

-- --------------------------------------------------------

--
-- Struktura tabulky `jednodenni_akce`
--

CREATE TABLE IF NOT EXISTS `jednodenni_akce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `misto` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `termin` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `cena` int(11) NOT NULL,
  `cas_navratu` date NOT NULL,
  `cas_odjezdu` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `jednodenni_akce`
--

INSERT INTO `jednodenni_akce` (`id`, `misto`, `termin`, `cena`, `cas_navratu`, `cas_odjezdu`) VALUES
(2, 'Tetřevický zámeček', '11.1.2011', 150, '2010-12-11', '2010-12-11'),
(3, 'Další výlet', 'příští víkend', 320, '2010-12-24', '2010-12-25');

-- --------------------------------------------------------

--
-- Struktura tabulky `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazev` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=7 ;

--
-- Vypisuji data pro tabulku `role`
--

INSERT INTO `role` (`id`, `nazev`) VALUES
(1, 'Hlavní vedoucí'),
(2, 'Hospodář'),
(3, 'Zdravotník'),
(4, 'Kuchař'),
(5, 'Oddílový vedoucí'),
(6, 'Praktikant');

-- --------------------------------------------------------

--
-- Struktura tabulky `schuzka`
--

CREATE TABLE IF NOT EXISTS `schuzka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `druh_akce` int(11) NOT NULL,
  `id_akce` int(11) NOT NULL,
  `druh_schuzky` int(11) NOT NULL,
  `misto` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `termin` date NOT NULL,
  `poradi` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

--
-- Vypisuji data pro tabulku `schuzka`
--


-- --------------------------------------------------------

--
-- Struktura tabulky `ubytovani`
--

CREATE TABLE IF NOT EXISTS `ubytovani` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazev` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=7 ;

--
-- Vypisuji data pro tabulku `ubytovani`
--

INSERT INTO `ubytovani` (`id`, `nazev`) VALUES
(1, 'stan'),
(2, 'chatka'),
(3, 'pod širákem'),
(4, 'zděný objekt'),
(5, 'tělocvična'),
(6, 'jiné');

-- --------------------------------------------------------

--
-- Struktura tabulky `ucast_na_akci`
--

CREATE TABLE IF NOT EXISTS `ucast_na_akci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `akce_id` int(11) NOT NULL,
  `uzivatel_id` int(11) NOT NULL,
  `druh_akce` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=11 ;

--
-- Vypisuji data pro tabulku `ucast_na_akci`
--

INSERT INTO `ucast_na_akci` (`id`, `akce_id`, `uzivatel_id`, `druh_akce`) VALUES
(1, 2, 3, 1),
(2, 2, 5, 1),
(3, 1, 1, 2),
(4, 1, 2, 2),
(5, 1, 6, 2),
(6, 3, 8, 1),
(7, 3, 7, 1),
(8, 3, 4, 1),
(9, 3, 1, 1),
(10, 3, 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `ukol`
--

CREATE TABLE IF NOT EXISTS `ukol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_schuzka` int(11) NOT NULL,
  `id_uzivatel` int(11) NOT NULL,
  `termin` date NOT NULL,
  `zadani` text COLLATE utf8_czech_ci NOT NULL,
  `splneno` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

--
-- Vypisuji data pro tabulku `ukol`
--


-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatel`
--

CREATE TABLE IF NOT EXISTS `uzivatel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `heslo` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `jmeno` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `telefon` int(12) NOT NULL,
  `roleID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=11 ;

--
-- Vypisuji data pro tabulku `uzivatel`
--

INSERT INTO `uzivatel` (`id`, `login`, `heslo`, `jmeno`, `Email`, `telefon`, `roleID`) VALUES
(1, 'hlavnivedouci', 'test', 'Václav Klaus', 'vasek@hrad.cz', 123456789, 1),
(2, 'hospodar', 'test', 'Miroslav Kalousek', 'mirek@top09.cz', 789445612, 2),
(3, 'zdravotnik', 'test', 'doc. MUDr.Leoš Heger, CSc.', 'leos@mares.cz', 155, 3),
(4, 'kuchar', 'test', 'Pavel Drobil', 'mzp@kdovico.cz', 123456744, 4),
(5, 'oddilovyvedouci', 'test', 'Radek John', 'nemamrad@policajty.cz', 158, 5),
(6, 'sexyMozek', 'test', 'Jiří Paroubek', 'kdozvasto@ma.cz', 111111111, 5),
(7, 'praktikant', 'test', 'Mirek Topolánek', 'kalousku@jsijednicka.cz', 456987411, 6),
(8, 'standa', 'test', 'Stanislav Gross', 'tafloridase@vyplatila.cz', 459745221, 6),
(9, 'novej', 'test', 'František Novák', 'mail@mail.cz', 123456789, 0);
-- (10, 'gergeg', 'test', 'sÄ?ttÅ?zÅ¾uh Ä?Å?z  Ä?zÅ¾Ä?z', 'rer@qewfw.cc', 748596587, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `vicedenni_akce`
--

CREATE TABLE IF NOT EXISTS `vicedenni_akce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `misto` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `termin` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `cena` int(11) NOT NULL,
  `cas_odjezdu` date NOT NULL,
  `cas_navratu` date NOT NULL,
  `ubytovani` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=2 ;

--
-- Vypisuji data pro tabulku `vicedenni_akce`
--

INSERT INTO `vicedenni_akce` (`id`, `misto`, `termin`, `cena`, `cas_odjezdu`, `cas_navratu`, `ubytovani`) VALUES
(1, 'Letní tábor Horní Mašov', 'léto 2011', 3200, '2011-07-15', '2011-08-03', 1);