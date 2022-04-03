-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 15, 2022 at 01:59 AM
-- Server version: 5.5.20
-- PHP Version: 5.3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `projeto`
--

-- --------------------------------------------------------
CREATE DATABASE projeto;
USE projeto;
--
-- Table structure for table `aluno`
--

CREATE TABLE IF NOT EXISTS `aluno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `foto` varchar(120) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cidade_id` int(11) NOT NULL,
  `turma_id` int(11) NOT NULL,
  `view` int(11) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`cidade_id`,`turma_id`),
  KEY `fk_aluno_cidade1_idx` (`cidade_id`),
  KEY `fk_aluno_turma1_idx` (`turma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aluno_skill`
--

CREATE TABLE IF NOT EXISTS `aluno_skill` (
  `aluno_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `observacao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`aluno_id`,`skill_id`),
  KEY `fk_aluno_has_skill_skill1_idx` (`skill_id`),
  KEY `fk_aluno_has_skill_aluno1_idx` (`aluno_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aluno_vaga`
--

CREATE TABLE IF NOT EXISTS `aluno_vaga` (
  `aluno_id` int(11) NOT NULL,
  `vaga_id` int(11) NOT NULL,
  `interesse` char(1) DEFAULT NULL,
  `candidata` char(1) DEFAULT NULL,
  `status_candidatura` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`aluno_id`,`vaga_id`),
  KEY `fk_aluno_has_vaga_vaga1_idx` (`vaga_id`),
  KEY `fk_aluno_has_vaga_aluno1_idx` (`aluno_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cidade`
--

CREATE TABLE IF NOT EXISTS `cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) DEFAULT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`estado_id`),
  KEY `fk_cidade_estado1_idx` (`estado_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `cidade`
--

INSERT INTO `cidade` (`id`, `nome`, `estado_id`) VALUES
(1, 'Mongaguá', 1),
(2, 'Itanhaém', 1),
(3, 'Peruíbe', 1);

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) DEFAULT NULL,
  `escola_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`escola_id`),
  KEY `fk_curso_escola_idx` (`escola_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`id`, `nome`, `escola_id`) VALUES
(1, 'Administração', 1),
(2, 'Desenvolvimento de Sistemas', 1),
(3, 'Farmácia', 1);

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `foto` varchar(120) DEFAULT NULL,
  `cidade_id` int(11) NOT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`cidade_id`),
  KEY `fk_empresa_cidade1_idx` (`cidade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `escola`
--

CREATE TABLE IF NOT EXISTS `escola` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `endereco` varchar(120) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `escola`
--

INSERT INTO `escola` (`id`, `nome`, `endereco`, `telefone`, `email`) VALUES
(1, 'Etec Itanhaém', '...', '...', '...'),
(2, 'Etec Adolpho Berezin', '...', '...', '..');

-- --------------------------------------------------------

--
-- Table structure for table `escolaridade`
--

CREATE TABLE IF NOT EXISTS `escolaridade` (
  `nivel_id` int(11) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  `dt_inicio` date DEFAULT NULL,
  `dt_fim` date DEFAULT NULL,
  `instituicao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`nivel_id`,`aluno_id`),
  KEY `fk_nivel_has_aluno_aluno1_idx` (`aluno_id`),
  KEY `fk_nivel_has_aluno_nivel1_idx` (`nivel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`id`, `nome`, `uf`) VALUES
(1, 'São Paulo', 'SP');

-- --------------------------------------------------------

--
-- Table structure for table `experiencia`
--

CREATE TABLE IF NOT EXISTS `experiencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) DEFAULT NULL,
  `descricao` longtext,
  `dt_inicio` date DEFAULT NULL,
  `dt_fim` date DEFAULT NULL,
  `aluno_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`aluno_id`),
  KEY `fk_experiencia_aluno1_idx` (`aluno_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `msg`
--

CREATE TABLE IF NOT EXISTS `msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origem` int(11) DEFAULT NULL,
  `destino` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nivel`
--

CREATE TABLE IF NOT EXISTS `nivel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `nivel`
--

INSERT INTO `nivel` (`id`, `nome`) VALUES
(1, 'Ensino Médio - Completo'),
(2, 'Ensino Médio - Incompleto'),
(3, 'Ensino Técnico - Completo'),
(4, 'Ensino Técnico - Cursando'),
(5, 'Ensino Médio - Incompleto'),
(6, 'Ensino Superior - Incompleto'),
(7, 'Ensino Superior - Cursando'),
(8, 'Ensino Superior - Completo');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE IF NOT EXISTS `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) DEFAULT NULL,
  `nivel` varchar(60) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`id`, `nome`, `nivel`, `descricao`) VALUES
(1, 'Operador de Empilhadeira', NULL, NULL),
(2, 'Operador de Caixa', NULL, NULL),
(3, 'Elétrica', 'básica', NULL),
(4, 'Elétrica', 'residencial', NULL),
(5, 'Elétrica', 'predial', NULL),
(6, 'Hidraúlica', 'básica', NULL),
(7, 'Hidraúlica', 'residencial', NULL),
(8, 'Hidraúlica', 'predial', NULL),
(9, 'Mecânica', 'carro - básica', NULL),
(10, 'Mecânica', 'moto - básica', NULL),
(11, 'Mecânica', 'diesel', NULL),
(12, 'CNH - A', NULL, NULL),
(13, 'CNH - B', NULL, NULL),
(14, 'CNH - A/B', NULL, NULL),
(15, 'CNH - C', NULL, NULL),
(16, 'Inglês', 'básico', NULL),
(17, 'Inglês', 'intermediário', NULL),
(18, 'Inglês', 'avançado', NULL),
(19, 'Espanhol', 'básico', NULL),
(20, 'Espanhol', 'intermediário', NULL),
(21, 'Espanhol', 'avançado', NULL),
(22, 'Francês', 'básico', NULL),
(23, 'Francês', 'intermediário', NULL),
(24, 'Francês', 'avançado', NULL),
(25, 'Italiano', 'básico', NULL),
(26, 'Italiano', 'intermediário', NULL),
(27, 'Italiano', 'avançado', NULL),
(28, 'Alemão', 'básico', NULL),
(29, 'Alemão', 'intermediário', NULL),
(30, 'Alemão', 'avançado', NULL),
(31, 'Linux', 'básico', 'Usuário - sou utilizador'),
(32, 'Linux', 'avançado', NULL),
(33, 'Versionamento(git)', NULL, NULL),
(34, 'Manutenção de Computadores', NULL, NULL),
(35, 'AutoCad', NULL, NULL),
(36, 'Pacote Office', NULL, NULL),
(37, 'PHP', 'iniciante', NULL),
(38, 'PHP', 'intermediário', NULL),
(39, 'PHP', 'avançado', NULL),
(40, 'JS', 'iniciante', NULL),
(41, 'JS', 'intermediário', NULL),
(42, 'JS', 'avançado', NULL),
(43, 'JAVA', 'iniciante', NULL),
(44, 'JAVA', 'intermediário', NULL),
(45, 'JAVA', 'avançado', NULL),
(46, 'HTML', NULL, NULL),
(47, 'CSS', NULL, NULL),
(48, 'C#', NULL, NULL),
(49, 'C++', NULL, NULL),
(50, 'Visual Basic', NULL, NULL),
(51, 'TypeScript', NULL, NULL),
(52, 'Node Js', NULL, NULL),
(53, 'Python', NULL, NULL),
(54, 'Ruby', NULL, NULL),
(55, 'SQL', NULL, NULL),
(56, 'Redes', NULL, NULL),
(57, 'Cordova', NULL, NULL),
(58, 'CorelDraw', NULL, NULL),
(59, 'Adobe Photoshop', NULL, NULL),
(60, 'Adobe Ilustrator', NULL, NULL),
(61, 'Figma', NULL, NULL),
(62, 'Bootstrap', NULL, NULL),
(63, 'InkScape', NULL, NULL),
(64, 'Contabilidade', NULL, NULL),
(65, 'Marketing', NULL, NULL),
(66, 'Empreendedorismo', NULL, NULL),
(67, 'Ética', NULL, NULL),
(68, 'Recursos Humanos', NULL, NULL),
(69, 'Gestão', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skill_vaga`
--

CREATE TABLE IF NOT EXISTS `skill_vaga` (
  `skill_id` int(11) NOT NULL,
  `vaga_id` int(11) NOT NULL,
  PRIMARY KEY (`skill_id`,`vaga_id`),
  KEY `fk_skill_has_vaga_vaga1_idx` (`vaga_id`),
  KEY `fk_skill_has_vaga_skill1_idx` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `turma`
--

CREATE TABLE IF NOT EXISTS `turma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` char(5) DEFAULT NULL,
  `periodo` varchar(45) DEFAULT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`curso_id`),
  KEY `fk_turma_curso1_idx` (`curso_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `turma`
--

INSERT INTO `turma` (`id`, `sigla`, `periodo`, `curso_id`) VALUES
(1, '1DS3', 'Noturno', 2),
(2, '2DS3', 'Noturno', 1),
(3, '3DS3', 'Noturno', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vaga`
--

CREATE TABLE IF NOT EXISTS `vaga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_publicacao` date DEFAULT NULL,
  `descricao` longtext,
  `remuneracao` decimal(10,2) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL,
  `cidade_id` int(11) NOT NULL,
  `nivel_id` int(11) NOT NULL,
  `view` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`empresa_id`,`cidade_id`,`nivel_id`),
  KEY `fk_vaga_empresa1_idx` (`empresa_id`),
  KEY `fk_vaga_cidade1_idx` (`cidade_id`),
  KEY `fk_vaga_nivel1_idx` (`nivel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_aluno_cidade1` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aluno_turma1` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `aluno_skill`
--
ALTER TABLE `aluno_skill`
  ADD CONSTRAINT `fk_aluno_has_skill_aluno1` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aluno_has_skill_skill1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `aluno_vaga`
--
ALTER TABLE `aluno_vaga`
  ADD CONSTRAINT `fk_aluno_has_vaga_aluno1` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aluno_has_vaga_vaga1` FOREIGN KEY (`vaga_id`) REFERENCES `vaga` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_cidade_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_curso_escola` FOREIGN KEY (`escola_id`) REFERENCES `escola` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_empresa_cidade1` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `escolaridade`
--
ALTER TABLE `escolaridade`
  ADD CONSTRAINT `fk_nivel_has_aluno_nivel1` FOREIGN KEY (`nivel_id`) REFERENCES `nivel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nivel_has_aluno_aluno1` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `experiencia`
--
ALTER TABLE `experiencia`
  ADD CONSTRAINT `fk_experiencia_aluno1` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `skill_vaga`
--
ALTER TABLE `skill_vaga`
  ADD CONSTRAINT `fk_skill_has_vaga_skill1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_skill_has_vaga_vaga1` FOREIGN KEY (`vaga_id`) REFERENCES `vaga` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `fk_turma_curso1` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vaga`
--
ALTER TABLE `vaga`
  ADD CONSTRAINT `fk_vaga_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vaga_cidade1` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vaga_nivel1` FOREIGN KEY (`nivel_id`) REFERENCES `nivel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
