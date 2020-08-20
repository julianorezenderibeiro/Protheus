//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"

//Se for espanhol
#Ifdef SPANISH
	#Define STR_TESTE		'Un gran poder conlleva una gran responsabilidad.'
	#Define STR_TITULO	'Precaución'
	
//Senão, irá fazer outros testes
#Else
	//Se for em Inglês
	#Ifdef ENGLISH
		#Define STR_TESTE		'With great power comes great responsibility.'
		#Define STR_TITULO	'Caution'
		
	//Senão, será o padrão (Português)
	#Else
		#Define STR_TESTE		'Com grandes poderes vêm grandes responsabilidades.'
		#Define STR_TITULO	'Atenção'
	#EndIf
#EndIf

//Constantes
#Define STR_PULA		Chr(13)+Chr(10)


User Function zConstantes()
	Local aArea := GetArea()
	
	//Mostrando mensagem
	MsgAlert(STR_TESTE + STR_PULA + "...", STR_TITULO)
	
	RestArea(aArea)
Return
