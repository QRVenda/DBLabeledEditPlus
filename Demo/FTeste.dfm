object s: Ts
  Left = 0
  Top = 0
  Caption = 'Teste de componente TDBEditDialog'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object LabeledEdit1: TLabeledEdit
    Left = 94
    Top = 104
    Width = 121
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'LabeledEdit1'
    TabOrder = 1
    Text = ''
  end
  object DBLabeledEditPlus1: TDBLabeledEditPlus
    Left = 94
    Top = 152
    Width = 65
    Height = 21
    DataField = 'VirtualField'
    DataSource = _virtual1_.Owner
    Enabled = True
    TabOrder = 0
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'Label'
    Configurar.TituloJanela = 'Paulo'
    Configurar.Campos = <
      item
        FieldName = 'CODIGO'
        WhereSyntax = 'CODIGO'
        DisplayLabel = 'C'#211'DIGO'
        DisplayWidth = 10
        DisplayColumnWidth = 0
        FieldType = ftInteger
        Search = True
        DefaultComparison = scIgual
        SearchCase = scUpper
      end
      item
        FieldName = 'NCM'
        WhereSyntax = 'NCM'
        DisplayLabel = 'NCM'
        DisplayWidth = 10
        DisplayColumnWidth = 0
        FieldType = ftString
        Search = True
        DefaultComparison = scContem
        SearchCase = scUpper
      end
      item
        FieldName = 'DESCRICAO'
        WhereSyntax = 'DESCRICAO'
        DisplayLabel = 'DESCRI'#199#195'O'
        DisplayWidth = 60
        DisplayColumnWidth = 0
        FieldType = ftString
        Search = True
        DefaultComparison = scContem
        SearchCase = scUpper
      end>
    Configurar.CampoChave = 'NCM'
    Configurar.CampoResultado = 'DESCRICAO'
    Configurar.Connection = DBConexao
    Configurar.TeclaPesquisa = 119
    Configurar.MensagemVazio = '<registro %s n'#227'o encontrado>'
    Configurar.EventoPesquisa = epQuandoDigitar
    Configurar.SQL.Strings = (
      'SELECT'
      'CODIGO,'
      'NCM,'
      'DESCRICAO'
      'FROM CAD_NCM'
      'WHERE'
      '%WHERE%')
    Configurar.RecursoExtra.BotaoTipo = trBotao
    Configurar.RecursoExtra.LocalPosicao = lpLado
    Configurar.RecursoExtra.LabelColor = clWindow
    Configurar.RecursoExtra.LabelFont.Charset = DEFAULT_CHARSET
    Configurar.RecursoExtra.LabelFont.Color = clBlack
    Configurar.RecursoExtra.LabelFont.Height = -12
    Configurar.RecursoExtra.LabelFont.Name = 'Calibri'
    Configurar.RecursoExtra.LabelFont.Style = [fsBold]
    Configurar.RecursoExtra.LabelResultado = lmLabel
    Configurar.RecursoExtra.LabelTransparent = False
    Configurar.RecursoExtra.LabelWidth = 270
    OnGetRetorno = DBLabeledEditPlus1GetRetorno
  end
  object BitBtn1: TBitBtn
    Left = 94
    Top = 179
    Width = 75
    Height = 25
    Caption = 'Configurar'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object DBConexao: TFDConnection
    Params.Strings = (
      'Database=C:\QRSistema\DB\QRSISTEMA.FDB'
      'Password=masterkey'
      'User_Name=SYSDBA'
      'Port=0'
      'DriverID=FB')
    FormatOptions.AssignedValues = [fvFmtDisplayDate, fvFmtDisplayTime]
    FormatOptions.FmtDisplayDate = 'dd/mm/yyyy'
    FormatOptions.FmtDisplayTime = 'hh:mm:ss'
    Connected = True
    LoginPrompt = False
    Transaction = FDTransacao
    Left = 448
    Top = 24
  end
  object FDTransacao: TFDTransaction
    Connection = DBConexao
    Left = 488
    Top = 23
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 520
    Top = 23
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 312
    Top = 24
  end
  object FDQuery1: TFDQuery
    Connection = DBConexao
    Transaction = FDTransacao
    SQL.Strings = (
      'select * from clientes'
      '')
    Left = 376
    Top = 24
  end
end
