# AtendeLab

**Sistema de Controle de Atendimentos Acadêmicos**  
Fábrica de Software - Univille - Engenharia de Software

---

## Tecnologias

- PHP 8.x + PDO
- MySQL (XAMPP porta 3307)
- HTML + CSS + Bootstrap 5.3
- JavaScript + Fetch API (x-www-form-urlencoded)
- Arquitetura MVC simples (sem framework)

---

## Estrutura de pastas

```
atendelab/
├── app/
│   ├── Controllers/
│   │   ├── AuthController.php
│   │   ├── DashboardController.php
│   │   ├── FrontendController.php
│   │   ├── PessoasController.php
│   │   ├── TiposAtendimentosController.php
│   │   ├── AtendimentosController.php
│   │   ├── UsuariosController.php
│   │   └── RelatoriosController.php
│   ├── Middleware/
│   │   └── auth.php
│   └── Views/
│       ├── auth/login.php
│       ├── dashboard/index.php
│       ├── pessoas/index.php
│       ├── tipos-atendimentos/index.php
│       ├── atendimentos/index.php
│       └── layouts/
│           ├── config-view.php
│           ├── header.php
│           ├── footer.php
│           └── sidebar.php (obsoleto - não utilizar)
├── config/
│   └── database.php
├── database/
│   └── atendelab.sql
├── public/
│   ├── index.php
│   └── assets/
│       ├── css/style.css
│       └── js/api.js
├── routes.php
├── .gitignore
└── README.md
```

---

## Instalação

### 1. Pré-requisitos

- XAMPP com Apache e MySQL ativos
- MySQL rodando na **porta 3307**

### 2. Clonar / copiar o projeto

Coloque a pasta `atendelab` dentro de `htdocs`:

```
C:/xampp/htdocs/atendelab/
```

### 3. Criar o banco de dados

1. Acesse o phpMyAdmin: `http://localhost/phpmyadmin`
2. Importe o arquivo `database/atendelab.sql`

Ou via terminal:

```bash
mysql -u root -P 3307 < database/atendelab.sql
```

### 4. Verificar a conexão

Abra `config/database.php` e confirme:

```php
define('DB_HOST', '127.0.0.1');
define('DB_PORT', '3307');
define('DB_NAME', 'atendelab');
define('DB_USER', 'root');
define('DB_PASS', '');
```

### 5. Acessar o sistema

```
http://localhost/atendelab/public/
```

**Credenciais padrão:**
- E-mail: `admin@atendelab.com`
- Senha: `123456`

---

## URLs principais

| Finalidade             | URL                                                                  |
|------------------------|----------------------------------------------------------------------|
| Login                  | `/atendelab/public/?controller=auth&action=login`                    |
| Dashboard              | `/atendelab/public/?controller=auth&action=dashboard`                |
| Pessoas (visual)       | `/atendelab/public/?controller=frontend&action=pessoas`              |
| Tipos (visual)         | `/atendelab/public/?controller=frontend&action=tipos`                |
| Atendimentos (visual)  | `/atendelab/public/?controller=frontend&action=atendimentos`         |
| Dashboard JSON         | `/atendelab/public/?controller=dashboard&action=resumo`              |
| Pessoas JSON           | `/atendelab/public/?controller=pessoas&action=listar`                |
| Tipos JSON             | `/atendelab/public/?controller=tipos&action=listar`                  |
| Atendimentos JSON      | `/atendelab/public/?controller=atendimentos&action=listar`           |

---

## Regras de negócio principais

- **RN01** - Apenas usuários autenticados acessam a área interna
- **RN02** - Atendimento deve ter pessoa vinculada
- **RN03** - Atendimento deve ter tipo vinculado
- **RN04** - Responsável vem da sessão, nunca do formulário
- **RN05** - Status: `aberto`, `em_andamento`, `concluido`
- **RN06** - Observação final obrigatória ao concluir
- **RN09** - Usuários inativos não acessam o sistema
- **RN11** - Exclusão lógica (inativar) para preservar histórico
- **RN12** - Campos obrigatórios validados no backend

---

## Fluxo técnico

```
Navegador
  -> public/index.php
  -> routes.php (?controller=X&action=Y)
  -> Middleware (exigirAutenticacao)
  -> Controller::metodo()
  -> PDO -> banco atendelab
  -> JSON
  -> api.js (AtendeLabApi)
  -> Tela atualizada
```

---

## Commit sugerido

```bash
git status
git add .
git commit -m "Integra frontend com backend do AtendeLab"
git push
```
