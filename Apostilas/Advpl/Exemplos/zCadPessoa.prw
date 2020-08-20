//Bibliotecas
#Include "Protheus.ch"


User Function zCadPessoa()
	Local oPessoa
	Local cNome		:= "Juliano"
	Local dNascimento	:= sToD("19710814")
	
	//Instanciando o objeto através da classe Pessoa
	oPessoa := zPessoa():New(cNome, dNascimento)
	
	//Chamando um método da classe
	oPessoa:MostraIdade()
Return
