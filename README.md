<div align="center">

# 🛍️ Event-Driven Product & Category Management

**Backend orientado a eventos com Spring Boot, AWS e arquitetura assíncrona**

![Java](https://img.shields.io/badge/Java-17-orange?style=flat-square&logo=openjdk)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3-6DB33F?style=flat-square&logo=springboot)
![MongoDB](https://img.shields.io/badge/MongoDB-7-47A248?style=flat-square&logo=mongodb)
![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?style=flat-square&logo=docker)
![AWS](https://img.shields.io/badge/AWS-SNS_•_SQS_•_Lambda_•_S3-FF9900?style=flat-square&logo=amazonaws)

</div>

---

## 📌 Sobre o projeto

Sistema de gerenciamento de produtos e categorias com foco em **arquitetura orientada a eventos**. Ao criar ou atualizar um item, um evento é publicado automaticamente via **SNS**, processado por uma fila **SQS**, consumido por uma **Lambda** e persistido como JSON no **S3** — tudo de forma assíncrona e desacoplada.

---

## 🏗️ Arquitetura

```
Client Request
      ↓
Spring Boot REST API
      ↓
MongoDB (persistência principal)
      ↓
SNS (publicação de eventos)
      ↓
SQS (fila de mensagens)
      ↓
AWS Lambda (consumidor)
      ↓
S3 (armazenamento JSON por owner)
```

---

## ✨ Funcionalidades

**Categorias**
- Criar, buscar, atualizar e remover categorias

**Produtos**
- Criar, buscar, atualizar e remover produtos

**Processamento assíncrono**
- Criação ou atualização de produto/categoria dispara evento SNS
- Evento é enfileirado no SQS e consumido pela Lambda
- Lambda grava/atualiza um arquivo JSON no S3 por `ownerId`

> ⚠️ Eventos de remoção não geram notificações no momento.

---

## 🛠️ Tecnologias

| Camada | Tecnologia |
|---|---|
| API | Java 17, Spring Boot, Maven |
| Banco de dados | MongoDB |
| Mensageria | AWS SNS, AWS SQS |
| Serverless | AWS Lambda (Node.js) |
| Storage | Amazon S3 |
| Containerização | Docker, Docker Compose, LocalStack |

---

## 📂 Estrutura do projeto

```
src
└── main
    └── java
        ├── config
        │   ├── aws        # Configuração do cliente SNS
        │   └── mongo      # Configuração do MongoDB
        ├── controllers    # Endpoints REST
        ├── domain
        │   ├── category   # Entidade e DTOs de categoria
        │   └── product    # Entidade e DTOs de produto
        ├── repositories   # Interfaces MongoDB
        └── services
            ├── aws        # Publicação de eventos SNS
            ├── category   # Regras de negócio de categoria
            └── product    # Regras de negócio de produto
```

---

## 🐳 Executando com Docker (recomendado)

Sobe toda a aplicação com um único comando — sem precisar de conta AWS, MongoDB instalado ou qualquer configuração extra.

**Pré-requisitos**
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

**Subindo o projeto**

```bash
git clone https://github.com/yamferreira/aws-event-driven-catalog.git
cd aws-event-driven-catalog
docker-compose up --build
```

O Docker Compose sobe automaticamente:
- ✅ Aplicação Spring Boot na porta `8080`
- ✅ MongoDB na porta `27017`
- ✅ LocalStack simulando SNS, SQS e S3 na porta `4566`
- ✅ Script de inicialização criando todos os recursos AWS automaticamente

---

## ⚙️ Executando localmente (sem Docker)

**Pré-requisitos**
- Java 17+
- Maven
- MongoDB rodando localmente
- Credenciais AWS configuradas

**Instalação e execução**

```bash
mvn clean install
mvn spring-boot:run
```

**Variáveis no `application.properties`**

```properties
aws.accessKeyId=SUA_ACCESS_KEY
aws.secretKey=SEU_SECRET_KEY
aws.region=us-east-2
aws.sns.topic.catalog.arn=arn:aws:sns:us-east-2:SEU_ACCOUNT_ID:catalog-emit
spring.data.mongodb.uri=mongodb://localhost:27017/product-catalog
```

---

## 🎯 Objetivos de aprendizado

Este projeto foi desenvolvido para estudar na prática:

- Arquitetura orientada a eventos
- Comunicação assíncrona entre serviços
- Integração com serviços AWS (SNS, SQS, Lambda, S3)
- Backend REST com Spring Boot
- Persistência NoSQL com MongoDB
- Processamento serverless com Node.js
- Containerização com Docker e LocalStack

---

## 🔮 Melhorias futuras

- [ ] Eventos de remoção gerando notificações
- [ ] Testes automatizados (JUnit + Mockito)
- [ ] Observabilidade (logs estruturados, métricas)
- [ ] CI/CD com GitHub Actions

---

<div align="center">

Desenvolvido por **Yam Ferreira**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Yam_Ferreira-0077B5?style=flat-square&logo=linkedin)](https://linkedin.com/in/yamferreira)
[![GitHub](https://img.shields.io/badge/GitHub-yam--ferreira-181717?style=flat-square&logo=github)](https://github.com/yamferreira)

</div>

---

Desenvolvido por Yam Ferreira
