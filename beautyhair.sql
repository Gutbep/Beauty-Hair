-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31/10/2023 às 22:04
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `beautyhair`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamento`
--

CREATE TABLE `agendamento` (
  `agendamentoId` int(11) NOT NULL,
  `salaoId` int(11) NOT NULL,
  `clienteId` int(11) NOT NULL,
  `colaboradorId` int(11) NOT NULL,
  `agendamentoData` date NOT NULL,
  `valor` int(11) NOT NULL,
  `comissao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `clienteId` int(11) NOT NULL,
  `clienteNome` varchar(99) NOT NULL,
  `telefone` int(11) NOT NULL,
  `clienteEmail` varchar(99) NOT NULL,
  `clienteSenha` varchar(99) NOT NULL,
  `foto` blob DEFAULT NULL,
  `sexo` enum('Masc','Fem','Outro') NOT NULL,
  `endereco` varchar(99) NOT NULL,
  `dataCadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `colaboradores`
--

CREATE TABLE `colaboradores` (
  `colaboradorId` int(11) NOT NULL,
  `colaboradorNome` varchar(99) NOT NULL,
  `colaboradorEmail` varchar(99) NOT NULL,
  `colaboradorSenha` varchar(99) NOT NULL,
  `foto` blob DEFAULT NULL,
  `sexo` enum('Masc','Fem','Outro') DEFAULT NULL,
  `colaboradorStatus` enum('Ativo','Inativo') DEFAULT NULL,
  `dataCadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `horario`
--

CREATE TABLE `horario` (
  `salaoId` int(11) NOT NULL,
  `servicoId` int(11) NOT NULL,
  `colaboradorId` int(11) NOT NULL,
  `dias` int(11) NOT NULL,
  `inicio` time NOT NULL,
  `fim` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `salao`
--

CREATE TABLE `salao` (
  `salaoId` int(11) NOT NULL,
  `salaoNome` varchar(99) NOT NULL,
  `capa` blob DEFAULT NULL,
  `salaoEmail` varchar(99) NOT NULL,
  `salaoSenha` varchar(99) NOT NULL,
  `telefone` int(11) NOT NULL,
  `endereco` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `servicoId` int(11) NOT NULL,
  `salaoId` int(11) NOT NULL,
  `titutlo` varchar(99) NOT NULL,
  `preco` int(11) NOT NULL,
  `comissao` int(11) NOT NULL,
  `descricao` varchar(999) DEFAULT NULL,
  `servicosStatus` enum('Ativo','Inativo') DEFAULT NULL,
  `dataCadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`agendamentoId`),
  ADD KEY `salaoId` (`salaoId`),
  ADD KEY `clienteId` (`clienteId`),
  ADD KEY `colaboradorId` (`colaboradorId`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`clienteId`);

--
-- Índices de tabela `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD PRIMARY KEY (`colaboradorId`);

--
-- Índices de tabela `horario`
--
ALTER TABLE `horario`
  ADD KEY `salaoId` (`salaoId`),
  ADD KEY `servicoId` (`servicoId`),
  ADD KEY `colaboradorId` (`colaboradorId`);

--
-- Índices de tabela `salao`
--
ALTER TABLE `salao`
  ADD PRIMARY KEY (`salaoId`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`servicoId`),
  ADD KEY `salaoId` (`salaoId`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `agendamento_ibfk_1` FOREIGN KEY (`salaoId`) REFERENCES `salao` (`salaoId`),
  ADD CONSTRAINT `agendamento_ibfk_2` FOREIGN KEY (`clienteId`) REFERENCES `cliente` (`clienteId`),
  ADD CONSTRAINT `agendamento_ibfk_3` FOREIGN KEY (`colaboradorId`) REFERENCES `colaboradores` (`colaboradorId`);

--
-- Restrições para tabelas `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`salaoId`) REFERENCES `salao` (`salaoId`),
  ADD CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`servicoId`) REFERENCES `servicos` (`servicoId`),
  ADD CONSTRAINT `horario_ibfk_3` FOREIGN KEY (`colaboradorId`) REFERENCES `colaboradores` (`colaboradorId`);

--
-- Restrições para tabelas `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `servicos_ibfk_1` FOREIGN KEY (`salaoId`) REFERENCES `salao` (`salaoId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
