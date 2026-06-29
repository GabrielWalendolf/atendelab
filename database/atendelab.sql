-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
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
-- Banco de dados: `atendelab`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimentos`
--

CREATE TABLE `atendimentos` (
  `id` int(11) NOT NULL,
  `pessoa_id` int(11) NOT NULL,
  `tipo_atendimento_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `status` enum('aberto','em_andamento','concluido') DEFAULT 'aberto',
  `data_atendimento` date NOT NULL,
  `horario_atendimento` time NOT NULL,
  `observacao_final` text DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `atendimentos` (`id`, `pessoa_id`, `tipo_atendimento_id`, `usuario_id`, `descricao`, `status`, `data_atendimento`, `horario_atendimento`, `observacao_final`, `criado_em`, `atualizado_em`) VALUES
(1, 1, 1, 1, 'Duvida sobre os criterios de avaliacao da disciplina de Algoritmos.', 'concluido', '2026-06-01', '08:30:00', 'Criterios detalhados e exemplos de provas anteriores enviados ao aluno.', '2026-06-15 23:40:34', '2026-06-15 23:40:34'),
(2, 2, 2, 1, 'Orientacao sobre o desenvolvimento do projeto integrador do semestre.', 'concluido', '2026-06-02', '10:00:00', 'Aluno orientado sobre escopo, prazos e entrega final.', '2026-06-15 23:40:34', '2026-06-15 23:40:34'),
(3, 3, 3, 1, 'Problema de acesso ao portal academico apos atualizacao de dados.', 'concluido', '2026-06-03', '13:30:00', 'Acesso restaurado apos redefinicao de credenciais junto ao suporte de TI.', '2026-06-15 23:40:34', '2026-06-15 23:40:34'),
(4, 4, 4, 1, 'Solicitacao de declaracao de vinculo institucional para estagio obrigatorio.', 'concluido', '2026-06-04', '09:00:00', 'Declaracao emitida, assinada e entregue ao aluno.', '2026-06-15 23:40:34', '2026-06-15 23:40:34'),
(5, 5, 5, 1, 'Agendamento do laboratorio de informatica para apresentacao de TCC.', 'concluido', '2026-06-05', '11:00:00', 'Laboratorio reservado para o dia 20/06 das 14h as 17h.', '2026-06-15 23:40:34', '2026-06-15 23:40:34'),
(6, 1, 2, 1, 'Revisao de nota em trabalho pratico da disciplina de Banco de Dados.', 'em_andamento', '2026-06-09', '10:00:00', NULL, '2026-06-15 23:40:34', '2026-06-15 23:40:34'),
(7, 2, 1, 1, 'Duvida sobre conteudo de estruturas de dados para a prova final.', 'em_andamento', '2026-06-10', '11:30:00', NULL, '2026-06-15 23:40:34', '2026-06-15 23:40:34'),
(8, 3, 4, 1, 'Solicitacao de historico escolar para inscricao em processo seletivo.', 'aberto', '2026-06-11', '08:00:00', NULL, '2026-06-15 23:40:34', '2026-06-15 23:40:34'),
(9, 4, 5, 1, 'Reserva do laboratorio de eletronica para pratica supervisionada.', 'aberto', '2026-06-12', '09:30:00', NULL, '2026-06-15 23:40:34', '2026-06-15 23:40:34'),
(10, 5, 2, 1, 'Orientacao sobre documentos exigidos para programa de intercambio.', 'aberto', '2026-06-13', '14:00:00', NULL, '2026-06-15 23:40:34', '2026-06-15 23:40:34'),
(11, 1, 1, 1, 'Esclarecimento sobre criterios de recuperacao da disciplina de Fisica.', 'aberto', '2026-06-15', '15:00:00', NULL, '2026-06-15 23:42:01', '2026-06-15 23:42:01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `documento` varchar(30) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `curso` varchar(120) DEFAULT NULL,
  `periodo` varchar(20) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `status` enum('ativo','inativo') DEFAULT 'ativo',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `pessoas` (`id`, `nome`, `documento`, `telefone`, `email`, `curso`, `periodo`, `observacoes`, `status`, `criado_em`, `atualizado_em`) VALUES
(1, 'Lucas Ferreira Andrade', '234.567.890-11', '(47) 98888-1001', 'lucas.andrade@exemplo.com', 'Engenharia de Software', '5o', NULL, 'ativo', '2026-06-15 23:03:26', '2026-06-15 23:03:26'),
(2, 'Beatriz Souza Lima', '345.678.901-22', '(47) 98888-1002', 'beatriz.lima@exemplo.com', 'Sistemas de Informacao', '3o', NULL, 'ativo', '2026-06-15 23:03:26', '2026-06-15 23:03:26'),
(3, 'Rafael Costa Mendes', '456.789.012-33', '(47) 98888-1003', 'rafael.mendes@exemplo.com', 'Ciencia da Computacao', '4o', 'Aluno bolsista', 'ativo', '2026-06-15 23:32:54', '2026-06-15 23:32:54'),
(4, 'Fernanda Alves Rocha', '567.890.123-44', '(47) 98888-1004', 'fernanda.rocha@exemplo.com', 'Administracao', '2o', NULL, 'ativo', '2026-06-15 23:40:26', '2026-06-15 23:40:26'),
(5, 'Thiago Martins Pereira', '678.901.234-55', '(47) 98888-1005', 'thiago.pereira@exemplo.com', 'Engenharia de Software', '6o', NULL, 'ativo', '2026-06-15 23:40:26', '2026-06-15 23:40:26');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_atendimentos`
--

CREATE TABLE `tipos_atendimentos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `status` enum('ativo','inativo') DEFAULT 'ativo',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tipos_atendimentos` (`id`, `nome`, `descricao`, `status`, `criado_em`, `atualizado_em`) VALUES
(1, 'Duvida academica', 'Duvidas sobre disciplinas, avaliacoes e conteudos.', 'ativo', '2026-06-15 23:03:26', '2026-06-15 23:03:26'),
(2, 'Orientacao de atividade', 'Orientacoes sobre trabalhos, TCC e projetos academicos.', 'ativo', '2026-06-15 23:03:26', '2026-06-15 23:03:26'),
(3, 'Suporte tecnico', 'Problemas com sistemas, equipamentos e acessos digitais.', 'ativo', '2026-06-15 23:03:26', '2026-06-15 23:03:26'),
(4, 'Matricula e documentacao', 'Solicitacoes de matricula, declaracoes e historicos escolares.', 'ativo', '2026-06-15 23:03:26', '2026-06-15 23:03:26'),
(5, 'Acesso ao laboratorio', 'Liberacao de uso e agendamento dos laboratorios institucionais.', 'ativo', '2026-06-15 23:03:26', '2026-06-15 23:03:26'),
(6, 'Orientacao de projeto', 'Orientacoes academicas sobre projetos integradores e extensao.', 'inativo', '2026-06-15 23:35:50', '2026-06-15 23:37:45');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `perfil` enum('admin','atendente') DEFAULT 'atendente',
  `status` enum('ativo','inativo') DEFAULT 'ativo',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Senha: 123456
INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `perfil`, `status`, `criado_em`, `atualizado_em`) VALUES
(1, 'Administrador', 'admin@atendelab.com', '$2y$10$aELjJUxpBhMQf9J4.PtV6.KrlkvqjIl4.jtDH3Z.gdR9Uy8MoYlyG', 'admin', 'ativo', '2026-06-15 23:03:26', '2026-06-15 23:03:26');

--
-- Índices para tabelas despejadas
--

ALTER TABLE `atendimentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_atendimentos_pessoa` (`pessoa_id`),
  ADD KEY `fk_atendimentos_tipo` (`tipo_atendimento_id`),
  ADD KEY `fk_atendimentos_usuario` (`usuario_id`);

ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documento` (`documento`);

ALTER TABLE `tipos_atendimentos`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

ALTER TABLE `atendimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `pessoas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `tipos_atendimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

ALTER TABLE `atendimentos`
  ADD CONSTRAINT `fk_atendimentos_pessoa` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoas` (`id`),
  ADD CONSTRAINT `fk_atendimentos_tipo` FOREIGN KEY (`tipo_atendimento_id`) REFERENCES `tipos_atendimentos` (`id`),
  ADD CONSTRAINT `fk_atendimentos_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;