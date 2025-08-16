#!/bin/bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                     #
#          SISTEMA DE BACKUP INTERATIVO COM RSYNC                       #
#                                                                     #
# Descrição: Este script fornece uma interface de menu para que o      #
#            usuário possa realizar backups de arquivos de forma      #
#            simples, especificando um diretório de origem e destino. #
#            Utiliza o rsync para uma sincronização eficiente.         #
#                                                                     #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Variáveis globais para armazenar os caminhos de origem e destino.
DIR_ORIG=""
DIR_DEST=""

# Função principal que executa a lógica do backup.
function exec_backup() {
    echo
    echo "Verificando..."

    # Validação 1: Verifica se a variável do diretório de origem foi definida.
    if [ -z "$DIR_ORIG" ]; then
        echo "ERRO: Diretório de Origem não especificado. Use a opção 1"
        return # Retorna ao menu se a origem não for definida.
    fi

    # Validação 2: Verifica se o caminho de origem realmente existe no sistema.
    if [ ! -d "$DIR_ORIG" ]; then
        echo "ERRO: O diretório de origem '$DIR_ORIG' não existe"
        return # Retorna ao menu se o diretório não existir.
    fi

    # Validação 3: Verifica se a variável do diretório de destino foi definida.
    if [ -z "$DIR_DEST" ]; then
        echo "ERRO: Diretório de Destino não especificado. Use a opção 2"
        return
    fi

    # Validação 4: Verifica se o destino não existe e oferece a opção de criá-lo.
    if [ ! -d "$DIR_DEST" ]; then
        echo "ERRO: O diretório de destino '$DIR_DEST' não existe"
        read -p "Deseja criar um diretório agora? (s/n) " resp

        if [ "$resp" == "s" ] || [ "$resp" == "S" ]; then
            # O comando 'mkdir -p' cria o diretório e quaisquer diretórios pais necessários.
            mkdir -p "$DIR_DEST"
            echo "Diretório '$DIR_DEST' criado com sucesso!"
        else
            echo "Backup Cancelado. Defina um diretório de destino válido"
            return # Cancela o backup se o usuário não quiser criar o diretório.
        fi
    fi

    # Confirmação final antes de iniciar o processo de cópia.
    echo "Pronto para começar!"
    echo "Origem: $DIR_ORIG"
    echo "Destino: $DIR_DEST"
    read -p "Pressione [Enter] para iniciar o BACKUP ou [Ctrl+C] para cancelar"

    echo "Iniciando a sincronização com rsync..."
    # Executa o rsync para sincronizar os arquivos.
    # -a (archive): modo recursivo que preserva permissões, dono, etc.
    # -v (verbose): mostra quais arquivos estão sendo transferidos.
    # -h (human-readable): exibe os tamanhos de forma legível (KB, MB).
    # --progress: mostra o progresso da transferência de arquivos grandes.
    # A barra "/" no final de "$DIR_ORIG/" copia o *conteúdo* do diretório, não o diretório em si.
    rsync -avh --progress "$DIR_ORIG/" "$DIR_DEST"

    echo
    echo "BACKUP Concluído com Sucesso!!!"
    echo
}

# Função que exibe o menu principal e gerencia a interação com o usuário.
function menu() {
    # Limpa a tela para uma exibição mais limpa do menu.
    clear
    echo
    echo "SISTEMA DE BACKUP INTERATIVO"
    echo
    # Exibe os diretórios definidos ou "Não definido" se as variáveis estiverem vazias.
    echo "Diretório de Origem: ${DIR_ORIG:-Não definido}"
    echo "Diretório de DestinO: ${DIR_DEST:-Não definido}"
    echo
    echo "Escolha um Comando:"
    echo " 1. Escolher diretório de Origem"
    echo " 2. Escolher diretório de Destino"
    echo " 3. Executar Backup"
    echo " 4. Encerrrar o Sistema"
    echo

    # Lê a opção do usuário.
    read -p "Comando: " coman

    # Estrutura 'case' para tratar a opção escolhida pelo usuário.
    case $coman in
        1)
            read -p "Digite o caminho completo do diretório de Origem: " DIR_ORIG
            echo " Origem definida como: $DIR_ORIG"
            ;;
        2)
            read -p "Digite o caminho completo do diretório de Destino: " DIR_DEST
            echo " Destino definido como: $DIR_DEST"
            ;;
        3)
            # Chama a função que executa o backup.
            exec_backup
            ;;
        4)
            # Encerra o script com status de sucesso (0).
            echo "Sistema encerrado com Sucesso!!!"
            exit 0
            ;;
        *)
            # Tratamento para qualquer outra entrada inválida.
            echo "Opção Inválida! Tente Novamente."
            ;;
    esac

    # Pausa o script para que o usuário possa ler as mensagens antes de o menu ser recarregado.
    read -p "Pressione [Enter] para continuar..."

    # Chamada recursiva: a função chama a si mesma para exibir o menu novamente.
    menu
}

# Chamada inicial que inicia o script exibindo o menu pela primeira vez.
menu