-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Ago-2022 às 22:24
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--
CREATE DATABASE IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci;
USE `escola`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_alunos`
--

CREATE TABLE `tab_alunos` (
  `id_aluno` int(10) NOT NULL,
  `nome` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `fone` varchar(15) COLLATE utf8_swedish_ci NOT NULL,
  `foto` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `tab_alunos`
--

INSERT INTO `tab_alunos` (`id_aluno`, `nome`, `email`, `fone`, `foto`) VALUES
(1, 'João', 'joao@gmail.com', '(11)90000-0000', 'joao.jph'),
(2, 'Maria', 'maria@gmail.com', '(11)91111-1111', 'maria.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_professores`
--

CREATE TABLE `tab_professores` (
  `id_professor` int(10) NOT NULL,
  `nome` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `fone` varchar(15) COLLATE utf8_swedish_ci NOT NULL,
  `foto` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `salarario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `tab_professores`
--

INSERT INTO `tab_professores` (`id_professor`, `nome`, `email`, `fone`, `foto`, `salarario`) VALUES
(1, 'Fabio', 'fabio@gmail.com', '(11) 93333-3333', 'fabio.jpg', '1500.00'),
(2, 'Rafael', 'rafael@gmail.com', '(11)91111-1111', 'rafael.jpg', '1800.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_salas`
--

CREATE TABLE `tab_salas` (
  `id_sala` int(10) NOT NULL,
  `numero` int(2) NOT NULL,
  `capacidade` int(3) NOT NULL,
  `equipamento` varchar(3) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `tab_salas`
--

INSERT INTO `tab_salas` (`id_sala`, `numero`, `capacidade`, `equipamento`) VALUES
(1, 24, 27, 'WIN'),
(2, 30, 20, 'MAC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_turmas`
--

CREATE TABLE `tab_turmas` (
  `id_turma` int(10) NOT NULL,
  `nome` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `id_aluno` int(10) NOT NULL,
  `id_professor` int(10) NOT NULL,
  `id_sala` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `tab_turmas`
--

INSERT INTO `tab_turmas` (`id_turma`, `nome`, `id_aluno`, `id_professor`, `id_sala`) VALUES
(1, 'SQL', 1, 1, 1),
(2, 'C#', 2, 2, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tab_alunos`
--
ALTER TABLE `tab_alunos`
  ADD PRIMARY KEY (`id_aluno`);

--
-- Índices para tabela `tab_professores`
--
ALTER TABLE `tab_professores`
  ADD PRIMARY KEY (`id_professor`);

--
-- Índices para tabela `tab_salas`
--
ALTER TABLE `tab_salas`
  ADD PRIMARY KEY (`id_sala`);

--
-- Índices para tabela `tab_turmas`
--
ALTER TABLE `tab_turmas`
  ADD PRIMARY KEY (`id_turma`),
  ADD KEY `id_aluno` (`id_aluno`),
  ADD KEY `fk_professor` (`id_professor`),
  ADD KEY `fk_sala` (`id_sala`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tab_alunos`
--
ALTER TABLE `tab_alunos`
  MODIFY `id_aluno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tab_professores`
--
ALTER TABLE `tab_professores`
  MODIFY `id_professor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tab_salas`
--
ALTER TABLE `tab_salas`
  MODIFY `id_sala` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tab_turmas`
--
ALTER TABLE `tab_turmas`
  MODIFY `id_turma` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tab_turmas`
--
ALTER TABLE `tab_turmas`
  ADD CONSTRAINT `tab_turmas_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `tab_alunos` (`id_aluno`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tab_turmas_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `tab_professores` (`id_professor`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tab_turmas_ibfk_3` FOREIGN KEY (`id_sala`) REFERENCES `tab_salas` (`id_sala`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
