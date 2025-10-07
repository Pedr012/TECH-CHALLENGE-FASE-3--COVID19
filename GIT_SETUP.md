# 🚀 Setup do Repositório Git

## 📋 Passos para Configurar o Repositório

### 1️⃣ Inicializar Git (se ainda não foi feito)
```bash
cd "e:\Documentos\Pós Tech\Fase 3 - Big Data\Tech Challenge"
git init
```

### 2️⃣ Configurar Informações do Usuário
```bash
git config user.name "Seu Nome"
git config user.email "seu.email@exemplo.com"
```

### 3️⃣ Adicionar Arquivos ao Staging
```bash
# Adicionar arquivos importantes (seguindo .gitignore)
git add README.md
git add requirements.txt
git add .env.example
git add .gitignore
git add CONTRIBUTING.md
git add LICENSE
git add "Tech Challenge Fase3 - Covid.ipynb"
git add SQL/
git add "Power BI/"
git add "documentação técnica.txt"

# Verificar quais arquivos serão commitados
git status
```

### 4️⃣ Primeiro Commit
```bash
git commit -m "feat: setup inicial do projeto COVID-19

- Adiciona README.md completo com documentação
- Configura requirements.txt com dependências
- Inclui .gitignore para proteção de credenciais
- Adiciona notebooks e scripts SQL
- Setup de documentação técnica completa"
```

### 5️⃣ Criar Repositório no GitHub
1. Acesse https://github.com
2. Clique em "New Repository"
3. Nome sugerido: `tech-challenge-covid19-fase3`
4. Descrição: `Sistema de análise COVID-19 com arquitetura medalhão - Tech Challenge Pós Big Data`
5. Marque como **Público** (para portfólio)
6. **NÃO** inicialize com README (já temos um)

### 6️⃣ Conectar ao GitHub
```bash
# Substitua 'seu-usuario' pelo seu username do GitHub
git remote add origin https://github.com/seu-usuario/tech-challenge-covid19-fase3.git

# Renomear branch principal para 'main' (padrão atual)
git branch -M main

# Push inicial
git push -u origin main
```

### 7️⃣ Verificar Upload
Acesse seu repositório no GitHub para verificar se todos os arquivos foram enviados corretamente.

## 🔒 Segurança - IMPORTANTE!

### ✅ Arquivos que SERÃO versionados:
- ✅ README.md
- ✅ requirements.txt
- ✅ .env.example (template)
- ✅ .gitignore
- ✅ CONTRIBUTING.md
- ✅ LICENSE
- ✅ Notebooks (.ipynb)
- ✅ Scripts SQL
- ✅ Documentação técnica
- ✅ Arquivos Power BI (.pbix)

### ❌ Arquivos que NÃO serão versionados:
- ❌ .env (credenciais reais)
- ❌ bases/ (datasets grandes)
- ❌ Arquivos CSV/ZIP
- ❌ __pycache__/
- ❌ .ipynb_checkpoints/

## 📝 Comandos Git Úteis

### Verificar Status
```bash
git status              # Ver arquivos modificados
git log --oneline       # Histórico de commits
git diff               # Ver diferenças
```

### Atualizações Futuras
```bash
# Adicionar mudanças
git add arquivo_modificado.py
git commit -m "fix: corrige bug no processamento ETL"
git push origin main

# Ou adicionar tudo de uma vez (cuidado!)
git add .
git commit -m "docs: atualiza documentação"
git push
```

### Branching (para futuro)
```bash
# Criar nova funcionalidade
git checkout -b feature/ml-predictions
# ... fazer mudanças ...
git commit -m "feat: adiciona modelos de ML"
git push origin feature/ml-predictions
# Criar Pull Request no GitHub
```

## 🎯 Próximos Passos Sugeridos

1. **Configure o repositório** seguindo os passos acima
2. **Adicione temas/tags** no GitHub:
   - `covid19`
   - `data-engineering`
   - `etl-pipeline`
   - `aws-s3`
   - `postgresql`
   - `power-bi`
   - `python`
   - `tech-challenge`

3. **Customize o README.md** com:
   - Seu nome real
   - Link do GitHub correto
   - Screenshots dos dashboards

4. **Considere adicionar**:
   - Badge de build status (futuro)
   - Link para demo/apresentação
   - Seção de FAQ

## 💡 Dicas de Boas Práticas

### Commits Frequentes
- Faça commits pequenos e frequentes
- Use mensagens descritivas
- Siga o padrão Conventional Commits

### Documentação
- Mantenha README sempre atualizado
- Documente mudanças importantes
- Adicione comentários no código

### Segurança
- Nunca commite credenciais
- Use .env.example para templates
- Rotacione chaves periodicamente

---

**🎉 Parabéns! Seu repositório está pronto para ser um excelente portfólio!**