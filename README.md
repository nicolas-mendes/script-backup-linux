# SCRIPT DE BACKUP AUTOMATIZADO COM RSYNC

## SOBRE O PROJETO

Este projeto consiste em um script de automação de backup desenvolvido em Shell Script. A ferramenta foi criada para realizar cópias de segurança de arquivos e diretórios de forma segura, eficiente e interativa. Utilizando o  `rsync`, o script garante a integridade e a sincronização precisa dos dados entre um diretório de origem e um de destino.

<p align="center">
  <img src="https://i.postimg.cc/RhQz81Wf/imagem-2025-08-16-184015673.png" width="700"/>
</p>

## FUNCIONALIDADES PRINCIPAIS

* **Interface Interativa**: Um menu simples e intuitivo para guiar o usuário na configuração do backup.
* **Sincronização Eficiente com `rsync`**: Utiliza o comando `rsync` para uma sincronização rápida e incremental, copiando apenas os arquivos novos ou modificados.
* **Validação de Integridade**: O `rsync` é configurado para verificar a integridade dos dados.
* **Estrutura Modular**: O código é organizado em funções (`Menu` e `exec_backup`) para facilitar a manutenção e a legibilidade.

## COMO USAR

Para executar o script, siga os passos abaixo:

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/nicolas-mendes/script-backup-linux.git
    cd seu-repositorio
    ```

2.  **Dê permissão de execução ao script:**
    ```bash
    chmod +x backup_script.sh
    ```

3.  **Execute o script:**
    ```bash
    ./backup_script.sh
    ```

4.  **Siga as instruções do menu**:
    * Você será solicitado a inserir o caminho completo do diretório de **origem**.
    * Em seguida, deverá inserir o caminho completo do diretório de **destino**.
    * Por fim, o script pedirá uma confirmação final antes de iniciar a cópia dos arquivos.

---

## EXEMPLO DE USO

Abaixo, uma demonstração da execução do script no terminal:

<p align="center">
  <img src="https://i.postimg.cc/gkS70Bbj/imagem-2025-08-16-184422645.png" width="700" />
</p>
