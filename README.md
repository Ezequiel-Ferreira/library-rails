# Library API

Esta é uma API em Ruby on Rails para gerenciar uma biblioteca de livros.

## Tecnologias

*   **Ruby on Rails**: Framework backend.
*   **PostgreSQL**: Banco de dados.
*   **RSpec**: Para a suíte de testes.
*   **Rswag**: Para documentação de API (Swagger/OpenAPI).
*   **Pundit**: Para autorização.
*   **JWT (JSON Web Tokens)**: Para autenticação.
*   **Kamal**: Para deployment.

---

## Pré-requisitos

Antes de começar, certifique-se de que você tem o seguinte instalado em sua máquina:

*   **Ruby**: A versão exata pode ser encontrada no arquivo `.ruby-version` ou `Gemfile`. É recomendado usar um gerenciador de versões como rbenv ou RVM.
*   **Bundler**: `gem install bundler`
*   **PostgreSQL**: Um servidor de banco de dados PostgreSQL rodando.

---

## Configuração do Ambiente de Desenvolvimento

Siga os passos abaixo para configurar o projeto localmente.

1.  **Clone o repositório:**
    ```bash
    git clone <URL_DO_SEU_REPOSITORIO>
    cd library
    ```

2.  **Instale as dependências do projeto:**
    ```bash
    bundle install
    ```

3.  **Configure as credenciais:**
    Este projeto usa `Rails credentials` para gerenciar chaves secretas, como a `secret_key_base` usada para assinar os tokens JWT. Para o desenvolvimento local, você precisará do arquivo `config/master.key`.

    *   **Se você recebeu o arquivo `master.key`:**
        Coloque-o na pasta `config/`.

    *   **Se você precisa criar novas credenciais para o ambiente local:**
        Execute o comando abaixo. Ele criará um novo `config/master.key` e abrirá o arquivo `config/credentials.yml.enc` para edição. Certifique-se de que o `secret_key_base` está presente. Se não estiver, gere um com `bin/rails secret` e adicione-o.
        ```bash
        EDITOR=vim rails credentials:edit
        ```
        **Importante:** Adicione `config/master.key` ao seu arquivo `.gitignore` para não versioná-lo acidentalmente.

4.  **Crie e configure o banco de dados:**
    Certifique-se de que seu servidor PostgreSQL está rodando. Você pode precisar editar o arquivo `config/database.yml` com suas credenciais de usuário e senha do Postgres.

    Depois, execute os seguintes comandos para criar o banco de dados, carregar o schema e popular com dados iniciais (se houver `seeds`):
    ```bash
    rails db:setup
    ```
    Ou, passo a passo:
    ```bash
    rails db:create
    rails db:migrate
    ```

---

## Rodando a Aplicação

Para iniciar o servidor Rails, execute:

```bash
rails server
```

A aplicação estará disponível em `http://localhost:3000`.

---

## Rodando os Testes

Para executar a suíte de testes automatizados (RSpec), use o comando:

```bash
bundle exec rspec
```

---

## Documentação da API

A documentação da API é gerada automaticamente a partir dos testes de integração usando Rswag.

1.  **Inicie o servidor** (`rails server`).
2.  Acesse a interface do Swagger UI em: http://localhost:3000/api-docs.

Para atualizar o arquivo `swagger.yaml` com base em novas alterações nos testes de integração, execute os testes da pasta `spec/integration`:

```bash
bundle exec rspec spec/integration/
```

### Autenticação na API

A maioria dos endpoints requer autenticação via JWT.

1.  **Faça login:** Envie uma requisição `POST` para `/login` com `email` e `password` no corpo da requisição para obter um token de acesso.
2.  **Use o token:** Para acessar endpoints protegidos, inclua o token no cabeçalho `Authorization` de suas requisições, no formato `Bearer <SEU_TOKEN_JWT>`.

---

## Deployment

O deployment desta aplicação é gerenciado pelo Kamal. A configuração pode ser encontrada no arquivo `config/deploy.yml`. Consulte a documentação oficial do Kamal para mais detalhes sobre como realizar o deploy.