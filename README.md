# API Policlínica

API para listar contatos de médicos.

## Como Fazer Funcionar

### 1. Instalar as dependências

No terminal da sua IDE (VSCode), execute:

```
npm install
```

### 2. Criar o banco de dados

Abra o MySQL Workbench, conecte-se ao servidor e execute o arquivo `executar_script.sql`

Isso criará o banco `clinica` com 25 médicos cadastrados.

### 3. Configurar sua senha

Abra o arquivo `conexao.js` e coloque sua senha do MySQL:

```
password: 'sua_senha_aqui'
```

### 4. Iniciar a API

No terminal da sua IDE, execute:

```
npm start
```

### 5. Testar

Abra o navegador e acesse:

```
http://localhost:3000/medicos
```

## Rotas Disponíveis

- `http://localhost:3000/medicos` - Lista todos os médicos
- `http://localhost:3000/medicos?nome=ana` - Busca por nome
- `http://localhost:3000/medicos?especialidade=pediatria` - Busca por especialidade
