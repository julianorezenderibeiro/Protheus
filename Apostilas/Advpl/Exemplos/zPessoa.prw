//Bibliotecas
#Include "Protheus.ch"

Class zPessoa
	//Atributos
	Data cNome
	Data nIdade
	Data dNascimento

	//M�todos
	Method New() CONSTRUCTOR
	Method MostraIdade()
EndClass


Method New(cNome, dNascimento) Class zPessoa
	//Atribuindo valores nos atributos do objeto instanciado
	::cNome		:= cNome
	::dNascimento	:= dNascimento
	::nIdade		:= fCalcIdade(dNascimento)
Return Self


Method MostraIdade() Class zPessoa
	Local cMsg := ""
	
	//Criando e mostrando a mensagem
	cMsg := "A <b>pessoa</b> "+::cNome+" tem "+cValToChar(::nIdade)+" anos!"
	MsgInfo(cMsg, "Atenção")
Return

Static Function fCalcIdade(dNascimento)
	Local nIdade
	
	//Chamando a função YearSub para subtrair os anos de uma data
	nIdade := DateDiffYear(dDataBase, dNascimento)
Return nIdade
