-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Ago-2022 às 20:27
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
-- Banco de dados: `loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_vendas`
--

CREATE TABLE `tab_vendas` (
  `id_venda` int(10) NOT NULL,
  `id_vendedor` int(10) NOT NULL,
  `data` date NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `tab_vendas`
--

INSERT INTO `tab_vendas` (`id_venda`, `id_vendedor`, `data`, `valor`) VALUES
(1, 1, '2022-08-02', '150.00'),
(2, 1, '2022-08-02', '650.00'),
(3, 2, '2022-08-02', '250.00'),
(4, 1, '2022-08-02', '980.00'),
(5, 2, '2022-08-02', '150.00'),
(6, 1, '2022-08-02', '150.00'),
(7, 1, '2022-08-02', '650.00'),
(8, 2, '2022-08-02', '250.00'),
(9, 1, '2022-08-02', '980.00'),
(10, 2, '2022-08-02', '150.00'),
(11, 1, '2022-08-02', '150.00'),
(12, 3, '2022-08-02', '650.00'),
(13, 2, '2022-08-02', '250.00'),
(14, 2, '2022-08-02', '980.00'),
(15, 3, '2022-08-02', '150.00'),
(16, 3, '2022-08-02', '650.00'),
(17, 2, '2022-08-02', '250.00'),
(18, 2, '2022-08-02', '988.00'),
(19, 3, '2022-08-02', '155.00'),
(20, 3, '2022-08-02', '550.00'),
(21, 2, '2022-08-02', '450.00'),
(22, 2, '2022-08-02', '80.00'),
(23, 4, '2022-08-02', '130.00'),
(24, 3, '2022-08-02', '680.00'),
(25, 2, '2022-08-02', '270.00'),
(26, 1, '2022-08-02', '480.00'),
(27, 4, '2022-08-02', '250.00'),
(28, 4, '2022-08-02', '150.00'),
(29, 4, '2022-08-02', '650.00'),
(30, 3, '2022-08-02', '350.00'),
(31, 3, '2022-08-02', '550.00'),
(32, 4, '2022-08-02', '250.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_vendedores`
--

CREATE TABLE `tab_vendedores` (
  `id_vendedor` int(10) NOT NULL,
  `nome` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `tab_vendedores`
--

INSERT INTO `tab_vendedores` (`id_vendedor`, `nome`, `email`) VALUES
(1, 'Carlos', 'carlos@gmail.com'),
(2, 'Maria', 'maria@gmail.com'),
(3, 'Simone', 'simone@gmail.com'),
(4, 'Sérgio', 'sergio@gmail.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tab_vendas`
--
ALTER TABLE `tab_vendas`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `fk_id_vendedor` (`id_vendedor`);

--
-- Índices para tabela `tab_vendedores`
--
ALTER TABLE `tab_vendedores`
  ADD PRIMARY KEY (`id_vendedor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tab_vendas`
--
ALTER TABLE `tab_vendas`
  MODIFY `id_venda` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `tab_vendedores`
--
ALTER TABLE `tab_vendedores`
  MODIFY `id_vendedor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tab_vendas`
--
ALTER TABLE `tab_vendas`
  ADD CONSTRAINT `tab_vendas_ibfk_1` FOREIGN KEY (`id_vendedor`) REFERENCES `tab_vendedores` (`id_vendedor`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
