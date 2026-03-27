{==============================================================================]
[ Unit           : DBLabeledEditPlusStruct.pas                                 ]
[ Componente     : "TDBLabeledEditPlus"                                        ]
[ Escopo         : TCollection e TCollectionItem.                              ]
[------------------------------------------------------------------------------]
[ Versão         : 1.0.2                                                       ]
[ Criado em      : julho/2024                                                  ]
[ Última mod.    : março/2026                                                  ]
[------------------------------------------------------------------------------]
[ Copyright      : (c) 2024-2026 Adriano Zanini                                ]
[ Licença        : Apache License 2.0                                          ]
[                  https://www.apache.org/licenses/LICENSE-2.0                 ]
[ GitHub         : https://github.com/QRVenda                                  ]
[------------------------------------------------------------------------------]
[ Autor          : Adriano Zanini                                              ]
{==============================================================================}

unit DBLabeledEditPlusStruct;

interface
uses

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  System.Generics.Collections, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Menus,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Util,
  System.DateUtils,
  System.TypInfo,
  DBLabeledEditPlusConst;

type
  EEditDialog = class(Exception);

  TEditDialogField = class(TCollectionItem)
  private
    FFieldName            : String;
    FWhereSyntax          : String;
    FDisplayLabel         : String;
    FDisplayWidth         : Integer;
    FFieldType            : TFieldType;
    FSearch               : Boolean;
    FDisplayFormat        : String;
    FDisplayColumnWidth   : Integer;
    FDefaultComparison    : TSearchComparison;
    FSearchCase           : TSearchCase;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property FieldName           : String                  read FFieldName            write FFieldName;
    property WhereSyntax         : String                  read FWhereSyntax          write FWhereSyntax;
    property DisplayLabel        : String                  read FDisplayLabel         write FDisplayLabel;
    property DisplayFormat       : String                  read FDisplayFormat        write FDisplayFormat;
    property DisplayWidth        : Integer                 read FDisplayWidth         write FDisplayWidth;
    property DisplayColumnWidth  : Integer                 read FDisplayColumnWidth   write FDisplayColumnWidth;
    property FieldType           : TFieldType              read FFieldType            write FFieldType;
    property Search              : Boolean                 read FSearch               write FSearch;
    property DefaultComparison   : TSearchComparison       read FDefaultComparison    write FDefaultComparison;
    property SearchCase          : TSearchCase             read FSearchCase           write FSearchCase;
  end;

  TEditDialogFieldList = class(TCollection)
  private
    FOwner: TPersistent;
  protected
    function GetOwner: TPersistent; override;
    function GetEstSearchDialogField(Index: Integer): TEditDialogField; virtual;
    procedure SetDialogField(Index: Integer; const Value: TEditDialogField); virtual;
  public
    constructor Create(AOwner: TPersistent);
    procedure Add(FieldName: String;
                  WhereSyntax: String;
                  DisplayLabel: String;
                  DisplayWidth: Integer;
                  DisplayFormat: String;
                  DisplayColumnWidth: Integer;
                  FieldType: TFieldType;
                  Search: Boolean;
                  DefaultComparison: TSearchComparison;
                  SearchCase: TSearchCase); virtual;
    procedure Delete(FieldName: String); overload; virtual;
    function IndexOf(FieldName: String): Integer; virtual;
    function ItemByFieldName(FieldName: String): TEditDialogField;
    property SearchDialogFields[Index: Integer]: TEditDialogField  read GetEstSearchDialogField write SetDialogField; default;
  end;


  TRegistro = record
    FieldName: String;
    FieldValue: String;
    IsNull: Boolean;
  end;
  TRegistroArray = array of TRegistro;


  procedure SetStringPropertyByName(Obj: TObject; Prop: String; Value: String);
  function SearchComparisionText(SearchComparison: TSearchComparison): String;
  function OperatorText(SearchOperator: TOperator): String;
  function FieldTypeComparisons(FieldType: TFieldType): TSearchComparisons;
  function FieldTypeDefaultComparison(FieldType: TFieldType): TSearchComparison;

implementation

function FieldTypeDefaultComparison(FieldType: TFieldType): TSearchComparison;
var
  i : Integer;
begin
  // Resultado padrão
  Result := scIgual;
  // Na lista de equações padrão para campos, procure o tipo de campo
  for i := Low(VALIDCOMPARISONS) to High(VALIDCOMPARISONS) do
  begin
    // Se isso for encontrado, forneça as equações correspondentes
    if VALIDCOMPARISONS[i].FieldType = FieldType then
    begin
      Result := VALIDCOMPARISONS[i].DefaultComparison;
      Break;
    end;
  end;
end;

function FieldTypeComparisons(FieldType: TFieldType): TSearchComparisons;
var
  i : Integer;
begin
  Result := VALIDCOMPARISON_NONE;
  for i := Low(VALIDCOMPARISONS) to High(VALIDCOMPARISONS) do
  begin
    if VALIDCOMPARISONS[i].FieldType = FieldType then
    begin
      Result := VALIDCOMPARISONS[i].Comparisons;
      Break;
    end;
  end;
end;


procedure SetStringPropertyByName(Obj: TObject; Prop: String; Value: String);
var
  PropInfo : PPropInfo;
begin
  PropInfo := GetPropInfo(Obj.ClassInfo, Prop);
  if PropInfo <> nil then
    SetStrProp(Obj, PropInfo, Value);
end;

function SearchComparisionText(SearchComparison: TSearchComparison): String;
begin
  case SearchComparison of
    scMenos:               Result := '<';
    scMenosIgual:          Result := '<=';
    scIgual:               Result := '=';
    scMaior:               Result := '>';
    scMaiorIgual:          Result := '>=';
    scNaoIgual:            Result := '<>';
    scContem:              Result := _ComparisonContains;
    scIniciaCom:           Result := _ComparisonBeginsWith;
    scNaoInicia:           Result := _ComparisonNotBeginsWith;
    scNaoContem:           Result := _ComparisonNotContains;
    scTerminaCom:          Result := _ComparisonEndsWith;
    scNaoTerminaCom:       Result := _ComparisonNotEndsWith;
    scMenosCaractere:      Result := '<';
    scMenosCaractereIgual: Result := '<=';
    scIgualCaractere:      Result := '=';
    scCaractereMaior:      Result := '>';
    scMaiorCaractereIgual: Result := '>=';
    scNaoIgualCaractere:   Result := '<>';
  else
    raise Exception.Create('Pesquisa desconhecida');
  end;
end;
function OperatorText(SearchOperator: TOperator): String;
begin
  case SearchOperator of
    soAnd     : Result := 'and';
    soOr      : Result := 'or';
    soAndAll  : Result := 'and all';
    soOrAll   : Result := 'or all';
  else
    raise Exception.Create('Operador de pesquisa desconhecido');
  end;
end;

{ TEditDialogFieldList }
procedure TEditDialogFieldList.Add(FieldName, WhereSyntax, DisplayLabel: String;
  DisplayWidth: Integer; DisplayFormat: String; DisplayColumnWidth: Integer;
  FieldType: TFieldType; Search: Boolean; DefaultComparison: TSearchComparison;
  SearchCase: TSearchCase);
var
  f : TEditDialogField;
begin
  if IndexOf(FieldName) <> -1 then
    raise Exception.Create('Campo de diálogo de pesquisa duplicado');
  f := (inherited Add) as TEditDialogField;
  f.FieldName := FieldName;
  f.WhereSyntax := WhereSyntax;
  f.DisplayLabel := DisplayLabel;
  f.DisplayWidth := DisplayWidth;
  f.DisplayFormat := DisplayFormat;
  f.DisplayColumnWidth := DisplayColumnWidth;
  f.FieldType := FieldType;
  f.Search := Search;
  f.DefaultComparison := DefaultComparison;
  f.SearchCase := SearchCase;
end;

constructor TEditDialogFieldList.Create(AOwner: TPersistent);
begin
  inherited Create(TEditDialogField);
  FOwner := AOwner;
end;

procedure TEditDialogFieldList.Delete(FieldName: String);
var
  o : TObject;
begin
  o := ItemByFieldName(FieldName);
  if Assigned(o) then
    o.Free
  else
    raise Exception.CreateFmt('Item com nome do campo %s não encontrado', [FieldName]);
end;

function TEditDialogFieldList.GetEstSearchDialogField(
  Index: Integer): TEditDialogField;
begin
  Result := TEditDialogField(Items[Index]);
end;

function TEditDialogFieldList.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TEditDialogFieldList.IndexOf(FieldName: String): Integer;
var
  i : Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  begin
    if SameText(TEditDialogField(Items[i]).FieldName, FieldName) then
    begin
      Result := i;
      Break;
    end;
  end;
end;

function TEditDialogFieldList.ItemByFieldName(FieldName: String): TEditDialogField;
var
  i : Integer;
begin
  i := IndexOf(FieldName);
  if i <> -1 then
    Result := TEditDialogField(Items[i])
  else
    Result := nil;
end;

procedure TEditDialogFieldList.SetDialogField(Index: Integer;
  const Value: TEditDialogField);
begin
  Items[Index] := Value;
end;

{ TEditDialogField }
procedure TEditDialogField.AssignTo(Dest: TPersistent);
var
  DestAsEstSearchDialogField: TEditDialogField;
begin
  if Dest is TEditDialogField then
  begin
    DestAsEstSearchDialogField := (Dest as TEditDialogField);
    DestAsEstSearchDialogField.FieldName := FFieldName;
    DestAsEstSearchDialogField.WhereSyntax := FWhereSyntax;
    DestAsEstSearchDialogField.DisplayLabel := FDisplayLabel;
    DestAsEstSearchDialogField.DisplayWidth := FDisplayWidth;
    DestAsEstSearchDialogField.DisplayFormat := FDisplayFormat;
    DestAsEstSearchDialogField.FieldType := FFieldType;
    DestAsEstSearchDialogField.DefaultComparison := FDefaultComparison;
    DestAsEstSearchDialogField.DisplayColumnWidth := FDisplayColumnWidth;
    DestAsEstSearchDialogField.Search := FSearch;
    DestAsEstSearchDialogField.SearchCase := FSearchCase;
  end
  else
  begin
    inherited AssignTo(Dest);
  end;
end;

constructor TEditDialogField.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FFieldName := '';
  FWhereSyntax := '';
  FDisplayLabel := '';
  FDisplayFormat := '';
  FDisplayWidth := 0;
  FFieldType := ftUnknown;
  FDefaultComparison := scIgual;
  FDisplayColumnWidth := 0;
  FSearch := True;
  FSearchCase := scUpper;
end;

destructor TEditDialogField.Destroy;
begin
  inherited;
end;

end.

