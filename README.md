# Event Driven Product & Category Management

Backend desenvolvido utilizando Spring Boot com foco em arquitetura orientada a eventos, comunicação assíncrona e integração com serviços AWS.

O sistema permite gerenciar produtos e categorias enquanto publica eventos automaticamente para processamento assíncrono utilizando filas e serviços serverless.

---

## Arquitetura

```text
Client Request
      ↓
Spring Boot REST API
      ↓
MongoDB Persistence
      ↓
SNS Event Publication
      ↓
SQS Queue
      ↓
AWS Lambda Consumer
      ↓
S3 JSON Storage
```

---

## Funcionalidades

### Gestão de Categorias

* Criar categorias
* Buscar categorias
* Atualizar categorias
* Remover categorias

### Gestão de Produtos

* Criar produtos
* Buscar produtos
* Atualizar produtos
* Remover produtos

### Processamento Assíncrono

Ao criar ou atualizar produtos e categorias:

* Evento publicado utilizando SNS
* Mensagens encaminhadas para SQS
* Lambda processa eventos
* Arquivos JSON gerados automaticamente no S3

Observação:

Atualmente eventos de remoção não geram notificações.

---

## Tecnologias

* Java 17
* Spring Boot
* MongoDB
* Maven
* AWS SNS
* AWS SQS
* AWS Lambda
* Amazon S3

---

## Estrutura do Projeto

```text
src
└── main
    └── java
        ├── config
        │   ├── aws
        │   └── mongo
        │
        ├── controllers
        │
        ├── domain
        │   ├── category
        │   └── product
        │
        ├── repositories
        │
        └── services
            ├── aws
            ├── category
            └── product
```

---

## Executando Localmente

### Pré requisitos

* Java 17+
* Maven
* MongoDB Local
* Credenciais AWS configuradas

### Instalação

```bash
mvn clean install
```

### Executando aplicação

```bash
mvn spring-boot:run
```

---

## Variáveis de Ambiente

Configure:

```env
AWS_ACCESS_KEY=
AWS_SECRET_KEY=

MONGODB_URI=

SNS_TOPIC_ARN=

SQS_QUEUE_URL=

S3_BUCKET_NAME=
```

---

## Objetivos do Projeto

Este projeto foi desenvolvido para estudar:

* Arquitetura orientada a eventos
* Comunicação assíncrona
* Integração entre serviços AWS
* Backend com Spring Boot
* Persistência NoSQL
* Processamento serverless

---

## Melhorias Futuras

* Dockerização
* Docker Compose
* LocalStack
* Testes automatizados
* Observabilidade
* CI/CD

---

Desenvolvido por Yam Ferreira
