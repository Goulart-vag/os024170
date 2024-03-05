object DMArq: TDMArq
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 258
  Width = 335
  object connection: TIBCConnection
    Database = 
      'C:\Users\Desenv4.SEO\Desktop\trabalhos de pesquisa\os024170\GED.' +
      'FDB'
    ClientLibrary = 'D:\SEOCorp\EXE\fbclient.dll'
    Port = '3050'
    Username = 'SYSDBA'
    Password = '19983101'
    Server = 'localhost'
    Left = 48
    Top = 48
  end
  object srcArquivos: TIBCDataSource
    DataSet = qryArquivos
    Left = 136
    Top = 48
  end
  object qryArquivos: TIBCQuery
    KeyFields = 'CD_ARQUIVO'
    KeyGenerator = 'GEN_ARQUIVO'
    SQLInsert.Strings = (
      'INSERT INTO ARQUIVO'
      
        '  (CD_ARQUIVO, DT_ARQUIVO, HR_HORA, DS_ARQUIVO, VL_TAMANHO, BL_A' +
        'RQUIVO, EX_ARQUIVO)'
      'VALUES'
      
        '  (:CD_ARQUIVO, :DT_ARQUIVO, :HR_HORA, :DS_ARQUIVO, :VL_TAMANHO,' +
        ' :BL_ARQUIVO, :EX_ARQUIVO)')
    SQLDelete.Strings = (
      'DELETE FROM ARQUIVO'
      'WHERE'
      '  CD_ARQUIVO = :Old_CD_ARQUIVO')
    SQLUpdate.Strings = (
      'UPDATE ARQUIVO'
      'SET'
      
        '  CD_ARQUIVO = :CD_ARQUIVO, DT_ARQUIVO = :DT_ARQUIVO, HR_HORA = ' +
        ':HR_HORA, DS_ARQUIVO = :DS_ARQUIVO, VL_TAMANHO = :VL_TAMANHO, BL' +
        '_ARQUIVO = :BL_ARQUIVO, EX_ARQUIVO = :EX_ARQUIVO'
      'WHERE'
      '  CD_ARQUIVO = :Old_CD_ARQUIVO')
    SQLRefresh.Strings = (
      
        'SELECT CD_ARQUIVO, DT_ARQUIVO, HR_HORA, DS_ARQUIVO, VL_TAMANHO, ' +
        'BL_ARQUIVO, EX_ARQUIVO FROM ARQUIVO'
      'WHERE'
      '  CD_ARQUIVO = :CD_ARQUIVO')
    SQLLock.Strings = (
      'SELECT NULL FROM ARQUIVO'
      'WHERE'
      'CD_ARQUIVO = :Old_CD_ARQUIVO'
      'FOR UPDATE WITH LOCK')
    Connection = connection
    SQL.Strings = (
      'Select * from ARQUIVO')
    AfterScroll = qryArquivosAfterScroll
    Left = 224
    Top = 48
    object qryArquivosCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
    end
    object qryArquivosDT_ARQUIVO: TDateField
      FieldName = 'DT_ARQUIVO'
      Required = True
    end
    object qryArquivosHR_HORA: TTimeField
      FieldName = 'HR_HORA'
      Required = True
    end
    object qryArquivosDS_ARQUIVO: TStringField
      FieldName = 'DS_ARQUIVO'
      Required = True
      Size = 255
    end
    object qryArquivosVL_TAMANHO: TIntegerField
      FieldName = 'VL_TAMANHO'
    end
    object qryArquivosBL_ARQUIVO: TBlobField
      FieldName = 'BL_ARQUIVO'
    end
    object qryArquivosEX_ARQUIVO: TStringField
      FieldName = 'EX_ARQUIVO'
      Required = True
      Size = 10
    end
  end
end
