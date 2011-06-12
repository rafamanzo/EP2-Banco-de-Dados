-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Jun 12, 2011 as 05:52 PM
-- Versão do Servidor: 5.1.54
-- Versão do PHP: 5.3.5-1ubuntu7.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `artigo`
--

CREATE TABLE `artigo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assunto` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `subtitulo` varchar(255) NOT NULL,
  `id_periodico` int(10) unsigned NOT NULL,
  `disponivel_online` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_periodico` (`id_periodico`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- RELAÇÕES PARA A TABELA `artigo`:
--   `id_periodico`
--       `periodico` -> `id`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimo`
--

CREATE TABLE `emprestimo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned NOT NULL,
  `id_livro` int(10) unsigned NOT NULL,
  `data_retirada` date NOT NULL,
  `data_devolucao` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- RELAÇÕES PARA A TABELA `emprestimo`:
--   `id_livro`
--       `livro` -> `id`
--   `id_usuario`
--       `usuario` -> `id`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `exemplar`
--

CREATE TABLE `exemplar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `editora` varchar(255) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `cidade` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(13) NOT NULL,
  `Autor` varchar(255) NOT NULL,
  `id_exemplar` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ISBN` (`ISBN`,`id_exemplar`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- RELAÇÕES PARA A TABELA `livro`:
--   `id_exemplar`
--       `exemplar` -> `id`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `periodico`
--

CREATE TABLE `periodico` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `id_exemplar` int(10) unsigned NOT NULL,
  `issn` varchar(14) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_exemplar` (`id_exemplar`,`issn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- RELAÇÕES PARA A TABELA `periodico`:
--   `id_exemplar`
--       `exemplar` -> `id`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `recadastro`
--

CREATE TABLE `recadastro` (
  `id` int(10) unsigned NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned NOT NULL,
  `id_livro` int(10) unsigned NOT NULL,
  `data_retirada` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- RELAÇÕES PARA A TABELA `reserva`:
--   `id_livro`
--       `livro` -> `id`
--   `id_usuario`
--       `usuario` -> `id`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nusp` varchar(10) NOT NULL,
  `senha` varchar(32) NOT NULL COMMENT 'conversão para MD5',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
