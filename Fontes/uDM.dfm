object DataBase: TDataBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 183
  Width = 317
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Lista de Compras\Dados\Dados.sdb'
      'DriverID=SQLite')
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
  object FDCommand: TFDCommand
    Connection = FDConnection
    Left = 192
    Top = 96
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
end
