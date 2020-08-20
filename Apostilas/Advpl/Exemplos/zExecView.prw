//Bibliotecas
#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'


User Function zExecView()
	Local aArea := GetArea()
	Local cFunBkp     := FunName()
	
	DbSelectArea('ZZ1')
	ZZ1->(DbSetOrder(1)) //Filial + Código
	
	//Se conseguir posicionar
	If ZZ1->(DbSeek(FWxFilial('ZZ1') + "000002"))
		SetFunName("zModel1")
		FWExecView('Visualizacao Teste', 'zModel1', MODEL_OPERATION_VIEW)
		SetFunName(cFunBkp)
	EndIf
	
	RestArea(aArea)
Return
