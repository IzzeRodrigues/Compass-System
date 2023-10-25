-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Out-2023 às 03:40
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_compassv2`
--
CREATE DATABASE IF NOT EXISTS `db_compassv2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_compassv2`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_arq_propostas`
--

CREATE TABLE `tb_arq_propostas` (
  `cd_arq_propostas` int(11) NOT NULL,
  `nr_versao_propostas` decimal(2,1) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_carreta`
--

CREATE TABLE `tb_carreta` (
  `cd_carreta` int(11) NOT NULL,
  `nm_carreta` varchar(50) DEFAULT NULL,
  `qt_cubagem_min_carreta` int(11) DEFAULT NULL,
  `qt_cubagem_max_carreta` int(11) DEFAULT NULL,
  `qt_peso_min_carreta` int(11) DEFAULT NULL,
  `qt_peso_max_carreta` int(11) DEFAULT NULL,
  `qt_pallets_carreta` int(11) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cidade_destino`
--

CREATE TABLE `tb_cidade_destino` (
  `cd_cidade_destino` int(11) NOT NULL,
  `nm_cidade_destino` varchar(30) DEFAULT NULL,
  `ds_cidade_destino` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cidade_origem`
--

CREATE TABLE `tb_cidade_origem` (
  `cd_cidade_origem` int(11) NOT NULL,
  `nm_cidade_origem` varchar(30) DEFAULT NULL,
  `ds_cidade_origem` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `cd_cliente` int(11) NOT NULL,
  `nm_empresa_cliente` varchar(50) DEFAULT NULL,
  `nm_referencia_cliente` varchar(50) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_container`
--

CREATE TABLE `tb_container` (
  `cd_container` int(11) NOT NULL,
  `nm_container` varchar(50) DEFAULT NULL,
  `qt_tara_container` int(11) DEFAULT NULL,
  `qt_peso_min_container` int(11) DEFAULT NULL,
  `qt_peso_max_container` int(11) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_email_usuario`
--

CREATE TABLE `tb_email_usuario` (
  `cd_email` int(11) NOT NULL,
  `nm_email_usuario` varchar(50) DEFAULT NULL,
  `cd_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_email_usuario`
--

INSERT INTO `tb_email_usuario` (`cd_email`, `nm_email_usuario`, `cd_usuario`) VALUES
(1, 'admin@acl.com.br', 1),
(2, 'comercial@acl.com.br', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_icms`
--

CREATE TABLE `tb_icms` (
  `cd_icms` int(11) NOT NULL,
  `nm_icms_rota` varchar(50) DEFAULT NULL,
  `vl_icms` decimal(2,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_local_devolucao_container`
--

CREATE TABLE `tb_local_devolucao_container` (
  `cd_local_devolucao_container` int(11) NOT NULL,
  `nm_local_devolucao_container` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_privilegio`
--

CREATE TABLE `tb_privilegio` (
  `cd_privilegio` int(11) NOT NULL,
  `nm_privilegio` enum('Adm','Usuario') DEFAULT NULL,
  `cd_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_privilegio`
--

INSERT INTO `tb_privilegio` (`cd_privilegio`, `nm_privilegio`, `cd_usuario`) VALUES
(1, 'Adm', 1),
(2, 'Usuario', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produto`
--

CREATE TABLE `tb_produto` (
  `cd_produto` int(11) NOT NULL,
  `nm_produto` varchar(50) DEFAULT NULL,
  `qt_produto` int(11) DEFAULT NULL,
  `ds_produto` varchar(100) DEFAULT NULL,
  `qt_cubagem_produto` int(11) DEFAULT NULL,
  `qt_peso_produto` int(11) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_proposta`
--

CREATE TABLE `tb_proposta` (
  `cd_proposta` int(11) NOT NULL,
  `dt_proposta` date DEFAULT NULL,
  `nm_referencia_acl` varchar(50) DEFAULT NULL,
  `dt_horario_recebimento` datetime DEFAULT NULL,
  `ds_metodo_transporte` varchar(50) DEFAULT NULL,
  `cd_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_responsavel_cliente`
--

CREATE TABLE `tb_responsavel_cliente` (
  `cd_responsavel_cliente` int(11) NOT NULL,
  `nm_responsavel_cliente` varchar(50) DEFAULT NULL,
  `nm_email_responsavel_cliente` varchar(50) DEFAULT NULL,
  `cd_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_uf_destino`
--

CREATE TABLE `tb_uf_destino` (
  `cd_uf_destino` int(11) NOT NULL,
  `sg_uf_destino` char(2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_uf_origem`
--

CREATE TABLE `tb_uf_origem` (
  `cd_uf_origem` int(11) NOT NULL,
  `sg_uf_origem` char(2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `cd_usuario` int(11) NOT NULL,
  `nm_nome_completo` varchar(100) DEFAULT NULL,
  `nm_cargo_usuario` varchar(50) DEFAULT NULL,
  `cd_senha` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`cd_usuario`, `nm_nome_completo`, `nm_cargo_usuario`, `cd_senha`) VALUES
(1, 'Admin Compass', 'Diretor de Negócios', '123'),
(2, 'Comercial Compass', 'Vendas e Relacionamento', '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_veiculo`
--

CREATE TABLE `tb_veiculo` (
  `cd_veiculo` int(11) NOT NULL,
  `nm_veiculo` varchar(50) DEFAULT NULL,
  `qt_eixos_veiculo` int(11) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_arq_propostas`
--
ALTER TABLE `tb_arq_propostas`
  ADD PRIMARY KEY (`cd_arq_propostas`),
  ADD KEY `fk_arq_propostas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_carreta`
--
ALTER TABLE `tb_carreta`
  ADD PRIMARY KEY (`cd_carreta`),
  ADD KEY `fk_carreta_veiculo` (`cd_proposta`);

--
-- Índices para tabela `tb_cidade_destino`
--
ALTER TABLE `tb_cidade_destino`
  ADD PRIMARY KEY (`cd_cidade_destino`),
  ADD KEY `fk_cidade_destino_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_cidade_origem`
--
ALTER TABLE `tb_cidade_origem`
  ADD PRIMARY KEY (`cd_cidade_origem`),
  ADD KEY `fk_cidade_origem_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`cd_cliente`),
  ADD KEY `fk_cliente_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_container`
--
ALTER TABLE `tb_container`
  ADD PRIMARY KEY (`cd_container`),
  ADD KEY `fk_container_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_email_usuario`
--
ALTER TABLE `tb_email_usuario`
  ADD PRIMARY KEY (`cd_email`),
  ADD KEY `fk_email_usuario_usuario` (`cd_usuario`);

--
-- Índices para tabela `tb_icms`
--
ALTER TABLE `tb_icms`
  ADD PRIMARY KEY (`cd_icms`),
  ADD KEY `fk_icms_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_local_devolucao_container`
--
ALTER TABLE `tb_local_devolucao_container`
  ADD PRIMARY KEY (`cd_local_devolucao_container`),
  ADD KEY `fk_local_devolucao_container_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_privilegio`
--
ALTER TABLE `tb_privilegio`
  ADD PRIMARY KEY (`cd_privilegio`),
  ADD KEY `fk_privilegio_usuario` (`cd_usuario`);

--
-- Índices para tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD PRIMARY KEY (`cd_produto`),
  ADD KEY `fk_produto_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_proposta`
--
ALTER TABLE `tb_proposta`
  ADD PRIMARY KEY (`cd_proposta`),
  ADD KEY `fk_proposta_usuario` (`cd_usuario`);

--
-- Índices para tabela `tb_responsavel_cliente`
--
ALTER TABLE `tb_responsavel_cliente`
  ADD PRIMARY KEY (`cd_responsavel_cliente`),
  ADD KEY `fk_responsavel_cliente_cliente` (`cd_cliente`);

--
-- Índices para tabela `tb_uf_destino`
--
ALTER TABLE `tb_uf_destino`
  ADD PRIMARY KEY (`cd_uf_destino`),
  ADD KEY `fk_uf_destino_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_uf_origem`
--
ALTER TABLE `tb_uf_origem`
  ADD PRIMARY KEY (`cd_uf_origem`),
  ADD KEY `fk_uf_origem_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`cd_usuario`);

--
-- Índices para tabela `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
  ADD PRIMARY KEY (`cd_veiculo`),
  ADD KEY `fk_veiculo_proposta` (`cd_proposta`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_arq_propostas`
--
ALTER TABLE `tb_arq_propostas`
  MODIFY `cd_arq_propostas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_carreta`
--
ALTER TABLE `tb_carreta`
  MODIFY `cd_carreta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cidade_destino`
--
ALTER TABLE `tb_cidade_destino`
  MODIFY `cd_cidade_destino` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cidade_origem`
--
ALTER TABLE `tb_cidade_origem`
  MODIFY `cd_cidade_origem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `cd_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_container`
--
ALTER TABLE `tb_container`
  MODIFY `cd_container` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_email_usuario`
--
ALTER TABLE `tb_email_usuario`
  MODIFY `cd_email` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_icms`
--
ALTER TABLE `tb_icms`
  MODIFY `cd_icms` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_local_devolucao_container`
--
ALTER TABLE `tb_local_devolucao_container`
  MODIFY `cd_local_devolucao_container` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_privilegio`
--
ALTER TABLE `tb_privilegio`
  MODIFY `cd_privilegio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  MODIFY `cd_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_proposta`
--
ALTER TABLE `tb_proposta`
  MODIFY `cd_proposta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_responsavel_cliente`
--
ALTER TABLE `tb_responsavel_cliente`
  MODIFY `cd_responsavel_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_uf_destino`
--
ALTER TABLE `tb_uf_destino`
  MODIFY `cd_uf_destino` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_uf_origem`
--
ALTER TABLE `tb_uf_origem`
  MODIFY `cd_uf_origem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `cd_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
  MODIFY `cd_veiculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_arq_propostas`
--
ALTER TABLE `tb_arq_propostas`
  ADD CONSTRAINT `fk_arq_propostas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_carreta`
--
ALTER TABLE `tb_carreta`
  ADD CONSTRAINT `fk_carreta_veiculo` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_cidade_destino`
--
ALTER TABLE `tb_cidade_destino`
  ADD CONSTRAINT `fk_cidade_destino_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_cidade_origem`
--
ALTER TABLE `tb_cidade_origem`
  ADD CONSTRAINT `fk_cidade_origem_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD CONSTRAINT `fk_cliente_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_container`
--
ALTER TABLE `tb_container`
  ADD CONSTRAINT `fk_container_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_email_usuario`
--
ALTER TABLE `tb_email_usuario`
  ADD CONSTRAINT `fk_email_usuario_usuario` FOREIGN KEY (`cd_usuario`) REFERENCES `tb_usuario` (`cd_usuario`);

--
-- Limitadores para a tabela `tb_icms`
--
ALTER TABLE `tb_icms`
  ADD CONSTRAINT `fk_icms_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_local_devolucao_container`
--
ALTER TABLE `tb_local_devolucao_container`
  ADD CONSTRAINT `fk_local_devolucao_container_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_privilegio`
--
ALTER TABLE `tb_privilegio`
  ADD CONSTRAINT `fk_privilegio_usuario` FOREIGN KEY (`cd_usuario`) REFERENCES `tb_usuario` (`cd_usuario`);

--
-- Limitadores para a tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD CONSTRAINT `fk_produto_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_proposta`
--
ALTER TABLE `tb_proposta`
  ADD CONSTRAINT `fk_proposta_usuario` FOREIGN KEY (`cd_usuario`) REFERENCES `tb_usuario` (`cd_usuario`);

--
-- Limitadores para a tabela `tb_responsavel_cliente`
--
ALTER TABLE `tb_responsavel_cliente`
  ADD CONSTRAINT `fk_responsavel_cliente_cliente` FOREIGN KEY (`cd_cliente`) REFERENCES `tb_cliente` (`cd_cliente`);

--
-- Limitadores para a tabela `tb_uf_destino`
--
ALTER TABLE `tb_uf_destino`
  ADD CONSTRAINT `fk_uf_destino_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_uf_origem`
--
ALTER TABLE `tb_uf_origem`
  ADD CONSTRAINT `fk_uf_origem_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
  ADD CONSTRAINT `fk_veiculo_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
