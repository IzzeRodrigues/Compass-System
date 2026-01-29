# Compass - Sistema de Gestão de Propostas Comerciais

O **Compass** é um web-software desenvolvido para centralizar e automatizar todo o ciclo de criação e gerenciamento de propostas comerciais no setor de logística. O sistema permite que empresas gerenciem desde o cálculo de rotas e impostos até a coleta da assinatura digital do cliente, eliminando processos manuais e descentralizados.

Este projeto foi desenvolvido como **Trabalho de Conclusão de Curso (TCC)** e entregue em dezembro de 2023.

---

## 🚀 Funcionalidades Principais

### 📊 Dashboards Inteligentes

O sistema oferece visões distintas baseadas no perfil do usuário:

* **Usuário Comum:** Acompanhamento de propostas em andamento, cálculo de comissão mensal e gráficos de produtividade (mensal e anual).
* **Administrador:** Visão macro da empresa, incluindo lucro mensal e acesso a propostas criadas por todos os colaboradores.

### 🤝 Gestão de Clientes e Funcionários

* Sistema completo de CRUD para funcionários e clientes.
* **Regra de Negócio:** A criação de propostas é vinculada obrigatoriamente a clientes previamente cadastrados para garantir a integridade dos dados.

### 📝 Ciclo de Proposta Digital

1. **Cálculo Automático:** Processamento de dados de rota e taxas de impostos atuais para gerar orçamentos precisos.
2. **Multicanal:** Opções para salvar rascunhos, imprimir para envio físico ou realizar o envio digital imediato.
3. **Assinatura Digital:** O cliente recebe um link único com token para revisar e assinar a proposta diretamente no navegador.
4. **Finalização Automática:** Após a assinatura, o status é atualizado e o PDF assinado por ambas as partes é enviado por e-mail para o cliente e o representante da empresa.

---

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** PHP
* **Framework:** Laravel
* **Frontend:** Blade Templates, JavaScript
* **Gerenciadores:** Composer e NPM
* **Serviços:** Integração com APIs de e-mail (SendGrid) para notificações e assinaturas, ViaCEP, Assinatura Digital.

---

### 📂 Estrutura do Repositório

O projeto segue a arquitetura MVC (Model-View-Controller).

* **`app/Http/Controllers/`**: Contém a lógica de controle do sistema.
* **Propostas**: Gerenciamento de cálculos, status e assinaturas digitais.
* **Dashboard**: Processamento dos gráficos de lucro, comissões e produtividade.
* **Cadastros**: Lógica para o gerenciamento (CRUD) de clientes e funcionários.

* **`resources/views/`**: Interfaces em Blade para administradores e usuários comuns.
* **`routes/`**: Definição das rotas web e endpoints do sistema.
* **`database/`**: Migrations para a estrutura do banco de dados de logística.

---
