{==============================================================================]
[ Arquivo        : FDBLabeledEditPlusConfig.pas                                ]
[ Componente     : TDBLabeledEditPlus                                          ]
[ Descrição      : Tela de configuração de script SQL e definições de campos   ]
[------------------------------------------------------------------------------]
[ Criado em      : julho/2025                                                  ]
[ Última modif.  : setembro/2025                                               ]
[------------------------------------------------------------------------------]
[ Autor          : Adriano Zanini                                              ]
[ Versão         : 1.0.2                                                       ]
[==============================================================================}

unit FDBLabeledEditPlusConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.TypInfo,
  System.UITypes,
  DBLabeledEditPlusStruct,
  DBLabeledEditPlusConst,
  DBLabeledEditPlus,
  System.ImageList, Vcl.ImgList;

type

  TFrmConfigurarCampos = class(TForm)
    pnlMain: TPanel;
    pnlControls: TPanel;
    pnlProperties: TPanel;
    pnlPropertiesHeader: TPanel;
    Label2: TLabel;
    pnlPropertiesDetails: TPanel;
    lblFieldName: TLabel;
    lblWhereSyntax: TLabel;
    lblDisplayLabel: TLabel;
    lblDisplayWidth: TLabel;
    lblFieldType: TLabel;
    lblDisplayFormat: TLabel;
    lblDefaultComparison: TLabel;
    lblSearch: TLabel;
    lblColumnWidth: TLabel;
    lblSearchCase: TLabel;
    edtFieldName: TEdit;
    edtWhereSyntax: TEdit;
    edtDisplayLabel: TEdit;
    edtDisplayWidth: TEdit;
    cbxFieldType: TComboBox;
    edtDisplayFormat: TEdit;
    cbxDefaultComparison: TComboBox;
    cbxSearch: TComboBox;
    edtDisplayColumnWidth: TEdit;
    cbxSearchCase: TComboBox;
    pnlFields: TPanel;
    pnlFieldsHeader: TPanel;
    lblFields: TLabel;
    pnlFieldsList: TPanel;
    lbxFields: TListBox;
    pnlData: TPanel;
    GroupBox1: TGroupBox;
    btnTestar: TButton;
    btnGerarCampos: TBitBtn;
    pnlButtons: TPanel;
    btnOK: TButton;
    btnCancelar: TButton;
    actFuncoes: TActionList;
    actGenerateFields: TAction;
    actAddField: TAction;
    actDeleteField: TAction;
    actMoveFieldUp: TAction;
    actMoveFieldDown: TAction;
    actTestar: TAction;
    qrySearch: TFDQuery;
    pn: TPanel;
    pnlDataHeader: TPanel;
    MemoSQL: TMemo;
    Panel1: TPanel;
    btnAddField: TBitBtn;
    btnDeleteField: TBitBtn;
    btnMoveFieldUp: TBitBtn;
    btnMoveFieldDown: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actGenerateFieldsExecute(Sender: TObject);
    procedure lbxFieldsClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtFieldNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtWhereSyntaxKeyPress(Sender: TObject; var Key: Char);
    procedure edtDisplayLabelKeyPress(Sender: TObject; var Key: Char);
    procedure edtDisplayWidthKeyPress(Sender: TObject; var Key: Char);
    procedure edtDisplayColumnWidthKeyPress(Sender: TObject; var Key: Char);
    procedure edtDisplayFormatKeyPress(Sender: TObject; var Key: Char);
    procedure cbxFieldTypeKeyPress(Sender: TObject; var Key: Char);
    procedure cbxDefaultComparisonKeyPress(Sender: TObject; var Key: Char);
    procedure cbxSearchCaseKeyPress(Sender: TObject; var Key: Char);
    procedure cbxSearchKeyPress(Sender: TObject; var Key: Char);
    procedure edtFieldNameExit(Sender: TObject);
    procedure edtWhereSyntaxExit(Sender: TObject);
    procedure edtDisplayLabelExit(Sender: TObject);
    procedure edtDisplayWidthExit(Sender: TObject);
    procedure edtDisplayColumnWidthExit(Sender: TObject);
    procedure edtDisplayFormatExit(Sender: TObject);
    procedure cbxFieldTypeExit(Sender: TObject);
    procedure cbxDefaultComparisonExit(Sender: TObject);
    procedure cbxSearchCaseExit(Sender: TObject);
    procedure cbxSearchExit(Sender: TObject);
    procedure actTestarExecute(Sender: TObject);
    procedure actAddFieldExecute(Sender: TObject);
    procedure actDeleteFieldExecute(Sender: TObject);
    procedure actMoveFieldUpExecute(Sender: TObject);
    procedure actMoveFieldDownExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FSearchDialog: TDBLabeledEditPlus;
    FDisplayWidthList: TStringList;
    FDisplayColumnWidthList: TStringList;
    FDisplayFormatList: TStringList;
    FFieldTypeList: TStringList;
    FDefaultComparisonList: TStringList;
    FSearchCaseList: TStringList;
    FSearchList: TStringList;
    FDialogWidth: Integer;
    FDialogHeight: Integer;
    procedure ToggleProperties;
    procedure ClearProperties;
    procedure AtualizarFormulario;
    procedure SetEditDialog(const Value: TDBLabeledEditPlus);
    function AddField(FieldName: String;
                  WhereSyntax: String;
                  DisplayLabel: String;
                  DisplayWidth: Integer;
                  DisplayColumnWidth: Integer;
                  DisplayFormat: String;
                  FieldType: TFieldType;
                  DefaultComparison: TSearchComparison;
                  SearchCase: TSearchCase;
                  Search: Boolean): Integer;

    procedure SetPropriedade();

    procedure SetSearchSQL(SQL: String);

    procedure ToggleActions;

    procedure SelectField;

    procedure ValidateSearchQuery;

    procedure ValidateDefaultSearch;

    procedure UpdateSearchDialog(ASearchDialog: TDBLabeledEditPlus);

    procedure SetFieldName;

    procedure SetWhereSyntax;

    procedure SetDisplayLabel;

    procedure SetDisplayWidth;

    procedure SetDisplayColumnWidth;

    procedure SetDisplayFormat;

    procedure SetFieldType;

    procedure SetDefaultComparision;

    procedure SetSearchCase;

    procedure SetSearch;

    procedure AtualizarPropriedades;

    procedure FormatarCampos(aFieldObject: TEditDialogField);

    { Private declarations }
  public
    { Public declarations }
    property SearchDialog : TDBLabeledEditPlus read FSearchDialog write SetEditDialog;
  end;

var
  FrmConfigurarCampos: TFrmConfigurarCampos;

implementation

{$R *.dfm}


procedure TFrmConfigurarCampos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TFrmConfigurarCampos.FormCreate(Sender: TObject);
var
  t : TFieldType;
  s : TSearchComparison;
  c : TSearchCase;
begin
  lbxFields.Clear;
  FSearchDialog                       := Nil;
  FDisplayWidthList                   := TStringList.Create;
  FDisplayColumnWidthList             := TStringList.Create;
  FDisplayFormatList                  := TStringList.Create;
  FFieldTypeList                      := TStringList.Create;
  FDefaultComparisonList              := TStringList.Create;
  FSearchCaseList                     := TStringList.Create;
  FSearchList                         := TStringList.Create;
  FDisplayWidthList.Sorted            := True;
  FDisplayWidthList.Duplicates        := dupIgnore;
  FDisplayColumnWidthList.Sorted      := True;
  FDisplayColumnWidthList.Duplicates  := dupIgnore;
  FDisplayFormatList.Sorted           := True;
  FDisplayFormatList.Duplicates       := dupIgnore;
  FFieldTypeList.Sorted               := True;
  FFieldTypeList.Duplicates           := dupIgnore;
  FDefaultComparisonList.Sorted       := True;
  FDefaultComparisonList.Duplicates   := dupIgnore;
  FSearchCaseList.Sorted              := True;
  FSearchCaseList.Duplicates          := dupIgnore;
  FSearchList.Sorted                  := True;
  FSearchList.Duplicates              := dupIgnore;
  cbxFieldType.Items.Clear;
  for t := Low(TFieldType) to High(TFieldType) do
    cbxFieldType.Items.AddObject(GetEnumName(TypeInfo(TFieldType), Ord(t)), TObject(t));
  cbxDefaultComparison.Items.Clear;
  for s := Low(TSearchComparison) to High(TSearchComparison) do
    cbxDefaultComparison.Items.AddObject(GetEnumName(TypeInfo(TSearchComparison), Ord(s)), TObject(s));
  cbxSearchCase.Items.Clear;
  for c := Low(TSearchCase) to High(TSearchCase) do
    cbxSearchCase.Items.AddObject(GetEnumName(TypeInfo(TSearchCase), Ord(c)), TObject(c));


  ClearProperties();
end;

procedure TFrmConfigurarCampos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key =VK_ESCAPE then
    ModalResult := mrCancel;
end;

procedure TFrmConfigurarCampos.FormShow(Sender: TObject);
begin
  ToggleProperties();
  AtualizarFormulario();
  SetPropriedade();
end;

procedure TFrmConfigurarCampos.UpdateSearchDialog(ASearchDialog: TDBLabeledEditPlus);
var
  i : Integer;
begin
  ASearchDialog.Configurar.FormWidth := FDialogWidth;
  ASearchDialog.Configurar.FormHeight := FDialogHeight;
  ASearchDialog.Configurar.SQL.Text := Trim(MemoSQL.Lines.Text);
  ASearchDialog.Configurar.SQL.Text := Trim(MemoSQL.Lines.Text);
  ASearchDialog.Configurar.Campos.Clear;
  for i := 0 to lbxFields.Items.Count - 1 do
  begin
    with TEditDialogField(lbxFields.Items.Objects[i]) do
    begin
      ASearchDialog.Configurar.Campos.Add(FieldName,
                                          WhereSyntax,
                                          DisplayLabel,
                                          DisplayWidth,
                                          DisplayFormat,
                                          DisplayColumnWidth,
                                          FieldType,
                                          Search,
                                          DefaultComparison,
                                          SearchCase);
    end;
  end;
end;

procedure TFrmConfigurarCampos.ValidateDefaultSearch;
var
  i      : Integer;
  Answer : TModalResult;
begin
  for i := 0 to lbxFields.Items.Count - 1 do
  begin
    with TEditDialogField(lbxFields.Items.Objects[i]) do
    begin
      if not (DefaultComparison in FieldTypeComparisons(FieldType)) then
      begin
        Answer := MessageDlg(Format('A comparação padrão do campo ''% s '' não é '+
                                    'válido para o tipo de campo indicado. Correto '+
                                    'para o valor padrão?', [FieldName]),
                                    mtConfirmation, mbYesNoCancel, 0);
        if Answer = mrYes then
        begin
          DefaultComparison := FieldTypeDefaultComparison(FieldType);
        end
        else
        begin
          if Answer = mrCancel then
            Abort;
        end;
      end;
    end;
  end;
end;
procedure TFrmConfigurarCampos.ValidateSearchQuery;
begin
  if (Trim(MemoSQL.Lines.Text) <> '') and
     (Pos(WHERE_TAG, UpperCase(MemoSQL.Lines.Text)) = 0) then
  begin
    raise Exception.CreateFmt('Script SQL não contem a tag %s', [WHERE_TAG]);
  end;
end;

procedure TFrmConfigurarCampos.SetPropriedade();
begin
  if FSearchDialog.Configurar.Connection = nil then
  begin
    Application.MessageBox(PChar('Propriedade Connection (TFDConnection) não foi definida nas configurações.'), '[Propriedade TFDConnection]', mb_ok + MB_ICONERROR);
    Abort;
  end;
  qrySearch.Connection  := FSearchDialog.Configurar.Connection;
end;

procedure TFrmConfigurarCampos.lbxFieldsClick(Sender: TObject);
begin
  SelectField;
  ToggleActions;
end;

procedure TFrmConfigurarCampos.SetFieldName;
var
  i : Integer;
  f : TEditDialogField;
begin
  if lbxFields.Items.Count = 0 then
    Exit;
  if Trim(edtFieldName.Text) = '' then
  begin
    MessageDlg('FieldName cannot be empty', mtError, [mbOK], 0);
    edtFieldName.SetFocus;
    Abort;
  end;
  if (lbxFields.Items.IndexOf(edtFieldName.Text) = -1) or
     (lbxFields.Items.IndexOf(edtFieldName.Text) = lbxFields.ItemIndex) then
  begin
    for i := 0 to lbxFields.Items.Count - 1 do
    begin
      if lbxFields.Selected[i] then
      begin
        f := TEditDialogField(lbxFields.Items.Objects[i]);
        f.FieldName := edtFieldName.Text;
        lbxFields.Items[i] := edtFieldName.Text;
        lbxFields.Selected[i] := True;
      end;
    end;
  end
  else
  begin
    MessageDlg(Format('Campo duplicado %s', [edtFieldName.Text]), mtError, [mbOK], 0);
    edtFieldName.SetFocus;
    Abort;
  end;
end;

procedure TFrmConfigurarCampos.SetWhereSyntax;
var
  i : Integer;
  f : TEditDialogField;
begin
  if lbxFields.Items.Count = 0 then
    Exit;
  if Trim(edtWhereSyntax.Text) = '' then
  begin
    MessageDlg('WhereSyntax cannot be empty', mtError, [mbOK], 0);
    edtWhereSyntax.SetFocus;
    Abort;
  end;
  for i := 0 to lbxFields.Items.Count - 1 do
  begin
    if lbxFields.Selected[i] then
    begin
      f := TEditDialogField(lbxFields.Items.Objects[i]);
      f.WhereSyntax := edtWhereSyntax.Text;
    end;
  end;
end;

procedure TFrmConfigurarCampos.ClearProperties;
begin
  edtFieldname.Text              := '';
  edtWhereSyntax.Text            := '';
  edtDisplayLabel.Text           := '';
  edtDisplayWidth.Text           := '';
  edtDisplayColumnWidth.Text     := '';
  edtDisplayFormat.Text          := '';
  cbxFieldType.ItemIndex         := -1;
  cbxFieldType.Text              := '';
  cbxDefaultComparison.ItemIndex := -1;
  cbxDefaultComparison.Text      := '';
  cbxSearchCase.ItemIndex        := -1;
  cbxSearchCase.Text             := '';
  cbxSearch.ItemIndex            := -1;
  cbxSearch.Text                 := '';
end;
procedure TFrmConfigurarCampos.edtDisplayColumnWidthExit(Sender: TObject);
begin
  SetDisplayColumnWidth;
end;

procedure TFrmConfigurarCampos.edtDisplayColumnWidthKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SetDisplayColumnWidth;
  end;
end;

procedure TFrmConfigurarCampos.edtDisplayFormatExit(Sender: TObject);
begin
  SetDisplayFormat;
end;

procedure TFrmConfigurarCampos.edtDisplayFormatKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SetDisplayFormat;
  end;
end;

procedure TFrmConfigurarCampos.edtDisplayLabelExit(Sender: TObject);
begin
  SetDisplayLabel;
end;

procedure TFrmConfigurarCampos.edtDisplayLabelKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SetDisplayLabel;
  end;
end;

procedure TFrmConfigurarCampos.edtDisplayWidthExit(Sender: TObject);
begin
  SetDisplayWidth;
end;

procedure TFrmConfigurarCampos.edtDisplayWidthKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SetDisplayWidth;
  end;
end;


procedure TFrmConfigurarCampos.edtFieldNameExit(Sender: TObject);
begin
  SetFieldName;
end;

procedure TFrmConfigurarCampos.edtFieldNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SetFieldName;
  end;
end;

procedure TFrmConfigurarCampos.edtWhereSyntaxExit(Sender: TObject);
begin
  SetWhereSyntax;
end;

procedure TFrmConfigurarCampos.edtWhereSyntaxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SetWhereSyntax;
  end;
end;

procedure TFrmConfigurarCampos.SetEditDialog(const Value: TDBLabeledEditPlus);
begin
  FSearchDialog := Value;
end;

procedure TFrmConfigurarCampos.SetSearchSQL(SQL: String);
begin
  qrySearch.Close;
  qrySearch.SQL.Text := SQL;
end;

procedure TFrmConfigurarCampos.actAddFieldExecute(Sender: TObject);
var
  i : Integer;
  n : Integer;
begin
  i := 1;
  while lbxFields.Items.IndexOf(Format('Field%d', [i])) <> -1 do
    Inc(i);
  n := AddField(Format('Field%d', [i]),
                Format('Field%d', [i]),
                Format('Field%d', [i]),
                10,
                0,
                '',
                ftString,
                FieldTypeDefaultComparison(ftString),
                scUpper,
                True);
  lbxFields.SetFocus;
  lbxFields.ClearSelection;
  lbxFields.ItemIndex := n;
  lbxFields.Selected[n] := True;
  SelectField;
  ToggleActions;
end;

procedure TFrmConfigurarCampos.actDeleteFieldExecute(Sender: TObject);
var
  i : Integer;
  n : Integer;
begin
  if lbxFields.SelCount = 0 then
    Exit;
  n := -1;
  for i := lbxFields.Items.Count - 1 downto 0 do
  begin
    if lbxFields.Selected[i] then
    begin
      n := i;
      lbxFields.Items.Objects[i].Free;
      lbxFields.Items.Delete(i);
    end;
  end;
  if n < lbxFields.Items.Count then
    lbxFields.ItemIndex := n
  else
    lbxFields.ItemIndex := n - 1;
  if lbxFields.ItemIndex <> -1 then
    lbxFields.Selected[lbxFields.ItemIndex] := True;
  SelectField;
  ToggleActions;
end;

procedure TFrmConfigurarCampos.actGenerateFieldsExecute(Sender: TObject);
var
  i : Integer;
  mFieldType: TFieldType;
begin
  qrySearch.Close;
  SetSearchSQL(StringReplace(MemoSQL.Lines.Text,
                             WHERE_TAG,
                             _1WHERE1_,
                             [rfIgnoreCase]));
  try
    qrySearch.Open;
  except
    on e: Exception do
    begin
      MessageDlg(Format('ScriptSQL não definido: (%s)', [e.Message]), mtError, [mbOK], 0);
      Exit;
    end;
  end;
  lbxFields.Clear;
  lbxFields.Items.Clear;
  for i := 0 to qrySearch.Fields.Count - 1 do
  begin
    if lbxFields.Items.IndexOf(qrySearch.Fields[i].FieldName) = -1 then
    begin
        mFieldType := qrySearch.Fields[i].DataType;
        if mFieldType in  [ftBCD] then
        begin
          mFieldType := ftCurrency;
        end;

        if qrySearch.Fields[i].DisplayWidth >= 200 then
          qrySearch.Fields[i].DisplayWidth := 80;

        AddField(qrySearch.Fields[i].FieldName,
                 Format('%s', [qrySearch.Fields[i].FieldName]),
                 qrySearch.Fields[i].FieldName,
                 qrySearch.Fields[i].DisplayWidth,
                 0,
                 '',
                 mFieldType,
                 FieldTypeDefaultComparison(mFieldType),
                 scUpper,
                 True);
    end;
  end;
  if (lbxFields.ItemIndex = -1) and (lbxFields.Items.Count > 0) then
    lbxFields.ItemIndex := 0;
  SelectField;
  ToggleActions;
end;

procedure TFrmConfigurarCampos.actMoveFieldDownExecute(Sender: TObject);
var
  i : Integer;
  f : TEditDialogField;
begin
  if (lbxFields.SelCount <> 1) or (lbxFields.Selected[lbxFields.Items.Count - 1]) then
    Exit;
  for i := 0 to lbxFields.Items.Count - 1 do
  begin
    if lbxFields.Selected[i] then
    begin
      lbxFields.ClearSelection;
      f := TEditDialogField(lbxFields.Items.Objects[i]);
      lbxFields.Items.Move(i, i+1);
      f.Index := i+1;
      lbxFields.ItemIndex := i+1;
      lbxFields.Selected[lbxFields.ItemIndex] := True;
      Break;
    end;
  end;
  ToggleActions;
end;

procedure TFrmConfigurarCampos.actMoveFieldUpExecute(Sender: TObject);
var
  i : Integer;
  f : TEditDialogField;
begin
  if (lbxFields.SelCount <> 1) or (lbxFields.Selected[0]) then
    Exit;
  for i := 0 to lbxFields.Items.Count - 1 do
  begin
    if lbxFields.Selected[i] then
    begin
      lbxFields.ClearSelection;
      f := TEditDialogField(lbxFields.Items.Objects[i]);
      lbxFields.Items.Move(i, i-1);
      f.Index := i-1;
      lbxFields.ItemIndex := i-1;
      lbxFields.Selected[lbxFields.ItemIndex] := True;
      Break;
    end;
  end;
  ToggleActions;
end;

procedure TFrmConfigurarCampos.SelectField;
var
  i : Integer;
  f : TEditDialogField;
begin
  f := nil;
  ClearProperties;
  ToggleProperties;
  FDisplayWidthList.Clear;
  FDisplayColumnWidthList.Clear;
  FDisplayFormatList.Clear;
  FFieldTypeList.Clear;
  FDefaultComparisonList.Clear;
  FSearchCaseList.Clear;
  FSearchList.Clear;
  for i := 0 to lbxFields.Items.Count - 1 do
  begin
    if lbxFields.Selected[i] then
    begin
      f := TEditDialogField(lbxFields.Items.Objects[i]);
      FDisplayWidthList.Add(IntToStr(f.DisplayWidth));
      FDisplayColumnWidthList.Add(IntToStr(f.DisplayColumnWidth));
      FDisplayFormatList.Add(f.DisplayFormat);
      FFieldTypeList.Add(IntToStr(Ord(f.FieldType)));
      FDefaultComparisonList.Add(IntToStr(Ord(f.DefaultComparison)));
      FSearchCaseList.Add(IntToStr(Ord(f.SearchCase)));
      FSearchList.Add(IntToStr(Ord(f.Search)));
    end;
  end;
  if Assigned(f) then
  begin
    if lbxFields.SelCount = 1 then
    begin
      edtFieldName.Text := f.FieldName;
      edtWhereSyntax.Text := f.WhereSyntax;
      edtDisplayLabel.Text := f.DisplayLabel;
    end;
    if FDisplayWidthList.Count = 1 then
      edtDisplayWidth.Text := IntToStr(f.DisplayWidth);
    if FDisplayColumnWidthList.Count = 1 then
      edtDisplayColumnWidth.Text := IntToStr(f.DisplayColumnWidth);
    if FDisplayFormatList.Count = 1 then
      edtDisplayFormat.Text := f.DisplayFormat;
    if FFieldTypeList.Count = 1 then
      cbxFieldType.ItemIndex := Ord(f.FieldType);
    if FDefaultComparisonList.Count = 1 then
      cbxDefaultComparison.ItemIndex := Ord(f.DefaultComparison);
    if FSearchCaseList.Count = 1 then
      cbxSearchCase.ItemIndex := Ord(f.SearchCase);
    if FSearchList.Count = 1 then
      cbxSearch.ItemIndex := Ord(f.Search);
  end;
end;


procedure TFrmConfigurarCampos.SetDisplayColumnWidth;
var
  i : Integer;
  n : Integer;
  f : TEditDialogField;
begin
  if lbxFields.Items.Count = 0 then
    Exit;
  if (lbxFields.SelCount > 1) and (edtDisplayColumnWidth.Text = '') then
    Exit;
  n := StrToIntDef(edtDisplayColumnWidth.Text, -MAXINT);
  if n >= 0 then
  begin
    for i := 0 to lbxFields.Items.Count - 1 do
    begin
      if lbxFields.Selected[i] then
      begin
        f := TEditDialogField(lbxFields.Items.Objects[i]);
        f.DisplayColumnWidth := n;
      end;
    end;
  end
  else
  begin
    MessageDlg(Format('DisplayColumnWidth %s inválido', [edtDisplayColumnWidth.Text]), mtError, [mbOK], 0);
    edtDisplayColumnWidth.SetFocus;
    Abort;
  end;
end;
procedure TFrmConfigurarCampos.SetDisplayFormat;
var
  i : Integer;
  f : TEditDialogField;
begin
  if lbxFields.Items.Count = 0 then
    Exit;
  if (lbxFields.SelCount > 1) and (edtDisplayFormat.Text = '') then
    Exit;
  for i := 0 to lbxFields.Items.Count - 1 do
  begin
    if lbxFields.Selected[i] then
    begin
      f := TEditDialogField(lbxFields.Items.Objects[i]);
      f.DisplayFormat := edtDisplayFormat.Text;
    end;
  end;
end;
procedure TFrmConfigurarCampos.SetDisplayLabel;
var
  i : Integer;
  f : TEditDialogField;
begin
  if lbxFields.Items.Count = 0 then
    Exit;
  for i := 0 to lbxFields.Items.Count - 1 do
  begin
    if lbxFields.Selected[i] then
    begin
      f := TEditDialogField(lbxFields.Items.Objects[i]);
      f.DisplayLabel := edtDisplayLabel.Text;
    end;
  end;
end;
procedure TFrmConfigurarCampos.SetDisplayWidth;
var
  i : Integer;
  n : Integer;
  f : TEditDialogField;
begin
  if lbxFields.Items.Count = 0 then
    Exit;
  if (lbxFields.SelCount > 1) and (edtDisplayWidth.Text = '') then
    Exit;
  n := StrToIntDef(edtDisplayWidth.Text, -MAXINT);
  if n >= 0 then
  begin
    for i := 0 to lbxFields.Items.Count - 1 do
    begin
      if lbxFields.Selected[i] then
      begin
        f := TEditDialogField(lbxFields.Items.Objects[i]);
        f.DisplayWidth := n;
      end;
    end;
  end
  else
  begin
    MessageDlg(Format('DisplayWidth %s Inválido', [edtDisplayWidth.Text]), mtError, [mbOK], 0);
    edtDisplayWidth.SetFocus;
    Abort;
  end;
end;
procedure TFrmConfigurarCampos.ToggleActions;
begin
  actDeleteField.Enabled := lbxFields.SelCount > 0;
  actMoveFieldUp.Enabled := (lbxFields.SelCount = 1) and
                            (lbxFields.Items.Count > 1) and
                            (not lbxFields.Selected[0]);
  actMoveFieldDown.Enabled := (lbxFields.SelCount = 1) and
                              (lbxFields.Items.Count > 1) and
                              (not lbxFields.Selected[lbxFields.Items.Count - 1]);
end;

procedure TFrmConfigurarCampos.actTestarExecute(Sender: TObject);
begin
  AtualizarPropriedades();
  FSearchDialog.Pesquisar();
end;

function TFrmConfigurarCampos.AddField(FieldName, WhereSyntax,
  DisplayLabel: String; DisplayWidth, DisplayColumnWidth: Integer;
  DisplayFormat: String; FieldType: TFieldType;
  DefaultComparison: TSearchComparison;
  SearchCase: TSearchCase; Search: Boolean): Integer;
var
  mEditField : TEditDialogField;
begin
  mEditField := TEditDialogField.Create(nil);
  mEditField.FieldName           := FieldName;
  mEditField.WhereSyntax         := WhereSyntax;
  mEditField.DisplayLabel        := DisplayLabel;
  mEditField.DisplayWidth        := DisplayWidth;
  mEditField.DisplayColumnWidth  := DisplayColumnWidth;
  mEditField.DisplayFormat       := DisplayFormat;
  mEditField.FieldType           := FieldType;
  mEditField.DefaultComparison   := DefaultComparison;
  mEditField.SearchCase          := SearchCase;
  mEditField.Search              := Search;
  FormatarCampos(mEditField);
  Result := lbxFields.Items.AddObject(mEditField.FieldName, mEditField);
end;

procedure TFrmConfigurarCampos.FormatarCampos(aFieldObject: TEditDialogField);
begin
  if (aFieldObject.FieldType in [ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint, ftByte, ftBytes, ftLongWord]) then
  begin
    if trim(aFieldObject.DisplayFormat) = '' then
      aFieldObject.DisplayFormat := '';
  end
  else if (aFieldObject.FieldType in [ftString, ftWideString]) then
  begin
    aFieldObject.DefaultComparison := scContem;
    if trim(aFieldObject.DisplayFormat) = '' then
      aFieldObject.DisplayFormat := '';
  end
  else if (aFieldObject.FieldType in [ftFloat, ftCurrency, ftBCD]) then
  begin
    if trim(aFieldObject.DisplayFormat) = '' then
      aFieldObject.DisplayFormat := '###,##0.00';
  end
  else if (aFieldObject.FieldType in [ftDate]) then
  begin
    if trim(aFieldObject.DisplayFormat) = '' then
      aFieldObject.DisplayFormat := 'dd/mm/yyyy';
  end
  else if (aFieldObject.FieldType in [ftDateTime]) then
  begin
    if trim(aFieldObject.DisplayFormat) = '' then
      aFieldObject.DisplayFormat := 'dd/mm/yyyy hh:nn:ss';
  end
  else if (aFieldObject.FieldType in [ftTime]) then
  begin
    if trim(aFieldObject.DisplayFormat) = '' then
      aFieldObject.DisplayFormat := 'hh:mm:ss';
  end;
end;

procedure TFrmConfigurarCampos.ToggleProperties;
var
  Select: Boolean;
  MultiSelect : Boolean;
begin
  Select := lbxFields.SelCount = 1;
  MultiSelect := lbxFields.SelCount > 1;
  edtFieldname.Enabled := Select;
  edtWhereSyntax.Enabled := Select;
  edtDisplayLabel.Enabled := Select;
  edtDisplayWidth.Enabled := Select or MultiSelect;
  edtDisplayColumnWidth.Enabled := Select or MultiSelect;
  edtDisplayFormat.Enabled := Select or MultiSelect;
  cbxFieldType.Enabled := Select or MultiSelect;
  cbxDefaultComparison.Enabled := Select or MultiSelect;
  cbxSearchCase.Enabled := Select or MultiSelect;
  cbxSearch.Enabled := Select or MultiSelect;
end;

procedure TFrmConfigurarCampos.AtualizarFormulario;
var
  i : Integer;
begin
  if Trim(FSearchDialog.Configurar.SQL.Text) > '' then
  begin
    MemoSQL.Lines.Text := Trim(FSearchDialog.Configurar.SQL.Text);
  end;
  for i := 0 to FSearchDialog.Configurar.Campos.Count - 1 do
  begin
    with FSearchDialog.Configurar.Campos[i] do
    begin
      AddField(FieldName,
               WhereSyntax,
               DisplayLabel,
               DisplayWidth,
               DisplayColumnWidth,
               DisplayFormat,
               FieldType,
               DefaultComparison,
               SearchCase,
               Search);
    end;
  end;
  FDialogWidth := FSearchDialog.Configurar.FormWidth;
  FDialogHeight := FSearchDialog.Configurar.FormHeight;
end;
procedure TFrmConfigurarCampos.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmConfigurarCampos.btnOKClick(Sender: TObject);
begin
  AtualizarPropriedades;
  ModalResult := mrOK;
end;

procedure TFrmConfigurarCampos.AtualizarPropriedades;
begin
  ValidateSearchQuery;
  ValidateDefaultSearch;
  UpdateSearchDialog(FSearchDialog);
end;

procedure TFrmConfigurarCampos.cbxDefaultComparisonExit(Sender: TObject);
begin
  SetDefaultComparision;
end;

procedure TFrmConfigurarCampos.cbxDefaultComparisonKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SetDefaultComparision;
  end;
end;

procedure TFrmConfigurarCampos.SetDefaultComparision;
var
  i : Integer;
  f : TEditDialogField;
begin
  if lbxFields.Items.Count = 0 then
    Exit;
  if cbxFieldType.ItemIndex <> -1 then
  begin
    for i := 0 to lbxFields.Items.Count - 1 do
    begin
      if lbxFields.Selected[i] then
      begin
        f := TEditDialogField(lbxFields.Items.Objects[i]);
        f.DefaultComparison := TSearchComparison(cbxDefaultComparison.Items.Objects[cbxDefaultComparison.ItemIndex]);
      end;
    end;
  end;
end;

procedure TFrmConfigurarCampos.cbxFieldTypeExit(Sender: TObject);
begin
  SetFieldType;
end;

procedure TFrmConfigurarCampos.cbxFieldTypeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SetFieldType;
  end;
end;

procedure TFrmConfigurarCampos.cbxSearchCaseExit(Sender: TObject);
begin
  SetSearchCase;
end;

procedure TFrmConfigurarCampos.cbxSearchCaseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SetSearchCase;
  end;
end;

procedure TFrmConfigurarCampos.cbxSearchExit(Sender: TObject);
begin
  SetSearch;
end;

procedure TFrmConfigurarCampos.cbxSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SetSearch;
  end;
end;

procedure TFrmConfigurarCampos.SetSearch;
var
  i : Integer;
  f : TEditDialogField;
begin
  if lbxFields.Items.Count = 0 then
    Exit;
  if cbxFieldType.ItemIndex <> -1 then
  begin
    for i := 0 to lbxFields.Items.Count - 1 do
    begin
      if lbxFields.Selected[i] then
      begin
        f := TEditDialogField(lbxFields.Items.Objects[i]);
        f.Search := (cbxSearch.ItemIndex = Ord(True));
      end;
    end;
  end;
end;

procedure TFrmConfigurarCampos.SetFieldType;
var
  i : Integer;
  f : TEditDialogField;
begin
  if lbxFields.Items.Count = 0 then
    Exit;
  if cbxFieldType.ItemIndex <> -1 then
  begin
    for i := 0 to lbxFields.Items.Count - 1 do
    begin
      if lbxFields.Selected[i] then
      begin
        f := TEditDialogField(lbxFields.Items.Objects[i]);
        f.FieldType := TFieldType(cbxFieldType.Items.Objects[cbxFieldType.ItemIndex]);
      end;
    end;
  end;
end;

procedure TFrmConfigurarCampos.SetSearchCase;
var
  i : Integer;
  f : TEditDialogField;
begin
  if lbxFields.Items.Count = 0 then
    Exit;
  if cbxFieldType.ItemIndex <> -1 then
  begin
    for i := 0 to lbxFields.Items.Count - 1 do
    begin
      if lbxFields.Selected[i] then
      begin
        f := TEditDialogField(lbxFields.Items.Objects[i]);
        f.SearchCase := TSearchCase(cbxSearchCase.Items.Objects[cbxSearchCase.ItemIndex]);
      end;
    end;
  end;
end;

end.
