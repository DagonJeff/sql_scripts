# Projeto de Teste de Dados

Este projeto contém scripts SQL e arquivos de dados para a criação e manipulação de tabelas no MySQL.

## Estrutura de Diretórios

```
sql_scripts/
├── scripts/
│   ├── create_tables.sql
│   ├── import_files.sql
│   └── analytical_query.sql
├── dados_cadastrais_operadoras/
│   └── Relatorio_cadop.csv
├── demonstracoes_contabeis/
│   ├── 2023/
│   │   ├── 1T2023.csv
│   │   ├── 2t2023.csv
│   │   ├── 3T2023.csv
│   │   └── 4T2023.csv
│   ├── 2024/
│   │   ├── 1T2024.csv
│   │   ├── 2T2024.csv
│   │   ├── 3T2024.csv
│   │   └── 4T2024.csv
└── README.md
```

## Instruções

### 1. Criação das Tabelas

Execute o script `create_tables.sql` para criar as tabelas necessárias.

```sql
SOURCE sql_scripts/scripts/create_tables.sql;
```

### 2. Importação dos Dados

Antes de executar o script `import_files.sql`, certifique-se de alterar os caminhos relativos para caminhos completos no comando `LOAD DATA LOCAL` para que os scripts sejam executados com sucesso.

**Exemplo:**

No arquivo `import_files.sql`, você encontrará trechos de código semelhantes a este:

```sql
LOAD DATA LOCAL INFILE 'relative_path/to/your/file.csv' 
INTO TABLE your_table 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

Altere o caminho relativo `'relative_path/to/your/file.csv'` para o caminho completo do arquivo no seu sistema. Por exemplo:

```sql
LOAD DATA LOCAL INFILE 'C:/Projects/sql_scripts/dados_cadastrais_operadoras/Relatorio_cadop.csv' 
INTO TABLE your_table 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

Depois de realizar essas alterações, execute o script `import_files.sql` para importar os dados.

```sql
SOURCE sql_scripts/scripts/import_files.sql;
```

### 3. Query Analítica

Execute o script `analytical_query.sql` para realizar a análise dos dados.

```sql
SOURCE sql_scripts/scripts/analytical_query.sql;
```
Obs.:
Altere o caminho relativo `'relative_path/to/your/file_query.sql'` para o caminho completo do arquivo no seu sistema na execução dos comandos `SOURCE` no prompt de comando.

## Compatibilidade

Esses scripts são compatíveis com MySQL 8. Certifique-se de que você está utilizando a versão correta do MySQL para evitar problemas de compatibilidade.


**Autor:** [DagonJeff](https://github.com/DagonJeff)