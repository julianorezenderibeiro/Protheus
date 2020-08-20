//Bibliotecas
#Include "Protheus.ch"


User Function zVariaveis()
	Local aArea := GetArea()
	
	//Declaração de variáveis
	Local nValor	:= 0
	Local dData	:= Date()
	Local lTeste	:= .T.
	Local cTexto	:= ""
	Local oObjeto	:= TFont():New("Tahoma")
	Local xInfo	:= 0
	Local aDados	:= {"", "", dData}
	Local bBloco1	:= {||			nValor := 1,;
									Alert("Valor é igual a "+cValToChar(nValor))}
	Local bBloco2	:= {|nValor|	nValor += 2,;
									Alert("Valor é igual a "+cValToChar(nValor))}
	
	//Executando o bloco de código
	EVal(bBloco1)
	EVal(bBloco2, 5)
	
	//Alterando valores
	xInfo := "Teste"
	
	RestArea(aArea)
Return
