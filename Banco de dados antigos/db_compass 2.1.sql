-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/12/2023 às 18:31
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

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
-- Estrutura para tabela `tb_adicionais`
--

CREATE TABLE `tb_adicionais` (
  `cd_adicionais` int(11) NOT NULL,
  `id_isca_adicionais` varchar(30) DEFAULT NULL,
  `vl_isca_adicionais` varchar(50) DEFAULT NULL,
  `id_monitoramento_isca_adicionais` varchar(30) DEFAULT NULL,
  `vl_monitoramento_isca_adicionais` varchar(50) DEFAULT NULL,
  `id_escolta_armada_adicionais` varchar(30) DEFAULT NULL,
  `vl_escolta_armada_adicionais` varchar(50) DEFAULT NULL,
  `id_devolucao_margem_esquerda_adicionais` varchar(30) NOT NULL,
  `vl_devolucao_margem_esquerda_adicionais` varchar(50) NOT NULL,
  `id_devolucao_sv_adicionais` varchar(30) NOT NULL,
  `vl_devolucao_sv_adicionais` varchar(50) NOT NULL,
  `id_adic_carga_anvisa_adicionais` varchar(30) NOT NULL,
  `vl_adic_carga_anvisa_adicionais` varchar(50) NOT NULL,
  `id_adic_carga_imo_adicionais` varchar(30) DEFAULT NULL,
  `vl_adic_carga_imo_adicionais` varchar(50) DEFAULT NULL,
  `id_carregamento_expr_adicionais` varchar(30) DEFAULT NULL,
  `vl_carregamento_expr_adicionais` varchar(50) DEFAULT NULL,
  `id_util_cav_ls_adicionais` varchar(30) DEFAULT NULL,
  `vl_util_cav_ls_adicionais` varchar(50) DEFAULT NULL,
  `id_estadia_especial_adicionais` varchar(30) DEFAULT NULL,
  `vl_estadia_especial_adicionais` varchar(50) DEFAULT NULL,
  `id_sobrestadia_carreg_adicionais` varchar(30) DEFAULT NULL,
  `vl_sobrestadia_carreg_adicionais` varchar(50) DEFAULT NULL,
  `id_sobrestadia_retirada_adicionais` varchar(30) NOT NULL,
  `vl_sobrestadia_retirada_adicionais` varchar(50) NOT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_adic_despesas`
--

CREATE TABLE `tb_adic_despesas` (
  `cd_adic_despesas` int(11) NOT NULL,
  `vl_buonny_despesas` decimal(10,2) DEFAULT NULL,
  `vl_gris_rastreamento_despesas` decimal(10,2) DEFAULT NULL,
  `vl_dta_terc_despesas` decimal(10,2) DEFAULT NULL,
  `vl_estacionamento_despesas` decimal(10,2) DEFAULT NULL,
  `vl_ajudantes_despesas` decimal(10,2) DEFAULT NULL,
  `cd_despesas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_adic_operacao`
--

CREATE TABLE `tb_adic_operacao` (
  `cd_adic_operacao` int(11) NOT NULL,
  `vl_estacionamento` decimal(10,2) DEFAULT NULL,
  `vl_imo` decimal(10,2) DEFAULT NULL,
  `vl_dta` decimal(10,2) DEFAULT NULL,
  `vl_ajudantes` decimal(10,2) DEFAULT NULL,
  `vl_pedagio` decimal(10,2) DEFAULT NULL,
  `cd_operacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_arq_propostas`
--

CREATE TABLE `tb_arq_propostas` (
  `cd_arq_propostas` int(11) NOT NULL,
  `nr_versao_propostas` decimal(3,1) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_assinatura_cliente`
--

CREATE TABLE `tb_assinatura_cliente` (
  `cd_assinatura_cliente` int(11) NOT NULL,
  `nm_assinatura_cliente` varchar(100) NOT NULL,
  `cd_cpf_assinatura_cliente` varchar(14) NOT NULL,
  `nm_email_assinatura_cliente` varchar(100) NOT NULL,
  `cd_token_assinatura_cliente` int(11) NOT NULL,
  `cd_proposta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_carga`
--

CREATE TABLE `tb_carga` (
  `cd_carga` int(11) NOT NULL,
  `nm_tipo_carga` varchar(100) DEFAULT NULL,
  `vl_despesa_viagem_carga` decimal(10,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `cd_cliente` int(11) NOT NULL,
  `nm_empresa_cliente` varchar(100) NOT NULL,
  `ds_tipo_cliente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_cliente_proposta`
--

CREATE TABLE `tb_cliente_proposta` (
  `cd_cliente` int(11) NOT NULL,
  `nm_empresa_cliente` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_combustivel_carga`
--

CREATE TABLE `tb_combustivel_carga` (
  `cd_combustivel_carga` int(11) NOT NULL,
  `vl_quantidade_combustivel_carga` decimal(10,2) NOT NULL,
  `vl_consumo_combustivel_carga` decimal(10,2) NOT NULL,
  `vl_preco_combustivel_carga` decimal(10,2) NOT NULL,
  `vl_total_preco_combustivel_carga` decimal(10,2) NOT NULL,
  `cd_carga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_consulta_porc_icms`
--

CREATE TABLE `tb_consulta_porc_icms` (
  `cd_consulta_porc_icms` int(11) NOT NULL,
  `nm_consulta_porc_icms` varchar(10) DEFAULT NULL,
  `vl_consulta_porc_icms` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tb_consulta_porc_icms`
--

INSERT INTO `tb_consulta_porc_icms` (`cd_consulta_porc_icms`, `nm_consulta_porc_icms`, `vl_consulta_porc_icms`) VALUES
(1459, 'AC_AC', 19),
(1460, 'AC_AL', 12),
(1461, 'AC_AP', 12),
(1462, 'AC_AM', 12),
(1463, 'AC_BA', 12),
(1464, 'AC_CE', 12),
(1465, 'AC_DF', 12),
(1466, 'AC_ES', 12),
(1467, 'AC_GO', 12),
(1468, 'AC_MA', 12),
(1469, 'AC_MT', 12),
(1470, 'AC_MS', 12),
(1471, 'AC_MG', 12),
(1472, 'AC_PA', 12),
(1473, 'AC_PB', 12),
(1474, 'AC_PR', 12),
(1475, 'AC_PE', 12),
(1476, 'AC_PI', 12),
(1477, 'AC_RJ', 12),
(1478, 'AC_RN', 12),
(1479, 'AC_RS', 12),
(1480, 'AC_RO', 12),
(1481, 'AC_RR', 12),
(1482, 'AC_SC', 12),
(1483, 'AC_SP', 12),
(1484, 'AC_SE', 12),
(1485, 'AC_TO', 12),
(1486, 'AL_AL', 17),
(1487, 'AL_AC', 12),
(1488, 'AL_AP', 12),
(1489, 'AL_AM', 12),
(1490, 'AL_BA', 12),
(1491, 'AL_CE', 12),
(1492, 'AL_DF', 12),
(1493, 'AL_ES', 12),
(1494, 'AL_GO', 12),
(1495, 'AL_MA', 12),
(1496, 'AL_MT', 12),
(1497, 'AL_MS', 12),
(1498, 'AL_MG', 12),
(1499, 'AL_PA', 12),
(1500, 'AL_PB', 12),
(1501, 'AL_PR', 12),
(1502, 'AL_PE', 12),
(1503, 'AL_PI', 12),
(1504, 'AL_RJ', 12),
(1505, 'AL_RN', 12),
(1506, 'AL_RS', 12),
(1507, 'AL_RO', 12),
(1508, 'AL_RR', 12),
(1509, 'AL_SC', 12),
(1510, 'AL_SP', 12),
(1511, 'AL_SE', 12),
(1512, 'AL_TO', 12),
(1513, 'AM_AM', 20),
(1514, 'AM_AC', 12),
(1515, 'AM_AP', 12),
(1516, 'AM_AL', 12),
(1517, 'AM_BA', 12),
(1518, 'AM_CE', 12),
(1519, 'AM_DF', 12),
(1520, 'AM_ES', 12),
(1521, 'AM_GO', 12),
(1522, 'AM_MA', 12),
(1523, 'AM_MT', 12),
(1524, 'AM_MS', 12),
(1525, 'AM_MG', 12),
(1526, 'AM_PA', 12),
(1527, 'AM_PB', 12),
(1528, 'AM_PR', 12),
(1529, 'AM_PE', 12),
(1530, 'AM_PI', 12),
(1531, 'AM_RJ', 12),
(1532, 'AM_RN', 12),
(1533, 'AM_RS', 12),
(1534, 'AM_RO', 12),
(1535, 'AM_RR', 12),
(1536, 'AM_SC', 12),
(1537, 'AM_SP', 12),
(1538, 'AM_SE', 12),
(1539, 'AM_TO', 12),
(1540, 'AP_AP', 18),
(1541, 'AP_AC', 12),
(1542, 'AP_AM', 12),
(1543, 'AP_AL', 12),
(1544, 'AP_BA', 12),
(1545, 'AP_CE', 12),
(1546, 'AP_DF', 12),
(1547, 'AP_ES', 12),
(1548, 'AP_GO', 12),
(1549, 'AP_MA', 12),
(1550, 'AP_MT', 12),
(1551, 'AP_MS', 12),
(1552, 'AP_MG', 12),
(1553, 'AP_PA', 12),
(1554, 'AP_PB', 12),
(1555, 'AP_PR', 12),
(1556, 'AP_PE', 12),
(1557, 'AP_PI', 12),
(1558, 'AP_RJ', 12),
(1559, 'AP_RN', 12),
(1560, 'AP_RS', 12),
(1561, 'AP_RO', 12),
(1562, 'AP_RR', 12),
(1563, 'AP_SC', 12),
(1564, 'AP_SP', 12),
(1565, 'AP_SE', 12),
(1566, 'AP_TO', 12),
(1567, 'BA_AP', 12),
(1568, 'BA_AC', 12),
(1569, 'BA_AM', 12),
(1570, 'BA_AL', 12),
(1571, 'BA_BA', 19),
(1572, 'BA_CE', 12),
(1573, 'BA_DF', 12),
(1574, 'BA_ES', 12),
(1575, 'BA_GO', 12),
(1576, 'BA_MA', 12),
(1577, 'BA_MT', 12),
(1578, 'BA_MS', 12),
(1579, 'BA_MG', 12),
(1580, 'BA_PA', 12),
(1581, 'BA_PB', 12),
(1582, 'BA_PR', 12),
(1583, 'BA_PE', 12),
(1584, 'BA_PI', 12),
(1585, 'BA_RJ', 12),
(1586, 'BA_RN', 12),
(1587, 'BA_RS', 12),
(1588, 'BA_RO', 12),
(1589, 'BA_RR', 12),
(1590, 'BA_SC', 12),
(1591, 'BA_SP', 12),
(1592, 'BA_SE', 12),
(1593, 'BA_TO', 12),
(1594, 'CE_AP', 12),
(1595, 'CE_AC', 12),
(1596, 'CE_AM', 12),
(1597, 'CE_AL', 12),
(1598, 'CE_BA', 12),
(1599, 'CE_CE', 20),
(1600, 'CE_DF', 12),
(1601, 'CE_ES', 12),
(1602, 'CE_GO', 12),
(1603, 'CE_MA', 12),
(1604, 'CE_MT', 12),
(1605, 'CE_MS', 12),
(1606, 'CE_MG', 12),
(1607, 'CE_PA', 12),
(1608, 'CE_PB', 12),
(1609, 'CE_PR', 12),
(1610, 'CE_PE', 12),
(1611, 'CE_PI', 12),
(1612, 'CE_RJ', 12),
(1613, 'CE_RN', 12),
(1614, 'CE_RS', 12),
(1615, 'CE_RO', 12),
(1616, 'CE_RR', 12),
(1617, 'CE_SC', 12),
(1618, 'CE_SP', 12),
(1619, 'CE_SE', 12),
(1620, 'CE_TO', 12),
(1621, 'CE_AP', 12),
(1622, 'CE_AC', 12),
(1623, 'CE_AM', 12),
(1624, 'CE_AL', 12),
(1625, 'CE_BA', 12),
(1626, 'CE_CE', 20),
(1627, 'CE_DF', 12),
(1628, 'CE_ES', 12),
(1629, 'CE_GO', 12),
(1630, 'CE_MA', 12),
(1631, 'CE_MT', 12),
(1632, 'CE_MS', 12),
(1633, 'CE_MG', 12),
(1634, 'CE_PA', 12),
(1635, 'CE_PB', 12),
(1636, 'CE_PR', 12),
(1637, 'CE_PE', 12),
(1638, 'CE_PI', 12),
(1639, 'CE_RJ', 12),
(1640, 'CE_RN', 12),
(1641, 'CE_RS', 12),
(1642, 'CE_RO', 12),
(1643, 'CE_RR', 12),
(1644, 'CE_SC', 12),
(1645, 'CE_SP', 12),
(1646, 'CE_SE', 12),
(1647, 'CE_TO', 12),
(1648, 'DF_AP', 12),
(1649, 'DF_AC', 12),
(1650, 'DF_AM', 12),
(1651, 'DF_AL', 12),
(1652, 'DF_BA', 12),
(1653, 'DF_CE', 12),
(1654, 'DF_DF', 18),
(1655, 'DF_ES', 12),
(1656, 'DF_GO', 12),
(1657, 'DF_MA', 12),
(1658, 'DF_MT', 12),
(1659, 'DF_MS', 12),
(1660, 'DF_MG', 12),
(1661, 'DF_PA', 12),
(1662, 'DF_PB', 12),
(1663, 'DF_PR', 12),
(1664, 'DF_PE', 12),
(1665, 'DF_PI', 12),
(1666, 'DF_RJ', 12),
(1667, 'DF_RN', 12),
(1668, 'DF_RS', 12),
(1669, 'DF_RO', 12),
(1670, 'DF_RR', 12),
(1671, 'DF_SC', 12),
(1672, 'DF_SP', 12),
(1673, 'DF_SE', 12),
(1674, 'DF_TO', 12),
(1675, 'ES_AP', 12),
(1676, 'ES_AC', 12),
(1677, 'ES_AM', 12),
(1678, 'ES_AL', 12),
(1679, 'ES_BA', 12),
(1680, 'ES_CE', 12),
(1681, 'ES_DF', 12),
(1682, 'ES_ES', 17),
(1683, 'ES_GO', 12),
(1684, 'ES_MA', 12),
(1685, 'ES_MT', 12),
(1686, 'ES_MS', 12),
(1687, 'ES_MG', 12),
(1688, 'ES_PA', 12),
(1689, 'ES_PB', 12),
(1690, 'ES_PR', 12),
(1691, 'ES_PE', 12),
(1692, 'ES_PI', 12),
(1693, 'ES_RJ', 12),
(1694, 'ES_RN', 12),
(1695, 'ES_RS', 12),
(1696, 'ES_RO', 12),
(1697, 'ES_RR', 12),
(1698, 'ES_SC', 12),
(1699, 'ES_SP', 12),
(1700, 'ES_SE', 12),
(1701, 'ES_TO', 12),
(1702, 'GO_AP', 12),
(1703, 'GO_AC', 12),
(1704, 'GO_AM', 12),
(1705, 'GO_AL', 12),
(1706, 'GO_BA', 12),
(1707, 'GO_CE', 12),
(1708, 'GO_DF', 12),
(1709, 'GO_ES', 12),
(1710, 'GO_GO', 17),
(1711, 'GO_MA', 12),
(1712, 'GO_MT', 12),
(1713, 'GO_MS', 12),
(1714, 'GO_MG', 12),
(1715, 'GO_PA', 12),
(1716, 'GO_PB', 12),
(1717, 'GO_PR', 12),
(1718, 'GO_PE', 12),
(1719, 'GO_PI', 12),
(1720, 'GO_RJ', 12),
(1721, 'GO_RN', 12),
(1722, 'GO_RS', 12),
(1723, 'GO_RO', 12),
(1724, 'GO_RR', 12),
(1725, 'GO_SC', 12),
(1726, 'GO_SP', 12),
(1727, 'GO_SE', 12),
(1728, 'GO_TO', 12),
(1729, 'MA_AP', 12),
(1730, 'MA_AC', 12),
(1731, 'MA_AM', 12),
(1732, 'MA_AL', 12),
(1733, 'MA_BA', 12),
(1734, 'MA_CE', 12),
(1735, 'MA_DF', 12),
(1736, 'MA_ES', 12),
(1737, 'MA_GO', 12),
(1738, 'MA_MA', 20),
(1739, 'MA_MT', 12),
(1740, 'MA_MS', 12),
(1741, 'MA_MG', 12),
(1742, 'MA_PA', 12),
(1743, 'MA_PB', 12),
(1744, 'MA_PR', 12),
(1745, 'MA_PE', 12),
(1746, 'MA_PI', 12),
(1747, 'MA_RJ', 12),
(1748, 'MA_RN', 12),
(1749, 'MA_RS', 12),
(1750, 'MA_RO', 12),
(1751, 'MA_RR', 12),
(1752, 'MA_SC', 12),
(1753, 'MA_SP', 12),
(1754, 'MA_SE', 12),
(1755, 'MA_TO', 12),
(1756, 'MG_AP', 7),
(1757, 'MG_AC', 7),
(1758, 'MG_AM', 7),
(1759, 'MG_AL', 7),
(1760, 'MG_BA', 7),
(1761, 'MG_CE', 7),
(1762, 'MG_DF', 7),
(1763, 'MG_ES', 7),
(1764, 'MG_GO', 7),
(1765, 'MG_MA', 7),
(1766, 'MG_MT', 7),
(1767, 'MG_MS', 7),
(1768, 'MG_MG', 18),
(1769, 'MG_PA', 7),
(1770, 'MG_PB', 7),
(1771, 'MG_PR', 12),
(1772, 'MG_PE', 7),
(1773, 'MG_PI', 7),
(1774, 'MG_RJ', 12),
(1775, 'MG_RN', 7),
(1776, 'MG_RS', 12),
(1777, 'MG_RO', 7),
(1778, 'MG_RR', 7),
(1779, 'MG_SC', 12),
(1780, 'MG_SP', 12),
(1781, 'MG_SE', 7),
(1782, 'MG_TO', 7),
(1783, 'MS_AP', 12),
(1784, 'MS_AC', 12),
(1785, 'MS_AM', 12),
(1786, 'MS_AL', 12),
(1787, 'MS_BA', 12),
(1788, 'MS_CE', 12),
(1789, 'MS_DF', 12),
(1790, 'MS_ES', 12),
(1791, 'MS_GO', 12),
(1792, 'MS_MA', 12),
(1793, 'MS_MT', 12),
(1794, 'MS_MS', 17),
(1795, 'MS_MG', 12),
(1796, 'MS_PA', 12),
(1797, 'MS_PB', 12),
(1798, 'MS_PR', 12),
(1799, 'MS_PE', 12),
(1800, 'MS_PI', 12),
(1801, 'MS_RJ', 12),
(1802, 'MS_RN', 12),
(1803, 'MS_RS', 12),
(1804, 'MS_RO', 12),
(1805, 'MS_RR', 12),
(1806, 'MS_SC', 12),
(1807, 'MS_SP', 12),
(1808, 'MS_SE', 12),
(1809, 'MS_TO', 12),
(1810, 'MT_AP', 12),
(1811, 'MT_AC', 12),
(1812, 'MT_AM', 12),
(1813, 'MT_AL', 12),
(1814, 'MT_BA', 12),
(1815, 'MT_CE', 12),
(1816, 'MT_DF', 12),
(1817, 'MT_ES', 12),
(1818, 'MT_GO', 12),
(1819, 'MT_MA', 12),
(1820, 'MT_MS', 12),
(1821, 'MT_MT', 17),
(1822, 'MT_MG', 12),
(1823, 'MT_PA', 12),
(1824, 'MT_PB', 12),
(1825, 'MT_PR', 12),
(1826, 'MT_PE', 12),
(1827, 'MT_PI', 12),
(1828, 'MT_RJ', 12),
(1829, 'MT_RN', 12),
(1830, 'MT_RS', 12),
(1831, 'MT_RO', 12),
(1832, 'MT_RR', 12),
(1833, 'MT_SC', 12),
(1834, 'MT_SP', 12),
(1835, 'MT_SE', 12),
(1836, 'MT_TO', 12),
(1837, 'PA_AP', 12),
(1838, 'PA_AC', 12),
(1839, 'PA_AM', 12),
(1840, 'PA_AL', 12),
(1841, 'PA_BA', 12),
(1842, 'PA_CE', 12),
(1843, 'PA_DF', 12),
(1844, 'PA_ES', 12),
(1845, 'PA_GO', 12),
(1846, 'PA_MA', 12),
(1847, 'PA_MS', 12),
(1848, 'PA_MT', 12),
(1849, 'PA_MG', 12),
(1850, 'PA_PA', 19),
(1851, 'PA_PB', 12),
(1852, 'PA_PR', 12),
(1853, 'PA_PE', 12),
(1854, 'PA_PI', 12),
(1855, 'PA_RJ', 12),
(1856, 'PA_RN', 12),
(1857, 'PA_RS', 12),
(1858, 'PA_RO', 12),
(1859, 'PA_RR', 12),
(1860, 'PA_SC', 12),
(1861, 'PA_SP', 12),
(1862, 'PA_SE', 12),
(1863, 'PA_TO', 12),
(1864, 'PB_AP', 12),
(1865, 'PB_AC', 12),
(1866, 'PB_AM', 12),
(1867, 'PB_AL', 12),
(1868, 'PB_BA', 12),
(1869, 'PB_CE', 12),
(1870, 'PB_DF', 12),
(1871, 'PB_ES', 12),
(1872, 'PB_GO', 12),
(1873, 'PB_MA', 12),
(1874, 'PB_MS', 12),
(1875, 'PB_MT', 12),
(1876, 'PB_MG', 12),
(1877, 'PB_PA', 12),
(1878, 'PB_PB', 18),
(1879, 'PB_PR', 12),
(1880, 'PB_PE', 12),
(1881, 'PB_PI', 12),
(1882, 'PB_RJ', 12),
(1883, 'PB_RN', 12),
(1884, 'PB_RS', 12),
(1885, 'PB_RO', 12),
(1886, 'PB_RR', 12),
(1887, 'PB_SC', 12),
(1888, 'PB_SP', 12),
(1889, 'PB_SE', 12),
(1890, 'PB_TO', 12),
(1891, 'PI_AP', 12),
(1892, 'PI_AC', 12),
(1893, 'PI_AM', 12),
(1894, 'PI_AL', 12),
(1895, 'PI_BA', 12),
(1896, 'PI_CE', 12),
(1897, 'PI_DF', 12),
(1898, 'PI_ES', 12),
(1899, 'PI_GO', 12),
(1900, 'PI_MA', 12),
(1901, 'PI_MS', 12),
(1902, 'PI_MT', 17),
(1903, 'PI_MG', 12),
(1904, 'PI_PA', 12),
(1905, 'PI_PB', 12),
(1906, 'PI_PR', 12),
(1907, 'PI_PE', 12),
(1908, 'PI_PI', 18),
(1909, 'PI_RJ', 12),
(1910, 'PI_RN', 12),
(1911, 'PI_RS', 12),
(1912, 'PI_RO', 12),
(1913, 'PI_RR', 12),
(1914, 'PI_SC', 12),
(1915, 'PI_SP', 12),
(1916, 'PI_SE', 12),
(1917, 'PI_TO', 12),
(1918, 'PR_AP', 7),
(1919, 'PR_AC', 7),
(1920, 'PR_AM', 7),
(1921, 'PR_AL', 7),
(1922, 'PR_BA', 7),
(1923, 'PR_CE', 7),
(1924, 'PR_DF', 7),
(1925, 'PR_ES', 7),
(1926, 'PR_GO', 7),
(1927, 'PR_MA', 7),
(1928, 'PR_MS', 7),
(1929, 'PR_MT', 7),
(1930, 'PR_MG', 12),
(1931, 'PR_PA', 7),
(1932, 'PR_PB', 7),
(1933, 'PR_PI', 7),
(1934, 'PR_PE', 7),
(1935, 'PR_PR', 19),
(1936, 'PR_RJ', 12),
(1937, 'PR_RN', 7),
(1938, 'PR_RS', 12),
(1939, 'PR_RO', 7),
(1940, 'PR_RR', 7),
(1941, 'PR_SC', 12),
(1942, 'PR_SP', 12),
(1943, 'PR_SE', 7),
(1944, 'PR_TO', 7),
(1945, 'RJ_AP', 7),
(1946, 'RJ_AC', 7),
(1947, 'RJ_AM', 7),
(1948, 'RJ_AL', 7),
(1949, 'RJ_BA', 7),
(1950, 'RJ_CE', 7),
(1951, 'RJ_DF', 7),
(1952, 'RJ_ES', 7),
(1953, 'RJ_GO', 7),
(1954, 'RJ_MA', 7),
(1955, 'RJ_MS', 7),
(1956, 'RJ_MT', 7),
(1957, 'RJ_MG', 12),
(1958, 'RJ_PA', 7),
(1959, 'RJ_PB', 7),
(1960, 'RJ_PI', 7),
(1961, 'RJ_PE', 7),
(1962, 'RJ_PR', 12),
(1963, 'RJ_RJ', 20),
(1964, 'RJ_RN', 7),
(1965, 'RJ_RS', 12),
(1966, 'RJ_RO', 7),
(1967, 'RJ_RR', 7),
(1968, 'RJ_SC', 12),
(1969, 'RJ_SP', 12),
(1970, 'RJ_SE', 7),
(1971, 'RJ_TO', 7),
(1972, 'RN_AP', 12),
(1973, 'RN_AC', 12),
(1974, 'RN_AM', 12),
(1975, 'RN_AL', 12),
(1976, 'RN_BA', 12),
(1977, 'RN_CE', 12),
(1978, 'RN_DF', 12),
(1979, 'RN_ES', 12),
(1980, 'RN_GO', 12),
(1981, 'RN_MA', 12),
(1982, 'RN_MS', 12),
(1983, 'RN_MT', 17),
(1984, 'RN_MG', 12),
(1985, 'RN_PA', 12),
(1986, 'RN_PB', 12),
(1987, 'RN_PR', 12),
(1988, 'RN_PE', 12),
(1989, 'RN_PE', 12),
(1990, 'RN_RJ', 12),
(1991, 'RN_RN', 20),
(1992, 'RN_RS', 12),
(1993, 'RN_RO', 12),
(1994, 'RN_RR', 12),
(1995, 'RN_SC', 12),
(1996, 'RN_SP', 12),
(1997, 'RN_SE', 12),
(1998, 'RN_TO', 12),
(1999, 'RO_AP', 12),
(2000, 'RO_AC', 12),
(2001, 'RO_AM', 12),
(2002, 'RO_AL', 12),
(2003, 'RO_BA', 12),
(2004, 'RO_CE', 12),
(2005, 'RO_DF', 12),
(2006, 'RO_ES', 12),
(2007, 'RO_GO', 12),
(2008, 'RO_MA', 12),
(2009, 'RO_MS', 12),
(2010, 'RO_MT', 17),
(2011, 'RO_MG', 12),
(2012, 'RO_PA', 12),
(2013, 'RO_PB', 12),
(2014, 'RO_PR', 12),
(2015, 'RO_PE', 12),
(2016, 'RO_PE', 12),
(2017, 'RO_RJ', 12),
(2018, 'RO_RN', 12),
(2019, 'RO_RS', 12),
(2020, 'RO_RO', 17.5),
(2021, 'RO_RR', 12),
(2022, 'RO_SC', 12),
(2023, 'RO_SP', 12),
(2024, 'RO_SE', 12),
(2025, 'RO_TO', 12),
(2026, 'RR_AP', 12),
(2027, 'RR_AC', 12),
(2028, 'RR_AM', 12),
(2029, 'RR_AL', 12),
(2030, 'RR_BA', 12),
(2031, 'RR_CE', 12),
(2032, 'RR_DF', 12),
(2033, 'RR_ES', 12),
(2034, 'RR_GR', 12),
(2035, 'RR_MA', 12),
(2036, 'RR_MS', 12),
(2037, 'RR_MT', 17),
(2038, 'RR_MG', 12),
(2039, 'RR_PA', 12),
(2040, 'RR_PB', 12),
(2041, 'RR_PR', 12),
(2042, 'RR_PE', 12),
(2043, 'RR_PE', 12),
(2044, 'RR_RJ', 12),
(2045, 'RR_RN', 12),
(2046, 'RR_RS', 12),
(2047, 'RR_RO', 12),
(2048, 'RR_RR', 17),
(2049, 'RR_SC', 12),
(2050, 'RR_SP', 12),
(2051, 'RR_SE', 12),
(2052, 'RR_TR', 12),
(2053, 'RS_AP', 7),
(2054, 'RS_AC', 7),
(2055, 'RS_AM', 7),
(2056, 'RS_AL', 7),
(2057, 'RS_BA', 7),
(2058, 'RS_CE', 7),
(2059, 'RS_DF', 7),
(2060, 'RS_ES', 7),
(2061, 'RS_GO', 7),
(2062, 'RS_MA', 7),
(2063, 'RS_MT', 7),
(2064, 'RS_MS', 7),
(2065, 'RS_MG', 12),
(2066, 'RS_PA', 7),
(2067, 'RS_PB', 7),
(2068, 'RS_PR', 12),
(2069, 'RS_PE', 7),
(2070, 'RS_PI', 7),
(2071, 'RS_RJ', 12),
(2072, 'RS_RN', 7),
(2073, 'RS_RS', 18),
(2074, 'RS_RO', 7),
(2075, 'RS_RR', 7),
(2076, 'RS_SC', 12),
(2077, 'RS_SP', 12),
(2078, 'RS_SE', 7),
(2079, 'RS_TO', 7),
(2080, 'SC_AP', 7),
(2081, 'SC_AC', 7),
(2082, 'SC_AM', 7),
(2083, 'SC_AL', 7),
(2084, 'SC_BA', 7),
(2085, 'SC_CE', 7),
(2086, 'SC_DF', 7),
(2087, 'SC_ES', 7),
(2088, 'SC_GO', 7),
(2089, 'SC_MA', 7),
(2090, 'SC_MT', 7),
(2091, 'SC_MS', 7),
(2092, 'SC_MG', 12),
(2093, 'SC_PA', 7),
(2094, 'SC_PB', 7),
(2095, 'SC_PR', 12),
(2096, 'SC_PE', 7),
(2097, 'SC_PI', 7),
(2098, 'SC_RJ', 12),
(2099, 'SC_RN', 7),
(2100, 'SC_RS', 12),
(2101, 'SC_RO', 7),
(2102, 'SC_RR', 12),
(2103, 'SC_SC', 17),
(2104, 'SC_SP', 12),
(2105, 'SC_SE', 7),
(2106, 'SC_TO', 7),
(2107, 'SE_AP', 12),
(2108, 'SE_AC', 12),
(2109, 'SE_AM', 12),
(2110, 'SE_AL', 12),
(2111, 'SE_BA', 12),
(2112, 'SE_CE', 12),
(2113, 'SE_DF', 12),
(2114, 'SE_ES', 12),
(2115, 'SE_GO', 12),
(2116, 'SE_MA', 12),
(2117, 'SE_MT', 12),
(2118, 'SE_MS', 12),
(2119, 'SE_MG', 12),
(2120, 'SE_PA', 12),
(2121, 'SE_PB', 12),
(2122, 'SE_PR', 12),
(2123, 'SE_PE', 12),
(2124, 'SE_PI', 12),
(2125, 'SE_RJ', 12),
(2126, 'SE_RN', 12),
(2127, 'SE_RS', 12),
(2128, 'SE_RO', 12),
(2129, 'SE_RR', 12),
(2130, 'SE_SC', 12),
(2131, 'SE_SP', 12),
(2132, 'SE_SE', 22),
(2133, 'SE_TO', 12),
(2134, 'SP_AP', 7),
(2135, 'SP_AC', 7),
(2136, 'SP_AM', 7),
(2137, 'SP_AL', 7),
(2138, 'SP_BA', 7),
(2139, 'SP_CE', 7),
(2140, 'SP_DF', 7),
(2141, 'SP_ES', 7),
(2142, 'SP_GO', 7),
(2143, 'SP_MA', 7),
(2144, 'SP_MT', 12),
(2145, 'SP_MS', 7),
(2146, 'SP_MG', 7),
(2147, 'SP_PA', 7),
(2148, 'SP_PB', 7),
(2149, 'SP_PR', 7),
(2150, 'SP_PE', 7),
(2151, 'SP_PI', 12),
(2152, 'SP_RJ', 12),
(2153, 'SP_RN', 7),
(2154, 'SP_RS', 7),
(2155, 'SP_RO', 7),
(2156, 'SP_RR', 12),
(2157, 'SP_SC', 12),
(2158, 'SP_SE', 7),
(2159, 'SP_SP', 18),
(2160, 'SP_TO', 7),
(2161, 'TO_AP', 12),
(2162, 'TO_AC', 12),
(2163, 'TO_AM', 12),
(2164, 'TO_AL', 12),
(2165, 'TO_BA', 12),
(2166, 'TO_CE', 12),
(2167, 'TO_DF', 12),
(2168, 'TO_ES', 12),
(2169, 'TO_GO', 12),
(2170, 'TO_MA', 12),
(2171, 'TO_MT', 12),
(2172, 'TO_MS', 12),
(2173, 'TO_MG', 12),
(2174, 'TO_PA', 12),
(2175, 'TO_PB', 12),
(2176, 'TO_PR', 12),
(2177, 'TO_PE', 12),
(2178, 'TO_PI', 12),
(2179, 'TO_RJ', 12),
(2180, 'TO_RN', 12),
(2181, 'TO_RS', 12),
(2182, 'TO_RO', 12),
(2183, 'TO_RR', 12),
(2184, 'TO_SC', 12),
(2185, 'TO_SE', 12),
(2186, 'TO_SP', 12),
(2187, 'TO_TO', 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_container`
--

CREATE TABLE `tb_container` (
  `cd_container` int(11) NOT NULL,
  `nm_container` varchar(100) DEFAULT NULL,
  `qt_tara_container` int(11) DEFAULT NULL,
  `qt_peso_min_container` decimal(8,2) DEFAULT NULL,
  `qt_peso_max_container` decimal(8,2) DEFAULT NULL,
  `qt_cub_container` decimal(6,2) DEFAULT NULL,
  `qt_pallet_container` int(11) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_cot_aut`
--

CREATE TABLE `tb_cot_aut` (
  `cd_cot_aut` int(11) NOT NULL,
  `nm_cot_aut` varchar(100) DEFAULT NULL,
  `vl_cot_aut` decimal(20,2) DEFAULT NULL,
  `dt_cot_aut` date DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_despesas`
--

CREATE TABLE `tb_despesas` (
  `cd_despesas` int(11) NOT NULL,
  `vl_motorista_despesas` decimal(10,2) DEFAULT NULL,
  `vl_pedagio_despesas` decimal(10,2) DEFAULT NULL,
  `vl_profit_despesas` decimal(10,2) DEFAULT NULL,
  `vl_comissao_despesas` decimal(10,2) DEFAULT NULL,
  `pc_comissao_despesas` decimal(5,2) DEFAULT NULL,
  `vl_despesas` decimal(10,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_eixos_consulta`
--

CREATE TABLE `tb_eixos_consulta` (
  `cd_eixos_consulta` int(11) NOT NULL,
  `qtd_eixos_consulta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_eixos_tipo_carga_consulta`
--

CREATE TABLE `tb_eixos_tipo_carga_consulta` (
  `cd_eixos_consulta` int(11) NOT NULL,
  `cd_tipo_carga_consulta` int(11) NOT NULL,
  `cd_tipo_op_consulta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_email_responsavel_cliente`
--

CREATE TABLE `tb_email_responsavel_cliente` (
  `cd_email_responsavel_cliente` int(11) NOT NULL,
  `nm_email_responsavel_cliente` varchar(100) NOT NULL,
  `cd_responsavel_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_email_responsavel_cliente_proposta`
--

CREATE TABLE `tb_email_responsavel_cliente_proposta` (
  `cd_email_responsavel_cliente` int(11) NOT NULL,
  `nm_email_responsavel_cliente` varchar(100) DEFAULT NULL,
  `cd_responsavel_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_email_usuario`
--

CREATE TABLE `tb_email_usuario` (
  `cd_email` int(11) NOT NULL,
  `nm_email_usuario` varchar(100) DEFAULT NULL,
  `cd_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tb_email_usuario`
--

INSERT INTO `tb_email_usuario` (`cd_email`, `nm_email_usuario`, `cd_usuario`) VALUES
(1, 'admin@acl.com.br', 1),
(2, 'comercial@acl.com.br', 2),
(3, 'lucas.craveiro@aclcargo.com.br', 3),
(4, 'lucas.craveiro@aclcargo.com.br', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_filial`
--

CREATE TABLE `tb_filial` (
  `cd_filial` int(11) NOT NULL,
  `nm_filial` varchar(50) NOT NULL,
  `cd_cnpj` varchar(50) NOT NULL,
  `cd_proposta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_frete_peso`
--

CREATE TABLE `tb_frete_peso` (
  `cd_frete_peso` int(11) NOT NULL,
  `vl_frete_peso` decimal(10,2) DEFAULT NULL,
  `pc_frete_peso` decimal(5,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_imp_despesas`
--

CREATE TABLE `tb_imp_despesas` (
  `cd_imp_despesas` int(11) NOT NULL,
  `pc_rcfdc_imp_despesas` decimal(5,2) DEFAULT NULL,
  `vl_rcfdc_imp_despesas` decimal(10,2) DEFAULT NULL,
  `pc_rctrc_imp_despesas` decimal(5,2) DEFAULT NULL,
  `vl_rctrc_imp_despesas` decimal(10,2) DEFAULT NULL,
  `pc_simples_nac_imp_despesas` decimal(5,2) DEFAULT NULL,
  `vl_simples_nac_imp_despesas` decimal(10,2) DEFAULT NULL,
  `pc_irpj_imp_despesas` decimal(5,2) DEFAULT NULL,
  `vl_irpj_imp_despesas` decimal(10,2) DEFAULT NULL,
  `pc_adic_irpj_imp_despesas` decimal(5,2) DEFAULT NULL,
  `vl_adic_irpj_imp_despesas` decimal(10,2) DEFAULT NULL,
  `pc_pis_imp_despesas` decimal(5,2) DEFAULT NULL,
  `vl_pis_imp_despesas` decimal(10,2) DEFAULT NULL,
  `pc_cofins_imp_despesas` decimal(5,2) DEFAULT NULL,
  `vl_cofins_imp_despesas` decimal(10,2) DEFAULT NULL,
  `vl_icms_despesas` decimal(10,2) DEFAULT NULL,
  `pc_icms_despesas` decimal(5,2) DEFAULT NULL,
  `cd_despesas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_imp_operacao`
--

CREATE TABLE `tb_imp_operacao` (
  `cd_imp_operacao` int(11) NOT NULL,
  `pc_imp_susp_imp_operacao` decimal(5,2) DEFAULT NULL,
  `vl_imp_susp_imp_operacao` decimal(10,2) DEFAULT NULL,
  `vl_total_imposto_seguro_operacao` decimal(10,2) NOT NULL,
  `pc_rctrc_imp_operacao` decimal(5,2) DEFAULT NULL,
  `vl_rctrc_imp_operacao` decimal(10,2) DEFAULT NULL,
  `pc_rcfdc_imp_operacao` decimal(5,2) DEFAULT NULL,
  `vl_rcfdc_imp_operacao` decimal(10,2) DEFAULT NULL,
  `ds_tipo_gris_imp_operacao` varchar(20) NOT NULL,
  `pc_gris_imp_operacao` decimal(5,2) DEFAULT NULL,
  `vl_gris_imp_operacao` decimal(10,2) DEFAULT NULL,
  `vl_valor_icms_operacao` decimal(10,2) DEFAULT NULL,
  `pc_icms_operacao` decimal(5,2) DEFAULT NULL,
  `cd_operacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_km_rota_carga`
--

CREATE TABLE `tb_km_rota_carga` (
  `cd_km_rota_carga` int(11) NOT NULL,
  `qtd_ida_km_rota_carga` decimal(6,2) DEFAULT NULL,
  `qtd_volta_km_rota_carga` decimal(6,2) DEFAULT NULL,
  `qtd_total_km_rota_carga` decimal(6,2) DEFAULT NULL,
  `cd_carga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_mercadoria_operacao`
--

CREATE TABLE `tb_mercadoria_operacao` (
  `cd_mercadoria_operacao` int(11) NOT NULL,
  `vl_mercadoria_operacao` decimal(10,2) DEFAULT NULL,
  `vl_container_operacao` decimal(20,2) DEFAULT NULL,
  `cd_operacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_motorista`
--

CREATE TABLE `tb_motorista` (
  `cd_motorista` int(11) NOT NULL,
  `vl_motorista` varchar(50) DEFAULT NULL,
  `vl_frete_conf_antt_motorista` decimal(10,2) DEFAULT NULL,
  `vl_pedagio_tab_motorista` decimal(10,2) DEFAULT NULL,
  `vl_total_aut_tab_motorista` decimal(10,2) DEFAULT NULL,
  `vl_lucro_total_aut_tab_motorista` decimal(10,2) DEFAULT NULL,
  `vl_frete_all_in_fechado_motorista` decimal(10,2) DEFAULT NULL,
  `vl_lucro_frete_all_in_fechado_motorista` decimal(10,2) DEFAULT NULL,
  `vl_tentar_fechar_motorista` decimal(10,2) DEFAULT NULL,
  `vl_lucro_tentar_fechar_motorista` decimal(10,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_operacao`
--

CREATE TABLE `tb_operacao` (
  `cd_operacao` int(11) NOT NULL,
  `nm_tipo_operacao` varchar(100) DEFAULT NULL,
  `nm_tipo_imposto_operacao` varchar(100) DEFAULT NULL,
  `vl_frete_peso_operacao` decimal(10,2) NOT NULL,
  `vl_subtotal_operacao` decimal(10,2) DEFAULT NULL,
  `pc_total_prest_operacao` decimal(5,2) DEFAULT NULL,
  `vl_total_prest_operacao` decimal(10,2) DEFAULT NULL,
  `vl_despesas_operacao` decimal(10,2) DEFAULT NULL,
  `pc_lucro_bruto_operacao` decimal(10,2) DEFAULT NULL,
  `vl_lucro_bruto_operacao` decimal(10,2) DEFAULT NULL,
  `vl_margem_operacao` varchar(50) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_pedagio_rota_carga`
--

CREATE TABLE `tb_pedagio_rota_carga` (
  `cd_pedagio_rota_carga` int(11) NOT NULL,
  `qtd_eixos_pedagio_rota_carga` decimal(10,2) DEFAULT NULL,
  `vl_ida_pedagio_rota_carga` decimal(10,2) DEFAULT NULL,
  `vl_volta_pedagio_rota_carga` decimal(10,2) DEFAULT NULL,
  `vl_total_pedagio_rota_carga` decimal(10,2) DEFAULT NULL,
  `cd_carga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_privilegio`
--

CREATE TABLE `tb_privilegio` (
  `cd_privilegio` int(11) NOT NULL,
  `nm_privilegio` varchar(50) DEFAULT NULL,
  `cd_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tb_privilegio`
--

INSERT INTO `tb_privilegio` (`cd_privilegio`, `nm_privilegio`, `cd_usuario`) VALUES
(1, 'Adm', 1),
(2, 'Usuario', 2),
(3, 'Adm', 3),
(4, 'Adm', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produto`
--

CREATE TABLE `tb_produto` (
  `cd_produto` int(11) NOT NULL,
  `nm_produto` varchar(100) DEFAULT NULL,
  `qt_produto` varchar(50) DEFAULT NULL,
  `qt_peso_produto` decimal(7,2) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_proposta`
--

CREATE TABLE `tb_proposta` (
  `cd_proposta` int(11) NOT NULL,
  `ds_tipo_proposta` varchar(50) NOT NULL,
  `dt_proposta` date DEFAULT NULL,
  `nm_referencia_acl` varchar(100) DEFAULT NULL,
  `nm_referencia_cliente` varchar(100) DEFAULT NULL,
  `nm_versao_proposta` varchar(50) DEFAULT NULL,
  `dt_horario_recebimento` time DEFAULT NULL,
  `ds_metodo_transporte` varchar(500) DEFAULT NULL,
  `ds_status_proposta` varchar(100) DEFAULT NULL,
  `ds_tipo_assinatura` varchar(20) DEFAULT NULL,
  `cd_token_cliente` int(11) DEFAULT NULL,
  `cd_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_responsavel_cliente`
--

CREATE TABLE `tb_responsavel_cliente` (
  `cd_responsavel_cliente` int(11) NOT NULL,
  `nm_responsavel_cliente` varchar(100) NOT NULL,
  `nr_telefone_responsavel_cliente` varchar(15) NOT NULL,
  `cd_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_responsavel_cliente_proposta`
--

CREATE TABLE `tb_responsavel_cliente_proposta` (
  `cd_responsavel_cliente` int(11) NOT NULL,
  `nm_responsavel_cliente` varchar(100) DEFAULT NULL,
  `cd_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_rota`
--

CREATE TABLE `tb_rota` (
  `cd_rota` int(11) NOT NULL,
  `sg_uf_origem_rota` char(2) DEFAULT NULL,
  `nm_cidade_origem_rota` varchar(100) DEFAULT NULL,
  `sg_uf_destino_rota` char(2) DEFAULT NULL,
  `nm_cidade_destino_rota` varchar(100) DEFAULT NULL,
  `nm_local_devolucao_container_rota` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sobrestadia_carreg`
--

CREATE TABLE `tb_sobrestadia_carreg` (
  `cd_sobrestadia_carreg` int(11) NOT NULL,
  `id_sobrestadia_carreg` char(3) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tipo_carga_consulta`
--

CREATE TABLE `tb_tipo_carga_consulta` (
  `cd_tipo_carga_consulta` int(11) NOT NULL,
  `nm_tipo_carga_consulta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tipo_frete`
--

CREATE TABLE `tb_tipo_frete` (
  `cd_tipo_frete` int(11) NOT NULL,
  `nm_tipo_frete` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tipo_op_consulta`
--

CREATE TABLE `tb_tipo_op_consulta` (
  `cd_tipo_op_consulta` int(11) NOT NULL,
  `nm_tipo_op_consulta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tipo_proposta`
--

CREATE TABLE `tb_tipo_proposta` (
  `cd_tipo_proposta` int(11) NOT NULL,
  `nm_tipo_proposta` varchar(100) DEFAULT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `cd_usuario` int(11) NOT NULL,
  `nm_nome_completo` varchar(100) DEFAULT NULL,
  `nm_cargo_usuario` varchar(100) DEFAULT NULL,
  `cd_senha` varchar(20) DEFAULT NULL,
  `cd_cpf_usuario` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`cd_usuario`, `nm_nome_completo`, `nm_cargo_usuario`, `cd_senha`, `cd_cpf_usuario`) VALUES
(1, 'Admin Compass', 'Diretor de Negócios', '123', NULL),
(2, 'Comercial Compass', 'Vendas e Relacionamento', '123', NULL),
(3, 'Lucas dos Santos Craveiro', 'Diretoria Geral', '123', '51992618860'),
(4, 'Lucas Craveiro', 'Diretoria Geral', '123', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_valor_carga`
--

CREATE TABLE `tb_valor_carga` (
  `cd_valor_carga` int(11) NOT NULL,
  `vl_preco_carga` decimal(10,2) DEFAULT NULL,
  `nm_tipo_moeda_valor_carga` varchar(50) DEFAULT NULL,
  `vl_cotacao_valor_carga` decimal(10,2) DEFAULT NULL,
  `vl_brl_valor_carga` decimal(10,2) DEFAULT NULL,
  `cd_carga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_valor_carga_op_consulta`
--

CREATE TABLE `tb_valor_carga_op_consulta` (
  `cd_valor_carga_op_consulta` int(11) NOT NULL,
  `vl_valor_carga_op_consulta` decimal(20,2) DEFAULT NULL,
  `cd_tipo_carga_consulta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_veiculo`
--

CREATE TABLE `tb_veiculo` (
  `cd_veiculo` int(11) NOT NULL,
  `nm_veiculo` varchar(100) DEFAULT NULL,
  `qt_eixos_veiculo` int(11) DEFAULT NULL,
  `ds_carga_veiculo` varchar(100) NOT NULL,
  `cd_proposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_adicionais`
--
ALTER TABLE `tb_adicionais`
  ADD PRIMARY KEY (`cd_adicionais`),
  ADD KEY `fk_adicionais_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_adic_despesas`
--
ALTER TABLE `tb_adic_despesas`
  ADD PRIMARY KEY (`cd_adic_despesas`),
  ADD KEY `fk_adic_despesas_despesas` (`cd_despesas`);

--
-- Índices de tabela `tb_adic_operacao`
--
ALTER TABLE `tb_adic_operacao`
  ADD PRIMARY KEY (`cd_adic_operacao`),
  ADD KEY `fk_adic_operacao_operacao` (`cd_operacao`);

--
-- Índices de tabela `tb_arq_propostas`
--
ALTER TABLE `tb_arq_propostas`
  ADD PRIMARY KEY (`cd_arq_propostas`),
  ADD KEY `fk_arq_propostas_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_assinatura_cliente`
--
ALTER TABLE `tb_assinatura_cliente`
  ADD PRIMARY KEY (`cd_assinatura_cliente`),
  ADD KEY `fk_assinatura_cliente_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_carga`
--
ALTER TABLE `tb_carga`
  ADD PRIMARY KEY (`cd_carga`),
  ADD KEY `fk_tipo_carga_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`cd_cliente`);

--
-- Índices de tabela `tb_cliente_proposta`
--
ALTER TABLE `tb_cliente_proposta`
  ADD PRIMARY KEY (`cd_cliente`),
  ADD KEY `fk_cliente_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_combustivel_carga`
--
ALTER TABLE `tb_combustivel_carga`
  ADD PRIMARY KEY (`cd_combustivel_carga`),
  ADD KEY `fk_combustivel_carga` (`cd_carga`);

--
-- Índices de tabela `tb_consulta_porc_icms`
--
ALTER TABLE `tb_consulta_porc_icms`
  ADD PRIMARY KEY (`cd_consulta_porc_icms`);

--
-- Índices de tabela `tb_container`
--
ALTER TABLE `tb_container`
  ADD PRIMARY KEY (`cd_container`),
  ADD KEY `fk_container_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_cot_aut`
--
ALTER TABLE `tb_cot_aut`
  ADD PRIMARY KEY (`cd_cot_aut`),
  ADD KEY `fk_cot_aut_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_despesas`
--
ALTER TABLE `tb_despesas`
  ADD PRIMARY KEY (`cd_despesas`),
  ADD KEY `fk_despesas_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_eixos_consulta`
--
ALTER TABLE `tb_eixos_consulta`
  ADD PRIMARY KEY (`cd_eixos_consulta`);

--
-- Índices de tabela `tb_eixos_tipo_carga_consulta`
--
ALTER TABLE `tb_eixos_tipo_carga_consulta`
  ADD PRIMARY KEY (`cd_eixos_consulta`,`cd_tipo_carga_consulta`),
  ADD KEY `fk_eixos_tipo_carga_consulta_consulta` (`cd_tipo_carga_consulta`),
  ADD KEY `fk_tipo_op_consulta_consulta` (`cd_tipo_op_consulta`);

--
-- Índices de tabela `tb_email_responsavel_cliente`
--
ALTER TABLE `tb_email_responsavel_cliente`
  ADD PRIMARY KEY (`cd_email_responsavel_cliente`);

--
-- Índices de tabela `tb_email_responsavel_cliente_proposta`
--
ALTER TABLE `tb_email_responsavel_cliente_proposta`
  ADD PRIMARY KEY (`cd_email_responsavel_cliente`),
  ADD KEY `fk_email_responsavel_cliente_responsavel` (`cd_responsavel_cliente`);

--
-- Índices de tabela `tb_email_usuario`
--
ALTER TABLE `tb_email_usuario`
  ADD PRIMARY KEY (`cd_email`),
  ADD KEY `fk_email_usuario_usuario` (`cd_usuario`);

--
-- Índices de tabela `tb_filial`
--
ALTER TABLE `tb_filial`
  ADD PRIMARY KEY (`cd_filial`),
  ADD KEY `fk_filial_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_frete_peso`
--
ALTER TABLE `tb_frete_peso`
  ADD PRIMARY KEY (`cd_frete_peso`),
  ADD KEY `fk_frete_peso_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_imp_despesas`
--
ALTER TABLE `tb_imp_despesas`
  ADD PRIMARY KEY (`cd_imp_despesas`),
  ADD KEY `fk_imp_despesas_despesas` (`cd_despesas`);

--
-- Índices de tabela `tb_imp_operacao`
--
ALTER TABLE `tb_imp_operacao`
  ADD PRIMARY KEY (`cd_imp_operacao`),
  ADD KEY `fk_imp_operacao_operacao` (`cd_operacao`);

--
-- Índices de tabela `tb_km_rota_carga`
--
ALTER TABLE `tb_km_rota_carga`
  ADD PRIMARY KEY (`cd_km_rota_carga`),
  ADD KEY `fk_km_ida_carga_carga` (`cd_carga`);

--
-- Índices de tabela `tb_mercadoria_operacao`
--
ALTER TABLE `tb_mercadoria_operacao`
  ADD PRIMARY KEY (`cd_mercadoria_operacao`),
  ADD KEY `fk_mercadoria_operacao_operacao` (`cd_operacao`);

--
-- Índices de tabela `tb_motorista`
--
ALTER TABLE `tb_motorista`
  ADD PRIMARY KEY (`cd_motorista`),
  ADD KEY `fk_motorista_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_operacao`
--
ALTER TABLE `tb_operacao`
  ADD PRIMARY KEY (`cd_operacao`),
  ADD KEY `fk_tipo_operacao_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_pedagio_rota_carga`
--
ALTER TABLE `tb_pedagio_rota_carga`
  ADD PRIMARY KEY (`cd_pedagio_rota_carga`),
  ADD KEY `fk_pedagio_rota_carga_carga` (`cd_carga`);

--
-- Índices de tabela `tb_privilegio`
--
ALTER TABLE `tb_privilegio`
  ADD PRIMARY KEY (`cd_privilegio`),
  ADD KEY `fk_privilegio_usuario` (`cd_usuario`);

--
-- Índices de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD PRIMARY KEY (`cd_produto`),
  ADD KEY `fk_produto_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_proposta`
--
ALTER TABLE `tb_proposta`
  ADD PRIMARY KEY (`cd_proposta`),
  ADD KEY `fk_proposta_usuario` (`cd_usuario`);

--
-- Índices de tabela `tb_responsavel_cliente`
--
ALTER TABLE `tb_responsavel_cliente`
  ADD PRIMARY KEY (`cd_responsavel_cliente`),
  ADD KEY `fk_responsavel_cliente_consulta` (`cd_cliente`);

--
-- Índices de tabela `tb_responsavel_cliente_proposta`
--
ALTER TABLE `tb_responsavel_cliente_proposta`
  ADD PRIMARY KEY (`cd_responsavel_cliente`),
  ADD KEY `fk_responsavel_cliente_cliente` (`cd_cliente`);

--
-- Índices de tabela `tb_rota`
--
ALTER TABLE `tb_rota`
  ADD PRIMARY KEY (`cd_rota`);

--
-- Índices de tabela `tb_sobrestadia_carreg`
--
ALTER TABLE `tb_sobrestadia_carreg`
  ADD PRIMARY KEY (`cd_sobrestadia_carreg`),
  ADD KEY `fk_sobrestadia_carreg_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_tipo_carga_consulta`
--
ALTER TABLE `tb_tipo_carga_consulta`
  ADD PRIMARY KEY (`cd_tipo_carga_consulta`);

--
-- Índices de tabela `tb_tipo_frete`
--
ALTER TABLE `tb_tipo_frete`
  ADD PRIMARY KEY (`cd_tipo_frete`),
  ADD KEY `fk_tipo_frete_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_tipo_op_consulta`
--
ALTER TABLE `tb_tipo_op_consulta`
  ADD PRIMARY KEY (`cd_tipo_op_consulta`);

--
-- Índices de tabela `tb_tipo_proposta`
--
ALTER TABLE `tb_tipo_proposta`
  ADD PRIMARY KEY (`cd_tipo_proposta`),
  ADD KEY `fk_tipos_proposta_proposta` (`cd_proposta`);

--
-- Índices de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`cd_usuario`);

--
-- Índices de tabela `tb_valor_carga`
--
ALTER TABLE `tb_valor_carga`
  ADD PRIMARY KEY (`cd_valor_carga`),
  ADD KEY `fk_valor_carga_carga` (`cd_carga`);

--
-- Índices de tabela `tb_valor_carga_op_consulta`
--
ALTER TABLE `tb_valor_carga_op_consulta`
  ADD PRIMARY KEY (`cd_valor_carga_op_consulta`),
  ADD KEY `fk_valor_tipo_consulta_carga` (`cd_tipo_carga_consulta`);

--
-- Índices de tabela `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
  ADD PRIMARY KEY (`cd_veiculo`),
  ADD KEY `fk_veiculo_proposta` (`cd_proposta`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_adicionais`
--
ALTER TABLE `tb_adicionais`
  MODIFY `cd_adicionais` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_adic_despesas`
--
ALTER TABLE `tb_adic_despesas`
  MODIFY `cd_adic_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_adic_operacao`
--
ALTER TABLE `tb_adic_operacao`
  MODIFY `cd_adic_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_arq_propostas`
--
ALTER TABLE `tb_arq_propostas`
  MODIFY `cd_arq_propostas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_assinatura_cliente`
--
ALTER TABLE `tb_assinatura_cliente`
  MODIFY `cd_assinatura_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_carga`
--
ALTER TABLE `tb_carga`
  MODIFY `cd_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `cd_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_cliente_proposta`
--
ALTER TABLE `tb_cliente_proposta`
  MODIFY `cd_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_combustivel_carga`
--
ALTER TABLE `tb_combustivel_carga`
  MODIFY `cd_combustivel_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_consulta_porc_icms`
--
ALTER TABLE `tb_consulta_porc_icms`
  MODIFY `cd_consulta_porc_icms` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2188;

--
-- AUTO_INCREMENT de tabela `tb_container`
--
ALTER TABLE `tb_container`
  MODIFY `cd_container` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cot_aut`
--
ALTER TABLE `tb_cot_aut`
  MODIFY `cd_cot_aut` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_despesas`
--
ALTER TABLE `tb_despesas`
  MODIFY `cd_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_eixos_consulta`
--
ALTER TABLE `tb_eixos_consulta`
  MODIFY `cd_eixos_consulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_email_responsavel_cliente`
--
ALTER TABLE `tb_email_responsavel_cliente`
  MODIFY `cd_email_responsavel_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_email_responsavel_cliente_proposta`
--
ALTER TABLE `tb_email_responsavel_cliente_proposta`
  MODIFY `cd_email_responsavel_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_email_usuario`
--
ALTER TABLE `tb_email_usuario`
  MODIFY `cd_email` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_filial`
--
ALTER TABLE `tb_filial`
  MODIFY `cd_filial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_frete_peso`
--
ALTER TABLE `tb_frete_peso`
  MODIFY `cd_frete_peso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_imp_despesas`
--
ALTER TABLE `tb_imp_despesas`
  MODIFY `cd_imp_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_imp_operacao`
--
ALTER TABLE `tb_imp_operacao`
  MODIFY `cd_imp_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_km_rota_carga`
--
ALTER TABLE `tb_km_rota_carga`
  MODIFY `cd_km_rota_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_mercadoria_operacao`
--
ALTER TABLE `tb_mercadoria_operacao`
  MODIFY `cd_mercadoria_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_motorista`
--
ALTER TABLE `tb_motorista`
  MODIFY `cd_motorista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_operacao`
--
ALTER TABLE `tb_operacao`
  MODIFY `cd_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_pedagio_rota_carga`
--
ALTER TABLE `tb_pedagio_rota_carga`
  MODIFY `cd_pedagio_rota_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_privilegio`
--
ALTER TABLE `tb_privilegio`
  MODIFY `cd_privilegio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `cd_responsavel_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_responsavel_cliente_proposta`
--
ALTER TABLE `tb_responsavel_cliente_proposta`
  MODIFY `cd_responsavel_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_rota`
--
ALTER TABLE `tb_rota`
  MODIFY `cd_rota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_sobrestadia_carreg`
--
ALTER TABLE `tb_sobrestadia_carreg`
  MODIFY `cd_sobrestadia_carreg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo_carga_consulta`
--
ALTER TABLE `tb_tipo_carga_consulta`
  MODIFY `cd_tipo_carga_consulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo_frete`
--
ALTER TABLE `tb_tipo_frete`
  MODIFY `cd_tipo_frete` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo_op_consulta`
--
ALTER TABLE `tb_tipo_op_consulta`
  MODIFY `cd_tipo_op_consulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo_proposta`
--
ALTER TABLE `tb_tipo_proposta`
  MODIFY `cd_tipo_proposta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `cd_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_valor_carga`
--
ALTER TABLE `tb_valor_carga`
  MODIFY `cd_valor_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_valor_carga_op_consulta`
--
ALTER TABLE `tb_valor_carga_op_consulta`
  MODIFY `cd_valor_carga_op_consulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
  MODIFY `cd_veiculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_adicionais`
--
ALTER TABLE `tb_adicionais`
  ADD CONSTRAINT `fk_adicionais_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_adic_despesas`
--
ALTER TABLE `tb_adic_despesas`
  ADD CONSTRAINT `fk_adic_despesas_despesas` FOREIGN KEY (`cd_despesas`) REFERENCES `tb_despesas` (`cd_despesas`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_adic_operacao`
--
ALTER TABLE `tb_adic_operacao`
  ADD CONSTRAINT `fk_adic_operacao_operacao` FOREIGN KEY (`cd_operacao`) REFERENCES `tb_operacao` (`cd_operacao`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_arq_propostas`
--
ALTER TABLE `tb_arq_propostas`
  ADD CONSTRAINT `fk_arq_propostas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Restrições para tabelas `tb_assinatura_cliente`
--
ALTER TABLE `tb_assinatura_cliente`
  ADD CONSTRAINT `fk_assinatura_cliente_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_carga`
--
ALTER TABLE `tb_carga`
  ADD CONSTRAINT `fk_tipo_carga_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_cliente_proposta`
--
ALTER TABLE `tb_cliente_proposta`
  ADD CONSTRAINT `fk_cliente_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_combustivel_carga`
--
ALTER TABLE `tb_combustivel_carga`
  ADD CONSTRAINT `fk_combustivel_carga` FOREIGN KEY (`cd_carga`) REFERENCES `tb_carga` (`cd_carga`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_container`
--
ALTER TABLE `tb_container`
  ADD CONSTRAINT `fk_container_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Restrições para tabelas `tb_cot_aut`
--
ALTER TABLE `tb_cot_aut`
  ADD CONSTRAINT `fk_cot_aut_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_despesas`
--
ALTER TABLE `tb_despesas`
  ADD CONSTRAINT `fk_despesas_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_eixos_tipo_carga_consulta`
--
ALTER TABLE `tb_eixos_tipo_carga_consulta`
  ADD CONSTRAINT `fk_eixos_consulta_consulta` FOREIGN KEY (`cd_eixos_consulta`) REFERENCES `tb_eixos_consulta` (`cd_eixos_consulta`),
  ADD CONSTRAINT `fk_eixos_tipo_carga_consulta_consulta` FOREIGN KEY (`cd_tipo_carga_consulta`) REFERENCES `tb_tipo_carga_consulta` (`cd_tipo_carga_consulta`),
  ADD CONSTRAINT `fk_tipo_op_consulta_consulta` FOREIGN KEY (`cd_tipo_op_consulta`) REFERENCES `tb_tipo_op_consulta` (`cd_tipo_op_consulta`);

--
-- Restrições para tabelas `tb_email_responsavel_cliente`
--
ALTER TABLE `tb_email_responsavel_cliente`
  ADD CONSTRAINT `fk_email_responsavel_consulta` FOREIGN KEY (`cd_email_responsavel_cliente`) REFERENCES `tb_responsavel_cliente` (`cd_responsavel_cliente`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_email_responsavel_cliente_proposta`
--
ALTER TABLE `tb_email_responsavel_cliente_proposta`
  ADD CONSTRAINT `fk_email_responsavel_cliente_responsavel` FOREIGN KEY (`cd_responsavel_cliente`) REFERENCES `tb_responsavel_cliente_proposta` (`cd_responsavel_cliente`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_email_usuario`
--
ALTER TABLE `tb_email_usuario`
  ADD CONSTRAINT `fk_email_usuario_usuario` FOREIGN KEY (`cd_usuario`) REFERENCES `tb_usuario` (`cd_usuario`);

--
-- Restrições para tabelas `tb_filial`
--
ALTER TABLE `tb_filial`
  ADD CONSTRAINT `fk_filial_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_frete_peso`
--
ALTER TABLE `tb_frete_peso`
  ADD CONSTRAINT `fk_frete_peso_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_imp_despesas`
--
ALTER TABLE `tb_imp_despesas`
  ADD CONSTRAINT `fk_imp_despesas_despesas` FOREIGN KEY (`cd_despesas`) REFERENCES `tb_despesas` (`cd_despesas`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_imp_operacao`
--
ALTER TABLE `tb_imp_operacao`
  ADD CONSTRAINT `fk_imp_operacao_operacao` FOREIGN KEY (`cd_operacao`) REFERENCES `tb_operacao` (`cd_operacao`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_km_rota_carga`
--
ALTER TABLE `tb_km_rota_carga`
  ADD CONSTRAINT `fk_km_ida_carga_carga` FOREIGN KEY (`cd_carga`) REFERENCES `tb_carga` (`cd_carga`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_mercadoria_operacao`
--
ALTER TABLE `tb_mercadoria_operacao`
  ADD CONSTRAINT `fk_mercadoria_operacao_operacao` FOREIGN KEY (`cd_operacao`) REFERENCES `tb_operacao` (`cd_operacao`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_motorista`
--
ALTER TABLE `tb_motorista`
  ADD CONSTRAINT `fk_motorista_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_operacao`
--
ALTER TABLE `tb_operacao`
  ADD CONSTRAINT `fk_tipo_operacao_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_pedagio_rota_carga`
--
ALTER TABLE `tb_pedagio_rota_carga`
  ADD CONSTRAINT `fk_pedagio_rota_carga_carga` FOREIGN KEY (`cd_carga`) REFERENCES `tb_carga` (`cd_carga`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_privilegio`
--
ALTER TABLE `tb_privilegio`
  ADD CONSTRAINT `fk_privilegio_usuario` FOREIGN KEY (`cd_usuario`) REFERENCES `tb_usuario` (`cd_usuario`);

--
-- Restrições para tabelas `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD CONSTRAINT `fk_produto_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_proposta`
--
ALTER TABLE `tb_proposta`
  ADD CONSTRAINT `fk_proposta_usuario` FOREIGN KEY (`cd_usuario`) REFERENCES `tb_usuario` (`cd_usuario`);

--
-- Restrições para tabelas `tb_responsavel_cliente`
--
ALTER TABLE `tb_responsavel_cliente`
  ADD CONSTRAINT `fk_responsavel_cliente_consulta` FOREIGN KEY (`cd_cliente`) REFERENCES `tb_cliente` (`cd_cliente`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_responsavel_cliente_proposta`
--
ALTER TABLE `tb_responsavel_cliente_proposta`
  ADD CONSTRAINT `fk_responsavel_cliente_cliente` FOREIGN KEY (`cd_cliente`) REFERENCES `tb_cliente_proposta` (`cd_cliente`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_rota`
--
ALTER TABLE `tb_rota`
  ADD CONSTRAINT `fk_rota_proposta` FOREIGN KEY (`cd_rota`) REFERENCES `tb_proposta` (`cd_proposta`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_sobrestadia_carreg`
--
ALTER TABLE `tb_sobrestadia_carreg`
  ADD CONSTRAINT `fk_sobrestadia_carreg_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Restrições para tabelas `tb_tipo_frete`
--
ALTER TABLE `tb_tipo_frete`
  ADD CONSTRAINT `fk_tipo_frete_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Restrições para tabelas `tb_tipo_proposta`
--
ALTER TABLE `tb_tipo_proposta`
  ADD CONSTRAINT `fk_tipos_proposta_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`);

--
-- Restrições para tabelas `tb_valor_carga`
--
ALTER TABLE `tb_valor_carga`
  ADD CONSTRAINT `fk_valor_carga_carga` FOREIGN KEY (`cd_carga`) REFERENCES `tb_carga` (`cd_carga`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_valor_carga_op_consulta`
--
ALTER TABLE `tb_valor_carga_op_consulta`
  ADD CONSTRAINT `fk_valor_tipo_consulta_carga` FOREIGN KEY (`cd_tipo_carga_consulta`) REFERENCES `tb_tipo_carga_consulta` (`cd_tipo_carga_consulta`);

--
-- Restrições para tabelas `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
  ADD CONSTRAINT `fk_veiculo_proposta` FOREIGN KEY (`cd_proposta`) REFERENCES `tb_proposta` (`cd_proposta`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
