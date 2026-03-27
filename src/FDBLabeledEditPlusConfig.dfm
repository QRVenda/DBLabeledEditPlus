object FrmConfigurarCampos: TFrmConfigurarCampos
  Left = 0
  Top = 0
  Caption = 'Configurar Campos'
  ClientHeight = 557
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object pnlMain: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 994
    Height = 498
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = ' '
    TabOrder = 0
    object pnlControls: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 980
      Height = 484
      Align = alClient
      BevelKind = bkTile
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 0
      object pnlProperties: TPanel
        Left = 688
        Top = 0
        Width = 288
        Height = 480
        Align = alRight
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 2
        object pnlPropertiesHeader: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 278
          Height = 40
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          BorderWidth = 2
          Caption = ' '
          TabOrder = 0
          object Label2: TLabel
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 264
            Height = 21
            Align = alTop
            Alignment = taCenter
            Caption = 'Propriedades'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 92
          end
        end
        object pnlPropertiesDetails: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 49
          Width = 278
          Height = 424
          Align = alClient
          BevelKind = bkTile
          BevelOuter = bvNone
          BorderWidth = 2
          Caption = ' '
          TabOrder = 1
          object lblFieldName: TLabel
            Left = 4
            Top = 4
            Width = 63
            Height = 15
            Caption = 'Field Name:'
            FocusControl = edtFieldName
          end
          object lblWhereSyntax: TLabel
            Left = 4
            Top = 29
            Width = 75
            Height = 15
            Caption = 'Where Syntax:'
            FocusControl = edtWhereSyntax
          end
          object lblDisplayLabel: TLabel
            Left = 4
            Top = 54
            Width = 72
            Height = 15
            Caption = 'Display Label:'
            FocusControl = edtDisplayLabel
          end
          object lblDisplayWidth: TLabel
            Left = 4
            Top = 79
            Width = 76
            Height = 15
            Caption = 'Display Width:'
            FocusControl = edtDisplayWidth
          end
          object lblFieldType: TLabel
            Left = 4
            Top = 152
            Width = 55
            Height = 15
            Caption = 'Field Type:'
            FocusControl = cbxFieldType
          end
          object lblDisplayFormat: TLabel
            Left = 4
            Top = 127
            Width = 82
            Height = 15
            Caption = 'Display Format:'
            FocusControl = edtDisplayFormat
          end
          object lblDefaultComparison: TLabel
            Left = 4
            Top = 177
            Width = 109
            Height = 15
            Caption = 'Default Comparison:'
            FocusControl = cbxDefaultComparison
          end
          object lblSearch: TLabel
            Left = 4
            Top = 226
            Width = 38
            Height = 15
            Caption = 'Search:'
            FocusControl = cbxSearch
          end
          object lblColumnWidth: TLabel
            Left = 4
            Top = 103
            Width = 122
            Height = 15
            Caption = 'Display Column Width:'
            FocusControl = edtDisplayColumnWidth
          end
          object lblSearchCase: TLabel
            Left = 4
            Top = 201
            Width = 66
            Height = 15
            Caption = 'Search Case:'
            FocusControl = cbxSearchCase
          end
          object edtFieldName: TEdit
            Left = 133
            Top = 0
            Width = 133
            Height = 23
            Enabled = False
            TabOrder = 0
            OnExit = edtFieldNameExit
            OnKeyPress = edtFieldNameKeyPress
          end
          object edtWhereSyntax: TEdit
            Left = 133
            Top = 25
            Width = 133
            Height = 23
            Enabled = False
            TabOrder = 1
            OnExit = edtWhereSyntaxExit
            OnKeyPress = edtWhereSyntaxKeyPress
          end
          object edtDisplayLabel: TEdit
            Left = 133
            Top = 50
            Width = 133
            Height = 23
            Enabled = False
            TabOrder = 2
            OnExit = edtDisplayLabelExit
            OnKeyPress = edtDisplayLabelKeyPress
          end
          object edtDisplayWidth: TEdit
            Left = 133
            Top = 75
            Width = 133
            Height = 23
            Enabled = False
            TabOrder = 3
            OnExit = edtDisplayWidthExit
            OnKeyPress = edtDisplayWidthKeyPress
          end
          object cbxFieldType: TComboBox
            Left = 133
            Top = 148
            Width = 133
            Height = 23
            Style = csDropDownList
            Enabled = False
            TabOrder = 6
            OnExit = cbxFieldTypeExit
            OnKeyPress = cbxFieldTypeKeyPress
          end
          object edtDisplayFormat: TEdit
            Left = 133
            Top = 123
            Width = 133
            Height = 23
            Enabled = False
            TabOrder = 5
            OnExit = edtDisplayFormatExit
            OnKeyPress = edtDisplayFormatKeyPress
          end
          object cbxDefaultComparison: TComboBox
            Left = 133
            Top = 173
            Width = 133
            Height = 23
            Style = csDropDownList
            Enabled = False
            TabOrder = 7
            OnExit = cbxDefaultComparisonExit
            OnKeyPress = cbxDefaultComparisonKeyPress
          end
          object cbxSearch: TComboBox
            Left = 133
            Top = 222
            Width = 133
            Height = 23
            Style = csDropDownList
            Enabled = False
            TabOrder = 9
            OnExit = cbxSearchExit
            OnKeyPress = cbxSearchKeyPress
            Items.Strings = (
              'False'
              'True')
          end
          object edtDisplayColumnWidth: TEdit
            Left = 133
            Top = 99
            Width = 133
            Height = 23
            Enabled = False
            TabOrder = 4
            OnExit = edtDisplayColumnWidthExit
            OnKeyPress = edtDisplayColumnWidthKeyPress
          end
          object cbxSearchCase: TComboBox
            Left = 133
            Top = 197
            Width = 133
            Height = 23
            Style = csDropDownList
            Enabled = False
            TabOrder = 8
            OnExit = cbxSearchCaseExit
            OnKeyPress = cbxSearchCaseKeyPress
            Items.Strings = (
              'Mixed case'
              'Upper case'
              'Lower case')
          end
          object pn: TPanel
            Left = 133
            Top = 264
            Width = 133
            Height = 41
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 10
            object btnTestar: TButton
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 123
              Height = 31
              Action = actTestar
              Align = alClient
              TabOrder = 0
            end
          end
        end
      end
      object pnlFields: TPanel
        AlignWithMargins = True
        Left = 448
        Top = 3
        Width = 237
        Height = 474
        Align = alRight
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
        object pnlFieldsHeader: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 393
          Width = 227
          Height = 74
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          BorderWidth = 2
          Caption = ' '
          TabOrder = 1
          object lblFields: TLabel
            Left = 2
            Top = 2
            Width = 219
            Height = 21
            Align = alTop
            Alignment = taCenter
            Caption = 'Organizar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 69
          end
          object Panel1: TPanel
            Left = 2
            Top = 23
            Width = 219
            Height = 45
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object btnAddField: TBitBtn
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 23
              Height = 35
              Action = actAddField
              Align = alLeft
              Glyph.Data = {
                52050000424D5205000000000000420000002800000024000000120000000100
                1000030000001005000000000000000000000000000000000000007C0000E003
                00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CFF7FFF7FFF7FFF7F
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000
                00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042
                1F7C1F7C1F7CFF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C10421F7C1F7C1F7CFF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7CFF7FFF7F1F7C1F7C1F7C1F7CFF7FFF7FFF7FFF7F1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000000000000000000000
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10421F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7CFF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000
                00000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10421F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7CFF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
                000000000000000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                10421F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CFF7F1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C10421042104210421F7C1F7C1F7C1F7C104210421F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10421F7C1F7C1F7CFF7F
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000
                00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042
                1F7C1F7C1F7CFF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C10421042104210421F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C}
              NumGlyphs = 2
              TabOrder = 0
            end
            object btnDeleteField: TBitBtn
              AlignWithMargins = True
              Left = 32
              Top = 3
              Width = 23
              Height = 35
              Action = actDeleteField
              Align = alLeft
              Glyph.Data = {
                52050000424D5205000000000000420000002800000024000000120000000100
                1000030000001005000000000000000000000000000000000000007C0000E003
                00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000000000000000000000
                00001F7C1F7C1F7C1F7C1F7C1F7C1F7C10421F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7CFF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000
                000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C10421F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7CFF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
                0000000000000000000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
                10421F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CFF7F1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C10421042104210421042104210421042104210421042FF7F
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C}
              NumGlyphs = 2
              TabOrder = 1
            end
            object btnMoveFieldUp: TBitBtn
              AlignWithMargins = True
              Left = 61
              Top = 3
              Width = 23
              Height = 35
              Action = actMoveFieldUp
              Align = alLeft
              Glyph.Data = {
                560A0000424D560A000000000000360000002800000024000000120000000100
                200000000000200A000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF0080808000FF00FF00FF00FF00FF00FF00FFFFFF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FF00
                FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF0080808000FF00FF00FF00FF00FF00FF00FFFFFF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FF00
                FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF0080808000FF00FF00FF00FF00FF00FF00FFFFFF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
                FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
                0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF0080808000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
                0000000000000000000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF0080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
                000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF0080808000FF00FF00FF00FF00FF00FF00FFFFFF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
                8000FF00FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              NumGlyphs = 2
              TabOrder = 2
            end
            object btnMoveFieldDown: TBitBtn
              AlignWithMargins = True
              Left = 90
              Top = 3
              Width = 23
              Height = 35
              Action = actMoveFieldDown
              Align = alLeft
              Glyph.Data = {
                560A0000424D560A000000000000360000002800000024000000120000000100
                200000000000200A000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF0080808000FF00FF00FF00FF00FFFFFF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FF00
                FF00FF00FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
                00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
                000000000000000000000000000000000000000000000000000000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
                8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF0080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFF
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00808080008080
                800080808000808080008080800080808000FF00FF00FF00FF00FF00FF008080
                8000808080008080800080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
                8000FF00FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF0080808000FF00FF00FF00FF00FF00FF00FFFF
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
                8000FF00FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF0080808000FF00FF00FF00FF00FF00FF00FFFF
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
                8000FF00FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF0080808000808080008080800080808000FFFF
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              NumGlyphs = 2
              TabOrder = 3
            end
          end
        end
        object pnlFieldsList: TPanel
          Left = 0
          Top = 52
          Width = 233
          Height = 338
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 2
          Caption = ' '
          TabOrder = 2
          object lbxFields: TListBox
            Left = 2
            Top = 2
            Width = 229
            Height = 334
            Align = alClient
            Ctl3D = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Lucida Console'
            Font.Style = []
            ItemHeight = 15
            Items.Strings = (
              'CAMPO1'
              'CAMPO2')
            MultiSelect = True
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            OnClick = lbxFieldsClick
          end
        end
        object pnlDataHeader: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 227
          Height = 46
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          BorderWidth = 2
          Caption = ' '
          TabOrder = 0
          object btnGerarCampos: TBitBtn
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 213
            Height = 32
            Action = actGenerateFields
            Align = alClient
            Caption = 'Gerar Campos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object pnlData: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 439
        Height = 474
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 0
        object GroupBox1: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 433
          Height = 468
          Align = alClient
          Caption = 'Script SQL:'
          DefaultHeaderFont = False
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -16
          HeaderFont.Name = 'Segoe UI'
          HeaderFont.Style = []
          TabOrder = 0
          object MemoSQL: TMemo
            AlignWithMargins = True
            Left = 5
            Top = 27
            Width = 423
            Height = 436
            Margins.Top = 10
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Lucida Console'
            Font.Style = []
            Lines.Strings = (
              '------------------------------------'
              '--     EXEMPLO DE SCRIPT SQL      --'
              '------------------------------------'
              ''
              'SELECT'
              'CODIGO,'
              'NOME'
              'FROM CAD_PESSOA'
              'WHERE'
              '%WHERE%'
              '')
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
  end
  object pnlButtons: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 507
    Width = 994
    Height = 47
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = ' '
    TabOrder = 1
    object btnOK: TButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 90
      Height = 33
      Align = alLeft
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancelar: TButton
      AlignWithMargins = True
      Left = 101
      Top = 5
      Width = 90
      Height = 33
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object actFuncoes: TActionList
    Left = 312
    Top = 209
    object actGenerateFields: TAction
      Category = 'Queries'
      Caption = 'Gerar Campos'
      Hint = 'carregar campos'
      ShortCut = 16455
      OnExecute = actGenerateFieldsExecute
    end
    object actAddField: TAction
      Category = 'Fields'
      Hint = 'adicionar campo'
      ShortCut = 16429
      OnExecute = actAddFieldExecute
    end
    object actDeleteField: TAction
      Category = 'Fields'
      Hint = 'excluir campo'
      ShortCut = 16430
      OnExecute = actDeleteFieldExecute
    end
    object actMoveFieldUp: TAction
      Category = 'Fields'
      Hint = 'mover para cima'
      ShortCut = 16469
      OnExecute = actMoveFieldUpExecute
    end
    object actMoveFieldDown: TAction
      Category = 'Fields'
      Hint = 'mover para baixo'
      ShortCut = 16452
      OnExecute = actMoveFieldDownExecute
    end
    object actTestar: TAction
      Category = 'Queries'
      Caption = 'Testar'
      Hint = 'testar suas configura'#231#245'es'
      ShortCut = 16468
      OnExecute = actTestarExecute
    end
  end
  object qrySearch: TFDQuery
    Left = 312
    Top = 276
  end
end
