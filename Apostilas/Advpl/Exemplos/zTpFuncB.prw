//Bibliotecas
#Include "Protheus.ch"


User Function zTpFuncB()
	Local aArea := GetArea()
	
	//Mostra mensagem e chama função estática
	MsgInfo("Estou na função u_zTpFuncB()", "Atenção")
	fTesteB()
	
	RestArea(aArea)
Return


Static Function fTesteB(cPar1)
	Local aArea := GetArea()
	Default cPar1 := ""
	
	//Mostrando mensagem
	MsgInfo("Estou em uma função estática <b>(B)</b>, "+cPar1+"!", "Atenção")
	
	RestArea(aArea)
Return

/*
Abaixo uma função de usuário com o nome similar com a função acima, porém ultrapassa 8 caracteres

User Function zTpFuncB2()

Return
*/

/*
Abaixo uma função padrão, porém somente é possível compilar se tiver chave de compilação

Function zTpFunPad()

Return
*/
