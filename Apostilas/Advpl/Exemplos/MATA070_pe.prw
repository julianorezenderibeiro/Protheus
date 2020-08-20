//Bibliotecas
#Include "Protheus.ch"
#Include "FWMVCDef.ch"

User Function MATA070()
	Local aParam     := PARAMIXB
	Local xRet       := .T.
	Local oObj       := Nil
	Local cIdPonto   := ''
	Local cIdModel   := ''
	Local nOper      := 0
	Local cCampo     := ''
	Local cTipo      := ''

	//Se tiver parâmetros
	If aParam <> NIL
		ConOut("> "+aParam[2])
		
		//Pega informações dos parâmetros
		oObj     := aParam[1]
		cIdPonto := aParam[2]
		cIdModel := aParam[3]
		
		//Valida a abertura da tela
		If cIdPonto == "MODELVLDACTIVE"
			nOper := oObj:nOperation
			
			//Se for inclusão, define o ini padrão
			If nOper == 3
				oStrucSA6 := oObj:GetModel( 'MATA070_SA6' ):GetStruct()
				oStrucSA6:SetProperty( 'A6_CONTATO', MODEL_FIELD_INIT, FwBuildFeature( STRUCT_FEATURE_INIPAD, "'AAA'" ) )
			
			//Se for Exclusão, não permite abrir a tela
			ElseIf nOper == 5
				xRet := .F.
			EndIf
		
		//Pré configurações do Modelo de Dados
		ElseIf cIdPonto == "MODELPRE"
			xRet := .T.
		
		//Pré configurações do Formulário de Dados
		ElseIf cIdPonto == "FORMPRE"
			nOper  := oObj:GetModel(cIdPonto):nOperation
			cTipo  := aParam[4]
			cCampo := aParam[5]
			
			//Se for Alteração
			If nOper == 4
				//Não permite alteração dos campos chave
				If cTipo == "CANSETVALUE" 
					If Alltrim(cCampo) $ ("A6_COD.A6_AGENCIA.A6_NUMCON")
						xRet := .F.
					EndIf
					
					oModelPad  := FWModelActive()
					oModelPad:SetValue('MATA070_SA6', 'A6_CONTATO', "BBB")
				EndIf
			EndIf
		
		//Adição de opções no Ações Relacionadas dentro da tela
		ElseIf cIdPonto == 'BUTTONBAR'
			xRet := {}
			aAdd(xRet, {"* Titulo 1", "", {|| Alert("Bot�o 1")}, "Tooltip 1"})
			aAdd(xRet, {"* Titulo 2", "", {|| Alert("Bot�o 2")}, "Tooltip 2"})
			aAdd(xRet, {"* Titulo 3", "", {|| Alert("Bot�o 3")}, "Tooltip 3"})
		
		//Pós configurações do Formulário
		ElseIf cIdPonto == 'FORMPOS'
			xRet := .T.
		
		//Validação ao clicar no Botão Confirmar
		ElseIf cIdPonto == 'MODELPOS'
			//Se o campo de contato estiver em branco, não permite prosseguir
			If Empty(M->A6_CONTATO)
				Aviso('Atenção', 'Por favor, informe um Contato!', {'OK'}, 03)
				xRet := .F.
			EndIf
		
		//Pré validações do Commit
		ElseIf cIdPonto == 'FORMCOMMITTTSPRE'
		
		//Pós validações do Commit
		ElseIf cIdPonto == 'FORMCOMMITTTSPOS'
			
		//Commit das operações (antes da gravação)
		ElseIf cIdPonto == 'MODELCOMMITTTS'
			
		//Commit das operações (após a gravação)
		ElseIf cIdPonto == 'MODELCOMMITNTTS'
			nOper := oObj:nOperation
			
			//Se for inclusão, mostra mensagem de sucesso
			If nOper == 3
				Aviso('Atenção', 'Banco criado com sucesso!', {'OK'}, 03)
			EndIf
		EndIf
	EndIf
Return xRet
