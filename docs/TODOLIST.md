# Ideias para contribuição

Se quiser contribuir mas não sabe por onde começar, aqui estão sugestões úteis, divididas por categoria.  

### Suporte a distribuições
- [ ] Testar e documentar suporte para **Arch-based** (Manjaro, EndeavourOS, Garuda).
- [ ] Testar e documentar suporte para **openSUSE**.
- [ ] Adicionar e testar suporte a **Alpine Linux**.

### Infra / instaladores e repositórios
- [ ] Criar função universal para **adicionar repositórios** baseada na distro detectada.
- [ ] Adicionar suporte automático ao **AUR** (opcional, usar `yay`/`paru` ou Chaotic-AUR).
- [ ] Automatizar adição de repositórios de terceiros (Docker, Google, Microsoft, Spotify).

### Arquivos e parsing
- [ ] **Otimizar leitura** de arquivos `.txt` de pacotes (ignorar comentários, espaços, normalizar nomes).
- [ ] Validar pacotes antes da instalação (evitar tentar instalar pacotes inexistentes).

### Experiência do usuário / QA
- [ ] Melhorar mensagens de erro para serem mais claras e amigáveis.
- [ ] Implementar modo `--dry-run` (simula sem executar) para testes.

---

## Como “pegar” uma tarefa?
1. Verifique se já não existe uma Issue ou Pull Request para a mesma tarefa.  
2. Se não existir, **abra uma Issue** com título claro:  
   `feat: testar suporte Arch-based - @seu_usuario`  
3. Comente na Issue que você vai trabalhar nela (comente `@maintainers: vou trabalhar nisso`), assim evitamos duplicidade.  
4. Crie uma branch com nome no formato: `<função>/<area>-<descrição>` — ex.: `feat/arch-test-documentation`.
    - função:
        - `<feat>` Implementação de algo novo.
        - `<update>` Atualização de algo ja existente.
        - `<fix>` Correção de bugs ou erros.
    - area:
        - Nome da tarefa escolhida 
    - descrição:
        - Breve descrição do que sera realizado, de 3 a 4 palavras.

---

## Se for um teste:

> Use este template rápido ao abrir a Issue de teste ou ao reportar resultados:

```txt
Titulo: teste: <Descrição do teste realizado>
Distro utilizada:
Branch testada:
----------------------------------------------
## Escopo do teste ##
Descreva o que foi testado: 
- Ex.: Instalação de pacotes básicos 

----------------------------------------------
## Passos executados ##
Liste exatamente o que você fez:

1. Clonar o repositório  
2. Dar permissão: `chmod +x main.sh`  
3. Executar: `./main.sh`  
4. Testar função específica:
----------------------------------------------
## Resultado obtido ##
Explique o que aconteceu:

** Funcionou como esperado?**  
- [ ] Sim  
- [ ] Parcialmente  
- [ ] Não  
----------------------------------------------
**Resumo:**  
> Ex.: Repositórios foram adicionados corretamente. 

----------------------------------------------
```
- Caso o arquivo de descrição for grande demais, conter imagens, logs, elabore um .pdf e anexe na issue.
- Issue com imagens, logs anexados também são aceitos. 
