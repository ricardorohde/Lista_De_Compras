object DataBase: TDataBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 183
  Width = 317
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Project Lista de Compras\1.0\Dados\Dados.sdb'
      'DriverID=SQLite')
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    LoginPrompt = False
    Left = 16
  end
  object FDPhysSQLiteDriver: TFDPhysSQLiteDriverLink
    Left = 72
    Top = 32
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 144
    Top = 64
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 248
    Top = 128
  end
  object qryCategorias: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT C.ID_CATE, C.CATEGORIA, SC.ID_SUBCATE, SC.SUB_CATEGORIA, ' +
        'SC.IMAGEM FROM CATEGORIA C, SUB_CATEGORIA SC'
      'WHERE C.ID_CATE = SC.ID_CATE'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 24
    Top = 104
    object qryCategoriasID_CATE: TIntegerField
      FieldName = 'ID_CATE'
      Origin = 'ID_CATE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCategoriasCATEGORIA: TWideMemoField
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
      BlobType = ftWideMemo
    end
    object qryCategoriasID_SUBCATE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_SUBCATE'
      Origin = 'ID_SUBCATE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCategoriasSUB_CATEGORIA: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'SUB_CATEGORIA'
      Origin = 'SUB_CATEGORIA'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object qryCategoriasIMAGEM: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'IMAGEM'
      Origin = 'IMAGEM'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDCommand: TFDQuery
    Connection = FDConnection
    Left = 192
    Top = 112
    object IntegerField1: TIntegerField
      FieldName = 'ID_CATE'
      Origin = 'ID_CATE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object WideMemoField1: TWideMemoField
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
      BlobType = ftWideMemo
    end
    object IntegerField2: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_SUBCATE'
      Origin = 'ID_SUBCATE'
      ProviderFlags = []
      ReadOnly = True
    end
    object WideMemoField2: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'SUB_CATEGORIA'
      Origin = 'SUB_CATEGORIA'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object BlobField1: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'IMAGEM'
      Origin = 'IMAGEM'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryProduto: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT P.ID_PROD,'
      'P.ID_CATE,CAT.CATEGORIA, P.ID_SUBCATE,SUB.SUB_CATEGORIA,'
      #39'PRODUTO: '#39' AS PRODUTOTXT,'
      'P.PRODUTO,'
      #39'VALOR: '#39' AS VALORTXT,'
      'P.VALOR,'
      'SUB.IMAGEM,'
      #39'MEDIDA: '#39' AS TIPOTXT,'
      'P.TIPO'
      'FROM PRODUTO P, SUB_CATEGORIA SUB, CATEGORIA CAT'
      'WHERE P.ID_SUBCATE = SUB.ID_SUBCATE AND P.ID_CATE = CAT.ID_CATE'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 64
    Top = 104
    object qryProdutoID_PROD: TIntegerField
      FieldName = 'ID_PROD'
      Origin = 'ID_PROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryProdutoID_CATE: TIntegerField
      FieldName = 'ID_CATE'
      Origin = 'ID_CATE'
    end
    object qryProdutoCATEGORIA: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object qryProdutoID_SUBCATE: TIntegerField
      FieldName = 'ID_SUBCATE'
      Origin = 'ID_SUBCATE'
    end
    object qryProdutoSUB_CATEGORIA: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'SUB_CATEGORIA'
      Origin = 'SUB_CATEGORIA'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object qryProdutoPRODUTOTXT: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTOTXT'
      Origin = 'PRODUTOTXT'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryProdutoPRODUTO: TWideMemoField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      BlobType = ftWideMemo
    end
    object qryProdutoVALORTXT: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'VALORTXT'
      Origin = 'VALORTXT'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryProdutoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object qryProdutoIMAGEM: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'IMAGEM'
      Origin = 'IMAGEM'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryProdutoTIPOTXT: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPOTXT'
      Origin = 'TIPOTXT'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryProdutoTIPO: TWideMemoField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      BlobType = ftWideMemo
    end
  end
  object qryBusca: TFDQuery
    Connection = FDConnection
    Left = 144
    Top = 96
  end
end
