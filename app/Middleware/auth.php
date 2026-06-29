<?php
// Funções auxiliares de autenticação e controle de sessão.
// Incluído em todos os controllers que exigem login.

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

function usuarioAutenticado(): bool
{
    // Verifica se há um usuário logado na sessão.
    return isset($_SESSION['usuario']['id']);
}

function exigirAutenticacao(): void
{
    // Redireciona para o login se não houver sessão ativa.
    if (!usuarioAutenticado()) {
        header('Location: /atendelab/public/?controller=auth&action=login');
        exit;
    }
}

function usuarioAtual(): array
{
    // Retorna os dados do usuário logado ou array vazio.
    return $_SESSION['usuario'] ?? [];
}
