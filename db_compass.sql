-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Nov-2023 às 19:35
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_compass`
--
CREATE DATABASE IF NOT EXISTS `db_compass` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_compass`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_adic_irpj_despesas`
--

DROP TABLE IF EXISTS `tb_adic_irpj_despesas`;
CREATE TABLE `tb_adic_irpj_despesas` (
  `cd_adic_irpj_despesas` int(11) NOT NULL,
  `vl_adic_irpj_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_ajudantes_despesas`
--

DROP TABLE IF EXISTS `tb_ajudantes_despesas`;
CREATE TABLE `tb_ajudantes_despesas` (
  `cd_ajudantes_despesas` int(11) NOT NULL,
  `vl_ajudantes_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_ajudantes_operacao`
--

DROP TABLE IF EXISTS `tb_ajudantes_operacao`;
CREATE TABLE `tb_ajudantes_operacao` (
  `cd_ajudantes_operacao` int(11) NOT NULL,
  `vl_ajudantes_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_arq_propostas`
--

DROP TABLE IF EXISTS `tb_arq_propostas`;
CREATE TABLE `tb_arq_propostas` (
  `cd_arq_propostas` int(11) NOT NULL,
  `nr_versao_propostas` decimal(3,1) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_buonny_cad_despesas`
--

DROP TABLE IF EXISTS `tb_buonny_cad_despesas`;
CREATE TABLE `tb_buonny_cad_despesas` (
  `cd_buonny_cad_despesas` int(11) NOT NULL,
  `id_buonny_cad_despesas` int(11) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_carreta`
--

DROP TABLE IF EXISTS `tb_carreta`;
CREATE TABLE `tb_carreta` (
  `cd_carreta` int(11) NOT NULL,
  `nm_carreta` varchar(100) DEFAULT NULL,
  `qt_cubagem_min_carreta` double DEFAULT NULL,
  `qt_cubagem_max_carreta` double DEFAULT NULL,
  `qt_peso_min_carreta` double DEFAULT NULL,
  `qt_peso_max_carreta` double DEFAULT NULL,
  `qt_pallets_carreta` int(11) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cat_imposto_operacao`
--

DROP TABLE IF EXISTS `tb_cat_imposto_operacao`;
CREATE TABLE `tb_cat_imposto_operacao` (
  `cd_cat_imposto_operacao` int(11) NOT NULL,
  `nm_cat_imposto_operacao` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cidade_destino`
--

DROP TABLE IF EXISTS `tb_cidade_destino`;
CREATE TABLE `tb_cidade_destino` (
  `cd_cidade_destino` int(11) NOT NULL,
  `nm_cidade_destino` varchar(100) DEFAULT NULL,
  `ds_cidade_destino` varchar(500) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cidade_origem`
--

DROP TABLE IF EXISTS `tb_cidade_origem`;
CREATE TABLE `tb_cidade_origem` (
  `cd_cidade_origem` int(11) NOT NULL,
  `nm_cidade_origem` varchar(100) DEFAULT NULL,
  `ds_cidade_origem` varchar(500) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_class_imo`
--

DROP TABLE IF EXISTS `tb_class_imo`;
CREATE TABLE `tb_class_imo` (
  `cd_class_imo` int(11) NOT NULL,
  `id_class_imo` int(11) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
CREATE TABLE `tb_cliente` (
  `cd_cliente` int(11) NOT NULL,
  `nm_empresa_cliente` varchar(100) DEFAULT NULL,
  `nm_referencia_cliente` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cofins_despesas`
--

DROP TABLE IF EXISTS `tb_cofins_despesas`;
CREATE TABLE `tb_cofins_despesas` (
  `cd_cofins_despesas` int(11) NOT NULL,
  `vl_cofins_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_comb_total_litro_carga`
--

DROP TABLE IF EXISTS `tb_comb_total_litro_carga`;
CREATE TABLE `tb_comb_total_litro_carga` (
  `cd_comb_total_litro_carga` int(11) NOT NULL,
  `qtd_comb_total_litro_carga` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_comissao_despesas`
--

DROP TABLE IF EXISTS `tb_comissao_despesas`;
CREATE TABLE `tb_comissao_despesas` (
  `cd_comissao_despesas` int(11) NOT NULL,
  `vl_comissao_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_consulta_porc_icms`
--

DROP TABLE IF EXISTS `tb_consulta_porc_icms`;
CREATE TABLE `tb_consulta_porc_icms` (
  `cd_consulta_porc_icms` int(11) NOT NULL,
  `nm_consulta_porc_icms` varchar(10) DEFAULT NULL,
  `vl_consulta_porc_icms` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `tb_consulta_porc_icms`
--

INSERT INTO `tb_consulta_porc_icms` (`cd_consulta_porc_icms`, `nm_consulta_porc_icms`, `vl_consulta_porc_icms`) VALUES
(1, 'AC/AC', 19),
(2, 'AC/AL', 12),
(3, 'AC/AP', 12),
(4, 'AC/AM', 12),
(5, 'AC/BA', 12),
(6, 'AC/CE', 12),
(7, 'AC/DF', 12),
(8, 'AC/ES', 12),
(9, 'AC/GO', 12),
(10, 'AC/MA', 12),
(11, 'AC/MT', 12),
(12, 'AC/MS', 12),
(13, 'AC/MG', 12),
(14, 'AC/PA', 12),
(15, 'AC/PB', 12),
(16, 'AC/PR', 12),
(17, 'AC/PE', 12),
(18, 'AC/PI', 12),
(19, 'AC/RJ', 12),
(20, 'AC/RN', 12),
(21, 'AC/RS', 12),
(22, 'AC/RO', 12),
(23, 'AC/RR', 12),
(24, 'AC/SC', 12),
(25, 'AC/SP', 12),
(26, 'AC/SE', 12),
(27, 'AC/TO', 12),
(28, 'AL/AL', 17),
(29, 'AL/AC', 12),
(30, 'AL/AP', 12),
(31, 'AL/AM', 12),
(32, 'AL/BA', 12),
(33, 'AL/CE', 12),
(34, 'AL/DF', 12),
(35, 'AL/ES', 12),
(36, 'AL/GO', 12),
(37, 'AL/MA', 12),
(38, 'AL/MT', 12),
(39, 'AL/MS', 12),
(40, 'AL/MG', 12),
(41, 'AL/PA', 12),
(42, 'AL/PB', 12),
(43, 'AL/PR', 12),
(44, 'AL/PE', 12),
(45, 'AL/PI', 12),
(46, 'AL/RJ', 12),
(47, 'AL/RN', 12),
(48, 'AL/RS', 12),
(49, 'AL/RO', 12),
(50, 'AL/RR', 12),
(51, 'AL/SC', 12),
(52, 'AL/SP', 12),
(53, 'AL/SE', 12),
(54, 'AL/TO', 12),
(55, 'AM/AM', 20),
(56, 'AM/AC', 12),
(57, 'AM/AP', 12),
(58, 'AM/AL', 12),
(59, 'AM/BA', 12),
(60, 'AM/CE', 12),
(61, 'AM/DF', 12),
(62, 'AM/ES', 12),
(63, 'AM/GO', 12),
(64, 'AM/MA', 12),
(65, 'AM/MT', 12),
(66, 'AM/MS', 12),
(67, 'AM/MG', 12),
(68, 'AM/PA', 12),
(69, 'AM/PB', 12),
(70, 'AM/PR', 12),
(71, 'AM/PE', 12),
(72, 'AM/PI', 12),
(73, 'AM/RJ', 12),
(74, 'AM/RN', 12),
(75, 'AM/RS', 12),
(76, 'AM/RO', 12),
(77, 'AM/RR', 12),
(78, 'AM/SC', 12),
(79, 'AM/SP', 12),
(80, 'AM/SE', 12),
(81, 'AM/TO', 12),
(82, 'AP/AP', 18),
(83, 'AP/AC', 12),
(84, 'AP/AM', 12),
(85, 'AP/AL', 12),
(86, 'AP/BA', 12),
(87, 'AP/CE', 12),
(88, 'AP/DF', 12),
(89, 'AP/ES', 12),
(90, 'AP/GO', 12),
(91, 'AP/MA', 12),
(92, 'AP/MT', 12),
(93, 'AP/MS', 12),
(94, 'AP/MG', 12),
(95, 'AP/PA', 12),
(96, 'AP/PB', 12),
(97, 'AP/PR', 12),
(98, 'AP/PE', 12),
(99, 'AP/PI', 12),
(100, 'AP/RJ', 12),
(101, 'AP/RN', 12),
(102, 'AP/RS', 12),
(103, 'AP/RO', 12),
(104, 'AP/RR', 12),
(105, 'AP/SC', 12),
(106, 'AP/SP', 12),
(107, 'AP/SE', 12),
(108, 'AP/TO', 12),
(109, 'BA/AP', 12),
(110, 'BA/AC', 12),
(111, 'BA/AM', 12),
(112, 'BA/AL', 12),
(113, 'BA/BA', 19),
(114, 'BA/CE', 12),
(115, 'BA/DF', 12),
(116, 'BA/ES', 12),
(117, 'BA/GO', 12),
(118, 'BA/MA', 12),
(119, 'BA/MT', 12),
(120, 'BA/MS', 12),
(121, 'BA/MG', 12),
(122, 'BA/PA', 12),
(123, 'BA/PB', 12),
(124, 'BA/PR', 12),
(125, 'BA/PE', 12),
(126, 'BA/PI', 12),
(127, 'BA/RJ', 12),
(128, 'BA/RN', 12),
(129, 'BA/RS', 12),
(130, 'BA/RO', 12),
(131, 'BA/RR', 12),
(132, 'BA/SC', 12),
(133, 'BA/SP', 12),
(134, 'BA/SE', 12),
(135, 'BA/TO', 12),
(136, 'CE/AP', 12),
(137, 'CE/AC', 12),
(138, 'CE/AM', 12),
(139, 'CE/AL', 12),
(140, 'CE/BA', 12),
(141, 'CE/CE', 20),
(142, 'CE/DF', 12),
(143, 'CE/ES', 12),
(144, 'CE/GO', 12),
(145, 'CE/MA', 12),
(146, 'CE/MT', 12),
(147, 'CE/MS', 12),
(148, 'CE/MG', 12),
(149, 'CE/PA', 12),
(150, 'CE/PB', 12),
(151, 'CE/PR', 12),
(152, 'CE/PE', 12),
(153, 'CE/PI', 12),
(154, 'CE/RJ', 12),
(155, 'CE/RN', 12),
(156, 'CE/RS', 12),
(157, 'CE/RO', 12),
(158, 'CE/RR', 12),
(159, 'CE/SC', 12),
(160, 'CE/SP', 12),
(161, 'CE/SE', 12),
(162, 'CE/TO', 12),
(163, 'CE/AP', 12),
(164, 'CE/AC', 12),
(165, 'CE/AM', 12),
(166, 'CE/AL', 12),
(167, 'CE/BA', 12),
(168, 'CE/CE', 20),
(169, 'CE/DF', 12),
(170, 'CE/ES', 12),
(171, 'CE/GO', 12),
(172, 'CE/MA', 12),
(173, 'CE/MT', 12),
(174, 'CE/MS', 12),
(175, 'CE/MG', 12),
(176, 'CE/PA', 12),
(177, 'CE/PB', 12),
(178, 'CE/PR', 12),
(179, 'CE/PE', 12),
(180, 'CE/PI', 12),
(181, 'CE/RJ', 12),
(182, 'CE/RN', 12),
(183, 'CE/RS', 12),
(184, 'CE/RO', 12),
(185, 'CE/RR', 12),
(186, 'CE/SC', 12),
(187, 'CE/SP', 12),
(188, 'CE/SE', 12),
(189, 'CE/TO', 12),
(190, 'DF/AP', 12),
(191, 'DF/AC', 12),
(192, 'DF/AM', 12),
(193, 'DF/AL', 12),
(194, 'DF/BA', 12),
(195, 'DF/CE', 12),
(196, 'DF/DF', 18),
(197, 'DF/ES', 12),
(198, 'DF/GO', 12),
(199, 'DF/MA', 12),
(200, 'DF/MT', 12),
(201, 'DF/MS', 12),
(202, 'DF/MG', 12),
(203, 'DF/PA', 12),
(204, 'DF/PB', 12),
(205, 'DF/PR', 12),
(206, 'DF/PE', 12),
(207, 'DF/PI', 12),
(208, 'DF/RJ', 12),
(209, 'DF/RN', 12),
(210, 'DF/RS', 12),
(211, 'DF/RO', 12),
(212, 'DF/RR', 12),
(213, 'DF/SC', 12),
(214, 'DF/SP', 12),
(215, 'DF/SE', 12),
(216, 'DF/TO', 12),
(217, 'ES/AP', 12),
(218, 'ES/AC', 12),
(219, 'ES/AM', 12),
(220, 'ES/AL', 12),
(221, 'ES/BA', 12),
(222, 'ES/CE', 12),
(223, 'ES/DF', 12),
(224, 'ES/ES', 17),
(225, 'ES/GO', 12),
(226, 'ES/MA', 12),
(227, 'ES/MT', 12),
(228, 'ES/MS', 12),
(229, 'ES/MG', 12),
(230, 'ES/PA', 12),
(231, 'ES/PB', 12),
(232, 'ES/PR', 12),
(233, 'ES/PE', 12),
(234, 'ES/PI', 12),
(235, 'ES/RJ', 12),
(236, 'ES/RN', 12),
(237, 'ES/RS', 12),
(238, 'ES/RO', 12),
(239, 'ES/RR', 12),
(240, 'ES/SC', 12),
(241, 'ES/SP', 12),
(242, 'ES/SE', 12),
(243, 'ES/TO', 12),
(244, 'GO/AP', 12),
(245, 'GO/AC', 12),
(246, 'GO/AM', 12),
(247, 'GO/AL', 12),
(248, 'GO/BA', 12),
(249, 'GO/CE', 12),
(250, 'GO/DF', 12),
(251, 'GO/ES', 12),
(252, 'GO/GO', 17),
(253, 'GO/MA', 12),
(254, 'GO/MT', 12),
(255, 'GO/MS', 12),
(256, 'GO/MG', 12),
(257, 'GO/PA', 12),
(258, 'GO/PB', 12),
(259, 'GO/PR', 12),
(260, 'GO/PE', 12),
(261, 'GO/PI', 12),
(262, 'GO/RJ', 12),
(263, 'GO/RN', 12),
(264, 'GO/RS', 12),
(265, 'GO/RO', 12),
(266, 'GO/RR', 12),
(267, 'GO/SC', 12),
(268, 'GO/SP', 12),
(269, 'GO/SE', 12),
(270, 'GO/TO', 12),
(271, 'MA/AP', 12),
(272, 'MA/AC', 12),
(273, 'MA/AM', 12),
(274, 'MA/AL', 12),
(275, 'MA/BA', 12),
(276, 'MA/CE', 12),
(277, 'MA/DF', 12),
(278, 'MA/ES', 12),
(279, 'MA/GO', 12),
(280, 'MA/MA', 20),
(281, 'MA/MT', 12),
(282, 'MA/MS', 12),
(283, 'MA/MG', 12),
(284, 'MA/PA', 12),
(285, 'MA/PB', 12),
(286, 'MA/PR', 12),
(287, 'MA/PE', 12),
(288, 'MA/PI', 12),
(289, 'MA/RJ', 12),
(290, 'MA/RN', 12),
(291, 'MA/RS', 12),
(292, 'MA/RO', 12),
(293, 'MA/RR', 12),
(294, 'MA/SC', 12),
(295, 'MA/SP', 12),
(296, 'MA/SE', 12),
(297, 'MA/TO', 12),
(298, 'MG/AP', 7),
(299, 'MG/AC', 7),
(300, 'MG/AM', 7),
(301, 'MG/AL', 7),
(302, 'MG/BA', 7),
(303, 'MG/CE', 7),
(304, 'MG/DF', 7),
(305, 'MG/ES', 7),
(306, 'MG/GO', 7),
(307, 'MG/MA', 7),
(308, 'MG/MT', 7),
(309, 'MG/MS', 7),
(310, 'MG/MG', 18),
(311, 'MG/PA', 7),
(312, 'MG/PB', 7),
(313, 'MG/PR', 12),
(314, 'MG/PE', 7),
(315, 'MG/PI', 7),
(316, 'MG/RJ', 12),
(317, 'MG/RN', 7),
(318, 'MG/RS', 12),
(319, 'MG/RO', 7),
(320, 'MG/RR', 7),
(321, 'MG/SC', 12),
(322, 'MG/SP', 12),
(323, 'MG/SE', 7),
(324, 'MG/TO', 7),
(325, 'MS/AP', 12),
(326, 'MS/AC', 12),
(327, 'MS/AM', 12),
(328, 'MS/AL', 12),
(329, 'MS/BA', 12),
(330, 'MS/CE', 12),
(331, 'MS/DF', 12),
(332, 'MS/ES', 12),
(333, 'MS/GO', 12),
(334, 'MS/MA', 12),
(335, 'MS/MT', 12),
(336, 'MS/MS', 17),
(337, 'MS/MG', 12),
(338, 'MS/PA', 12),
(339, 'MS/PB', 12),
(340, 'MS/PR', 12),
(341, 'MS/PE', 12),
(342, 'MS/PI', 12),
(343, 'MS/RJ', 12),
(344, 'MS/RN', 12),
(345, 'MS/RS', 12),
(346, 'MS/RO', 12),
(347, 'MS/RR', 12),
(348, 'MS/SC', 12),
(349, 'MS/SP', 12),
(350, 'MS/SE', 12),
(351, 'MS/TO', 12),
(352, 'MT/AP', 12),
(353, 'MT/AC', 12),
(354, 'MT/AM', 12),
(355, 'MT/AL', 12),
(356, 'MT/BA', 12),
(357, 'MT/CE', 12),
(358, 'MT/DF', 12),
(359, 'MT/ES', 12),
(360, 'MT/GO', 12),
(361, 'MT/MA', 12),
(362, 'MT/MS', 12),
(363, 'MT/MT', 17),
(364, 'MT/MG', 12),
(365, 'MT/PA', 12),
(366, 'MT/PB', 12),
(367, 'MT/PR', 12),
(368, 'MT/PE', 12),
(369, 'MT/PI', 12),
(370, 'MT/RJ', 12),
(371, 'MT/RN', 12),
(372, 'MT/RS', 12),
(373, 'MT/RO', 12),
(374, 'MT/RR', 12),
(375, 'MT/SC', 12),
(376, 'MT/SP', 12),
(377, 'MT/SE', 12),
(378, 'MT/TO', 12),
(379, 'PA/AP', 12),
(380, 'PA/AC', 12),
(381, 'PA/AM', 12),
(382, 'PA/AL', 12),
(383, 'PA/BA', 12),
(384, 'PA/CE', 12),
(385, 'PA/DF', 12),
(386, 'PA/ES', 12),
(387, 'PA/GO', 12),
(388, 'PA/MA', 12),
(389, 'PA/MS', 12),
(390, 'PA/MT', 12),
(391, 'PA/MG', 12),
(392, 'PA/PA', 19),
(393, 'PA/PB', 12),
(394, 'PA/PR', 12),
(395, 'PA/PE', 12),
(396, 'PA/PI', 12),
(397, 'PA/RJ', 12),
(398, 'PA/RN', 12),
(399, 'PA/RS', 12),
(400, 'PA/RO', 12),
(401, 'PA/RR', 12),
(402, 'PA/SC', 12),
(403, 'PA/SP', 12),
(404, 'PA/SE', 12),
(405, 'PA/TO', 12),
(406, 'PB/AP', 12),
(407, 'PB/AC', 12),
(408, 'PB/AM', 12),
(409, 'PB/AL', 12),
(410, 'PB/BA', 12),
(411, 'PB/CE', 12),
(412, 'PB/DF', 12),
(413, 'PB/ES', 12),
(414, 'PB/GO', 12),
(415, 'PB/MA', 12),
(416, 'PB/MS', 12),
(417, 'PB/MT', 12),
(418, 'PB/MG', 12),
(419, 'PB/PA', 12),
(420, 'PB/PB', 18),
(421, 'PB/PR', 12),
(422, 'PB/PE', 12),
(423, 'PB/PI', 12),
(424, 'PB/RJ', 12),
(425, 'PB/RN', 12),
(426, 'PB/RS', 12),
(427, 'PB/RO', 12),
(428, 'PB/RR', 12),
(429, 'PB/SC', 12),
(430, 'PB/SP', 12),
(431, 'PB/SE', 12),
(432, 'PB/TO', 12),
(433, 'PI/AP', 12),
(434, 'PI/AC', 12),
(435, 'PI/AM', 12),
(436, 'PI/AL', 12),
(437, 'PI/BA', 12),
(438, 'PI/CE', 12),
(439, 'PI/DF', 12),
(440, 'PI/ES', 12),
(441, 'PI/GO', 12),
(442, 'PI/MA', 12),
(443, 'PI/MS', 12),
(444, 'PI/MT', 17),
(445, 'PI/MG', 12),
(446, 'PI/PA', 12),
(447, 'PI/PB', 12),
(448, 'PI/PR', 12),
(449, 'PI/PE', 12),
(450, 'PI/PI', 18),
(451, 'PI/RJ', 12),
(452, 'PI/RN', 12),
(453, 'PI/RS', 12),
(454, 'PI/RO', 12),
(455, 'PI/RR', 12),
(456, 'PI/SC', 12),
(457, 'PI/SP', 12),
(458, 'PI/SE', 12),
(459, 'PI/TO', 12),
(460, 'PR/AP', 7),
(461, 'PR/AC', 7),
(462, 'PR/AM', 7),
(463, 'PR/AL', 7),
(464, 'PR/BA', 7),
(465, 'PR/CE', 7),
(466, 'PR/DF', 7),
(467, 'PR/ES', 7),
(468, 'PR/GO', 7),
(469, 'PR/MA', 7),
(470, 'PR/MS', 7),
(471, 'PR/MT', 7),
(472, 'PR/MG', 12),
(473, 'PR/PA', 7),
(474, 'PR/PB', 7),
(475, 'PR/PI', 7),
(476, 'PR/PE', 7),
(477, 'PR/PR', 19),
(478, 'PR/RJ', 12),
(479, 'PR/RN', 7),
(480, 'PR/RS', 12),
(481, 'PR/RO', 7),
(482, 'PR/RR', 7),
(483, 'PR/SC', 12),
(484, 'PR/SP', 12),
(485, 'PR/SE', 7),
(486, 'PR/TO', 7),
(487, 'RJ/AP', 7),
(488, 'RJ/AC', 7),
(489, 'RJ/AM', 7),
(490, 'RJ/AL', 7),
(491, 'RJ/BA', 7),
(492, 'RJ/CE', 7),
(493, 'RJ/DF', 7),
(494, 'RJ/ES', 7),
(495, 'RJ/GO', 7),
(496, 'RJ/MA', 7),
(497, 'RJ/MS', 7),
(498, 'RJ/MT', 7),
(499, 'RJ/MG', 12),
(500, 'RJ/PA', 7),
(501, 'RJ/PB', 7),
(502, 'RJ/PI', 7),
(503, 'RJ/PE', 7),
(504, 'RJ/PR', 12),
(505, 'RJ/RJ', 20),
(506, 'RJ/RN', 7),
(507, 'RJ/RS', 12),
(508, 'RJ/RO', 7),
(509, 'RJ/RR', 7),
(510, 'RJ/SC', 12),
(511, 'RJ/SP', 12),
(512, 'RJ/SE', 7),
(513, 'RJ/TO', 7),
(514, 'RN/AP', 12),
(515, 'RN/AC', 12),
(516, 'RN/AM', 12),
(517, 'RN/AL', 12),
(518, 'RN/BA', 12),
(519, 'RN/CE', 12),
(520, 'RN/DF', 12),
(521, 'RN/ES', 12),
(522, 'RN/GO', 12),
(523, 'RN/MA', 12),
(524, 'RN/MS', 12),
(525, 'RN/MT', 17),
(526, 'RN/MG', 12),
(527, 'RN/PA', 12),
(528, 'RN/PB', 12),
(529, 'RN/PR', 12),
(530, 'RN/PE', 12),
(531, 'RN/PE', 12),
(532, 'RN/RJ', 12),
(533, 'RN/RN', 20),
(534, 'RN/RS', 12),
(535, 'RN/RO', 12),
(536, 'RN/RR', 12),
(537, 'RN/SC', 12),
(538, 'RN/SP', 12),
(539, 'RN/SE', 12),
(540, 'RN/TO', 12),
(541, 'RO/AP', 12),
(542, 'RO/AC', 12),
(543, 'RO/AM', 12),
(544, 'RO/AL', 12),
(545, 'RO/BA', 12),
(546, 'RO/CE', 12),
(547, 'RO/DF', 12),
(548, 'RO/ES', 12),
(549, 'RO/GO', 12),
(550, 'RO/MA', 12),
(551, 'RO/MS', 12),
(552, 'RO/MT', 17),
(553, 'RO/MG', 12),
(554, 'RO/PA', 12),
(555, 'RO/PB', 12),
(556, 'RO/PR', 12),
(557, 'RO/PE', 12),
(558, 'RO/PE', 12),
(559, 'RO/RJ', 12),
(560, 'RO/RN', 12),
(561, 'RO/RS', 12),
(562, 'RO/RO', 17.5),
(563, 'RO/RR', 12),
(564, 'RO/SC', 12),
(565, 'RO/SP', 12),
(566, 'RO/SE', 12),
(567, 'RO/TO', 12),
(568, 'RR/AP', 12),
(569, 'RR/AC', 12),
(570, 'RR/AM', 12),
(571, 'RR/AL', 12),
(572, 'RR/BA', 12),
(573, 'RR/CE', 12),
(574, 'RR/DF', 12),
(575, 'RR/ES', 12),
(576, 'RR/GR', 12),
(577, 'RR/MA', 12),
(578, 'RR/MS', 12),
(579, 'RR/MT', 17),
(580, 'RR/MG', 12),
(581, 'RR/PA', 12),
(582, 'RR/PB', 12),
(583, 'RR/PR', 12),
(584, 'RR/PE', 12),
(585, 'RR/PE', 12),
(586, 'RR/RJ', 12),
(587, 'RR/RN', 12),
(588, 'RR/RS', 12),
(589, 'RR/RO', 12),
(590, 'RR/RR', 17),
(591, 'RR/SC', 12),
(592, 'RR/SP', 12),
(593, 'RR/SE', 12),
(594, 'RR/TR', 12),
(595, 'RS/AP', 7),
(596, 'RS/AC', 7),
(597, 'RS/AM', 7),
(598, 'RS/AL', 7),
(599, 'RS/BA', 7),
(600, 'RS/CE', 7),
(601, 'RS/DF', 7),
(602, 'RS/ES', 7),
(603, 'RS/GO', 7),
(604, 'RS/MA', 7),
(605, 'RS/MT', 7),
(606, 'RS/MS', 7),
(607, 'RS/MG', 12),
(608, 'RS/PA', 7),
(609, 'RS/PB', 7),
(610, 'RS/PR', 12),
(611, 'RS/PE', 7),
(612, 'RS/PI', 7),
(613, 'RS/RJ', 12),
(614, 'RS/RN', 7),
(615, 'RS/RS', 18),
(616, 'RS/RO', 7),
(617, 'RS/RR', 7),
(618, 'RS/SC', 12),
(619, 'RS/SP', 12),
(620, 'RS/SE', 7),
(621, 'RS/TO', 7),
(622, 'SC/AP', 7),
(623, 'SC/AC', 7),
(624, 'SC/AM', 7),
(625, 'SC/AL', 7),
(626, 'SC/BA', 7),
(627, 'SC/CE', 7),
(628, 'SC/DF', 7),
(629, 'SC/ES', 7),
(630, 'SC/GO', 7),
(631, 'SC/MA', 7),
(632, 'SC/MT', 7),
(633, 'SC/MS', 7),
(634, 'SC/MG', 12),
(635, 'SC/PA', 7),
(636, 'SC/PB', 7),
(637, 'SC/PR', 12),
(638, 'SC/PE', 7),
(639, 'SC/PI', 7),
(640, 'SC/RJ', 12),
(641, 'SC/RN', 7),
(642, 'SC/RS', 12),
(643, 'SC/RO', 7),
(644, 'SC/RR', 12),
(645, 'SC/SC', 17),
(646, 'SC/SP', 12),
(647, 'SC/SE', 7),
(648, 'SC/TO', 7),
(649, 'SE/AP', 12),
(650, 'SE/AC', 12),
(651, 'SE/AM', 12),
(652, 'SE/AL', 12),
(653, 'SE/BA', 12),
(654, 'SE/CE', 12),
(655, 'SE/DF', 12),
(656, 'SE/ES', 12),
(657, 'SE/GO', 12),
(658, 'SE/MA', 12),
(659, 'SE/MT', 12),
(660, 'SE/MS', 12),
(661, 'SE/MG', 12),
(662, 'SE/PA', 12),
(663, 'SE/PB', 12),
(664, 'SE/PR', 12),
(665, 'SE/PE', 12),
(666, 'SE/PI', 12),
(667, 'SE/RJ', 12),
(668, 'SE/RN', 12),
(669, 'SE/RS', 12),
(670, 'SE/RO', 12),
(671, 'SE/RR', 12),
(672, 'SE/SC', 12),
(673, 'SE/SP', 12),
(674, 'SE/SE', 22),
(675, 'SE/TO', 12),
(676, 'SP/AP', 7),
(677, 'SP/AC', 7),
(678, 'SP/AM', 7),
(679, 'SP/AL', 7),
(680, 'SP/BA', 7),
(681, 'SP/CE', 7),
(682, 'SP/DF', 7),
(683, 'SP/ES', 7),
(684, 'SP/GO', 7),
(685, 'SP/MA', 7),
(686, 'SP/MT', 12),
(687, 'SP/MS', 7),
(688, 'SP/MG', 7),
(689, 'SP/PA', 7),
(690, 'SP/PB', 7),
(691, 'SP/PR', 7),
(692, 'SP/PE', 7),
(693, 'SP/PI', 12),
(694, 'SP/RJ', 12),
(695, 'SP/RN', 7),
(696, 'SP/RS', 7),
(697, 'SP/RO', 7),
(698, 'SP/RR', 12),
(699, 'SP/SC', 12),
(700, 'SP/SE', 7),
(701, 'SP/SP', 18),
(702, 'SP/TO', 7),
(703, 'TO/AP', 12),
(704, 'TO/AC', 12),
(705, 'TO/AM', 12),
(706, 'TO/AL', 12),
(707, 'TO/BA', 12),
(708, 'TO/CE', 12),
(709, 'TO/DF', 12),
(710, 'TO/ES', 12),
(711, 'TO/GO', 12),
(712, 'TO/MA', 12),
(713, 'TO/MT', 12),
(714, 'TO/MS', 12),
(715, 'TO/MG', 12),
(716, 'TO/PA', 12),
(717, 'TO/PB', 12),
(718, 'TO/PR', 12),
(719, 'TO/PE', 12),
(720, 'TO/PI', 12),
(721, 'TO/RJ', 12),
(722, 'TO/RN', 12),
(723, 'TO/RS', 12),
(724, 'TO/RO', 12),
(725, 'TO/RR', 12),
(726, 'TO/SC', 12),
(727, 'TO/SE', 12),
(728, 'TO/SP', 12),
(729, 'TO/TO', 20);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_consumo_medio_km_litro_carga`
--

DROP TABLE IF EXISTS `tb_consumo_medio_km_litro_carga`;
CREATE TABLE `tb_consumo_medio_km_litro_carga` (
  `cd_consumo_medio_km_litro_carga` int(11) NOT NULL,
  `qtd_consumo_medio_km_litro_carga` decimal(4,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_container`
--

DROP TABLE IF EXISTS `tb_container`;
CREATE TABLE `tb_container` (
  `cd_container` int(11) NOT NULL,
  `nm_container` varchar(100) DEFAULT NULL,
  `qt_tara_container` int(11) DEFAULT NULL,
  `qt_peso_min_container` double DEFAULT NULL,
  `qt_peso_max_container` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cotacao_carga`
--

DROP TABLE IF EXISTS `tb_cotacao_carga`;
CREATE TABLE `tb_cotacao_carga` (
  `cd_cotacao_carga` int(11) NOT NULL,
  `vl_cotacao_carga` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cot_aut`
--

DROP TABLE IF EXISTS `tb_cot_aut`;
CREATE TABLE `tb_cot_aut` (
  `cd_cot_aut` int(11) NOT NULL,
  `nm_cot_aut` varchar(100) DEFAULT NULL,
  `vl_cot_aut` decimal(20,2) DEFAULT NULL,
  `dt_cot_aut` date DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_despesas_operacao`
--

DROP TABLE IF EXISTS `tb_despesas_operacao`;
CREATE TABLE `tb_despesas_operacao` (
  `cd_despesas_operacao` int(11) NOT NULL,
  `vl_despesas_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_despesa_total_viagem_carga`
--

DROP TABLE IF EXISTS `tb_despesa_total_viagem_carga`;
CREATE TABLE `tb_despesa_total_viagem_carga` (
  `cd_despesa_total_viagem_carga` int(11) NOT NULL,
  `vl_despesa_total_viagem_carga` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_dta_di_terc_despesas`
--

DROP TABLE IF EXISTS `tb_dta_di_terc_despesas`;
CREATE TABLE `tb_dta_di_terc_despesas` (
  `cd_dta_di_terc_despesas` int(11) NOT NULL,
  `vl_dta_di_terc_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_dta_operacao`
--

DROP TABLE IF EXISTS `tb_dta_operacao`;
CREATE TABLE `tb_dta_operacao` (
  `cd_dta_operacao` int(11) NOT NULL,
  `vl_dta_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_eixos_carga`
--

DROP TABLE IF EXISTS `tb_eixos_carga`;
CREATE TABLE `tb_eixos_carga` (
  `cd_eixos_carga` int(11) NOT NULL,
  `qtd_eixos_carga` int(11) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_email_responsavel_cliente`
--

DROP TABLE IF EXISTS `tb_email_responsavel_cliente`;
CREATE TABLE `tb_email_responsavel_cliente` (
  `cd_email_responsavel_cliente` int(11) NOT NULL,
  `nm_email_responsavel_cliente` varchar(100) DEFAULT NULL,
  `cd_responsavel_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_email_usuario`
--

DROP TABLE IF EXISTS `tb_email_usuario`;
CREATE TABLE `tb_email_usuario` (
  `cd_email` int(11) NOT NULL,
  `nm_email_usuario` varchar(100) DEFAULT NULL,
  `cd_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_estacionamento_despesas`
--

DROP TABLE IF EXISTS `tb_estacionamento_despesas`;
CREATE TABLE `tb_estacionamento_despesas` (
  `cd_estacionamento_despesas` int(11) NOT NULL,
  `vl_estacionamento_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_frete_all_in_fechado_motorista`
--

DROP TABLE IF EXISTS `tb_frete_all_in_fechado_motorista`;
CREATE TABLE `tb_frete_all_in_fechado_motorista` (
  `cd_frete_all_in_fechado_motorista` int(11) NOT NULL,
  `vl_frete_all_in_fechado_motorista` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_frete_conf_antt_motorista`
--

DROP TABLE IF EXISTS `tb_frete_conf_antt_motorista`;
CREATE TABLE `tb_frete_conf_antt_motorista` (
  `cd_frete_conf_antt_motorista` int(11) NOT NULL,
  `vl_frete_conf_antt_motorista` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_frete_peso_operacao`
--

DROP TABLE IF EXISTS `tb_frete_peso_operacao`;
CREATE TABLE `tb_frete_peso_operacao` (
  `cd_frete_peso_operacao` int(11) NOT NULL,
  `vl_frete_peso_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_gris_rast_despesas`
--

DROP TABLE IF EXISTS `tb_gris_rast_despesas`;
CREATE TABLE `tb_gris_rast_despesas` (
  `cd_gris_rast_despesas` int(11) NOT NULL,
  `vl_gris_rast_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_imp_gris`
--

DROP TABLE IF EXISTS `tb_imp_gris`;
CREATE TABLE `tb_imp_gris` (
  `cd_imp_gris` int(11) NOT NULL,
  `vl_imp_gris` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_imp_rcfdc_despesas`
--

DROP TABLE IF EXISTS `tb_imp_rcfdc_despesas`;
CREATE TABLE `tb_imp_rcfdc_despesas` (
  `cd_imp_rcfdc_despesas` int(11) NOT NULL,
  `vl_imp_rcfdc_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_imp_rcfdc_operacao`
--

DROP TABLE IF EXISTS `tb_imp_rcfdc_operacao`;
CREATE TABLE `tb_imp_rcfdc_operacao` (
  `cd_imp_rcfdc_operacao` int(11) NOT NULL,
  `vl_imp_rcfdc_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_imp_rctrc_despesas`
--

DROP TABLE IF EXISTS `tb_imp_rctrc_despesas`;
CREATE TABLE `tb_imp_rctrc_despesas` (
  `cd_imp_rctrc_despesas` int(11) NOT NULL,
  `vl_imp_rctrc_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_imp_rctrc_operacao`
--

DROP TABLE IF EXISTS `tb_imp_rctrc_operacao`;
CREATE TABLE `tb_imp_rctrc_operacao` (
  `cd_imp_rctrc_operacao` int(11) NOT NULL,
  `vl_imp_rctrc_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_imp_suspenso_operacao`
--

DROP TABLE IF EXISTS `tb_imp_suspenso_operacao`;
CREATE TABLE `tb_imp_suspenso_operacao` (
  `cd_imp_suspenso_operacao` int(11) NOT NULL,
  `vl_imp_suspenso_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_irpj_despesas`
--

DROP TABLE IF EXISTS `tb_irpj_despesas`;
CREATE TABLE `tb_irpj_despesas` (
  `cd_irpj_despesas` int(11) NOT NULL,
  `vl_irpj_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_km_ida_carga`
--

DROP TABLE IF EXISTS `tb_km_ida_carga`;
CREATE TABLE `tb_km_ida_carga` (
  `cd_km_ida_carga` int(11) NOT NULL,
  `qtd_km_ida_carga` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_km_volta_carga`
--

DROP TABLE IF EXISTS `tb_km_volta_carga`;
CREATE TABLE `tb_km_volta_carga` (
  `cd_km_volta_carga` int(11) NOT NULL,
  `qtd_km_volta_carga` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_local_devolucao_container`
--

DROP TABLE IF EXISTS `tb_local_devolucao_container`;
CREATE TABLE `tb_local_devolucao_container` (
  `cd_local_devolucao_container` int(11) NOT NULL,
  `nm_local_devolucao_container` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_lucro_bruto_operacao`
--

DROP TABLE IF EXISTS `tb_lucro_bruto_operacao`;
CREATE TABLE `tb_lucro_bruto_operacao` (
  `cd_lucro_bruto_operacao` int(11) NOT NULL,
  `vl_lucro_bruto_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_lucro_frete_all_in_fechado_motorista`
--

DROP TABLE IF EXISTS `tb_lucro_frete_all_in_fechado_motorista`;
CREATE TABLE `tb_lucro_frete_all_in_fechado_motorista` (
  `cd_lucro_frete_all_in_fechado_motorista` int(11) NOT NULL,
  `vl_lucro_frete_all_in_fechado_motorista` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_lucro_tentar_fechar_motorista`
--

DROP TABLE IF EXISTS `tb_lucro_tentar_fechar_motorista`;
CREATE TABLE `tb_lucro_tentar_fechar_motorista` (
  `cd_lucro_tentar_fechar_motorista` int(11) NOT NULL,
  `vl_lucro_tentar_fechar_motorista` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_lucro_total_aut_tab_motorista`
--

DROP TABLE IF EXISTS `tb_lucro_total_aut_tab_motorista`;
CREATE TABLE `tb_lucro_total_aut_tab_motorista` (
  `cd_lucro_total_aut_tab_motorista` int(11) NOT NULL,
  `vl_lucro_total_aut_tab_motorista` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_margem_operacao`
--

DROP TABLE IF EXISTS `tb_margem_operacao`;
CREATE TABLE `tb_margem_operacao` (
  `cd_margem_operacao` int(11) NOT NULL,
  `vl_margem_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_mot_aut_despesas`
--

DROP TABLE IF EXISTS `tb_mot_aut_despesas`;
CREATE TABLE `tb_mot_aut_despesas` (
  `cd_mot_aut_despesas` int(11) NOT NULL,
  `vl_mot_aut_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pedagio_despesas`
--

DROP TABLE IF EXISTS `tb_pedagio_despesas`;
CREATE TABLE `tb_pedagio_despesas` (
  `cd_pedagio_despesas` int(11) NOT NULL,
  `vl_pedagio_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pedagio_ida_eixo_carga`
--

DROP TABLE IF EXISTS `tb_pedagio_ida_eixo_carga`;
CREATE TABLE `tb_pedagio_ida_eixo_carga` (
  `cd_pedagio_ida_eixo_carga` int(11) NOT NULL,
  `vl_pedagio_ida_eixo_carga` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pedagio_operacao`
--

DROP TABLE IF EXISTS `tb_pedagio_operacao`;
CREATE TABLE `tb_pedagio_operacao` (
  `cd_pedagio_operacao` int(11) NOT NULL,
  `vl_pedagio_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pedagio_volta_eixo_carga`
--

DROP TABLE IF EXISTS `tb_pedagio_volta_eixo_carga`;
CREATE TABLE `tb_pedagio_volta_eixo_carga` (
  `cd_pedagio_volta_eixo_carga` int(11) NOT NULL,
  `vl_pedagio_volta_eixo_carga` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pis_despesas`
--

DROP TABLE IF EXISTS `tb_pis_despesas`;
CREATE TABLE `tb_pis_despesas` (
  `cd_pis_despesas` int(11) NOT NULL,
  `vl_pis_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_adic_irpj_despesas`
--

DROP TABLE IF EXISTS `tb_porc_adic_irpj_despesas`;
CREATE TABLE `tb_porc_adic_irpj_despesas` (
  `cd_porc_adic_irpj_despesas` int(11) NOT NULL,
  `vl_porc_adic_irpj_despesas` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_cofins_despesas`
--

DROP TABLE IF EXISTS `tb_porc_cofins_despesas`;
CREATE TABLE `tb_porc_cofins_despesas` (
  `cd_porc_cofins_despesas` int(11) NOT NULL,
  `vl_porc_cofins_despesas` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_comissao_despesas`
--

DROP TABLE IF EXISTS `tb_porc_comissao_despesas`;
CREATE TABLE `tb_porc_comissao_despesas` (
  `cd_porc_comissao_despesas` int(11) NOT NULL,
  `vl_porc_comissao_despesas` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_icms_despesas`
--

DROP TABLE IF EXISTS `tb_porc_icms_despesas`;
CREATE TABLE `tb_porc_icms_despesas` (
  `cd_porc_icms_despesas` int(11) NOT NULL,
  `vl_porc_icms_despesas` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_icms_operacao`
--

DROP TABLE IF EXISTS `tb_porc_icms_operacao`;
CREATE TABLE `tb_porc_icms_operacao` (
  `cd_porc_icms_operacao` int(11) NOT NULL,
  `vl_porcicms_operacao` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_imp_gris`
--

DROP TABLE IF EXISTS `tb_porc_imp_gris`;
CREATE TABLE `tb_porc_imp_gris` (
  `cd_porc_imp_gris` int(11) NOT NULL,
  `vl_porc_imp_gris` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_imp_rcfdc_despesas`
--

DROP TABLE IF EXISTS `tb_porc_imp_rcfdc_despesas`;
CREATE TABLE `tb_porc_imp_rcfdc_despesas` (
  `cd_porc_imp_rcfdc_despesas` int(11) NOT NULL,
  `vl_porc_imp_rcfdc_despesas` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_imp_rcfdc_operacao`
--

DROP TABLE IF EXISTS `tb_porc_imp_rcfdc_operacao`;
CREATE TABLE `tb_porc_imp_rcfdc_operacao` (
  `cd_porc_imp_rcfdc_operacao` int(11) NOT NULL,
  `vl_porc_imp_rcfdc_operacao` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_imp_rctrc_despesas`
--

DROP TABLE IF EXISTS `tb_porc_imp_rctrc_despesas`;
CREATE TABLE `tb_porc_imp_rctrc_despesas` (
  `cd_porc_imp_rctrc_despesas` int(11) NOT NULL,
  `vl_porc_imp_rctrc_despesas` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_imp_rctrc_operacao`
--

DROP TABLE IF EXISTS `tb_porc_imp_rctrc_operacao`;
CREATE TABLE `tb_porc_imp_rctrc_operacao` (
  `cd_porc_imp_rctrc_operacao` int(11) NOT NULL,
  `vl_porc_imp_rctrc_operacao` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_imp_suspenso_operacao`
--

DROP TABLE IF EXISTS `tb_porc_imp_suspenso_operacao`;
CREATE TABLE `tb_porc_imp_suspenso_operacao` (
  `cd_porc_imp_suspenso_operacao` int(11) NOT NULL,
  `vl_porc_imp_suspenso_operacao` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_irpj_despesas`
--

DROP TABLE IF EXISTS `tb_porc_irpj_despesas`;
CREATE TABLE `tb_porc_irpj_despesas` (
  `cd_porc_irpj_despesas` int(11) NOT NULL,
  `vl_porc_irpj_despesas` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_lucro_bruto_operacao`
--

DROP TABLE IF EXISTS `tb_porc_lucro_bruto_operacao`;
CREATE TABLE `tb_porc_lucro_bruto_operacao` (
  `cd_porc_lucro_bruto_operacao` int(11) NOT NULL,
  `vl_porc_lucro_bruto_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_pis_despesas`
--

DROP TABLE IF EXISTS `tb_porc_pis_despesas`;
CREATE TABLE `tb_porc_pis_despesas` (
  `cd_porc_pis_despesas` int(11) NOT NULL,
  `vl_porc_pis_despesas` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_simples_nac_despesas`
--

DROP TABLE IF EXISTS `tb_porc_simples_nac_despesas`;
CREATE TABLE `tb_porc_simples_nac_despesas` (
  `cd_porc_simples_nac_despesas` int(11) NOT NULL,
  `vl_porc_simples_nac_despesas` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_tipo_seguro_operacao`
--

DROP TABLE IF EXISTS `tb_porc_tipo_seguro_operacao`;
CREATE TABLE `tb_porc_tipo_seguro_operacao` (
  `cd_porc_tipo_seguro_operacao` int(11) NOT NULL,
  `vl_porc_tipo_seguro_operacao` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_porc_total_prest_operacao`
--

DROP TABLE IF EXISTS `tb_porc_total_prest_operacao`;
CREATE TABLE `tb_porc_total_prest_operacao` (
  `cd_porc_total_prest_operacao` int(11) NOT NULL,
  `vl_porc_total_prest_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_preco_litro_comb_carga`
--

DROP TABLE IF EXISTS `tb_preco_litro_comb_carga`;
CREATE TABLE `tb_preco_litro_comb_carga` (
  `cd_preco_litro_comb_carga` int(11) NOT NULL,
  `vl_preco_litro_comb_carga` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_privilegio`
--

DROP TABLE IF EXISTS `tb_privilegio`;
CREATE TABLE `tb_privilegio` (
  `cd_privilegio` int(11) NOT NULL,
  `nm_privilegio` enum('Adm','Usuario') DEFAULT NULL,
  `cd_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
CREATE TABLE `tb_produto` (
  `cd_produto` int(11) NOT NULL,
  `nm_produto` varchar(100) DEFAULT NULL,
  `qt_produto` int(11) DEFAULT NULL,
  `ds_produto` varchar(500) DEFAULT NULL,
  `qt_cubagem_produto` double DEFAULT NULL,
  `qt_peso_produto` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_profit_despesas`
--

DROP TABLE IF EXISTS `tb_profit_despesas`;
CREATE TABLE `tb_profit_despesas` (
  `cd_profit_despesas` int(11) NOT NULL,
  `vl_profit_despesas` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_proposta`
--

DROP TABLE IF EXISTS `tb_proposta`;
CREATE TABLE `tb_proposta` (
  `cd_proposta` int(11) NOT NULL,
  `dt_proposta` date DEFAULT NULL,
  `nm_referencia_acl` varchar(100) DEFAULT NULL,
  `dt_horario_recebimento` datetime DEFAULT NULL,
  `ds_metodo_transporte` varchar(500) DEFAULT NULL,
  `cd_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_responsavel_cliente`
--

DROP TABLE IF EXISTS `tb_responsavel_cliente`;
CREATE TABLE `tb_responsavel_cliente` (
  `cd_responsavel_cliente` int(11) NOT NULL,
  `nm_responsavel_cliente` varchar(100) DEFAULT NULL,
  `cd_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_simples_nac_despesas`
--

DROP TABLE IF EXISTS `tb_simples_nac_despesas`;
CREATE TABLE `tb_simples_nac_despesas` (
  `cd_simples_nac_despesas` int(11) NOT NULL,
  `vl_simples_nac_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_sub_total_operacao`
--

DROP TABLE IF EXISTS `tb_sub_total_operacao`;
CREATE TABLE `tb_sub_total_operacao` (
  `cd_sub_total_operacao` int(11) NOT NULL,
  `vl_sub_total_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tentar_fechar_motorista`
--

DROP TABLE IF EXISTS `tb_tentar_fechar_motorista`;
CREATE TABLE `tb_tentar_fechar_motorista` (
  `cd_tentar_fechar_motorista` int(11) NOT NULL,
  `vl_tentar_fechar_motorista` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_carga`
--

DROP TABLE IF EXISTS `tb_tipo_carga`;
CREATE TABLE `tb_tipo_carga` (
  `cd_tipo_carga` int(11) NOT NULL,
  `nm_tipo_carga` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_frete`
--

DROP TABLE IF EXISTS `tb_tipo_frete`;
CREATE TABLE `tb_tipo_frete` (
  `cd_tipo_frete` int(11) NOT NULL,
  `nm_tipo_frete` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_moeda_carga`
--

DROP TABLE IF EXISTS `tb_tipo_moeda_carga`;
CREATE TABLE `tb_tipo_moeda_carga` (
  `cd_tipo_moeda_carga` int(11) NOT NULL,
  `nm_tipo_moeda_carga` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_operacao`
--

DROP TABLE IF EXISTS `tb_tipo_operacao`;
CREATE TABLE `tb_tipo_operacao` (
  `cd_tipo_operacao` int(11) NOT NULL,
  `nm_tipo_operacao` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_proposta`
--

DROP TABLE IF EXISTS `tb_tipo_proposta`;
CREATE TABLE `tb_tipo_proposta` (
  `cd_tipo_proposta` int(11) NOT NULL,
  `nm_tipo_proposta` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_seguro_operacao`
--

DROP TABLE IF EXISTS `tb_tipo_seguro_operacao`;
CREATE TABLE `tb_tipo_seguro_operacao` (
  `cd_tipo_seguro_operacao` int(11) NOT NULL,
  `nm_tipo_seguro_operacao` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_total_aut_motorista`
--

DROP TABLE IF EXISTS `tb_total_aut_motorista`;
CREATE TABLE `tb_total_aut_motorista` (
  `cd_total_aut_motorista` int(11) NOT NULL,
  `vl_total_aut_motorista` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_total_despesas`
--

DROP TABLE IF EXISTS `tb_total_despesas`;
CREATE TABLE `tb_total_despesas` (
  `cd_total_despesas` int(11) NOT NULL,
  `vl_total_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_total_km_carga`
--

DROP TABLE IF EXISTS `tb_total_km_carga`;
CREATE TABLE `tb_total_km_carga` (
  `cd_total_km_carga` int(11) NOT NULL,
  `vl_total_km_carga` double DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_total_prest_operacao`
--

DROP TABLE IF EXISTS `tb_total_prest_operacao`;
CREATE TABLE `tb_total_prest_operacao` (
  `cd_total_prest_operacao` int(11) NOT NULL,
  `vl_total_prest_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_total_tipo_seguro_operacao`
--

DROP TABLE IF EXISTS `tb_total_tipo_seguro_operacao`;
CREATE TABLE `tb_total_tipo_seguro_operacao` (
  `cd_total_tipo_seguro_operacao` int(11) NOT NULL,
  `vl_total_tipo_seguro_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tot_imp_seg_operacao`
--

DROP TABLE IF EXISTS `tb_tot_imp_seg_operacao`;
CREATE TABLE `tb_tot_imp_seg_operacao` (
  `cd_tot_imp_seg_operacao` int(11) NOT NULL,
  `vl_tot_imp_seg_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_uf_destino`
--

DROP TABLE IF EXISTS `tb_uf_destino`;
CREATE TABLE `tb_uf_destino` (
  `cd_uf_destino` int(11) NOT NULL,
  `sg_uf_destino` char(2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_uf_origem`
--

DROP TABLE IF EXISTS `tb_uf_origem`;
CREATE TABLE `tb_uf_origem` (
  `cd_uf_origem` int(11) NOT NULL,
  `sg_uf_origem` char(2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
CREATE TABLE `tb_usuario` (
  `cd_usuario` int(11) NOT NULL,
  `nm_nome_completo` varchar(100) DEFAULT NULL,
  `nm_cargo_usuario` varchar(100) DEFAULT NULL,
  `cd_senha` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_vale_pedagio_tab_motorista`
--

DROP TABLE IF EXISTS `tb_vale_pedagio_tab_motorista`;
CREATE TABLE `tb_vale_pedagio_tab_motorista` (
  `cd_vale_pedagio_tab_motorista` int(11) NOT NULL,
  `vl_vale_pedagio_tab_motorista` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_valores_motorista`
--

DROP TABLE IF EXISTS `tb_valores_motorista`;
CREATE TABLE `tb_valores_motorista` (
  `cd_valores_motorista` int(11) NOT NULL,
  `vl_valores_mototrista` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_valor_carga`
--

DROP TABLE IF EXISTS `tb_valor_carga`;
CREATE TABLE `tb_valor_carga` (
  `cd_valor_carga` int(11) NOT NULL,
  `vl_valor_carga` decimal(20,2) DEFAULT NULL,
  `cd_tipo_carga` int(11) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_valor_carga_brl_carga`
--

DROP TABLE IF EXISTS `tb_valor_carga_brl_carga`;
CREATE TABLE `tb_valor_carga_brl_carga` (
  `cd_valor_carga_brl_carga` int(11) NOT NULL,
  `vl_valor_carga_brl_carga` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_valor_carga_usd_eur_carga`
--

DROP TABLE IF EXISTS `tb_valor_carga_usd_eur_carga`;
CREATE TABLE `tb_valor_carga_usd_eur_carga` (
  `cd_valor_carga_usd_eur_carga` int(11) NOT NULL,
  `vl_valor_carga_usd_eur_carga` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_valor_container_operacao`
--

DROP TABLE IF EXISTS `tb_valor_container_operacao`;
CREATE TABLE `tb_valor_container_operacao` (
  `cd_valor_container_operacao` int(11) NOT NULL,
  `vl_valor_container_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_valor_icms_despesas`
--

DROP TABLE IF EXISTS `tb_valor_icms_despesas`;
CREATE TABLE `tb_valor_icms_despesas` (
  `cd_valor_icms_despesas` int(11) NOT NULL,
  `vl_valor_icms_despesas` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_valor_icms_operacao`
--

DROP TABLE IF EXISTS `tb_valor_icms_operacao`;
CREATE TABLE `tb_valor_icms_operacao` (
  `cd_valor_icms_operacao` int(11) NOT NULL,
  `vl_valor_icms_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_valor_merc_operacao`
--

DROP TABLE IF EXISTS `tb_valor_merc_operacao`;
CREATE TABLE `tb_valor_merc_operacao` (
  `cd_valor_merc_operacao` int(11) NOT NULL,
  `vl_valor_merc_operacao` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_valor_total_comb_carga`
--

DROP TABLE IF EXISTS `tb_valor_total_comb_carga`;
CREATE TABLE `tb_valor_total_comb_carga` (
  `cd_valor_total_comb_carga` int(11) NOT NULL,
  `vl_valor_total_comb_carga` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_valor_total_pedagio_carga`
--

DROP TABLE IF EXISTS `tb_valor_total_pedagio_carga`;
CREATE TABLE `tb_valor_total_pedagio_carga` (
  `cd_valor_total_pedagio_carga` int(11) NOT NULL,
  `vl_valor_total_pedagio_carga` decimal(20,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_veiculo`
--

DROP TABLE IF EXISTS `tb_veiculo`;
CREATE TABLE `tb_veiculo` (
  `cd_veiculo` int(11) NOT NULL,
  `nm_veiculo` varchar(100) DEFAULT NULL,
  `qt_eixos_veiculo` int(11) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_adic_irpj_despesas`
--
ALTER TABLE `tb_adic_irpj_despesas`
  ADD PRIMARY KEY (`cd_adic_irpj_despesas`),
  ADD KEY `fk_adic_irpj_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_ajudantes_despesas`
--
ALTER TABLE `tb_ajudantes_despesas`
  ADD PRIMARY KEY (`cd_ajudantes_despesas`),
  ADD KEY `fk_ajudantes_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_ajudantes_operacao`
--
ALTER TABLE `tb_ajudantes_operacao`
  ADD PRIMARY KEY (`cd_ajudantes_operacao`),
  ADD KEY `fk_ajudantes_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_arq_propostas`
--
ALTER TABLE `tb_arq_propostas`
  ADD PRIMARY KEY (`cd_arq_propostas`),
  ADD KEY `fk_arq_propostas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_buonny_cad_despesas`
--
ALTER TABLE `tb_buonny_cad_despesas`
  ADD PRIMARY KEY (`cd_buonny_cad_despesas`),
  ADD KEY `fk_buonny_cad_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_carreta`
--
ALTER TABLE `tb_carreta`
  ADD PRIMARY KEY (`cd_carreta`),
  ADD KEY `fk_carreta_veiculo` (`cd_proposta`);

--
-- Índices para tabela `tb_cat_imposto_operacao`
--
ALTER TABLE `tb_cat_imposto_operacao`
  ADD PRIMARY KEY (`cd_cat_imposto_operacao`),
  ADD KEY `fk_cat_imposto_operacao_proposta` (`cd_proposta`);

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
-- Índices para tabela `tb_class_imo`
--
ALTER TABLE `tb_class_imo`
  ADD PRIMARY KEY (`cd_class_imo`),
  ADD KEY `fk_class_imo_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`cd_cliente`),
  ADD KEY `fk_cliente_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_cofins_despesas`
--
ALTER TABLE `tb_cofins_despesas`
  ADD PRIMARY KEY (`cd_cofins_despesas`),
  ADD KEY `fk_cofins_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_comb_total_litro_carga`
--
ALTER TABLE `tb_comb_total_litro_carga`
  ADD PRIMARY KEY (`cd_comb_total_litro_carga`),
  ADD KEY `fk_comb_total_litro_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_comissao_despesas`
--
ALTER TABLE `tb_comissao_despesas`
  ADD PRIMARY KEY (`cd_comissao_despesas`),
  ADD KEY `fk_comissao_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_consulta_porc_icms`
--
ALTER TABLE `tb_consulta_porc_icms`
  ADD PRIMARY KEY (`cd_consulta_porc_icms`);

--
-- Índices para tabela `tb_consumo_medio_km_litro_carga`
--
ALTER TABLE `tb_consumo_medio_km_litro_carga`
  ADD PRIMARY KEY (`cd_consumo_medio_km_litro_carga`),
  ADD KEY `fk_consumo_medio_km_litro_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_container`
--
ALTER TABLE `tb_container`
  ADD PRIMARY KEY (`cd_container`),
  ADD KEY `fk_container_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_cotacao_carga`
--
ALTER TABLE `tb_cotacao_carga`
  ADD PRIMARY KEY (`cd_cotacao_carga`),
  ADD KEY `fk_cotacao_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_cot_aut`
--
ALTER TABLE `tb_cot_aut`
  ADD PRIMARY KEY (`cd_cot_aut`),
  ADD KEY `fk_cot_aut_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_despesas_operacao`
--
ALTER TABLE `tb_despesas_operacao`
  ADD PRIMARY KEY (`cd_despesas_operacao`),
  ADD KEY `fk_despesas_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_despesa_total_viagem_carga`
--
ALTER TABLE `tb_despesa_total_viagem_carga`
  ADD PRIMARY KEY (`cd_despesa_total_viagem_carga`),
  ADD KEY `fk_despesa_total_viagem_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_dta_di_terc_despesas`
--
ALTER TABLE `tb_dta_di_terc_despesas`
  ADD PRIMARY KEY (`cd_dta_di_terc_despesas`),
  ADD KEY `fk_dta_di_terc_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_dta_operacao`
--
ALTER TABLE `tb_dta_operacao`
  ADD PRIMARY KEY (`cd_dta_operacao`),
  ADD KEY `fk_dta_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_eixos_carga`
--
ALTER TABLE `tb_eixos_carga`
  ADD PRIMARY KEY (`cd_eixos_carga`),
  ADD KEY `fk_eixos_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_email_responsavel_cliente`
--
ALTER TABLE `tb_email_responsavel_cliente`
  ADD PRIMARY KEY (`cd_email_responsavel_cliente`),
  ADD KEY `fk_email_responsavel_cliente_cliente` (`cd_responsavel_cliente`);

--
-- Índices para tabela `tb_email_usuario`
--
ALTER TABLE `tb_email_usuario`
  ADD PRIMARY KEY (`cd_email`),
  ADD KEY `fk_email_usuario_usuario` (`cd_usuario`);

--
-- Índices para tabela `tb_estacionamento_despesas`
--
ALTER TABLE `tb_estacionamento_despesas`
  ADD PRIMARY KEY (`cd_estacionamento_despesas`),
  ADD KEY `fk_estacionamento_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_frete_all_in_fechado_motorista`
--
ALTER TABLE `tb_frete_all_in_fechado_motorista`
  ADD PRIMARY KEY (`cd_frete_all_in_fechado_motorista`),
  ADD KEY `fk_frete_all_in_fechado_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_frete_conf_antt_motorista`
--
ALTER TABLE `tb_frete_conf_antt_motorista`
  ADD PRIMARY KEY (`cd_frete_conf_antt_motorista`),
  ADD KEY `fk_frete_conf_antt_motorista_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_frete_peso_operacao`
--
ALTER TABLE `tb_frete_peso_operacao`
  ADD PRIMARY KEY (`cd_frete_peso_operacao`),
  ADD KEY `fk_frete_peso_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_gris_rast_despesas`
--
ALTER TABLE `tb_gris_rast_despesas`
  ADD PRIMARY KEY (`cd_gris_rast_despesas`),
  ADD KEY `fk_gris_rast_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_imp_gris`
--
ALTER TABLE `tb_imp_gris`
  ADD PRIMARY KEY (`cd_imp_gris`),
  ADD KEY `fk_imp_gris_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_imp_rcfdc_despesas`
--
ALTER TABLE `tb_imp_rcfdc_despesas`
  ADD PRIMARY KEY (`cd_imp_rcfdc_despesas`),
  ADD KEY `fk_imp_rcfdc_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_imp_rcfdc_operacao`
--
ALTER TABLE `tb_imp_rcfdc_operacao`
  ADD PRIMARY KEY (`cd_imp_rcfdc_operacao`),
  ADD KEY `fk_imp_rcfdc_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_imp_rctrc_despesas`
--
ALTER TABLE `tb_imp_rctrc_despesas`
  ADD PRIMARY KEY (`cd_imp_rctrc_despesas`),
  ADD KEY `fk_imp_rctrc_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_imp_rctrc_operacao`
--
ALTER TABLE `tb_imp_rctrc_operacao`
  ADD PRIMARY KEY (`cd_imp_rctrc_operacao`),
  ADD KEY `fk_imp_rctrc_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_imp_suspenso_operacao`
--
ALTER TABLE `tb_imp_suspenso_operacao`
  ADD PRIMARY KEY (`cd_imp_suspenso_operacao`),
  ADD KEY `fk_imp_suspenso_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_irpj_despesas`
--
ALTER TABLE `tb_irpj_despesas`
  ADD PRIMARY KEY (`cd_irpj_despesas`),
  ADD KEY `fk_irpj_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_km_ida_carga`
--
ALTER TABLE `tb_km_ida_carga`
  ADD PRIMARY KEY (`cd_km_ida_carga`),
  ADD KEY `fk_km_ida_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_km_volta_carga`
--
ALTER TABLE `tb_km_volta_carga`
  ADD PRIMARY KEY (`cd_km_volta_carga`),
  ADD KEY `fk_km_volta_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_local_devolucao_container`
--
ALTER TABLE `tb_local_devolucao_container`
  ADD PRIMARY KEY (`cd_local_devolucao_container`),
  ADD KEY `fk_local_devolucao_container_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_lucro_bruto_operacao`
--
ALTER TABLE `tb_lucro_bruto_operacao`
  ADD PRIMARY KEY (`cd_lucro_bruto_operacao`),
  ADD KEY `fk_lucro_bruto_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_lucro_frete_all_in_fechado_motorista`
--
ALTER TABLE `tb_lucro_frete_all_in_fechado_motorista`
  ADD PRIMARY KEY (`cd_lucro_frete_all_in_fechado_motorista`),
  ADD KEY `fk_lucro_frete_all_in_fechado_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_lucro_tentar_fechar_motorista`
--
ALTER TABLE `tb_lucro_tentar_fechar_motorista`
  ADD PRIMARY KEY (`cd_lucro_tentar_fechar_motorista`),
  ADD KEY `fk_lucro_tentar_fechar_motorista_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_lucro_total_aut_tab_motorista`
--
ALTER TABLE `tb_lucro_total_aut_tab_motorista`
  ADD PRIMARY KEY (`cd_lucro_total_aut_tab_motorista`),
  ADD KEY `fk_lucro_total_aut_tab_motorista_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_margem_operacao`
--
ALTER TABLE `tb_margem_operacao`
  ADD PRIMARY KEY (`cd_margem_operacao`),
  ADD KEY `fk_margem_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_mot_aut_despesas`
--
ALTER TABLE `tb_mot_aut_despesas`
  ADD PRIMARY KEY (`cd_mot_aut_despesas`),
  ADD KEY `fk_mot_aut_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_pedagio_despesas`
--
ALTER TABLE `tb_pedagio_despesas`
  ADD PRIMARY KEY (`cd_pedagio_despesas`),
  ADD KEY `fk_pedagio_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_pedagio_ida_eixo_carga`
--
ALTER TABLE `tb_pedagio_ida_eixo_carga`
  ADD PRIMARY KEY (`cd_pedagio_ida_eixo_carga`),
  ADD KEY `fk_pedagio_ida_eixo_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_pedagio_operacao`
--
ALTER TABLE `tb_pedagio_operacao`
  ADD PRIMARY KEY (`cd_pedagio_operacao`),
  ADD KEY `fk_pedagio_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_pedagio_volta_eixo_carga`
--
ALTER TABLE `tb_pedagio_volta_eixo_carga`
  ADD PRIMARY KEY (`cd_pedagio_volta_eixo_carga`),
  ADD KEY `fk_pedagio_volta_eixo_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_pis_despesas`
--
ALTER TABLE `tb_pis_despesas`
  ADD PRIMARY KEY (`cd_pis_despesas`),
  ADD KEY `fk_pis_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_adic_irpj_despesas`
--
ALTER TABLE `tb_porc_adic_irpj_despesas`
  ADD PRIMARY KEY (`cd_porc_adic_irpj_despesas`),
  ADD KEY `fk_porc_adic_irpj_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_cofins_despesas`
--
ALTER TABLE `tb_porc_cofins_despesas`
  ADD PRIMARY KEY (`cd_porc_cofins_despesas`),
  ADD KEY `fk_porc_cofins_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_comissao_despesas`
--
ALTER TABLE `tb_porc_comissao_despesas`
  ADD PRIMARY KEY (`cd_porc_comissao_despesas`),
  ADD KEY `fk_porc_comissao_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_icms_despesas`
--
ALTER TABLE `tb_porc_icms_despesas`
  ADD PRIMARY KEY (`cd_porc_icms_despesas`),
  ADD KEY `fk_porc_icms_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_icms_operacao`
--
ALTER TABLE `tb_porc_icms_operacao`
  ADD PRIMARY KEY (`cd_porc_icms_operacao`),
  ADD KEY `fk_porc_icms_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_imp_gris`
--
ALTER TABLE `tb_porc_imp_gris`
  ADD PRIMARY KEY (`cd_porc_imp_gris`),
  ADD KEY `fk_porc_imp_gris_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_imp_rcfdc_despesas`
--
ALTER TABLE `tb_porc_imp_rcfdc_despesas`
  ADD PRIMARY KEY (`cd_porc_imp_rcfdc_despesas`),
  ADD KEY `fk_porc_imp_rcfdc_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_imp_rcfdc_operacao`
--
ALTER TABLE `tb_porc_imp_rcfdc_operacao`
  ADD PRIMARY KEY (`cd_porc_imp_rcfdc_operacao`),
  ADD KEY `fk_porc_imp_rcfdc_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_imp_rctrc_despesas`
--
ALTER TABLE `tb_porc_imp_rctrc_despesas`
  ADD PRIMARY KEY (`cd_porc_imp_rctrc_despesas`),
  ADD KEY `fk_porc_imp_rctrc_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_imp_rctrc_operacao`
--
ALTER TABLE `tb_porc_imp_rctrc_operacao`
  ADD PRIMARY KEY (`cd_porc_imp_rctrc_operacao`),
  ADD KEY `fk_porc_imp_rctrc_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_imp_suspenso_operacao`
--
ALTER TABLE `tb_porc_imp_suspenso_operacao`
  ADD PRIMARY KEY (`cd_porc_imp_suspenso_operacao`),
  ADD KEY `fk_porc_imp_suspenso_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_irpj_despesas`
--
ALTER TABLE `tb_porc_irpj_despesas`
  ADD PRIMARY KEY (`cd_porc_irpj_despesas`),
  ADD KEY `fk_porc_irpj_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_lucro_bruto_operacao`
--
ALTER TABLE `tb_porc_lucro_bruto_operacao`
  ADD PRIMARY KEY (`cd_porc_lucro_bruto_operacao`),
  ADD KEY `fk_porc_lucro_bruto_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_pis_despesas`
--
ALTER TABLE `tb_porc_pis_despesas`
  ADD PRIMARY KEY (`cd_porc_pis_despesas`),
  ADD KEY `fk_porc_pis_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_simples_nac_despesas`
--
ALTER TABLE `tb_porc_simples_nac_despesas`
  ADD PRIMARY KEY (`cd_porc_simples_nac_despesas`),
  ADD KEY `fk_porc_simples_nac_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_tipo_seguro_operacao`
--
ALTER TABLE `tb_porc_tipo_seguro_operacao`
  ADD PRIMARY KEY (`cd_porc_tipo_seguro_operacao`),
  ADD KEY `fk_porc_tipo_seguro_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_porc_total_prest_operacao`
--
ALTER TABLE `tb_porc_total_prest_operacao`
  ADD PRIMARY KEY (`cd_porc_total_prest_operacao`),
  ADD KEY `fk_porc_total_prest_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_preco_litro_comb_carga`
--
ALTER TABLE `tb_preco_litro_comb_carga`
  ADD PRIMARY KEY (`cd_preco_litro_comb_carga`),
  ADD KEY `fk_preco_litro_comb_carga_proposta` (`cd_proposta`);

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
-- Índices para tabela `tb_profit_despesas`
--
ALTER TABLE `tb_profit_despesas`
  ADD PRIMARY KEY (`cd_profit_despesas`),
  ADD KEY `fk_profit_despesas_proposta` (`cd_proposta`);

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
-- Índices para tabela `tb_simples_nac_despesas`
--
ALTER TABLE `tb_simples_nac_despesas`
  ADD PRIMARY KEY (`cd_simples_nac_despesas`),
  ADD KEY `fk_simples_nac_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_sub_total_operacao`
--
ALTER TABLE `tb_sub_total_operacao`
  ADD PRIMARY KEY (`cd_sub_total_operacao`),
  ADD KEY `fk_sub_total_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_tentar_fechar_motorista`
--
ALTER TABLE `tb_tentar_fechar_motorista`
  ADD PRIMARY KEY (`cd_tentar_fechar_motorista`),
  ADD KEY `fk_tentar_fechar_motorista_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_tipo_carga`
--
ALTER TABLE `tb_tipo_carga`
  ADD PRIMARY KEY (`cd_tipo_carga`),
  ADD KEY `fk_tipo_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_tipo_frete`
--
ALTER TABLE `tb_tipo_frete`
  ADD PRIMARY KEY (`cd_tipo_frete`),
  ADD KEY `fk_tipo_frete_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_tipo_moeda_carga`
--
ALTER TABLE `tb_tipo_moeda_carga`
  ADD PRIMARY KEY (`cd_tipo_moeda_carga`),
  ADD KEY `fk_tipo_moeda_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_tipo_operacao`
--
ALTER TABLE `tb_tipo_operacao`
  ADD PRIMARY KEY (`cd_tipo_operacao`),
  ADD KEY `fk_tipo_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_tipo_proposta`
--
ALTER TABLE `tb_tipo_proposta`
  ADD PRIMARY KEY (`cd_tipo_proposta`),
  ADD KEY `fk_tipo_proposta_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_tipo_seguro_operacao`
--
ALTER TABLE `tb_tipo_seguro_operacao`
  ADD PRIMARY KEY (`cd_tipo_seguro_operacao`),
  ADD KEY `fk_tipo_seguro_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_total_aut_motorista`
--
ALTER TABLE `tb_total_aut_motorista`
  ADD PRIMARY KEY (`cd_total_aut_motorista`),
  ADD KEY `fk_total_aut_motorista_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_total_despesas`
--
ALTER TABLE `tb_total_despesas`
  ADD PRIMARY KEY (`cd_total_despesas`),
  ADD KEY `fk_total_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_total_km_carga`
--
ALTER TABLE `tb_total_km_carga`
  ADD PRIMARY KEY (`cd_total_km_carga`),
  ADD KEY `fk_total_km_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_total_prest_operacao`
--
ALTER TABLE `tb_total_prest_operacao`
  ADD PRIMARY KEY (`cd_total_prest_operacao`),
  ADD KEY `fk_total_prest_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_total_tipo_seguro_operacao`
--
ALTER TABLE `tb_total_tipo_seguro_operacao`
  ADD PRIMARY KEY (`cd_total_tipo_seguro_operacao`),
  ADD KEY `fk_total_tipo_seguro_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_tot_imp_seg_operacao`
--
ALTER TABLE `tb_tot_imp_seg_operacao`
  ADD PRIMARY KEY (`cd_tot_imp_seg_operacao`),
  ADD KEY `fk_tot_imp_seg_operacao_proposta` (`cd_proposta`);

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
-- Índices para tabela `tb_vale_pedagio_tab_motorista`
--
ALTER TABLE `tb_vale_pedagio_tab_motorista`
  ADD PRIMARY KEY (`cd_vale_pedagio_tab_motorista`),
  ADD KEY `fk_vale_pedagio_tab_motorista_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_valores_motorista`
--
ALTER TABLE `tb_valores_motorista`
  ADD PRIMARY KEY (`cd_valores_motorista`),
  ADD KEY `fk_valores_motorista_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_valor_carga`
--
ALTER TABLE `tb_valor_carga`
  ADD PRIMARY KEY (`cd_valor_carga`),
  ADD KEY `fk_valor_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_valor_carga_brl_carga`
--
ALTER TABLE `tb_valor_carga_brl_carga`
  ADD PRIMARY KEY (`cd_valor_carga_brl_carga`),
  ADD KEY `fk_valor_carga_brl_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_valor_carga_usd_eur_carga`
--
ALTER TABLE `tb_valor_carga_usd_eur_carga`
  ADD PRIMARY KEY (`cd_valor_carga_usd_eur_carga`),
  ADD KEY `fk_valor_carga_usd_eur_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_valor_container_operacao`
--
ALTER TABLE `tb_valor_container_operacao`
  ADD PRIMARY KEY (`cd_valor_container_operacao`),
  ADD KEY `fk_valor_container_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_valor_icms_despesas`
--
ALTER TABLE `tb_valor_icms_despesas`
  ADD PRIMARY KEY (`cd_valor_icms_despesas`),
  ADD KEY `fk_valor_icms_despesas_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_valor_icms_operacao`
--
ALTER TABLE `tb_valor_icms_operacao`
  ADD PRIMARY KEY (`cd_valor_icms_operacao`),
  ADD KEY `fk_valor_icms_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_valor_merc_operacao`
--
ALTER TABLE `tb_valor_merc_operacao`
  ADD PRIMARY KEY (`cd_valor_merc_operacao`),
  ADD KEY `fk_valor_merc_operacao_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_valor_total_comb_carga`
--
ALTER TABLE `tb_valor_total_comb_carga`
  ADD PRIMARY KEY (`cd_valor_total_comb_carga`),
  ADD KEY `fk_valor_total_comb_carga_proposta` (`cd_proposta`);

--
-- Índices para tabela `tb_valor_total_pedagio_carga`
--
ALTER TABLE `tb_valor_total_pedagio_carga`
  ADD PRIMARY KEY (`cd_valor_total_pedagio_carga`),
  ADD KEY `fk_valor_total_pedagio_carga_proposta` (`cd_proposta`);

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
-- AUTO_INCREMENT de tabela `tb_adic_irpj_despesas`
--
ALTER TABLE `tb_adic_irpj_despesas`
  MODIFY `cd_adic_irpj_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_ajudantes_despesas`
--
ALTER TABLE `tb_ajudantes_despesas`
  MODIFY `cd_ajudantes_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_ajudantes_operacao`
--
ALTER TABLE `tb_ajudantes_operacao`
  MODIFY `cd_ajudantes_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_arq_propostas`
--
ALTER TABLE `tb_arq_propostas`
  MODIFY `cd_arq_propostas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_buonny_cad_despesas`
--
ALTER TABLE `tb_buonny_cad_despesas`
  MODIFY `cd_buonny_cad_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_carreta`
--
ALTER TABLE `tb_carreta`
  MODIFY `cd_carreta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cat_imposto_operacao`
--
ALTER TABLE `tb_cat_imposto_operacao`
  MODIFY `cd_cat_imposto_operacao` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de tabela `tb_class_imo`
--
ALTER TABLE `tb_class_imo`
  MODIFY `cd_class_imo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `cd_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cofins_despesas`
--
ALTER TABLE `tb_cofins_despesas`
  MODIFY `cd_cofins_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_comb_total_litro_carga`
--
ALTER TABLE `tb_comb_total_litro_carga`
  MODIFY `cd_comb_total_litro_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_comissao_despesas`
--
ALTER TABLE `tb_comissao_despesas`
  MODIFY `cd_comissao_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_consulta_porc_icms`
--
ALTER TABLE `tb_consulta_porc_icms`
  MODIFY `cd_consulta_porc_icms` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=730;

--
-- AUTO_INCREMENT de tabela `tb_consumo_medio_km_litro_carga`
--
ALTER TABLE `tb_consumo_medio_km_litro_carga`
  MODIFY `cd_consumo_medio_km_litro_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_container`
--
ALTER TABLE `tb_container`
  MODIFY `cd_container` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cotacao_carga`
--
ALTER TABLE `tb_cotacao_carga`
  MODIFY `cd_cotacao_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cot_aut`
--
ALTER TABLE `tb_cot_aut`
  MODIFY `cd_cot_aut` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_despesas_operacao`
--
ALTER TABLE `tb_despesas_operacao`
  MODIFY `cd_despesas_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_despesa_total_viagem_carga`
--
ALTER TABLE `tb_despesa_total_viagem_carga`
  MODIFY `cd_despesa_total_viagem_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_dta_di_terc_despesas`
--
ALTER TABLE `tb_dta_di_terc_despesas`
  MODIFY `cd_dta_di_terc_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_dta_operacao`
--
ALTER TABLE `tb_dta_operacao`
  MODIFY `cd_dta_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_eixos_carga`
--
ALTER TABLE `tb_eixos_carga`
  MODIFY `cd_eixos_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_email_responsavel_cliente`
--
ALTER TABLE `tb_email_responsavel_cliente`
  MODIFY `cd_email_responsavel_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_email_usuario`
--
ALTER TABLE `tb_email_usuario`
  MODIFY `cd_email` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_estacionamento_despesas`
--
ALTER TABLE `tb_estacionamento_despesas`
  MODIFY `cd_estacionamento_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_frete_all_in_fechado_motorista`
--
ALTER TABLE `tb_frete_all_in_fechado_motorista`
  MODIFY `cd_frete_all_in_fechado_motorista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_frete_conf_antt_motorista`
--
ALTER TABLE `tb_frete_conf_antt_motorista`
  MODIFY `cd_frete_conf_antt_motorista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_frete_peso_operacao`
--
ALTER TABLE `tb_frete_peso_operacao`
  MODIFY `cd_frete_peso_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_gris_rast_despesas`
--
ALTER TABLE `tb_gris_rast_despesas`
  MODIFY `cd_gris_rast_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_imp_gris`
--
ALTER TABLE `tb_imp_gris`
  MODIFY `cd_imp_gris` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_imp_rcfdc_despesas`
--
ALTER TABLE `tb_imp_rcfdc_despesas`
  MODIFY `cd_imp_rcfdc_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_imp_rcfdc_operacao`
--
ALTER TABLE `tb_imp_rcfdc_operacao`
  MODIFY `cd_imp_rcfdc_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_imp_rctrc_despesas`
--
ALTER TABLE `tb_imp_rctrc_despesas`
  MODIFY `cd_imp_rctrc_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_imp_rctrc_operacao`
--
ALTER TABLE `tb_imp_rctrc_operacao`
  MODIFY `cd_imp_rctrc_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_imp_suspenso_operacao`
--
ALTER TABLE `tb_imp_suspenso_operacao`
  MODIFY `cd_imp_suspenso_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_irpj_despesas`
--
ALTER TABLE `tb_irpj_despesas`
  MODIFY `cd_irpj_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_km_ida_carga`
--
ALTER TABLE `tb_km_ida_carga`
  MODIFY `cd_km_ida_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_km_volta_carga`
--
ALTER TABLE `tb_km_volta_carga`
  MODIFY `cd_km_volta_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_local_devolucao_container`
--
ALTER TABLE `tb_local_devolucao_container`
  MODIFY `cd_local_devolucao_container` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_lucro_bruto_operacao`
--
ALTER TABLE `tb_lucro_bruto_operacao`
  MODIFY `cd_lucro_bruto_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_lucro_frete_all_in_fechado_motorista`
--
ALTER TABLE `tb_lucro_frete_all_in_fechado_motorista`
  MODIFY `cd_lucro_frete_all_in_fechado_motorista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_lucro_tentar_fechar_motorista`
--
ALTER TABLE `tb_lucro_tentar_fechar_motorista`
  MODIFY `cd_lucro_tentar_fechar_motorista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_lucro_total_aut_tab_motorista`
--
ALTER TABLE `tb_lucro_total_aut_tab_motorista`
  MODIFY `cd_lucro_total_aut_tab_motorista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_margem_operacao`
--
ALTER TABLE `tb_margem_operacao`
  MODIFY `cd_margem_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_mot_aut_despesas`
--
ALTER TABLE `tb_mot_aut_despesas`
  MODIFY `cd_mot_aut_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_pedagio_despesas`
--
ALTER TABLE `tb_pedagio_despesas`
  MODIFY `cd_pedagio_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_pedagio_ida_eixo_carga`
--
ALTER TABLE `tb_pedagio_ida_eixo_carga`
  MODIFY `cd_pedagio_ida_eixo_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_pedagio_operacao`
--
ALTER TABLE `tb_pedagio_operacao`
  MODIFY `cd_pedagio_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_pedagio_volta_eixo_carga`
--
ALTER TABLE `tb_pedagio_volta_eixo_carga`
  MODIFY `cd_pedagio_volta_eixo_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_pis_despesas`
--
ALTER TABLE `tb_pis_despesas`
  MODIFY `cd_pis_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_adic_irpj_despesas`
--
ALTER TABLE `tb_porc_adic_irpj_despesas`
  MODIFY `cd_porc_adic_irpj_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_cofins_despesas`
--
ALTER TABLE `tb_porc_cofins_despesas`
  MODIFY `cd_porc_cofins_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_comissao_despesas`
--
ALTER TABLE `tb_porc_comissao_despesas`
  MODIFY `cd_porc_comissao_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_icms_despesas`
--
ALTER TABLE `tb_porc_icms_despesas`
  MODIFY `cd_porc_icms_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_icms_operacao`
--
ALTER TABLE `tb_porc_icms_operacao`
  MODIFY `cd_porc_icms_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_imp_gris`
--
ALTER TABLE `tb_porc_imp_gris`
  MODIFY `cd_porc_imp_gris` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_imp_rcfdc_despesas`
--
ALTER TABLE `tb_porc_imp_rcfdc_despesas`
  MODIFY `cd_porc_imp_rcfdc_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_imp_rcfdc_operacao`
--
ALTER TABLE `tb_porc_imp_rcfdc_operacao`
  MODIFY `cd_porc_imp_rcfdc_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_imp_rctrc_despesas`
--
ALTER TABLE `tb_porc_imp_rctrc_despesas`
  MODIFY `cd_porc_imp_rctrc_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_imp_rctrc_operacao`
--
ALTER TABLE `tb_porc_imp_rctrc_operacao`
  MODIFY `cd_porc_imp_rctrc_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_imp_suspenso_operacao`
--
ALTER TABLE `tb_porc_imp_suspenso_operacao`
  MODIFY `cd_porc_imp_suspenso_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_irpj_despesas`
--
ALTER TABLE `tb_porc_irpj_despesas`
  MODIFY `cd_porc_irpj_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_lucro_bruto_operacao`
--
ALTER TABLE `tb_porc_lucro_bruto_operacao`
  MODIFY `cd_porc_lucro_bruto_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_pis_despesas`
--
ALTER TABLE `tb_porc_pis_despesas`
  MODIFY `cd_porc_pis_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_simples_nac_despesas`
--
ALTER TABLE `tb_porc_simples_nac_despesas`
  MODIFY `cd_porc_simples_nac_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_tipo_seguro_operacao`
--
ALTER TABLE `tb_porc_tipo_seguro_operacao`
  MODIFY `cd_porc_tipo_seguro_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_porc_total_prest_operacao`
--
ALTER TABLE `tb_porc_total_prest_operacao`
  MODIFY `cd_porc_total_prest_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_preco_litro_comb_carga`
--
ALTER TABLE `tb_preco_litro_comb_carga`
  MODIFY `cd_preco_litro_comb_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_privilegio`
--
ALTER TABLE `tb_privilegio`
  MODIFY `cd_privilegio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  MODIFY `cd_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_profit_despesas`
--
ALTER TABLE `tb_profit_despesas`
  MODIFY `cd_profit_despesas` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de tabela `tb_simples_nac_despesas`
--
ALTER TABLE `tb_simples_nac_despesas`
  MODIFY `cd_simples_nac_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_sub_total_operacao`
--
ALTER TABLE `tb_sub_total_operacao`
  MODIFY `cd_sub_total_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tentar_fechar_motorista`
--
ALTER TABLE `tb_tentar_fechar_motorista`
  MODIFY `cd_tentar_fechar_motorista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo_carga`
--
ALTER TABLE `tb_tipo_carga`
  MODIFY `cd_tipo_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo_frete`
--
ALTER TABLE `tb_tipo_frete`
  MODIFY `cd_tipo_frete` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo_moeda_carga`
--
ALTER TABLE `tb_tipo_moeda_carga`
  MODIFY `cd_tipo_moeda_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo_operacao`
--
ALTER TABLE `tb_tipo_operacao`
  MODIFY `cd_tipo_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo_proposta`
--
ALTER TABLE `tb_tipo_proposta`
  MODIFY `cd_tipo_proposta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo_seguro_operacao`
--
ALTER TABLE `tb_tipo_seguro_operacao`
  MODIFY `cd_tipo_seguro_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_total_aut_motorista`
--
ALTER TABLE `tb_total_aut_motorista`
  MODIFY `cd_total_aut_motorista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_total_despesas`
--
ALTER TABLE `tb_total_despesas`
  MODIFY `cd_total_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_total_km_carga`
--
ALTER TABLE `tb_total_km_carga`
  MODIFY `cd_total_km_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_total_prest_operacao`
--
ALTER TABLE `tb_total_prest_operacao`
  MODIFY `cd_total_prest_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_total_tipo_seguro_operacao`
--
ALTER TABLE `tb_total_tipo_seguro_operacao`
  MODIFY `cd_total_tipo_seguro_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tot_imp_seg_operacao`
--
ALTER TABLE `tb_tot_imp_seg_operacao`
  MODIFY `cd_tot_imp_seg_operacao` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `cd_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_vale_pedagio_tab_motorista`
--
ALTER TABLE `tb_vale_pedagio_tab_motorista`
  MODIFY `cd_vale_pedagio_tab_motorista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_valores_motorista`
--
ALTER TABLE `tb_valores_motorista`
  MODIFY `cd_valores_motorista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_valor_carga`
--
ALTER TABLE `tb_valor_carga`
  MODIFY `cd_valor_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_valor_carga_brl_carga`
--
ALTER TABLE `tb_valor_carga_brl_carga`
  MODIFY `cd_valor_carga_brl_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_valor_carga_usd_eur_carga`
--
ALTER TABLE `tb_valor_carga_usd_eur_carga`
  MODIFY `cd_valor_carga_usd_eur_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_valor_container_operacao`
--
ALTER TABLE `tb_valor_container_operacao`
  MODIFY `cd_valor_container_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_valor_icms_despesas`
--
ALTER TABLE `tb_valor_icms_despesas`
  MODIFY `cd_valor_icms_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_valor_icms_operacao`
--
ALTER TABLE `tb_valor_icms_operacao`
  MODIFY `cd_valor_icms_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_valor_merc_operacao`
--
ALTER TABLE `tb_valor_merc_operacao`
  MODIFY `cd_valor_merc_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_valor_total_comb_carga`
--
ALTER TABLE `tb_valor_total_comb_carga`
  MODIFY `cd_valor_total_comb_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_valor_total_pedagio_carga`
--
ALTER TABLE `tb_valor_total_pedagio_carga`
  MODIFY `cd_valor_total_pedagio_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
  MODIFY `cd_veiculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_adic_irpj_despesas`
--
ALTER TABLE `tb_adic_irpj_despesas`
  ADD CONSTRAINT `fk_adic_irpj_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_ajudantes_despesas`
--
ALTER TABLE `tb_ajudantes_despesas`
  ADD CONSTRAINT `fk_ajudantes_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_ajudantes_operacao`
--
ALTER TABLE `tb_ajudantes_operacao`
  ADD CONSTRAINT `fk_ajudantes_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_arq_propostas`
--
ALTER TABLE `tb_arq_propostas`
  ADD CONSTRAINT `fk_arq_propostas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_buonny_cad_despesas`
--
ALTER TABLE `tb_buonny_cad_despesas`
  ADD CONSTRAINT `fk_buonny_cad_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_carreta`
--
ALTER TABLE `tb_carreta`
  ADD CONSTRAINT `fk_carreta_veiculo` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_cat_imposto_operacao`
--
ALTER TABLE `tb_cat_imposto_operacao`
  ADD CONSTRAINT `fk_cat_imposto_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

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
-- Limitadores para a tabela `tb_class_imo`
--
ALTER TABLE `tb_class_imo`
  ADD CONSTRAINT `fk_class_imo_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD CONSTRAINT `fk_cliente_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_cofins_despesas`
--
ALTER TABLE `tb_cofins_despesas`
  ADD CONSTRAINT `fk_cofins_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_comb_total_litro_carga`
--
ALTER TABLE `tb_comb_total_litro_carga`
  ADD CONSTRAINT `fk_comb_total_litro_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_comissao_despesas`
--
ALTER TABLE `tb_comissao_despesas`
  ADD CONSTRAINT `fk_comissao_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_consumo_medio_km_litro_carga`
--
ALTER TABLE `tb_consumo_medio_km_litro_carga`
  ADD CONSTRAINT `fk_consumo_medio_km_litro_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_container`
--
ALTER TABLE `tb_container`
  ADD CONSTRAINT `fk_container_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_cotacao_carga`
--
ALTER TABLE `tb_cotacao_carga`
  ADD CONSTRAINT `fk_cotacao_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_cot_aut`
--
ALTER TABLE `tb_cot_aut`
  ADD CONSTRAINT `fk_cot_aut_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_despesas_operacao`
--
ALTER TABLE `tb_despesas_operacao`
  ADD CONSTRAINT `fk_despesas_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_despesa_total_viagem_carga`
--
ALTER TABLE `tb_despesa_total_viagem_carga`
  ADD CONSTRAINT `fk_despesa_total_viagem_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_dta_di_terc_despesas`
--
ALTER TABLE `tb_dta_di_terc_despesas`
  ADD CONSTRAINT `fk_dta_di_terc_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_dta_operacao`
--
ALTER TABLE `tb_dta_operacao`
  ADD CONSTRAINT `fk_dta_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_eixos_carga`
--
ALTER TABLE `tb_eixos_carga`
  ADD CONSTRAINT `fk_eixos_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_email_responsavel_cliente`
--
ALTER TABLE `tb_email_responsavel_cliente`
  ADD CONSTRAINT `fk_email_responsavel_cliente_cliente` FOREIGN KEY (`cd_responsavel_cliente`) REFERENCES `tb_responsavel_cliente` (`cd_responsavel_cliente`);

--
-- Limitadores para a tabela `tb_email_usuario`
--
ALTER TABLE `tb_email_usuario`
  ADD CONSTRAINT `fk_email_usuario_usuario` FOREIGN KEY (`cd_usuario`) REFERENCES `tb_usuario` (`cd_usuario`);

--
-- Limitadores para a tabela `tb_estacionamento_despesas`
--
ALTER TABLE `tb_estacionamento_despesas`
  ADD CONSTRAINT `fk_estacionamento_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_frete_all_in_fechado_motorista`
--
ALTER TABLE `tb_frete_all_in_fechado_motorista`
  ADD CONSTRAINT `fk_frete_all_in_fechado_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_frete_conf_antt_motorista`
--
ALTER TABLE `tb_frete_conf_antt_motorista`
  ADD CONSTRAINT `fk_frete_conf_antt_motorista_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_frete_peso_operacao`
--
ALTER TABLE `tb_frete_peso_operacao`
  ADD CONSTRAINT `fk_frete_peso_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_gris_rast_despesas`
--
ALTER TABLE `tb_gris_rast_despesas`
  ADD CONSTRAINT `fk_gris_rast_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_imp_gris`
--
ALTER TABLE `tb_imp_gris`
  ADD CONSTRAINT `fk_imp_gris_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_imp_rcfdc_despesas`
--
ALTER TABLE `tb_imp_rcfdc_despesas`
  ADD CONSTRAINT `fk_imp_rcfdc_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_imp_rcfdc_operacao`
--
ALTER TABLE `tb_imp_rcfdc_operacao`
  ADD CONSTRAINT `fk_imp_rcfdc_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_imp_rctrc_despesas`
--
ALTER TABLE `tb_imp_rctrc_despesas`
  ADD CONSTRAINT `fk_imp_rctrc_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_imp_rctrc_operacao`
--
ALTER TABLE `tb_imp_rctrc_operacao`
  ADD CONSTRAINT `fk_imp_rctrc_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_imp_suspenso_operacao`
--
ALTER TABLE `tb_imp_suspenso_operacao`
  ADD CONSTRAINT `fk_imp_suspenso_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_irpj_despesas`
--
ALTER TABLE `tb_irpj_despesas`
  ADD CONSTRAINT `fk_irpj_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_km_ida_carga`
--
ALTER TABLE `tb_km_ida_carga`
  ADD CONSTRAINT `fk_km_ida_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_km_volta_carga`
--
ALTER TABLE `tb_km_volta_carga`
  ADD CONSTRAINT `fk_km_volta_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_local_devolucao_container`
--
ALTER TABLE `tb_local_devolucao_container`
  ADD CONSTRAINT `fk_local_devolucao_container_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_lucro_bruto_operacao`
--
ALTER TABLE `tb_lucro_bruto_operacao`
  ADD CONSTRAINT `fk_lucro_bruto_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_lucro_frete_all_in_fechado_motorista`
--
ALTER TABLE `tb_lucro_frete_all_in_fechado_motorista`
  ADD CONSTRAINT `fk_lucro_frete_all_in_fechado_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_lucro_tentar_fechar_motorista`
--
ALTER TABLE `tb_lucro_tentar_fechar_motorista`
  ADD CONSTRAINT `fk_lucro_tentar_fechar_motorista_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_lucro_total_aut_tab_motorista`
--
ALTER TABLE `tb_lucro_total_aut_tab_motorista`
  ADD CONSTRAINT `fk_lucro_total_aut_tab_motorista_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_margem_operacao`
--
ALTER TABLE `tb_margem_operacao`
  ADD CONSTRAINT `fk_margem_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_mot_aut_despesas`
--
ALTER TABLE `tb_mot_aut_despesas`
  ADD CONSTRAINT `fk_mot_aut_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_pedagio_despesas`
--
ALTER TABLE `tb_pedagio_despesas`
  ADD CONSTRAINT `fk_pedagio_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_pedagio_ida_eixo_carga`
--
ALTER TABLE `tb_pedagio_ida_eixo_carga`
  ADD CONSTRAINT `fk_pedagio_ida_eixo_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_pedagio_operacao`
--
ALTER TABLE `tb_pedagio_operacao`
  ADD CONSTRAINT `fk_pedagio_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_pedagio_volta_eixo_carga`
--
ALTER TABLE `tb_pedagio_volta_eixo_carga`
  ADD CONSTRAINT `fk_pedagio_volta_eixo_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_pis_despesas`
--
ALTER TABLE `tb_pis_despesas`
  ADD CONSTRAINT `fk_pis_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_adic_irpj_despesas`
--
ALTER TABLE `tb_porc_adic_irpj_despesas`
  ADD CONSTRAINT `fk_porc_adic_irpj_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_cofins_despesas`
--
ALTER TABLE `tb_porc_cofins_despesas`
  ADD CONSTRAINT `fk_porc_cofins_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_comissao_despesas`
--
ALTER TABLE `tb_porc_comissao_despesas`
  ADD CONSTRAINT `fk_porc_comissao_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_icms_despesas`
--
ALTER TABLE `tb_porc_icms_despesas`
  ADD CONSTRAINT `fk_porc_icms_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_icms_operacao`
--
ALTER TABLE `tb_porc_icms_operacao`
  ADD CONSTRAINT `fk_porc_icms_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_imp_gris`
--
ALTER TABLE `tb_porc_imp_gris`
  ADD CONSTRAINT `fk_porc_imp_gris_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_imp_rcfdc_despesas`
--
ALTER TABLE `tb_porc_imp_rcfdc_despesas`
  ADD CONSTRAINT `fk_porc_imp_rcfdc_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_imp_rcfdc_operacao`
--
ALTER TABLE `tb_porc_imp_rcfdc_operacao`
  ADD CONSTRAINT `fk_porc_imp_rcfdc_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_imp_rctrc_despesas`
--
ALTER TABLE `tb_porc_imp_rctrc_despesas`
  ADD CONSTRAINT `fk_porc_imp_rctrc_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_imp_rctrc_operacao`
--
ALTER TABLE `tb_porc_imp_rctrc_operacao`
  ADD CONSTRAINT `fk_porc_imp_rctrc_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_imp_suspenso_operacao`
--
ALTER TABLE `tb_porc_imp_suspenso_operacao`
  ADD CONSTRAINT `fk_porc_imp_suspenso_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_irpj_despesas`
--
ALTER TABLE `tb_porc_irpj_despesas`
  ADD CONSTRAINT `fk_porc_irpj_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_lucro_bruto_operacao`
--
ALTER TABLE `tb_porc_lucro_bruto_operacao`
  ADD CONSTRAINT `fk_porc_lucro_bruto_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_pis_despesas`
--
ALTER TABLE `tb_porc_pis_despesas`
  ADD CONSTRAINT `fk_porc_pis_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_simples_nac_despesas`
--
ALTER TABLE `tb_porc_simples_nac_despesas`
  ADD CONSTRAINT `fk_porc_simples_nac_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_tipo_seguro_operacao`
--
ALTER TABLE `tb_porc_tipo_seguro_operacao`
  ADD CONSTRAINT `fk_porc_tipo_seguro_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_porc_total_prest_operacao`
--
ALTER TABLE `tb_porc_total_prest_operacao`
  ADD CONSTRAINT `fk_porc_total_prest_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_preco_litro_comb_carga`
--
ALTER TABLE `tb_preco_litro_comb_carga`
  ADD CONSTRAINT `fk_preco_litro_comb_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

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
-- Limitadores para a tabela `tb_profit_despesas`
--
ALTER TABLE `tb_profit_despesas`
  ADD CONSTRAINT `fk_profit_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

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
-- Limitadores para a tabela `tb_simples_nac_despesas`
--
ALTER TABLE `tb_simples_nac_despesas`
  ADD CONSTRAINT `fk_simples_nac_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_sub_total_operacao`
--
ALTER TABLE `tb_sub_total_operacao`
  ADD CONSTRAINT `fk_sub_total_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_tentar_fechar_motorista`
--
ALTER TABLE `tb_tentar_fechar_motorista`
  ADD CONSTRAINT `fk_tentar_fechar_motorista_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_tipo_carga`
--
ALTER TABLE `tb_tipo_carga`
  ADD CONSTRAINT `fk_tipo_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_tipo_frete`
--
ALTER TABLE `tb_tipo_frete`
  ADD CONSTRAINT `fk_tipo_frete_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_tipo_moeda_carga`
--
ALTER TABLE `tb_tipo_moeda_carga`
  ADD CONSTRAINT `fk_tipo_moeda_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_tipo_operacao`
--
ALTER TABLE `tb_tipo_operacao`
  ADD CONSTRAINT `fk_tipo_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_tipo_proposta`
--
ALTER TABLE `tb_tipo_proposta`
  ADD CONSTRAINT `fk_tipo_proposta_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_tipo_seguro_operacao`
--
ALTER TABLE `tb_tipo_seguro_operacao`
  ADD CONSTRAINT `fk_tipo_seguro_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_total_aut_motorista`
--
ALTER TABLE `tb_total_aut_motorista`
  ADD CONSTRAINT `fk_total_aut_motorista_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_total_despesas`
--
ALTER TABLE `tb_total_despesas`
  ADD CONSTRAINT `fk_total_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_total_km_carga`
--
ALTER TABLE `tb_total_km_carga`
  ADD CONSTRAINT `fk_total_km_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_total_prest_operacao`
--
ALTER TABLE `tb_total_prest_operacao`
  ADD CONSTRAINT `fk_total_prest_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_total_tipo_seguro_operacao`
--
ALTER TABLE `tb_total_tipo_seguro_operacao`
  ADD CONSTRAINT `fk_total_tipo_seguro_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_tot_imp_seg_operacao`
--
ALTER TABLE `tb_tot_imp_seg_operacao`
  ADD CONSTRAINT `fk_tot_imp_seg_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

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
-- Limitadores para a tabela `tb_vale_pedagio_tab_motorista`
--
ALTER TABLE `tb_vale_pedagio_tab_motorista`
  ADD CONSTRAINT `fk_vale_pedagio_tab_motorista_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_valores_motorista`
--
ALTER TABLE `tb_valores_motorista`
  ADD CONSTRAINT `fk_valores_motorista_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_valor_carga`
--
ALTER TABLE `tb_valor_carga`
  ADD CONSTRAINT `fk_valor_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_valor_carga_brl_carga`
--
ALTER TABLE `tb_valor_carga_brl_carga`
  ADD CONSTRAINT `fk_valor_carga_brl_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_valor_carga_usd_eur_carga`
--
ALTER TABLE `tb_valor_carga_usd_eur_carga`
  ADD CONSTRAINT `fk_valor_carga_usd_eur_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_valor_container_operacao`
--
ALTER TABLE `tb_valor_container_operacao`
  ADD CONSTRAINT `fk_valor_container_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_valor_icms_despesas`
--
ALTER TABLE `tb_valor_icms_despesas`
  ADD CONSTRAINT `fk_valor_icms_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_valor_icms_operacao`
--
ALTER TABLE `tb_valor_icms_operacao`
  ADD CONSTRAINT `fk_valor_icms_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_valor_merc_operacao`
--
ALTER TABLE `tb_valor_merc_operacao`
  ADD CONSTRAINT `fk_valor_merc_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_valor_total_comb_carga`
--
ALTER TABLE `tb_valor_total_comb_carga`
  ADD CONSTRAINT `fk_valor_total_comb_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_valor_total_pedagio_carga`
--
ALTER TABLE `tb_valor_total_pedagio_carga`
  ADD CONSTRAINT `fk_valor_total_pedagio_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Limitadores para a tabela `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
  ADD CONSTRAINT `fk_veiculo_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
