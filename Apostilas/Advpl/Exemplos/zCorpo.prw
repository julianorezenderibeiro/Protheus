//------------------------------------------------------------------
//    Corpo de um programa AdvPL:
//------------------------------------------------------------------

/*
{Bibliotecas utilizadas - Includes}

{Constantes declaradas - Defines}

{Variáveis Estáticas - Static}

{Documentação da Função}

{Tipo Função} Function {Nome Função}
	{Declaração de variáveis}

	{Lógica do Programa}

	{Encerramento de variáveis / Áreas}
Return {Variável Retorno}
*/

//------------------------------------------------------------------
//    Exemplo abaixo:
//------------------------------------------------------------------

//Bibliotecas
#Include "Protheus.ch"

//Constantes
#Define STR_PULA		Chr(13)+Chr(10)

User Function zCorpo()
	Local aArea := GetArea()
	Local cHora := Time()
	
	//Mostrando uma mensagem da hora atual
	MsgInfo("Hora Atual: " + STR_PULA + cHora, "Atenção")
	
	RestArea(aArea)
Return
