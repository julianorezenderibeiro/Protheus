//Bibliotecas
#Include "Protheus.ch"


User Function zTestes()
	Local aArea := GetArea()
	Local dDataTst := Date()
	Local lQuinta := .F.
	
	//Testando se o dia de hoje é quinta feira
	If Upper(cDoW(dDataTst)) == "THURSDAY"
		lQuinta := .T.
		Alert("Hoje é Quinta!")
		
	//Senão mostra um alerta que hoje não é quinta
	Else
		lQuinta := .F.
		Alert("Hoje não é Quinta!")
	EndIf
	
	//Se não for quinta feira, e for sábado
	If !lQuinta .And. Upper(cDoW(dDataTst)) == "SATURDAY"
		Alert("Sábado!")
	
	//Senão, se não for quinta feira, e for domingo
	ElseIf !lQuinta .And. Upper(cDoW(dDataTst)) == "SUNDAY"
		Alert("Domingo!")
	EndIf
	
	
	//Fazendo case de testes
	Do Case
		Case Upper(cDoW(dDataTst)) == "MONDAY"
			Alert("Hoje é <b>Segunda</b>")
			
		Case Upper(cDoW(dDataTst)) == "TUESDAY"
			Alert("Hoje é <b>Terça</b>")
			
		Case Upper(cDoW(dDataTst)) == "WEDNESDAY"
			Alert("Hoje é <b>Quarta</b>")
			
		Case Upper(cDoW(dDataTst)) == "THURSDAY"
			Alert("Hoje é <b>Quinta</b>")
			
		Case Upper(cDoW(dDataTst)) == "FRIDAY"
			Alert("Hoje é <b>Sexta</b>")
			
		Case Upper(cDoW(dDataTst)) == "SATURDAY"
			Alert("Hoje é <b>Sábado</b>")
			
		Case Upper(cDoW(dDataTst)) == "SUNDAY"
			Alert("Hoje é <b>Domingo</b>")
		OtherWise
			Alert("Hoje é <b>???</b>")
	EndCase
	
	RestArea(aArea)
Return
