//Bibliotecas
#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'
 
//Variáveis Estáticas
Static cTitulo := "Grp. Produtos (Abas)"

 
User Function zAba1()
	Local aArea   := GetArea()
	Local oBrowse
	Local cFunBkp := FunName()
	
	SetFunName("zAba1")
	
	//Instânciando FWMBrowse
	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias("SBM")
	oBrowse:SetDescription(cTitulo)
	oBrowse:Activate()
	
	SetFunName(cFunBkp)
	RestArea(aArea)
Return Nil

Static Function MenuDef()
	Local aRot := {}
	
	//Adicionando opções
	ADD OPTION aRot TITLE 'Visualizar' ACTION 'VIEWDEF.zAba1' OPERATION MODEL_OPERATION_VIEW   ACCESS 0 //OPERATION 1
Return aRot

Static Function ModelDef()
	Local oModel     := Nil
	Local oStPai     := FWFormStruct(1, 'SBM')
	Local oStFilho1  := FWFormStruct(1, 'SB1')
	Local oStFilho2  := FWFormStruct(1, 'SB1')
	Local aRelFilho1 := {}
	Local aRelFilho2 := {}
	
	//Criando o modelo
	oModel := MPFormModel():New('zAba1M')
	oModel:AddFields('SBM_MASTER', /*cOwner*/, oStPai)
	
	//Criando as grids dos filhos
	oModel:AddGrid('SB1_FILHO1', 'SBM_MASTER', oStFilho1)
	oModel:AddGrid('SB1_FILHO2', 'SBM_MASTER', oStFilho2)
	
	//Criando os relacionamentos dos pais e filhos
	aAdd(aRelFilho1, {'B1_FILIAL', 'BM_FILIAL'})
	aAdd(aRelFilho1, {'B1_GRUPO',  'BM_GRUPO'})
	aAdd(aRelFilho1, {'B1_LOCPAD', '00'})
	aAdd(aRelFilho2, {'B1_FILIAL', 'BM_FILIAL'})
	aAdd(aRelFilho2, {'B1_GRUPO',  'BM_GRUPO'})
	aAdd(aRelFilho2, {'B1_LOCPAD', '01'})
	
	//Criando o relacionamento do Filho 1
	oModel:SetRelation('SB1_FILHO1', aRelFilho1, SB1->(IndexKey(1)))
	oModel:GetModel('SB1_FILHO1'):SetUniqueLine({"B1_FILIAL","B1_COD"})
	
	//Criando o relacionamento do Filho 2
	oModel:SetRelation('SB1_FILHO2', aRelFilho2, SB1->(IndexKey(1)))
	oModel:GetModel('SB1_FILHO2'):SetUniqueLine({"B1_FILIAL","B1_COD"})
	
	//Finaliznado a criação do Model
	oModel:SetPrimaryKey({})
	oModel:SetDescription("Grupo de Produtos - com Abas")
	oModel:GetModel('SBM_MASTER'):SetDescription('Modelo Grupo')
	oModel:GetModel('SB1_FILHO1'):SetDescription('Modelo Prod. Arm. 00')
	oModel:GetModel('SB1_FILHO2'):SetDescription('Modelo Prod. Arm. 01')
Return oModel
 
Static Function ViewDef()
	Local oView     := Nil
	Local oModel    := FWLoadModel('zAba1')
	Local oStPai    := FWFormStruct(2, 'SBM')
	Local oStFilho1 := FWFormStruct(2, 'SB1')
	Local oStFilho2 := FWFormStruct(2, 'SB1')
	
	//Criando a View
	oView := FWFormView():New()
	oView:SetModel(oModel)
	
	//Adicionando os campos do cabeçalho
	oView:AddField('VIEW_SBM', oStPai, 'SBM_MASTER')
	
	//Grids dos filhos
	oView:AddGrid('VIEW_FILHO1', oStFilho1, 'SB1_FILHO1')
	oView:AddGrid('VIEW_FILHO2', oStFilho2, 'SB1_FILHO2')
	
	//Setando o dimensionamento de tamanho
	oView:CreateHorizontalBox('SUPERIOR', 30)
	oView:CreateHorizontalBox('INFERIOR', 70)
	
	//Criando a folder dos produtos (filhos)
	oView:CreateFolder('PASTA_FILHOS', 'INFERIOR')
	oView:AddSheet('PASTA_FILHOS', 'ABA_FILHO01', "Armaz�m 00")
	oView:AddSheet('PASTA_FILHOS', 'ABA_FILHO02', "Armaz�m 01")
	
	//Criando os vinculos onde serão mostrado os dados
	oView:CreateHorizontalBox('ITENS_FILHO01', 100,,, 'PASTA_FILHOS', 'ABA_FILHO01' )
	oView:CreateHorizontalBox('ITENS_FILHO02', 100,,, 'PASTA_FILHOS', 'ABA_FILHO02' )
	
	//Amarrando a view com as box
	oView:SetOwnerView('VIEW_SBM',    'SUPERIOR')
	oView:SetOwnerView('VIEW_FILHO1', 'ITENS_FILHO01')
	oView:SetOwnerView('VIEW_FILHO2', 'ITENS_FILHO02')
Return oView
