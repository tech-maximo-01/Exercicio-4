algoritmo "semnome"
// Função :
// Autor :
// Data : 24/10/2025
// Seção de Declarações 
var
  opc, subOpc, i, indiceVenda: inteiro
  saida: inteiro
  nomeProduto: vetor[0..100] de caractere
  qtdProduto: vetor[0..100] de inteiro
  valorProduto: vetor[0..100] de real

nomeVenda: vetor[0..100] de caractere
qtdVendida: vetor[0..100] de inteiro
valorVenda: vetor[0..100] de real

totalProdutos, totalVendas: inteiro
totalDiario, totalVendaAtual: real
continuarVenda: inteiro
inicio

saida <- 1
totalProdutos <- 1
totalVendas <- 1
totalDiario <- 0

    enquanto (saida <> 0) faca
        escreval("============ MENU ============")
        escreval("1 - CADASTRO")
        escreval("2 - VENDAS")
        escreval("3 - RELATÓRIOS")
        escreval("0 - SAIR")
        escreval()
        escreva("Escolha uma opção: ")
        leia(opc)
        escreval()

        escolha (opc)

            // =============================================
            //              CADASTRO DE PRODUTOS
            // =============================================

            caso 1
                escreval("=== MENU DE CADASTRO ===")
                escreval("1 - Cadastrar novo produto")
                escreval("2 - Alterar produto existente")
                escreval("0 - Voltar ao menu principal")
                escreva("Escolha: ")
                leia(subOpc)
                escreval()

                escolha (subOpc)

                    // CADASTRAR NOVO PRODUTO
                   caso 1
    escreval("=== CADASTRAR PRODUTOS ===")
    continuarVenda <- 1

    enquanto (continuarVenda <> 0) faca
        escreval()
        escreva("Nome do produto: ")
        leia(nomeProduto[totalProdutos])
        escreva("Quantidade: ")
        leia(qtdProduto[totalProdutos])
        escreva("Valor unitário: R$ ")
        leia(valorProduto[totalProdutos])
        totalProdutos <- totalProdutos + 1
        escreval("Produto cadastrado com sucesso!")

        escreval()
        escreval("Deseja cadastrar outro produto?")
        escreval("1 - Sim")
        escreval("0 - Não (voltar ao menu)")
        escreva("Escolha: ")
        leia(continuarVenda)
        limpatela
    fimenquanto

    // ALTERAR PRODUTO EXISTENTE
                    caso 2
                        se totalProdutos = 1 entao
                            escreval("Nenhum produto cadastrado para alterar.")
                        senao
                            escreval("=== ALTERAR PRODUTO ===")
                            para i de 1 ate totalProdutos - 1 faca
                                escreval(i, " - ", nomeProduto[i], " (Qtd: ", qtdProduto[i], ", Valor: R$ ", valorProduto[i], ")")
                            fimpara
                            escreva("Digite o número do produto que deseja alterar: ")
                            leia(i)
                            se (i >= 1) e (i < totalProdutos) entao
                                escreval("Produto selecionado: ", nomeProduto[i])
                                escreval("1 - Alterar nome")
                                escreval("2 - Alterar quantidade")
                                escreval("3 - Alterar valor unitário")
                                escreval("4 - Alterar tudo")
                                escreva("Escolha: ")
                                leia(subOpc)

                                escolha (subOpc)
                                    caso 1
                                        escreva("Novo nome: ")
                                        leia(nomeProduto[i])
                                    caso 2
                                        escreva("Nova quantidade: ")
                                        leia(qtdProduto[i])
                                    caso 3
                                        escreva("Novo valor unitário: R$ ")
                                        leia(valorProduto[i])
                                    caso 4
                                        escreva("Novo nome: ")
                                        leia(nomeProduto[i])
                                        escreva("Nova quantidade: ")
                                        leia(qtdProduto[i])
                                        escreva("Novo valor unitário: R$ ")
                                        leia(valorProduto[i])
                                    outrocaso
                                        escreval("Opção inválida!")
                                fimescolha
                                escreval("Produto atualizado com sucesso!")
                            senao
                                escreval("Produto inválido!")
                            fimse
                        fimse

                    // VOLTAR
                    caso 0
                        escreval("Voltando ao menu principal...")

                    outrocaso
                        escreval("Opção inválida no menu de cadastro!")
                fimescolha


            // =============================================
            //                    VENDAS
            // =============================================

            caso 2
                se (totalProdutos = 1) entao
                    limpatela
                    escreval("Não há nenhum produto no estoque!")
                senao
                    escreval("=== REALIZAR VENDA ===")

                    totalVendaAtual <- 0
                    continuarVenda <- 1

                    enquanto (continuarVenda <> 0) faca
                        escreval()
                        escreval("Produtos disponíveis:")
                        para i de 1 ate totalProdutos - 1 faca
                            escreval(i, " - ", nomeProduto[i], " (Qtd: ", qtdProduto[i], ", Valor: R$ ", valorProduto[i], ")")
                        fimpara

                        escreval()
                        escreva("Digite o ID do produto que deseja vender (ou 0 para finalizar): ")
                        leia(i)

                        se (i = 0) entao
                            continuarVenda <- 0
                        senao
                            se (i >= 1) e (i < totalProdutos) entao
                                escreva("Quantidade vendida: ")
                                leia(qtdVendida[totalVendas])

                                se (qtdVendida[totalVendas] <= qtdProduto[i]) entao
                                    qtdProduto[i] <- qtdProduto[i] - qtdVendida[totalVendas]

                                    nomeVenda[totalVendas] <- nomeProduto[i]
                                    valorVenda[totalVendas] <- qtdVendida[totalVendas] * valorProduto[i]

                                    totalDiario <- totalDiario + valorVenda[totalVendas]
                                    totalVendaAtual <- totalVendaAtual + valorVenda[totalVendas]

                                    escreval("Venda parcial: R$ ", valorVenda[totalVendas])
                                    escreval("Produto vendido com sucesso!")

                                    totalVendas <- totalVendas + 1
                                senao
                                    escreval("Erro: quantidade insuficiente em estoque!")
                                fimse
                            senao
                                escreval("Produto inválido!")
                            fimse
                        fimse
                    fimenquanto

                    escreval()
                    escreval("=====================================")
                    escreval("Total da venda: R$ ", totalVendaAtual)
                    escreval("Venda finalizada com sucesso!")
                    escreval("=====================================")
                fimse
                escreval()


            // =============================================
            //                  RELATÓRIOS
            // =============================================

            caso 3
                limpatela
                escreval("=== RELATÓRIOS ===")
                escreval("1 - Vendas diárias")
                escreval("2 - Estoque atual")
                escreval("3 - Produtos para reposição")
                escreva("Escolha: ")
                leia(indiceVenda)
                escreval()

                escolha (indiceVenda)
                    caso 1
                        escreval("=== RELATÓRIO DE VENDAS ===")
                        se totalVendas = 1 entao
                            escreval("Nenhuma venda registrada.")
                        senao
                            para i de 1 ate totalVendas - 1 faca
                                escreval(i, " - ", nomeVenda[i], " | Valor: R$ ", valorVenda[i])
                            fimpara
                            escreval("----------------------------------")
                            escreval("TOTAL VENDIDO NO DIA: R$ ", totalDiario)
                        fimse

                    caso 2
                        escreval("=== ESTOQUE ATUAL ===")
                        se totalProdutos = 1 entao
                            escreval("Nenhum produto cadastrado.")
                        senao
                            para i de 1 ate totalProdutos - 1 faca
                                escreval(i, " - ", nomeProduto[i], " | Qtd: ", qtdProduto[i], " | Valor: R$ ", valorProduto[i])
                            fimpara
                        fimse

                    caso 3
                        escreval("=== PRODUTOS PARA REPOSIÇÃO ===")
                        para i de 1 ate totalProdutos - 1 faca
                            se qtdProduto[i] < 5 entao
                                escreval(nomeProduto[i], " | Estoque baixo: ", qtdProduto[i])
                            senao
                                 escreval(nomeProduto[i], " | Estoque está legal | Unidades: ", qtdProduto[i])
                            fimse
                        fimpara
                fimescolha
                escreval()

            // =============================================
            //                      SAIR
            // =============================================

            caso 0
                limpatela
                escreval("Saindo do programa...")
                saida <- 0

            // =============================================
            //                 OPÇÃO INVÁLIDA
            // =============================================

            outrocaso
                escreval("Opção inválida! Tente novamente")
        fimescolha
    fimenquanto
// Seção de Comandos 
fimalgoritmo
