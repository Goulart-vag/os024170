object frmArquivos: TfrmArquivos
  Left = 183
  Top = 131
  Width = 1466
  Height = 675
  Caption = 'frmArquivos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object imgArquivo: TImage
    Left = 1032
    Top = 56
    Width = 329
    Height = 281
    Center = True
    Proportional = True
  end
  object lblDesc: TLabel
    Left = 1032
    Top = 192
    Width = 7
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 88
    Top = 56
    Width = 897
    Height = 345
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DMArq.srcArquivos
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1CD_ARQUIVO: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'CD_ARQUIVO'
      end
      object cxGrid1DBTableView1DT_ARQUIVO: TcxGridDBColumn
        Caption = 'Data Arquivo'
        SortOrder = soAscending
        Width = 116
        DataBinding.FieldName = 'DT_ARQUIVO'
      end
      object cxGrid1DBTableView1HR_HORA: TcxGridDBColumn
        Caption = 'Hora Arquivo'
        Width = 102
        DataBinding.FieldName = 'HR_HORA'
      end
      object cxGrid1DBTableView1DS_ARQUIVO: TcxGridDBColumn
        Caption = 'Nome Arquivo'
        Width = 287
        DataBinding.FieldName = 'DS_ARQUIVO'
      end
      object cxGrid1DBTableView1VL_TAMANHO: TcxGridDBColumn
        Caption = 'Tamanho'
        Width = 123
        DataBinding.FieldName = 'VL_TAMANHO'
      end
      object cxGrid1DBTableView1BL_ARQUIVO: TcxGridDBColumn
        Caption = 'Arquivo'
        Width = 201
        DataBinding.FieldName = 'BL_ARQUIVO'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
