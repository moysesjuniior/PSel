-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Maio-2021 às 02:27
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_moveis`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `distribuidoras`
--

CREATE TABLE `distribuidoras` (
  `cod` int(11) NOT NULL,
  `distribuidora` varchar(20) NOT NULL,
  `cidade` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `distribuidoras`
--

INSERT INTO `distribuidoras` (`cod`, `distribuidora`, `cidade`) VALUES
(1, 'GoToShop', 'São Paulo'),
(2, 'Mobly', 'Rio de Janeiro'),
(3, 'Tok&Stok', 'Curitiba'),
(4, 'Westwing', 'Curitiba'),
(5, 'Oppa', 'São Paulo'),
(6, 'Etna', 'São Paulo'),
(7, 'Meu Móvel de Madeira', 'Curitiba'),
(8, 'Spicy', 'Curitiba'),
(9, ' Collector 55', 'Curitiba'),
(10, 'Desmo', 'Curitiba'),
(11, 'Urban Outfitters', 'São Paulo'),
(12, 'Americanas', 'Curitiba'),
(13, 'Casas Bahia', 'São Paulo'),
(14, 'Ponto Frio', 'Curitiba');

-- --------------------------------------------------------

--
-- Estrutura da tabela `generos`
--

CREATE TABLE `generos` (
  `cod` int(11) NOT NULL,
  `genero` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `generos`
--

INSERT INTO `generos` (`cod`, `genero`) VALUES
(1, 'Mesa'),
(2, 'Cadeira'),
(3, 'Cama'),
(4, 'Sofá'),
(5, 'Escrivaninha'),
(6, 'Televisão'),
(7, 'Eletro'),
(8, 'Computador'),
(9, 'Iluminação'),
(10, 'Guarda-Roupa'),
(11, 'Geladeira'),
(12, 'Armário');

-- --------------------------------------------------------

--
-- Estrutura da tabela `moveis`
--

CREATE TABLE `moveis` (
  `cod` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `genero` int(11) NOT NULL,
  `distribuidora` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `nota` decimal(4,2) NOT NULL,
  `capa` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `moveis`
--

INSERT INTO `moveis` (`cod`, `nome`, `genero`, `distribuidora`, `descricao`, `nota`, `capa`) VALUES
(1, 'Mesa para Sala de Jantar', 1, 11, 'A Mesa Veneza é o que falta em sua Sala de Jantar!.', '9.50', 'mesa.jpg'),
(2, 'Cadeira Charles Eames Eiffel', 2, 10, 'Cadeira Charles Eames Eiffel Dkr Wood - Base De Madeira As cadeiras Eiffel são importantes itens para a sua decoração.', '8.50', 'cadeira.jpg'),
(3, 'Cama Casal Mônaco Tcil Móveis Branco', 3, 9, 'A Cama Casal Mônaco é a melhor opção para trazer conforto e elegância ao seu quarto.', '8.00', 'cama.jpg'),
(4, 'Sofá Retrátil Lubeck', 4, 8, 'É na sala de estar onde a maior parte dos momentos de lazer da família acontece, seja curtindo um filminho, jogando aquele lançamento dos games ou recebendo os amigos para um café, por isso é essencial ter um sofá com qualidade e beleza para acomodar a todos muito bem.', '7.50', 'sofa.jpg'),
(5, 'Escrivaninha Porto Espresso', 5, 7, 'Agregando beleza e modernidade a sua casa, a escrivaninha Porto é o produto perfeito para diversos tipos de ambientes, para quem busca otimização de espaço sem abrir mão do design moderno.', '8.50', 'escrivaninha.jpg'),
(6, 'Smart TV LED', 6, 6, 'O Processador Quad Core usa a tecnologia da TV para conseguir remover automaticamente as imperfeições e criar cores mais vibrantes com contraste mais intenso.', '9.00', 'televisao.jpg'),
(7, 'Fogão Consul 4 bocas cor Inox com acendi', 7, 5, 'O Fogão 4 bocas da Consul é perfeito para você que busca design e praticidade para a sua cozinha.', '7.50', 'eletro.jpg'),
(8, 'Computador Desktop Dell Vostro', 8, 4, 'Compacto, sem perder performance e expansível, para se adaptar as futuras demandas do seu negócio.', '7.00', 'computador.jpg'),
(9, 'Luminária Alumínio', 9, 3, 'Pendente Meia Lua 34cm Luminária Alumínio Preto Textura C/ Cobre Pendente Meia Lua 34cm, sucesso de vendas, extremamente resistente.', '6.50', 'iluminacao.jpg'),
(10, 'Guarda-Roupa Fama Flórida Plus', 10, 2, 'Moderno, o Guarda-Roupa Fama Flórida Plus.', '7.50', 'guarda-roupa.jpg'),
(11, 'Refrigerador Electrolux Duplex DC35A 260', 11, 1, 'Leve para casa um refrigerador que faz muito mais do que armazenar os alimentos.', '7.00', 'geladeira.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` varchar(10) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `senha` varchar(80) NOT NULL,
  `tipo` varchar(10) NOT NULL DEFAULT 'editor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `nome`, `senha`, `tipo`) VALUES
('admin', 'Moyses Junior', '$2y$10$UpMQCcir.v649HrdLvUXiOC/ftU7xWhSxm8QhX.VzSe9LZHhvW/Ty', 'admin'),
('dell', 'dell 2', '$2y$10$iLrqnSXlATbDbBfQCtUbcu40qF95jpXHRXXfl1BRiHGTd6swoghve', 'editor'),
('Jonathas', 'jonathas', '$2y$10$kgaJZeJe3lgOqAQ.vCQiiubOUJ0nVazNfK2p5AZ8AErmTR7lappQ.', 'editor'),
('teste', 'Sara Nunes', '$2y$10$w7on7cjLKNtmJUGkiHIXoOQAwTJzkgxXqLmjtfDUkCXmQK0784.IS', 'editor');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `distribuidoras`
--
ALTER TABLE `distribuidoras`
  ADD PRIMARY KEY (`cod`);

--
-- Índices para tabela `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`cod`);

--
-- Índices para tabela `moveis`
--
ALTER TABLE `moveis`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `genero` (`genero`),
  ADD KEY `distribuidora` (`distribuidora`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `moveis`
--
ALTER TABLE `moveis`
  ADD CONSTRAINT `moveis_ibfk_1` FOREIGN KEY (`genero`) REFERENCES `generos` (`cod`),
  ADD CONSTRAINT `moveis_ibfk_2` FOREIGN KEY (`distribuidora`) REFERENCES `distribuidoras` (`cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
