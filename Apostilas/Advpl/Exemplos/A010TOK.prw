//Bibliotecas
#Include "Protheus.ch"

User Function A010TOK()
	Local aArea := GetArea()
	Local aAreaB1 := SB1->(GetArea())
	Local lRet := .T.
	
	//Mostrando a pergunta
	lRet := MsgYesNo("Confirma o cadastro do <b>"+M->B1_DESC+"</b>?", "Atenção")
	
	RestArea(aAreaB1)
	RestArea(aArea)
Return lRet
