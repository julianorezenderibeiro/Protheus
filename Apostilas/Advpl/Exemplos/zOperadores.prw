//Bibliotecas
#Include "Protheus.ch"

User Function zOperadores()
	Local aArea := GetArea()
	
	//Declaração de variáveis
	Local nValor1	:= 5
	Local nValor2	:= 3
	Local cTexto1	:= "Texto1"
	Local cTexto2	:= "Texto2"
	
	//Atribuição
	nValor1 := 6	//Existe também o replace, porém ele é utilizado para campos (RecLock)
	
	//Manipulação
	nValor1++		//Soma 1 na variável. Outro exemplo:		nValor1 := nValor1 + 1
	nValor1--		//Subtrai 1 na variável. Outro exemplo:	nValor1 := nValor1 - 1
	nValor1 *= 2	//Multiplica o valor. Outro exemplo:		nValor1 := nValor1 * 2
	nValor1 /= 2	//Divide o valor. Outro exemplo:			nValor1 := nValor1 / 2
	nValor1 += 7  //Soma o valor. Outro exemplo:				nValor1 := nValor1 + 7
	nValor1 -= 7	//Subtrai o valor. Outro exemplo:			nValor1 := nValor1 - 7
	
	//Testes
	ConOut("Testes: ")
	ConOut( nValor1 == nValor2 )		//Exatamente igual
	ConOut( !(nValor1 == nValor2) )		//Negação de teste
	ConOut( nValor1 != nValor2 )		//Diferente de (também pode ser usado <>)
	ConOut( cTexto2 $ cTexto1 )			//Está contido
	ConOut( nValor1 > nValor2 )			//É maior que (também pode ser >=, seria maior ou igual)
	ConOut( nValor1 < nValor2 )			//É menor que (também pode ser <=, seria menor ou igual)
	
	//Testes compostos
	ConOut("Testes Compostos: ")
	ConOut( (1==1) .And. (1!=1) )		//Teste com .And. só retorna verdadeiro, se todos os testes forem verdadeiro
	ConOut( (1==1) .Or.  (1!=1) )		//Teste com .Or.  retorna verdadeiro, se qualquer teste for verdadeiro
	
	//Macro Substituição
	&("nValor3 := 8")
	Alert(nValor3)
	
	RestArea(aArea)
Return
