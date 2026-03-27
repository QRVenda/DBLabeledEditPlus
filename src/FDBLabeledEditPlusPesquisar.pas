{==============================================================================]
[ Unit           : FDBLabeledEditPlusPesquisar.pas                             ]
[ Componente     : "TDBLabeledEditPlus"                                        ]
[ Escopo         : Tela de pesquisa para utilização do usuário.                ]
[ Criado em      : julho/2024                                                  ]
[ Última mod.    : março/2026                                                  ]
[ Versão         : 1.0.2                                                       ]
[------------------------------------------------------------------------------]
[ Licença        : Apache License 2.0                                          ]
[ Documentação   : https://www.apache.org/licenses                             ]
[                  Consulte o arquivo LICENSE para mais detalhes               ]
[------------------------------------------------------------------------------]
[ Autor          : Adriano Zanini                                              ]
[ Formação       : Engenharia de Software                                      ]
[ Competências   : Arquitetura de Software / C# / Delphi / PHP / Java          ]
[==============================================================================}

unit FDBLabeledEditPlusPesquisar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids,  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  System.DateUtils,
  System.TypInfo,
  System.Math,
  DBLabeledEditPlus,
  DBLabeledEditPlusConst,
  DBLabeledEditPlusStruct, Vcl.Mask, Vcl.DBCtrls, ACBrBase, ACBrSocket,
  ACBrSpedTabelas;


type
  TFrmDBLabeledEditPlusPesquisar = class(TForm)
    Panel1: TPanel;
    LblBarraTitulo: TLabel;
    Image1: TImage;
    actComandos: TActionList;
    actProcurar: TAction;
    actConfirmar: TAction;
    actCancelar: TAction;
    pnSairLimpar: TPanel;
    pnConfirmar: TPanel;
    pnSair: TPanel;
    pnlInput: TPanel;
    gbxSelecionarCampo: TGroupBox;
    cbxField01: TComboBox;
    gbxCondicao: TGroupBox;
    cbxOperator01: TComboBox;
    gbxValorProcurar: TGroupBox;
    EditPesquisar: TEdit;
    pnAreaBotaoPesquisar: TPanel;
    pnProcurar: TPanel;
    pnlGrid: TPanel;
    gridDados: TDBGrid;
    pnDetalhes: TPanel;
    lblTotalizador: TLabel;
    btnPesquisar: TBitBtn;
    dsPesquisa: TDataSource;
    tblPesquisa: TFDMemTable;
    btnConfirmar: TBitBtn;
    btnSair: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actProcurarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxOperator01CloseUp(Sender: TObject);
    procedure cbxField01CloseUp(Sender: TObject);
    procedure cbxField01Change(Sender: TObject);
    procedure cbxOperator01Change(Sender: TObject);
    procedure EditPesquisarEnter(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure EditPesquisarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridDadosTitleClick(Column: TColumn);
    procedure actConfirmarExecute(Sender: TObject);
  private
    FBusca       : TSearchFieldList;
    FDataSetOut  : TFDMemTable;
    FQuoteChar   : Char;
    FDecimalChar : Char;
    FCompareFormatDate: String;
    FCompareFormatDateTime: String;
    FCompareFormatTime: String;
    FQuotedDateTime: Boolean;

    FSearchDialogFieldList: TEditDialogFieldList;
    procedure MontarGrid;
    Function MontarWhere: String;
    procedure SetarFoco;
    procedure cbxFieldChange;
    procedure SetFieldSettings;
    function BuildQuery(aScriptInicial: String): String;
    function DateTimeValue(FormatString: String; Value: TDateTime): String;
    function ValueToDate(Value: String): TDateTime;
    function CaseFormattedField(Field: String; SearchCase: TSearchCase): String;
    procedure ValidarCamposEdit();

    function Procurar: Boolean;
    procedure Confirmar();
    procedure Sair();
    procedure AjustarBordas();
    procedure TransacaoDesfazer();
  public
    property Busca      : TSearchFieldList  read FBusca       write FBusca;
    property DataSetOut : TFDMemTable  read FDataSetOut  write FDataSetOut;
  end;

var
  FrmDBLabeledEditPlusPesquisar: TFrmDBLabeledEditPlusPesquisar;

implementation

{$R *.DFM}

uses DBLabeledEditPlusUtils;

procedure TFrmDBLabeledEditPlusPesquisar.FormCreate(Sender: TObject);
begin
  AjustarBordas();
  Self.Caption := _TITULO_JANELA;
  ModalResult := mrNone;
  actConfirmar.Enabled := False;
  FSearchDialogFieldList := TEditDialogFieldList.Create(Self);
  cbxField01.Clear;
  cbxOperator01.Clear;
  EditPesquisar.Text := '';
  FCompareFormatDate := 'yyyy/mm/dd';
  FCompareFormatTime := 'tt'; //'hh:mm:ss';
  FCompareFormatDateTime := 'yyyy/mm/dd hh:mm:ss';
  FQuotedDateTime := True;
  FQuoteChar := '''';
  FDecimalChar := '.';
  FDataSetOut := TFDMemTable.Create(Self);
end;

procedure TFrmDBLabeledEditPlusPesquisar.actCancelarExecute(Sender: TObject);
begin
  Sair();
end;

procedure TFrmDBLabeledEditPlusPesquisar.btnSairClick(Sender: TObject);
begin
  Sair();
end;

procedure TFrmDBLabeledEditPlusPesquisar.Confirmar;
begin
  if not tblPesquisa.Active then
    Exit;
  if tblPesquisa.IsEmpty then
    exit;
  FBusca.CampoValor  := Trim(tblPesquisa.FieldByName(FBusca.CampoChave).AsString);
  FBusca.Resultado   := Trim(tblPesquisa.FieldByName(FBusca.CampoResultado).AsString);
  FDataSetOut.CloneCursor(tblPesquisa, True, True);
  FDataSetOut.Open;
  FDataSetOut.Append;
  FDataSetOut.CopyRecord(tblPesquisa);
  FDataSetOut.Post;
  ModalResult := mrOk;
end;

procedure TFrmDBLabeledEditPlusPesquisar.actConfirmarExecute(Sender: TObject);
begin
  Confirmar();
end;

procedure TFrmDBLabeledEditPlusPesquisar.actProcurarExecute(Sender: TObject);
begin
 Procurar();
end;

function TFrmDBLabeledEditPlusPesquisar.Procurar: Boolean;
var
  cScriptSQL : String;
begin
  Result := False;
  cScriptSQL := BuildQuery(FBusca.SQL.Text);
  if Trim(cScriptSQL) = '' then
    Exit;
  lblTotalizador.Caption := _REGISTROS;
  tblPesquisa.DisableControls;
  TransacaoDesfazer();
  try
    tblPesquisa.Close;
    try
      GetToMemTable(tblPesquisa, cScriptSQL, FBusca.Connection);
      lblTotalizador.Caption := Format(_REGISTROS, [tblPesquisa.RecordCount]);
      SetFieldSettings;
    except
      on e:Exception do
      begin
        raise EEditDialog.CreateFmt('Não é possível determinar o resultado. ' +
                                     sLineBreak+
                                     'Consulta inválida (%s)'+
                                     sLineBreak+
                                     '%s',
                                     [e.Message, cScriptSQL]);
      end;
    end;
  finally
    tblPesquisa.EnableControls;
    TransacaoDesfazer();
  end;

  Result := (tblPesquisa.Active) and (not tblPesquisa.IsEmpty);
  actConfirmar.Enabled := Result;

  if Result then
  begin
    if (gridDados.Enabled) and (gridDados.Visible) then
      if gridDados.canFocus then
        gridDados.SetFocus;
 end;

end;

procedure TFrmDBLabeledEditPlusPesquisar.cbxField01Change(Sender: TObject);
begin
  cbxFieldChange;
end;

procedure TFrmDBLabeledEditPlusPesquisar.cbxField01CloseUp(Sender: TObject);
begin
  cbxFieldChange;
  EditPesquisar.SetFocus;
end;

procedure TFrmDBLabeledEditPlusPesquisar.cbxOperator01Change(Sender: TObject);
begin
  ValidarCamposEdit;
end;

procedure TFrmDBLabeledEditPlusPesquisar.ValidarCamposEdit;
var
  oEditDialogField  : TEditDialogField;
begin
  if cbxField01.Items.Count < 1 then
    Exit;

  oEditDialogField  := TEditDialogField(cbxField01.Items.Objects[cbxField01.ItemIndex]);
  EditPesquisar.TextHint := _MSG_HINT;
  EditPesquisar.NumbersOnly := False;
  if (oEditDialogField.FieldType in [ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint, ftByte, ftBytes, ftLongWord, ftFloat, ftCurrency, ftBCD]) then
  begin
    EditPesquisar.TextHint := _MSG_HINT + ' (somente números)';
    EditPesquisar.NumbersOnly := True;
  end
  else if (oEditDialogField.FieldType in [ftDate]) then
    EditPesquisar.TextHint :=  _MSG_HINT + ' (somente data | exemplo: '+FormatDateTime('ddddd', Now)+')'
  else if (oEditDialogField.FieldType in [ftDateTime]) then
    EditPesquisar.TextHint :=  _MSG_HINT + ' (somente data e hora | exemplo: '+FormatDateTime('c', Now)+')'
  else if (oEditDialogField.FieldType in [ftTime]) then
    EditPesquisar.TextHint :=  _MSG_HINT + ' (somente hora | exemplo: '+FormatDateTime('tt', Now)+')';
end;

procedure TFrmDBLabeledEditPlusPesquisar.cbxOperator01CloseUp(Sender: TObject);
begin
  EditPesquisar.SetFocus;
end;

procedure TFrmDBLabeledEditPlusPesquisar.Sair;
begin
  ModalResult := mrCancel;
end;

procedure TFrmDBLabeledEditPlusPesquisar.SetarFoco;
begin

  EditPesquisar.SetFocus;
end;

procedure TFrmDBLabeledEditPlusPesquisar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblPesquisa.Close;
end;

procedure TFrmDBLabeledEditPlusPesquisar.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE : actCancelar.Execute;
    VK_F2     : actConfirmar.Execute;
    VK_RETURN : begin
                  if gridDados.Focused then
                    actConfirmar.Execute;
                end;
  end;
end;

procedure TFrmDBLabeledEditPlusPesquisar.FormShow(Sender: TObject);
begin
  MontarGrid();
  EditPesquisar.SetFocus;
end;

procedure TFrmDBLabeledEditPlusPesquisar.gridDadosTitleClick(Column: TColumn);
var
  oDataSet    : TDataSet;
  cFieldNames : string;
begin
  oDataSet    := Column.Field.DataSet;
  cFieldNames := Column.Field.FieldName;
  if tblPesquisa.IndexFieldNames = cFieldNames then
    tblPesquisa.IndexFieldNames := cFieldNames + ':D'  // descendente
  else
    tblPesquisa.IndexFieldNames := cFieldNames;        // ascendente
end;

procedure TFrmDBLabeledEditPlusPesquisar.MontarGrid;
var
  i                 : integer;
  cLinha            : String;
  oEditDialogField  : TEditDialogField;
  oPrimeiraBusca    : TEditDialogField;
  oCampo            : TEditDialogField;
  oTextMetric       : TTextMetric;
  oOperator         : TOperator;
  nLargura          : Integer;
  oColuna           : TColumn;
begin
  nLargura := 0;
  gridDados.Columns.Clear;
  FSearchDialogFieldList.Clear;
  oPrimeiraBusca := nil;
  for i := 0 to FBusca.Campos.Count - 1 do
  begin
    oCampo := TEditDialogField(FBusca.Campos[i]);
    if oCampo.Search then
    begin
      cbxField01.Items.AddObject(oCampo.DisplayLabel, oCampo);
      if not Assigned(oPrimeiraBusca) then
        oPrimeiraBusca := oCampo;
    end;
    with gridDados.Columns.Add do
    begin
       FieldName     := oCampo.FieldName;
       Title.Caption := oCampo.DisplayLabel;
       GetTextMetrics(gridDados.Canvas.Handle, oTextMetric);
       nLargura := oCampo.DisplayWidth * (gridDados.Canvas.TextWidth('A') - oTextMetric.tmOverhang) + oTextMetric.tmOverhang + 4;
       Width := nLargura;
    end;
  end;

  if (cbxField01.Items.Count > 0) and Assigned(oPrimeiraBusca) then
    cbxField01.ItemIndex := cbxField01.Items.IndexOfObject(oPrimeiraBusca);
  EditPesquisar.Text := '';
  for oOperator := Low(TOperator) to High(TOperator) do
    cbxOperator01.Items.AddObject(OperatorText(oOperator), Pointer(oOperator));

  cbxFieldChange;
  SetFieldSettings;
end;

Function TFrmDBLabeledEditPlusPesquisar.MontarWhere: String;
var
  i                  : integer;
  oEditDialogField   : TEditDialogField;
  cCampo             : String;
  nValorInteiro      : Integer;
  nValorDecimal      : Extended;
  cSeparadorDecimal  : Char;
  cComparacaoWhere   : String;
  nIndiceOperador    : Integer;
  cOperadorPesquisa  : TOperator;
  cResultado         : String;
  cComparador        : String;
  cScriptSQL         : String;
  cValorDigitado     : String;
  cOrderBy           : String;
  oSearchComparison  : TSearchComparison;
  oFieldType         : TFieldType;
begin
  Result := '';
  if cbxField01.Items.Count < 1 then
    Exit;
  nValorInteiro     := 0;
  cOrderBy          := '';
  cComparacaoWhere  := '';
  cResultado        := '';
  oEditDialogField  := TEditDialogField(cbxField01.Items.Objects[cbxField01.ItemIndex]);
  oFieldType        := ftUnknown;
  oSearchComparison := TSearchComparison(cbxOperator01.Items.Objects[cbxOperator01.ItemIndex]);
  cComparador       := StringReplace(SEARCH_COMPARISON[oSearchComparison], '"', FQuoteChar, [rfReplaceAll]);
  cCampo            := oEditDialogField.WhereSyntax;
  cValorDigitado    := Trim(EditPesquisar.Text);

  //if (oEditDialogField.FieldType in [ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint]) then
  if NormalizeFieldType(oEditDialogField.FieldType) = ftInteger then
  begin
    if StrToInt64Def(cValorDigitado,-9999) = -9999 then
      cValorDigitado := '';
  end;
  if cValorDigitado = '' then
    Exit;

  //if oEditDialogField.FieldType in [ftDate, ftTime, ftDateTime] then
  if NormalizeFieldType(oEditDialogField.FieldType) = ftDateTime then
  begin
    case oEditDialogField.FieldType of
      ftDate     : cValorDigitado := DateTimeValue(FCompareFormatDate,     ValueToDate(cValorDigitado));
      ftTime     : cValorDigitado := DateTimeValue(FCompareFormatTime,     ValueToDate(cValorDigitado));
      ftDateTime : cValorDigitado := DateTimeValue(FCompareFormatDateTime, ValueToDate(cValorDigitado));
    end;
  end
  else
  begin
    if oSearchComparison <> scContem then
    begin
      //case oEditDialogField.FieldType of
      case NormalizeFieldType(oEditDialogField.FieldType) of
        ftInteger:    begin
                        nValorInteiro := StrToIntDef(cValorDigitado, -1);
                        cValorDigitado := IntToStr(nValorInteiro);
                      end;

        ftCurrency:   begin
                        nValorDecimal := StrToFloat(cValorDigitado);
                        cSeparadorDecimal := FormatSettings.DecimalSeparator;
                        try
                          FormatSettings.DecimalSeparator := FDecimalChar;
                          cValorDigitado := CurrToStr(nValorDecimal);
                        finally
                          FormatSettings.DecimalSeparator := cSeparadorDecimal;
                        end;
                      end;

        ftString:     begin
                        cCampo := CaseFormattedField(cCampo, oEditDialogField.SearchCase);
                      end;
      end;
    end
    else
    begin
      case oEditDialogField.SearchCase of
        scAll   : cValorDigitado := StringReplace(cValorDigitado, FQuoteChar, FQuoteChar+FQuoteChar, [rfReplaceAll]);
        scUpper : cValorDigitado := StringReplace(AnsiUpperCase(cValorDigitado), FQuoteChar, FQuoteChar+FQuoteChar, [rfReplaceAll]);
        scLower : cValorDigitado := StringReplace(AnsiLowerCase(cValorDigitado), FQuoteChar, FQuoteChar+FQuoteChar, [rfReplaceAll]);
       end;
      cCampo    := CaseFormattedField(cCampo, oEditDialogField.SearchCase);
    end;
  end;
  if cValorDigitado <> '' then
  begin
    cComparacaoWhere := cCampo + ' ' + Format(cComparador, [cValorDigitado]);
    cResultado := ' AND ' + cResultado + '(' + cComparacaoWhere + ') ' +sLineBreak;
  end;
  Result := cResultado;
end;

procedure TFrmDBLabeledEditPlusPesquisar.cbxFieldChange;
var
  n           : Integer;
  mDetalhe    : TEditDialogField;
  Comparison  : TSearchComparison;
  FieldType   : TFieldType;
  FieldObject : TEditDialogField;
begin
  cbxOperator01.Clear;
  if cbxField01.Items.Count < 1 then
    Exit;

  FieldObject := TEditDialogField(cbxField01.Items.Objects[cbxField01.ItemIndex]);
  FieldType   := ftUnknown;
  with cbxOperator01 do
  begin
    Items.Clear;
    if cbxField01.ItemIndex <> -1 then
    begin
      FieldType := FieldObject.FieldType;
      for Comparison := Low(TSearchComparison) to High(TSearchComparison) do
      begin
        if Comparison in FieldTypeComparisons(FieldType) then
        begin
          Items.AddObject(SearchComparisionText(Comparison), Pointer(Comparison));
        end;
      end;
    end;
    if FieldObject.DefaultComparison in FieldTypeComparisons(FieldType) then
    begin
      n := Items.IndexOfObject(Pointer(FieldObject.DefaultComparison));
      ItemIndex := n;
    end
    else
    begin
      n := Items.IndexOfObject(Pointer(FieldTypeDefaultComparison(FieldType)));
      if n <> -1 then
        ItemIndex := n;
    end;
  end;
  ValidarCamposEdit;
end;

procedure TFrmDBLabeledEditPlusPesquisar.SetFieldSettings;
var
  i                 : Integer;
  oEditDialogField  : TEditDialogField;
  oCampoTabela      : TField;
begin
  tblPesquisa.DisableControls;
  try
    if tblPesquisa.FieldCount < 1 then
      Exit;

    for i := 0 to tblPesquisa.FieldCount - 1 do
    begin
      if (i > FBusca.Campos.Count-1) then
        break;
      oEditDialogField := TEditDialogField(FBusca.Campos[i]);
      oCampoTabela := tblPesquisa.FindField(oEditDialogField.FieldName);

      tblPesquisa.Fields[i].Visible := False;
      if not Assigned(oEditDialogField) then
        Continue;

      if not Assigned(oCampoTabela) then
        Continue;

      if LowerCase(oCampoTabela.FieldName) = LowerCase(oEditDialogField.FieldName) then
      begin
        tblPesquisa.Fields[i].DisplayLabel := oEditDialogField.DisplayLabel;
        if oEditDialogField.DisplayWidth <> 0 then
          tblPesquisa.Fields[i].DisplayWidth := oEditDialogField.DisplayWidth;

        if NormalizeFieldType(oCampoTabela.DataType) = ftCurrency then
          TNumericField(oCampoTabela).DisplayFormat    := oEditDialogField.DisplayFormat;

        if NormalizeFieldType(oCampoTabela.DataType) = ftDateTime then
        begin
          if Trim(oEditDialogField.DisplayFormat) <> '' then
            TDateTimeField(oCampoTabela).DisplayFormat := oEditDialogField.DisplayFormat;
        end;
        tblPesquisa.Fields[i].Visible := True;
      end;
    end;

    for i := 0 to FSearchDialogFieldList.Count - 1 do
    begin
      oEditDialogField := TEditDialogField(FSearchDialogFieldList.Items[i]);
      oCampoTabela := tblPesquisa.FindField(oEditDialogField.FieldName);
      if Assigned(oCampoTabela) then
        oCampoTabela.Index := i;
    end;

  finally
    tblPesquisa.EnableControls;
  end;

end;

procedure TFrmDBLabeledEditPlusPesquisar.TransacaoDesfazer;
begin
  if FBusca.Connection = nil then
    Exit;
  if not FBusca.Connection.InTransaction then
    Exit;
  FBusca.Connection.Rollback;
end;

procedure TFrmDBLabeledEditPlusPesquisar.EditPesquisarEnter(Sender: TObject);
begin
  ValidarCamposEdit;
end;

procedure TFrmDBLabeledEditPlusPesquisar.EditPesquisarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    Key := 0;
    Procurar();
  end;
end;

function TFrmDBLabeledEditPlusPesquisar.BuildQuery(aScriptInicial: String): String;
var
  cCondicao  : String;
  cWhere2    : String;
begin
  Result := '';
  cWhere2 := MontarWhere();
  cCondicao := '1 = 1' + sLineBreak + cWhere2;

  if Trim(FBusca.Filtro) <> '' then
    cCondicao := cCondicao + ' AND ' + FBusca.Filtro + ' ';
  Result := StringReplace(aScriptInicial, WHERE_TAG, cCondicao, [rfIgnoreCase]);
end;

function TFrmDBLabeledEditPlusPesquisar.DateTimeValue(FormatString: String; Value: TDateTime): String;
begin
  Result := QuotedStr(FormatDateTime(FormatString, Value));
end;

function TFrmDBLabeledEditPlusPesquisar.ValueToDate(Value: String): TDateTime;
begin
  Result := 0;
  TryStrToDateTime(Value, Result);
end;

function TFrmDBLabeledEditPlusPesquisar.CaseFormattedField(Field: String; SearchCase: TSearchCase): String;
begin
  Result := Field;
  case SearchCase of
    scAll:
      begin
      end;
    scUpper:
      begin
        Result := UpperCase(Field);
      end;
    scLower:
      begin
        Result := LowerCase(Field);
      end;
  else
    raise EEditDialog.Create('CaseFormattedField inválido');
  end;

end;

procedure TFrmDBLabeledEditPlusPesquisar.AjustarBordas;
var
  i :Integer;
begin
  Exit;

  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TPanel) then
      PlanarObjeto( [TPanel(Components[i])] );
    if (Components[i] is TMemo) then
      TMemo(Components[i]).BorderStyle := bsNone;
    if (Components[i] is TGroupBox) then
      TGroupBox(Components[i]).ShowFrame := False;
  end;
end;

end.
