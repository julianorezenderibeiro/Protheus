//Bibliotecas
#Include "Protheus.ch"

//Variáveis Estáticas
Static cTesteSta := ''

User Function zEscopo()
	Local aArea := GetArea()
	
	//Vari�veis Locais
	Local nVar01 := 5
	Local nVar02 := 8
	Local nVar03 := 10
	
	//Variáveis Privadas
	Private cTst := "Teste Pvt"
	cTst2 := "Teste Pvt2"
	
	//Variáveis públicas
	Public __cTeste  := "teste"
	Public __cTeste2 := "teste2"
	
	//Chamando outra rotina para demonstrar o escopo de variáveis
	fEscopo(nVar01, @nVar02)
	
	Alert(nVar02)
	Alert("Public: "+__cTeste + " " + __cTeste2)
	RestArea(aArea)
Return


Static Function fEscopo(nValor1, nValor2, nValor3)
	Local aArea := GetArea()
	
	//Variáveis locais
	Local __cTeste2 := "Teste2"
	
	//Valores Default
	Default nValor1 := 0
	Default nValor2 := 0
	Default nValor3 := 0
	
	//Alterando conteúdo do nValor2
	nValor2 += 10
	
	//Mostrando conteúdo da variável private
	Alert("Private: "+cTst2)
	
	//Setando valor da variável pública para demonstrar como pode ser perigoso a utilização
	__cTeste := "Teste1"
	
	RestArea(aArea)
Return
