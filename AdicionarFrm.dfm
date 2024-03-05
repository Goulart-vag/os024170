object frmAdicionar: TfrmAdicionar
  Left = 349
  Top = 145
  Width = 813
  Height = 675
  Caption = 'Adicionar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblFilePath: TLabel
    Left = 16
    Top = 56
    Width = 189
    Height = 24
    Caption = 'Caminho do arquivo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDescricao: TLabel
    Left = 16
    Top = 120
    Width = 94
    Height = 24
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object imgArquivo: TImage
    Left = 224
    Top = 200
    Width = 329
    Height = 257
    Center = True
    Proportional = True
  end
  object lblStatus: TLabel
    Left = 224
    Top = 312
    Width = 329
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edtFilePath: TEdit
    Left = 248
    Top = 56
    Width = 305
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'edtFilePath'
  end
  object edtDescricao: TEdit
    Left = 248
    Top = 120
    Width = 305
    Height = 21
    TabOrder = 1
    Text = 'Descri'#231#227'o'
  end
  object btnSalvar: TButton
    Left = 224
    Top = 520
    Width = 145
    Height = 49
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 408
    Top = 520
    Width = 145
    Height = 49
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object opdArquivo: TOpenDialog
    FileName = 
      'C:\Users\Desenv4.SEO\Desktop\OS\Arquivos\testesArquivos\jpeg444.' +
      'jpeg'
    Filter = 'All|*.jpg;*.jpeg;*.bmp;*.png;*.pdf;*txt'
    Left = 696
    Top = 48
  end
end
