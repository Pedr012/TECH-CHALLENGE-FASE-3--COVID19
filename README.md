# 🦠 Tech Challenge Fase 3 - Sistema de Análise COVID-19

[![Python](https://img.shields.io/badge/Python-3.11%2B-blue)](https://www.python.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14%2B-blue)](https://www.postgresql.org/)
[![AWS](https://img.shields.io/badge/AWS-S3%20%7C%20EC2-orange)](https://aws.amazon.com/)
[![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-yellow)](https://powerbi.microsoft.com/)

> Sistema de análise de dados COVID-19 utilizando arquitetura medalhão (Bronze-Silver-Gold) em ambiente AWS, processando dados da PNAD-COVID19 do IBGE.

## 📋 Sobre o Projeto

Este projeto foi desenvolvido como **Tech Challenge da Fase 3** do curso de Pós-Graduação em Big Data, implementando uma solução completa de engenharia de dados para análise epidemiológica da COVID-19 no Brasil.

### 🎯 Objetivos

- **Ingestão Automatizada**: Pipeline ETL para dados PNAD-COVID19 do IBGE
- **Arquitetura Escalável**: Implementação do padrão medalhão em AWS S3
- **Processamento Otimizado**: PostgreSQL com método COPY de alta performance
- **Visualização Integrada**: Dashboards interativos no Power BI
- **Governança de Dados**: Controle de qualidade e rastreabilidade completa

## 🏗️ Arquitetura

```
GitHub API → Pipeline ETL → AWS S3 (Bronze) → PostgreSQL → S3 (Silver) → Power BI
   (CSV)       (Python)       (Raw Data)      (Processing)   (Parquet)   (Analytics)
```

### 📊 Fluxo de Dados

1. **Extração**: GitHub → S3 Bronze (dados brutos CSV)
2. **Transformação**: S3 Bronze → PostgreSQL (processamento e limpeza)  
3. **Refinamento**: PostgreSQL → S3 Silver (dados estruturados Parquet)
4. **Visualização**: PostgreSQL → Power BI (dashboards e análises)

## 🚀 Tecnologias Utilizadas

| Categoria | Tecnologia | Propósito |
|-----------|------------|-----------|
| **Linguagem** | Python 3.11+ | Pipeline ETL e análise de dados |
| **Banco de Dados** | PostgreSQL 14+ | Armazenamento transacional |
| **Cloud Storage** | AWS S3 | Data Lake (Bronze/Silver/Gold) |
| **Visualização** | Power BI Desktop | Dashboards e relatórios |
| **Orquestração** | Jupyter Notebooks | Desenvolvimento interativo |

### 📦 Principais Bibliotecas Python

- **pandas**: Manipulação de DataFrames
- **boto3**: SDK AWS para S3
- **psycopg2**: Driver PostgreSQL nativo
- **sqlalchemy**: ORM e engine de conexão
- **pyarrow**: Processamento formato Parquet

## 📁 Estrutura do Projeto

```
tech-challenge-covid19/
├── 📓 notebooks/
│   ├── Tech Challenge Fase3 - Covid.ipynb    # Notebook principal
│   └── tech_challenge_fase_3.ipynb           # Versão alternativa
├── 🗃️ SQL/
│   ├── postgres_bronze_092020.sql            # Criação tabelas Bronze
│   ├── postgres_bronze_102020.sql
│   ├── postgres_bronze_112020.sql
│   ├── create_table_silver.sql               # Estrutura Silver
│   └── postgres_silver.sql                   # Transformações Silver
├── 📊 Power BI/
│   └── PNAD COVID19 - Tech Challenge.pbix    # Dashboard principal
├── 📖 docs/
│   ├── documentação técnica.txt              # Documentação completa
│   └── Documentação Técnica - Covid19.docx  # Versão Word
├── 🗂️ bases/                                  # Dados locais (não versionados)
├── 📋 dicionario/                             # Metadados IBGE
└── 🔧 config/
    └── .env.example                          # Template de configuração
```

## ⚡ Quick Start

### 1️⃣ Pré-requisitos

```bash
# Versões mínimas
Python >= 3.11
PostgreSQL >= 14
AWS CLI configurado
Power BI Desktop
```

### 2️⃣ Instalação

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/tech-challenge-covid19.git
cd tech-challenge-covid19

# Instale as dependências
pip install -r requirements.txt

# Configure as variáveis de ambiente
cp .env.example .env
# Edite .env com suas credenciais AWS e PostgreSQL
```

### 3️⃣ Configuração

```bash
# Configure credenciais AWS
aws configure

# Configure PostgreSQL
# Edite .env com host, usuário, senha e database
```

### 4️⃣ Execução

1. **Abra o Jupyter Notebook**: `Tech Challenge Fase3 - Covid.ipynb`
2. **Execute as células sequencialmente** para:
   - Configurar conexões AWS/PostgreSQL
   - Executar pipeline ETL Bronze → Silver
   - Validar qualidade dos dados
3. **Abra o Power BI**: `PNAD COVID19 - Tech Challenge.pbix`
4. **Conecte ao PostgreSQL** e atualize os dados

## 📈 Resultados e Performance

### 🎯 Métricas Alcançadas

- ⚡ **Throughput**: 2.8GB/min (método COPY PostgreSQL)
- 📊 **Volume**: 1.2M+ registros processados
- 🎯 **Qualidade**: 99.97% taxa de sucesso
- ⏱️ **Tempo Total**: <20 minutos para pipeline completo
- 💾 **Compressão**: 73% redução com formato Parquet

### 📋 Dados Processados

| Período | Registros | Tamanho Original | Após Compressão |
|---------|-----------|------------------|-----------------|
| Set/2020 | ~300K | 650MB | 175MB |
| Out/2020 | ~290K | 620MB | 167MB |
| Nov/2020 | ~285K | 610MB | 164MB |

## 🔧 Configuração Avançada

### AWS S3 Buckets
```
s3://postech-covid19-gp81/
├── bronze/     # Dados brutos CSV
├── silver/     # Dados processados Parquet
└── gold/       # Dados analytics (futuro)
```

### PostgreSQL Schema
```sql
-- Tabelas Bronze (dados brutos)
pnad_covid_092020
pnad_covid_102020  
pnad_covid_112020

-- Tabela Silver (dados processados)
silver_pnad_covid
```

## 🤝 Contribuição

Este é um projeto acadêmico, mas sugestões e melhorias são bem-vindas:

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👥 Autores

**Equipe Tech Challenge GP81**
- Projeto desenvolvido para Pós-Graduação em Big Data
- Outubro 2025

## 🙏 Agradecimentos

- **IBGE** - Pela disponibilização dos dados PNAD-COVID19
- **Professores e Mentores** - Pelo suporte durante o desenvolvimento
- **Comunidade Open Source** - Pelas ferramentas e bibliotecas utilizadas

---

<div align="center">

**📊 Transformando dados em insights para o combate à COVID-19** 

![COVID-19](https://img.shields.io/badge/COVID--19-Data%20Analysis-red)
![IBGE](https://img.shields.io/badge/IBGE-PNAD%20COVID19-green)

</div>