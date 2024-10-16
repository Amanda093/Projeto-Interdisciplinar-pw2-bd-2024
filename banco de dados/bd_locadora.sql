-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Set-2024 às 19:54
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_locadora`
--
CREATE DATABASE IF NOT EXISTS `bd_locadora` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_locadora`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `CodCliente` int(11) NOT NULL,
  `Nome` varchar(35) NOT NULL,
  `Telefone` varchar(10) NOT NULL,
  `Endereco` varchar(80) NOT NULL,
  `RG` varchar(12) NOT NULL,
  `CPF` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`CodCliente`, `Nome`, `Telefone`, `Endereco`, `RG`, `CPF`) VALUES
(1, 'Giovanna Andrade', '96297-1805', '2989 Braga Rua - Moiporá, RS / 22749-124', '33.067.442-0', '927.565.058-62'),
(2, 'Beatriz Silva', '93018-8323', '009 Moraes Avenida - Bom Lugar, PE / 35597-148', '40.113.612-7', '192.459.418-84'),
(3, 'Cassio Edígio', '93133-2678', '37907 Nogueira Marginal - Santo Inácio, ES / 53822-951', '47.631.049-0', '924.586.158-99');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `CodFornecedor` int(11) NOT NULL,
  `Nome` varchar(35) NOT NULL,
  `CNPJ` varchar(18) NOT NULL,
  `Telefone` varchar(10) NOT NULL,
  `Endereco` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`CodFornecedor`, `Nome`, `CNPJ`, `Telefone`, `Endereco`) VALUES
(1, 'Bluepen Informatica', '08.182.288/0001-74', '92261-4212', '50646 Batista Travessa - Potim, AC / 89259-069'),
(2, 'Valve inc', '85.774.154/0001-93', '92962-9654', '11.298.709/0001-31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `CodFuncionario` int(11) NOT NULL,
  `Nome` varchar(35) NOT NULL,
  `Salario` double NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Telefone` varchar(10) NOT NULL,
  `RG` varchar(12) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `Usuario` varchar(25) NOT NULL,
  `Senha` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`CodFuncionario`, `Nome`, `Salario`, `Email`, `Telefone`, `RG`, `CPF`, `Usuario`, `Senha`) VALUES
(1, 'Amanda Farias', 2900, 'amanda.tec@email.com.br', '93346-4173', '32.226.256-2', '740.160.568-61', 'amanda', '123'),
(2, 'Carlos Henrique', 2200, 'carlos.tec@email.com.br', '92666-3818', '31.982.279-5', '750.793.068-82', 'carlos', '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `CodProduto` int(11) NOT NULL,
  `Nome` varchar(35) NOT NULL,
  `Preco` double NOT NULL,
  `CodTipoProd` int(11) NOT NULL,
  `CodFornecedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`CodProduto`, `Nome`, `Preco`, `CodTipoProd`, `CodFornecedor`) VALUES
(1, 'Notebook Gamer', 50, 1, 1),
(2, 'Hollow Knight Silksong', 20, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `CodReserva` int(11) NOT NULL,
  `DataInicial` date NOT NULL,
  `DataFinal` date NOT NULL,
  `CodTipoReserva` int(11) NOT NULL,
  `CodCliente` int(11) NOT NULL,
  `CodFuncionario` int(11) NOT NULL,
  `CodProduto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` (`CodReserva`, `DataInicial`, `DataFinal`, `CodTipoReserva`, `CodCliente`, `CodFuncionario`, `CodProduto`) VALUES
(1, '2024-09-03', '2024-09-23', 1, 1, 1, 1),
(2, '2024-09-24', '2024-10-08', 1, 3, 2, 1),
(3, '2024-08-20', '2024-08-27', 1, 2, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_produto`
--

CREATE TABLE `tipo_produto` (
  `CodTipoProd` int(11) NOT NULL,
  `Descricao` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_produto`
--

INSERT INTO `tipo_produto` (`CodTipoProd`, `Descricao`) VALUES
(1, 'Eletrônico'),
(2, 'Game');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_reserva`
--

CREATE TABLE `tipo_reserva` (
  `CodTipoReserva` int(11) NOT NULL,
  `Descricao` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_reserva`
--

INSERT INTO `tipo_reserva` (`CodTipoReserva`, `Descricao`) VALUES
(1, 'Reserva'),
(2, 'Agendamento');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CodCliente`),
  ADD UNIQUE KEY `RG` (`RG`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`CodFornecedor`),
  ADD UNIQUE KEY `CNPJ` (`CNPJ`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`CodFuncionario`),
  ADD UNIQUE KEY `RG` (`RG`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`CodProduto`),
  ADD KEY `CodFornecedor` (`CodFornecedor`),
  ADD KEY `CodTipoProduto` (`CodTipoProd`);

--
-- Índices para tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`CodReserva`),
  ADD KEY `TipoReserva` (`CodTipoReserva`),
  ADD KEY `CodCliente` (`CodCliente`),
  ADD KEY `CodFuncionario` (`CodFuncionario`),
  ADD KEY `CodProduto` (`CodProduto`);

--
-- Índices para tabela `tipo_produto`
--
ALTER TABLE `tipo_produto`
  ADD PRIMARY KEY (`CodTipoProd`);

--
-- Índices para tabela `tipo_reserva`
--
ALTER TABLE `tipo_reserva`
  ADD PRIMARY KEY (`CodTipoReserva`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `CodCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `CodFornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `CodFuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `CodProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `CodReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipo_produto`
--
ALTER TABLE `tipo_produto`
  MODIFY `CodTipoProd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tipo_reserva`
--
ALTER TABLE `tipo_reserva`
  MODIFY `CodTipoReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `CodFornecedor` FOREIGN KEY (`CodFornecedor`) REFERENCES `fornecedor` (`CodFornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `CodTipoProduto` FOREIGN KEY (`CodTipoProd`) REFERENCES `tipo_produto` (`CodTipoProd`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `CodCliente` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`CodCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `CodFuncionario` FOREIGN KEY (`CodFuncionario`) REFERENCES `funcionario` (`CodFuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `CodProduto` FOREIGN KEY (`CodProduto`) REFERENCES `produto` (`CodProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `TipoReserva` FOREIGN KEY (`CodTipoReserva`) REFERENCES `tipo_reserva` (`CodTipoReserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;