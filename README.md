## SCRIPT DE BACKUP AUTOMATIZADO COM RSYNC

## SOBRE O PROJETO

Este projeto consiste em um script de automação de backup desenvolvido em Shell Script. A ferramenta foi criada para realizar cópias de segurança de arquivos e diretórios de forma segura, eficiente e interativa. Utilizando o poder do `rsync`, o script garante a integridade e a sincronização precisa dos dados entre um diretório de origem e um de destino.

<p align="center">
  <img src="https://i.postimg.cc/RhQz81Wf/imagem-2025-08-16-184015673.png" width="700"/>
</p>

A principal característica do script é sua interface de menu interativa, que guia o usuário durante todo o processo, desde a seleção dos diretórios até a confirmação e execução do backup.

---

## FUNCIONALIDADES PRINCIPAIS

* **Interface Interativa**: Um menu simples e intuitivo para guiar o usuário na configuração do backup.
* **Seleção Personalizada**: Permite que o usuário escolha de forma flexível o diretório de origem (o que será copiado) e o diretório de destino (onde o backup será salvo).
* **Sincronização Eficiente com `rsync`**: Utiliza o comando `rsync` para uma sincronização rápida e incremental, copiando apenas os arquivos novos ou modificados.
* **Validação de Integridade**: O `rsync` é configurado para verificar a integridade dos dados, garantindo uma cópia segura e confiável.
* **Confirmação de Execução**: Solicita uma confirmação final antes de iniciar o processo de backup, evitando operações acidentais.
* **Estrutura Modular**: O código é organizado em funções (`Menu` e `exec_backup`) para facilitar a manutenção e a legibilidade.

---

## ESTRUTURA DO SCRIPT

O script é composto por duas funções principais que gerenciam todo o processo:

1.  **`Menu`**:
    * Responsável por toda a interação com o usuário.
    * Apresenta as opções e captura as informações necessárias, como os diretórios de origem e destino.
    * Utiliza uma abordagem recursiva para garantir que o usuário forneça caminhos válidos.

2.  **`exec_backup`**:
    * Contém a lógica principal do backup.
    * Valida se os diretórios de origem e destino existem.
    * Executa o comando `rsync` com os parâmetros adequados para a sincronização.
    * Exibe uma mensagem de sucesso ou erro ao final da operação.

<p align="center">
  <img src="" />
</p>

---

## COMO USAR

Para executar o script, siga os passos abaixo:

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/seu-usuario/seu-repositorio.git](https://github.com/seu-usuario/seu-repositorio.git)
    cd seu-repositorio
    ```

2.  **Dê permissão de execução ao script:**
    ```bash
    chmod +x nome_do_script.sh
    ```

3.  **Execute o script:**
    ```bash
    ./nome_do_script.sh
    ```

4.  **Siga as instruções do menu**:
    * Você será solicitado a inserir o caminho completo do diretório de **origem**.
    * Em seguida, deverá inserir o caminho completo do diretório de **destino**.
    * Por fim, o script pedirá uma confirmação final antes de iniciar a cópia dos arquivos.

---

## EXEMPLO DE USO

Abaixo, uma demonstração da execução do script no terminal:

<p align="center">
  <img src="" />
</p>
