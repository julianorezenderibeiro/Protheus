//Bibliotecas
#Include "Protheus.ch"


User Function zTpFuncA()
	Local aArea := GetArea()
	
	//Chamada de função padrão
	Mata010()

	//Chamada de função de usuário
	u_zTpFuncB()
	
	//Chamada de função estática no mesmo prw
	fTesteA()
	
	//Chamada de função estática de outro prw
	StaticCall(zTpFuncB, fTesteB, "Daniel")
	
	RestArea(aArea)
Return


Static Function fTesteA()
	Local aArea := GetArea()
	
	//Mostrando mensagem
	MsgInfo("Estou em uma função estática <b>(A)</b>!", "Atenção")
	
	RestArea(aArea)
Return
