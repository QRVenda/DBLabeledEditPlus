object FrmDBLabeledEditPlusPesquisar: TFrmDBLabeledEditPlusPesquisar
  Left = 302
  Top = 239
  BorderStyle = bsDialog
  Caption = '<titulo da tela>'
  ClientHeight = 522
  ClientWidth = 934
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 800
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 21
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 928
    Height = 46
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    BorderWidth = 2
    Color = 4934475
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object LblBarraTitulo: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 874
      Height = 32
      Align = alClient
      Alignment = taCenter
      Caption = '<titulo da tela>'
      Color = 4934475
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      ExplicitWidth = 132
      ExplicitHeight = 25
    end
    object Image1: TImage
      Left = 882
      Top = 2
      Width = 40
      Height = 38
      Align = alRight
      Center = True
      Proportional = True
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitHeight = 40
    end
  end
  object pnSairLimpar: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 463
    Width = 928
    Height = 56
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    object pnConfirmar: TPanel
      AlignWithMargins = True
      Left = 607
      Top = 3
      Width = 167
      Height = 46
      Align = alRight
      BevelKind = bkTile
      BevelOuter = bvNone
      ParentColor = True
      ShowCaption = False
      TabOrder = 0
      StyleElements = []
      object btnConfirmar: TBitBtn
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 157
        Height = 36
        Cursor = crHandPoint
        Action = actConfirmar
        Align = alClient
        Caption = 'Confirmar (F2)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        StyleName = 'Windows'
      end
    end
    object pnSair: TPanel
      AlignWithMargins = True
      Left = 780
      Top = 3
      Width = 141
      Height = 46
      Align = alRight
      BevelKind = bkTile
      BevelOuter = bvNone
      ParentColor = True
      ShowCaption = False
      TabOrder = 1
      StyleElements = []
      object btnSair: TBitBtn
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 131
        Height = 36
        Cursor = crHandPoint
        Action = actCancelar
        Align = alClient
        Caption = 'Sair (Esc)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        StyleName = 'Windows'
      end
    end
  end
  object pnlInput: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 55
    Width = 928
    Height = 70
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = ' '
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object gbxSelecionarCampo: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 190
      Height = 60
      Align = alLeft
      Caption = 'Pes&quisar por:'
      DefaultHeaderFont = False
      HeaderFont.Charset = ANSI_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -16
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsBold]
      TabOrder = 0
      object cbxField01: TComboBox
        AlignWithMargins = True
        Left = 5
        Top = 26
        Width = 180
        Height = 29
        Hint = 'Selecione o campo para pesquisar'
        Align = alClient
        Style = csDropDownList
        DropDownCount = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = '<vazio>'
        OnChange = cbxField01Change
        OnCloseUp = cbxField01CloseUp
        Items.Strings = (
          '<vazio>')
      end
    end
    object gbxCondicao: TGroupBox
      AlignWithMargins = True
      Left = 199
      Top = 3
      Width = 170
      Height = 60
      Align = alLeft
      Caption = '&Condi'#231#227'o:'
      DefaultHeaderFont = False
      HeaderFont.Charset = ANSI_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -16
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsBold]
      TabOrder = 1
      object cbxOperator01: TComboBox
        AlignWithMargins = True
        Left = 5
        Top = 26
        Width = 160
        Height = 29
        Hint = 'Select how to compare field content with value'
        Align = alTop
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = '<vazio>'
        OnChange = cbxOperator01Change
        OnCloseUp = cbxOperator01CloseUp
        Items.Strings = (
          '<vazio>')
      end
    end
    object gbxValorProcurar: TGroupBox
      AlignWithMargins = True
      Left = 375
      Top = 3
      Width = 399
      Height = 60
      Align = alClient
      Caption = '&Digite aqui | tecle ENTER para pesquisar'
      DefaultHeaderFont = False
      HeaderFont.Charset = ANSI_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -16
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsBold]
      TabOrder = 2
      object EditPesquisar: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 26
        Width = 389
        Height = 29
        Hint = 'Digite o que deseja pesquisar'
        Align = alTop
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = EditPesquisarEnter
        OnKeyDown = EditPesquisarKeyDown
      end
    end
    object pnAreaBotaoPesquisar: TPanel
      AlignWithMargins = True
      Left = 780
      Top = 3
      Width = 141
      Height = 60
      Align = alRight
      BevelOuter = bvNone
      ParentColor = True
      ShowCaption = False
      TabOrder = 3
      StyleElements = []
      object pnProcurar: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 20
        Width = 135
        Height = 40
        Margins.Top = 20
        Margins.Bottom = 0
        Align = alClient
        BevelKind = bkTile
        BevelOuter = bvNone
        ParentColor = True
        ShowCaption = False
        TabOrder = 0
        StyleElements = []
        object btnPesquisar: TBitBtn
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 125
          Height = 30
          Cursor = crHandPoint
          Action = actProcurar
          Align = alClient
          Caption = 'Procurar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          StyleName = 'Windows'
        end
      end
    end
  end
  object pnlGrid: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 131
    Width = 928
    Height = 326
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = ' '
    ParentColor = True
    TabOrder = 3
    object gridDados: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 914
      Height = 276
      Align = alClient
      DataSource = dsPesquisa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      OnTitleClick = gridDadosTitleClick
      Columns = <
        item
          Expanded = False
          Visible = True
        end>
    end
    object pnDetalhes: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 287
      Width = 914
      Height = 30
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
      object lblTotalizador: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 3
        Width = 74
        Height = 20
        Margins.Left = 10
        Margins.Right = 10
        Align = alLeft
        Caption = '0 registros'
        Layout = tlCenter
        ExplicitHeight = 21
      end
    end
  end
  object actComandos: TActionList
    Left = 114
    Top = 179
    object actProcurar: TAction
      Caption = 'Procurar'
      OnExecute = actProcurarExecute
    end
    object actConfirmar: TAction
      Caption = 'Confirmar (F2)'
      ShortCut = 113
      OnExecute = actConfirmarExecute
    end
    object actCancelar: TAction
      Caption = 'Sair (Esc)'
      OnExecute = actCancelarExecute
    end
  end
  object dsPesquisa: TDataSource
    DataSet = tblPesquisa
    Left = 147
    Top = 179
  end
  object tblPesquisa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 179
    Top = 179
  end
end
