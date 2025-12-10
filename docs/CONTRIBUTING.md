## Contribuindo com Linux auto-setup

### 📁 Como o projeto esta estruturado?

```
src/
├── config/
│   ├── repos/
│   │   ├── add_repos.sh
│   │   └── functions.sh
│   ├── vars/
│   │   ├── basic-Packages.txt
│   │   ├── dev-Packages.txt
│   │   ├── games-Packages.txt
│   │   ├── multimedia-Packages.txt
│   │   ├── social-Packages.txt
│   │   └── dev-*-Packages.txt
|   ├── tools/
│   │   └── *.sh
|   ├── logs/
│   │   └── *.log
│   ├── menu.sh
│   ├── functions.sh
│   ├── config.sh
│   ├── findValues.sh
│   └── createFiles.sh
├── main.sh
└── README.md
```
**config/**
- Contém scripts e funções que gerenciam configurações internas.
- subpastas e arquivos:
  - **vars/** → arquivos `.txt` contendo listas de pacotes separados por categoria.
  - **repos/** → scripts responsáveis pela manipulação e configuração de repositórios.
  - **tools/** → scripts de ferramentas uteis para automatizações com base na distro.
  - **./functions.sh** → funções reutilizáveis do sistema.
  - **./menu.sh** → menu de interação com o usuário.
  - **./config.sh** → configurações gerais.
  - **./createFiles.sh** → Cria automaticamente os arquivos dentro de `vars/`.

**./main.sh**
- Script principal.  
- Detecta a distro, adiciona repositórios, instala pacotes e gerencia o fluxo do script.

## Requesitos para participar do desenvolvimento do projeto
Para manter a qualidade, segurança e consistência do código, pedimos que todos os colaboradores sigam as diretrizes abaixo:

#### 1. Conduta e ética

- O script **não deve causar danos**, apagar arquivos sem permissão ou executar ações intrusivas.
- Toda funcionalidade deve ser pensada para **auxiliar o usuário**, nunca prejudicá-lo.
- Mensagens no terminal/logs devem ser claras, objetivas e explicativas.

#### 2. Linguagem e estrutura do projeto

- O projeto deve ser desenvolvido **majoritariamente em Bash**, utilizando arquivos `.sh`.
- Todos os arquivos Bash devem começar com o cabeçalho `#!/bin/bash`.
- Para manipulação de arquivos com extensões diferentes de `.sh` você deve:
  - Criar o arquivo dentro de `/src/config/createFiles.sh`
  - Adicionar o conteudo dentro do arquivo através de uma função dentro de `./config/functions.sh`.
  - Chamar a função de criação e adição de conteudo dentro de `./config/config.sh`.

## Contribuindo
1. Crie um fork!
2. Crie sua branch: `git checkout -b minha-contribuicao`
3. Adicione os arquivos modificados: `git add .`
4. Faça um commit com suas alterações e implementações para o projeto: `git commit -m "Minha contribuição!"`
5. Faça um Pull Request para esse repositório! lembre-se de:
    - Adicionar um bom título.
    - Adicionar uma breve descrição que deixe claro suas ideias e implementações.
    - Depois que sua brach for mergeada, você pode apagar sua branch.
