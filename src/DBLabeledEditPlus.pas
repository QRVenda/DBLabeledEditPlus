{==============================================================================]
[ Unit           : DBLabeledEditPlus.pas                                       ]
[ Componente     : "TDBLabeledEditPlus"                                        ]
[ Herança        : "TDBLabeledEdit" (nativo do Delphi)                         ]
[ Escopo         : Componente para pesquisar registros. As funcionalidades     ]
[                  extras estão encapsuladas na propridade "Configurar".       ]
[ Criado em      : julho/2024                                                  ]
[ Última mod.    : março/2026                                                  ]
[------------------------------------------------------------------------------]
[ Licença        : Apache License 2.0                                          ]
[ Documentação   : https://www.apache.org/licenses                             ]
[                  Consulte o arquivo LICENSE para mais detalhes               ]
[------------------------------------------------------------------------------]
[ Autor          : Adriano Zanini                                              ]
[ Formação       : Engenharia de Software                                      ]
[ Competências   : Arquitetura de Software / C# / Delphi / PHP / Java          ]
[==============================================================================}

unit DBLabeledEditPlus;

interface

uses

  Winapi.Windows, Winapi.Messages, Winapi.CommCtrl, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  System.Generics.Collections, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Menus,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Util,
  System.DateUtils,
  System.TypInfo,
  Vcl.Themes,
  DBLabeledEditPlusConst,
  DBLabeledEditPlusStruct;

type

  TEditCloseEvent     = procedure(const aConfirmado: Boolean; const aChave, aResultado: string) of object;
  TDBLabeledEditEx    = Class;
  TSearchFieldList    = Class;

  //-------------------------------------------------------------------------------
  // Subclasse para definir tipo de objeto (Botão ou Label) para pesquisar
  //-------------------------------------------------------------------------------
  TAdicionaisEx = class(TPersistent)
  private
    FOwnerConfigurar      : TSearchFieldList;
    FTipoBotao            : TBotaoTipo;
    FLocalPosicao         : TLocalPosicao;
    FBotaoCaption         : String;
    FLabelWidth           : Integer;

    FResultadoPrefixo     : String; // No resultado da pesquisa coloca esse no inicio
    FResultadoSufixo      : String; // No resultado da pesquisa coloca esse no final

    FLabelColor           : TColor;
    FLabelFont            : TFont;
    FLabelResultado       : TLocalResultado;
    FLabelTransparent     : Boolean;

    procedure SetOwnerRecursoExtra(const Value: TSearchFieldList);

    procedure SetTipoPesquisa(const Value: TBotaoTipo);
    procedure SetBotaoCaption(const Value: String);

    procedure SetLocalPosicao(const Value: TLocalPosicao);
    procedure SetLabelResultado(const Value: TLocalResultado);
    procedure SetLabelWidth(const Value: Integer);
    procedure SetLabelFont(const Value: TFont);
    procedure SetLabelColor(const Value: TColor);
    procedure SetLabelTransparent(const Value: Boolean);
  protected
    function GetOwner: TPersistent; override;
  public
    Constructor Create(AOwner: TComponent);
    Destructor Destroy; override;

    property OwnerConfigurar     : TSearchFieldList    read FOwnerConfigurar       write SetOwnerRecursoExtra;
  published
    property BotaoTipo           : TBotaoTipo        read FTipoBotao             write  SetTipoPesquisa;
    property LocalPosicao        : TLocalPosicao     read FLocalPosicao          write  SetLocalPosicao;
    property BotaoCaption        : String            read FBotaoCaption          write  SetBotaoCaption;
    property LabelColor          : TColor            read FLabelColor            write  SetLabelColor;
    property LabelFont           : TFont             read FLabelFont             write  SetLabelFont;
    property LabelResultado      : TLocalResultado   read FLabelResultado        write  SetLabelResultado;
    property LabelTransparent    : Boolean           read FLabelTransparent      write  SetLabelTransparent stored  True default True;
    property LabelWidth          : Integer           read FLabelWidth            write  SetLabelWidth;
    [('No resultado da pesquisa coloca esse caractere no inicio')]
    property ResultadoPrefixo    : String            read FResultadoPrefixo      write  FResultadoPrefixo;
    [('No resultado da pesquisa coloca esse caractere no final')]
    property ResultadoSufixo     : String            read FResultadoSufixo       write  FResultadoSufixo;

  end;

  //-------------------------------------------------------------------------------
  // Subclasse propriedade de configuração
  //-------------------------------------------------------------------------------
  TSearchFieldList = class(TPersistent)
  private
    FEditButtonExtra     : TDBLabeledEditEx;
    FRecursoExtra        : TAdicionaisEx;
    FFormWidth           : Integer;
    FFormHeight          : Integer;
    FItems               : TEditDialogFieldList;
    FConnection          : TFDConnection;

    FCampoChave          : String;
    FCampoValor          : String;
    FCampoResultado      : String;
    FResultado           : String;
    FRegistroExiste      : Boolean;
    FMensagemVazio       : String;
    FMostrarTela         : Boolean;
    FEventoPesquisa      : TEventoPesquisa;
    FTeclaPesquisa       : TShortCut;
    FSQL                 : TStringList;
    FFiltro              : String;
    FExigirValidar       : Boolean;
    FTituloJanela        : String;

    procedure SetCollectionItems(Value: TEditDialogFieldList);
    procedure SetConnection(const Value: TFDConnection);
    procedure SetCampoResultado(const Value: String);
    procedure SetResultado(const Value: String);
    procedure SetWidthForm(const Value: Integer);
    procedure SetHeightForm(const Value: Integer);
    procedure SetSQL(const Value: TStringList);
    procedure SetMensagemVazio(const Value: String);
    procedure SetTeclaPesquisa(const Value: TShortCut);
    procedure SetOwnerConfigurar(const Value: TDBLabeledEditEx);

  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TPersistent);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function GetLarguraTeclaAtalho: Integer;

    procedure SetMostrarPosicaoLocal;

    property CampoValor           : String                read FCampoValor            write FCampoValor;
    property Resultado            : String                read FResultado             write SetResultado;
    property RegistroExiste       : Boolean               read FRegistroExiste        write FRegistroExiste;
    property EditButtonExtra      : TDBLabeledEditEx      read FEditButtonExtra       write SetOwnerConfigurar;

  published
    property TituloJanela         : String                read FTituloJanela          write FTituloJanela;
    property Campos               : TEditDialogFieldList  read FItems                 write SetCollectionItems;
    property CampoChave           : String                read FCampoChave            write FCampoChave;
    property CampoResultado       : String                read FCampoResultado        write SetCampoResultado;

    property Connection           : TFDConnection         read FConnection            write SetConnection;
    property MostrarTela          : Boolean               read FMostrarTela           write FMostrarTela   stored True default True;
    property ExigirValidar        : Boolean               read FExigirValidar         write FExigirValidar stored True default True;
    property TeclaPesquisa        : TShortCut             read FTeclaPesquisa         write SetTeclaPesquisa;
    property FormWidth            : Integer               read FFormWidth             write SetWidthForm   default _WIDTHFORM;
    property FormHeight           : Integer               read FFormHeight            write SetHeightForm  default _HEIGHTFORM;
    property MensagemVazio        : String                read FMensagemVazio         write SetMensagemVazio;
    property EventoPesquisa       : TEventoPesquisa       read FEventoPesquisa        write FEventoPesquisa;
    property Filtro               : String                read FFiltro                write FFiltro;
    property SQL                  : TStringList           read FSQL                   write SetSQL;
    property RecursoExtra         : TAdicionaisEx         read FRecursoExtra          write FRecursoExtra;

  end;

  //-------------------------------------------------------------------------------
  //
  //-------------------------------------------------------------------------------
  TDBLabeledEditEx = class(TDBLabeledEdit)
  private
    FTBLVirtual         : TFDMemTable;
    FDataSource         : TDataSource;
    FConfigurar         : TSearchFieldList;
    FBorderWidth        : TBorderWidth;
    FBorderStyle        : TBorderStyle;
    FResultRecord       : TRegistroArray;
    FTesteVirtual       : Boolean;
    FLabelClicar        : TLabel;
    FBotaoClicar        : TSpeedButton;
    FLabelMostrar       : TPanel;
    FOnGetRetorno       : TEditCloseEvent;
    procedure Instanciar;

    procedure SetConfigurar(Value: TSearchFieldList);
    function  GetAbout: String;
    procedure SetResultPesquisa();
    function  GetSQLResult(const aValue : String): Boolean;
    procedure SetLabelClicar(const Value: TLabel);
    procedure SetBotaoClicar(const Value: TSpeedButton);
    procedure SetLabelMostrar(const Value: TPanel);
  protected
    procedure Loaded(); override;
    //procedure VirtualDataSet;
    function  GetEnabled: boolean;  reintroduce;
    procedure SetEnabled(Value: boolean); reintroduce;
//    procedure BtnClicar(Sender: TObject); virtual;
    property  Enabled: boolean read GetEnabled write SetEnabled;
    procedure SetParent(AParent: TWinControl); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetName(const Value: TComponentName); override;
    procedure CMVisiblechanged(var Message: TMessage); message CM_VISIBLECHANGED;
    procedure SetarLabelHint;
    procedure SetarBotaoHint;
    procedure AbrirTelaPesquisa(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    function Pesquisar : Boolean;
    procedure VirtualDataSet;

    function GetResultRecord(Const aDataSet: TFDMemTable): TRegistroArray;
    function ResultAsString(const aCampo: String): String;
    function ResultAsInteger(const aCampo: String): Integer;
    function ResultAsDateTime(const aCampo: String): TDateTime;
    function ResultAsFloat(const aCampo: String): Double;
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer); override;


    property LabelClicar       : TLabel          read  FLabelClicar       write SetLabelClicar;
    property BotaoClicar       : TSpeedButton    read  FBotaoClicar       write SetBotaoClicar;
    property LabelMostrar      : TPanel          read  FLabelMostrar      write SetLabelMostrar;

  published
    property About             : String               read GetAbout            stored False;
    property Configurar        : TSearchFieldList     read FConfigurar         write SetConfigurar;
    property OnGetRetorno      : TEditCloseEvent      read FOnGetRetorno       write FOnGetRetorno;
    property AutoSelect;
  end;

  TDBLabeledEditPlus = class(TDBLabeledEditEx)
  private
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
  protected
    procedure EventoExit(Sender: TObject);
    procedure EventoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EventoChange(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;
    function ExecPesquisar(const aSQL : String): String;
  published
    property AutoSelect;
    property BorderStyle;
    property Color;
    property Ctl3d;
    property Enabled;
    property Name;
    property NumbersOnly;
    property Font;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    [Default(False)]
    property ReadOnly default False;
    property ShowHint;
    property TabOrder;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;

  end;
  TEstSearchDialogClass = class of TDBLabeledEditPlus;

  function AdjustedAlignment(RightToLeftAlignment: Boolean; Alignment: TAlignment): TAlignment;
  function GetTextWidth(const AText: string; AFont: TFont): Integer;

var
  vEditDialog : TDBLabeledEditPlus;

implementation

uses FDBLabeledEditPlusPesquisar, FDBLabeledEditPlusConfig,
  DBLabeledEditPlusUtils;

function AdjustedAlignment(RightToLeftAlignment: Boolean; Alignment: TAlignment): TAlignment;
begin
  Result := Alignment;
  if RightToLeftAlignment then
    case Result of
      taLeftJustify: Result := taRightJustify;
      taRightJustify: Result := taLeftJustify;
    end;
end;

function GetTextWidth(const AText: string; AFont: TFont): Integer;
var
  mBMP: TBitmap;
begin
  Result := 0;
  mBMP := TBitmap.Create;
  try
    mBMP.Canvas.Font.Assign(AFont);
    Result := mBMP.Canvas.TextWidth(AText);
  finally
    mBMP.Free;
  end;
end;

{ TAdicionaisEx }
constructor TAdicionaisEx.Create(AOwner: TComponent);
begin
  FLabelColor        := clBtnFace;
  FBotaoCaption      := '';
  FLabelResultado    := lmLabel;
  FLocalPosicao      := lpLado;
  FTipoBotao         := trBotao;
  FLabelWidth        := 200;

  if FLabelFont = nil then
  begin
    FLabelFont        := TFont.Create;
    FLabelFont.Color  := clBlack;
    FLabelFont.Name   := 'Segoe UI';
    FLabelFont.Size   := 9;
    FLabelFont.Style  := [fsBold];
  end;

  FResultadoPrefixo  := ''; // No resultado da pesquisa coloca esse no inicio
  FResultadoSufixo   := ''; // No resultado da pesquisa coloca esse no final
end;

destructor TAdicionaisEx.Destroy;
begin
  FreeAndNil(FLabelFont);
  inherited;
end;

function TAdicionaisEx.GetOwner: TPersistent;
begin
  Result := FOwnerConfigurar;
end;

procedure TAdicionaisEx.SetBotaoCaption(const Value: String);
begin
  FBotaoCaption := Trim(Value);
  case FTipoBotao of
    trBotao   : FOwnerConfigurar.FEditButtonExtra.SetarBotaoHint;
    trLabel   : FOwnerConfigurar.FEditButtonExtra.SetarLabelHint;
  end;

end;

procedure TAdicionaisEx.SetLabelColor(const Value: TColor);
begin
  FLabelColor := Value;
  if FLabelResultado = lmLabel then
  begin
    FOwnerConfigurar.SetMostrarPosicaoLocal();
    FOwnerConfigurar.EditButtonExtra.LabelMostrar.Color := FLabelColor;
  end;
end;

procedure TAdicionaisEx.SetLabelFont(const Value: TFont);
begin
  FLabelFont.Assign(Value);
  if FLabelResultado = lmLabel then
  begin
    FOwnerConfigurar.EditButtonExtra.LabelMostrar.Font.Assign(FLabelFont);
    FOwnerConfigurar.SetMostrarPosicaoLocal();
  end;
end;

procedure TAdicionaisEx.SetLabelWidth(const Value: Integer);
begin
  if FLabelWidth <> Value then
  begin
    FLabelWidth := Value;
    FOwnerConfigurar.SetMostrarPosicaoLocal();
  end;
end;

procedure TAdicionaisEx.SetLocalPosicao(const Value: TLocalPosicao);
begin
  if FLocalPosicao = Value then
    Exit;

  FLocalPosicao := Value;

  FOwnerConfigurar.SetMostrarPosicaoLocal();
end;

procedure TAdicionaisEx.SetLabelResultado(const Value: TLocalResultado);
begin
  if FLabelResultado = Value then
    Exit;

  FLabelResultado := Value;

  FOwnerConfigurar.EditButtonExtra.Instanciar();
  FOwnerConfigurar.SetMostrarPosicaoLocal();

end;

procedure TAdicionaisEx.SetLabelTransparent(const Value: Boolean);
begin
  FLabelTransparent := Value;
  if FLabelResultado = lmLabel then
    //FOwnerConfigurar.EditButtonExtra.LabelMostrar.Transparent := FLabelTransparent;

end;

procedure TAdicionaisEx.SetOwnerRecursoExtra(const Value: TSearchFieldList);
begin
  FOwnerConfigurar := Value;
end;

procedure TAdicionaisEx.SetTipoPesquisa(const Value: TBotaoTipo);
begin
  if FTipoBotao = Value then
    Exit;

  FTipoBotao := Value;
  OwnerConfigurar.EditButtonExtra.BotaoClicar.Visible := False;
  OwnerConfigurar.EditButtonExtra.LabelClicar.Visible := False;

  if FOwnerConfigurar.TeclaPesquisa = 0 then
  begin
    if FTipoBotao <> trNenhum then
    begin
      if (csReading in OwnerConfigurar.EditButtonExtra.Owner.ComponentState ) = False then
         ShowMessage('Primeiro defina uma Tecla de Pesquisa. Depois informe o Tipo de Pesquisa.');

      FTipoBotao := trNenhum;
    end;
  end;

  case FTipoBotao of
    trBotao    : OwnerConfigurar.EditButtonExtra.BotaoClicar.Visible := True;
    trLabel    : OwnerConfigurar.EditButtonExtra.LabelClicar.Visible := True;
    trOcultar  : OwnerConfigurar.EditButtonExtra.LabelClicar.Visible := False;
  end;

  case FTipoBotao of
    trBotao   : FOwnerConfigurar.FEditButtonExtra.SetarBotaoHint;
    trLabel   : FOwnerConfigurar.FEditButtonExtra.SetarLabelHint;
  end;

  OwnerConfigurar.SetMostrarPosicaoLocal();
end;

procedure TDBLabeledEditEx.Loaded;
var
  eTipoPesquisa : TEventoPesquisa;
begin
  eTipoPesquisa := FConfigurar.EventoPesquisa;
  FConfigurar.EventoPesquisa := epNaoPesquisar;
  try
    if (DataSource = nil) or (Trim(DataField).IsEmpty) or (DataSource.DataSet = nil) then
    begin
      VirtualDataSet;
    end;
  finally
    FConfigurar.EventoPesquisa :=  eTipoPesquisa;
  end;

  case FConfigurar.RecursoExtra.BotaoTipo of
    trBotao:  SetarBotaoHint;
    trLabel:  SetarLabelHint;
  end;

  inherited;
end;

procedure TDBLabeledEditEx.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  P: TPoint;
  mMargem    : Integer;
  mEsquerda  : Integer;
  mTopo      : Integer;
  mAltura    : Integer;

begin
  mMargem    := 0;
  mEsquerda  := 0;
  mTopo      := 0;
  mAltura    := 0;

  inherited SetBounds(ALeft, ATop, AWidth, AHeight);

  if not Assigned(FConfigurar) then
    Exit;

  mMargem := Self.Width - 2;

  mEsquerda  := Self.Left + mMargem;
  mTopo      := Self.Top - 1;
  mAltura    := Self.Height + 2;
  if FLabelClicar <> nil then
  begin
    FLabelClicar.Height := mAltura;
    FLabelClicar.SetBounds(mEsquerda + 3, mTopo, FLabelClicar.Width, FLabelClicar.Height);
  end;

  if FBotaoClicar <> nil then
  begin
    FBotaoClicar.Height := mAltura;
    FBotaoClicar.SetBounds(mEsquerda, mTopo, FBotaoClicar.Width, FBotaoClicar.Height);
  end;

  if FLabelMostrar <> nil then
  begin
    FLabelMostrar.Height := mAltura;
    FLabelMostrar.SetBounds(mEsquerda + 25, mTopo, FLabelMostrar.Width, FLabelMostrar.Height);
  end;
end;

procedure TDBLabeledEditEx.SetarLabelHint;
var
  mTecla : String;
begin
  FLabelClicar.Caption := '';
  FLabelClicar.Hint    := '';
  mTecla               := Trim(ShortCutToText(FConfigurar.FTeclaPesquisa));

  if Trim(FConfigurar.RecursoExtra.BotaoCaption) <> '' then
    mTecla := Trim(FConfigurar.RecursoExtra.BotaoCaption);

  FLabelClicar.Caption  := '';
  FLabelClicar.Hint     := '';
  if mTecla <> '' then
  begin
    FLabelClicar.Caption  := mTecla;
    FLabelClicar.Hint     := 'Tecle ' + mTecla + ' para pesquisar';
  end;
end;

procedure TDBLabeledEditEx.SetarBotaoHint;
var
  mTecla : String;
begin
  FBotaoClicar.Caption := '';
  FBotaoClicar.Hint    := '';
  mTecla             := Trim(ShortCutToText(FConfigurar.FTeclaPesquisa));

  if Trim(FConfigurar.RecursoExtra.BotaoCaption) <> '' then
    mTecla := Trim(FConfigurar.RecursoExtra.BotaoCaption);

  FBotaoClicar.Caption  := '';
  FBotaoClicar.Hint     := '';
  if mTecla <> '' then
  begin
    FBotaoClicar.Caption  := mTecla;
    FBotaoClicar.Hint     := 'Tecle ' + mTecla + ' para pesquisar';
  end;
end;

procedure TDBLabeledEditEx.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
end;

procedure TDBLabeledEditEx.CMVisiblechanged(var Message: TMessage);
begin
  inherited;
  if assigned(FLabelClicar) then
    FLabelClicar.Visible := Visible;

  if assigned(FBotaoClicar) then
    FBotaoClicar.Visible := Visible;

  if assigned(FLabelMostrar) then
    FLabelMostrar.Visible := Visible;

end;

constructor TDBLabeledEditEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  if Trim(Self.Name) = '' then
    Self.Name := '_TDBLabeledEditEx_' + ''  +  '_' +  Random(255).ToString;

  Self.EditLabel.Caption := 'Label';

  SetLength(FResultRecord, 0);
  Self.Width            := 65;
  FConfigurar           := TSearchFieldList.Create(Self);

  TabStop               := True;
  FTesteVirtual         := False;

  FDataSource           := TDataSource.Create(Nil);
  FDataSource.Name      := '_virtual1_';
  DataSource            := FDataSource;

  FLabelClicar            := TLabel.Create(Self.Parent);
  FLabelClicar.Parent     := Self.Parent;
  FLabelClicar.AutoSize   := False;
  FLabelClicar.Layout     := tlCenter;
  FLabelClicar.ShowHint   := True;
  FLabelClicar.Font.Size  := 9;
  FLabelClicar.Font.Name  := 'Segoe UI';
  FLabelClicar.Font.Style := [fsBold];
  FLabelClicar.Cursor     := crHandPoint;
  FLabelClicar.OnClick    := AbrirTelaPesquisa;
  if (csDesigning in ComponentState ) then
  begin
    FLabelClicar.Cursor     := crArrow;
    FLabelClicar.OnClick    := Nil;
  end;
  SetarLabelHint;
  FLabelClicar.Visible := False;

  FBotaoClicar            := TSpeedButton.Create(Self.Parent);
  FBotaoClicar.Parent     := Self.Parent;
  FBotaoClicar.ShowHint   := True;
  FBotaoClicar.Cursor     := crHandPoint;
  FBotaoClicar.OnClick    := AbrirTelaPesquisa;
  if (csDesigning in ComponentState ) then
  begin
    FBotaoClicar.Cursor     := crArrow;
    FBotaoClicar.OnClick    := Nil;
  end;

  Instanciar();
  SetarBotaoHint;

end;

destructor TDBLabeledEditEx.Destroy;
begin
  if FTBLVirtual <> Nil then
  begin
    FTBLVirtual.Release;
    FTBLVirtual := nil;
  end;

  FConfigurar.Free;
  inherited;
end;

procedure TDBLabeledEditEx.AbrirTelaPesquisa(Sender: TObject);
begin
  Pesquisar();
end;

// -------------------------------------------------------------------------------
// Esse Metodo cria dataset virtual para permitir edição no campo quando
// nenhum datasource (vinculado a um dataset) foi definido pelo programador
// -------------------------------------------------------------------------------
procedure TDBLabeledEditEx.VirtualDataSet;
begin
  if FTBLVirtual = Nil then
    FTBLVirtual := TFDMemTable.Create(Nil);

  if DataSource = Nil then
    DataSource := FDataSource;

  if DataSource.DataSet = Nil then
    DataSource.DataSet := FTBLVirtual;

  DataField            := _CAMPOVIRTUAL;

  FTBLVirtual.FieldDefs.Add(_CAMPOVIRTUAL, ftString, _MAXLENGTH, False);

  FTBLVirtual.CreateDataSet;
end;

procedure TDBLabeledEditEx.SetResultPesquisa();
begin
  if not Assigned(FLabelMostrar) then
    Exit;

  if FConfigurar.RecursoExtra.LabelResultado = lmNenhum then
    Exit;

  LabelMostrar.Caption := FConfigurar.RecursoExtra.ResultadoPrefixo + FConfigurar.Resultado + FConfigurar.RecursoExtra.ResultadoSufixo;
end;

//procedure TDBLabeledEditEx.BtnClicar(Sender: TObject);
//begin
//  Pesquisar;
//end;

function TDBLabeledEditEx.GetAbout: String;
begin
   Result := 'DBLabeledEditPlus - ' + YearOf(date).ToString;
end;

function TDBLabeledEditEx.GetEnabled: boolean;
begin
  Result := inherited Enabled;
end;

procedure TDBLabeledEditEx.SetEnabled(Value: boolean);
begin
  inherited Enabled := Value;
end;

procedure TDBLabeledEditEx.SetLabelClicar(const Value: TLabel);
begin
  FLabelClicar.Assign(value);
end;

procedure TDBLabeledEditEx.SetLabelMostrar(const Value: TPanel);
begin
  if FLabelMostrar = nil then
    Exit;
  FLabelMostrar.Assign(value);

  FConfigurar.SetMostrarPosicaoLocal();
end;

procedure TDBLabeledEditEx.SetParent(AParent: TWinControl);
begin
  inherited SetParent(AParent);

  if Assigned(FLabelClicar) then
  begin
    FLabelClicar.Parent := AParent;
  end;

  if Assigned(FBotaoClicar) then
  begin
    FBotaoClicar.Parent := AParent;
  end;

  if Assigned(FLabelMostrar) then
  begin
    FLabelMostrar.Parent := AParent;
  end;

end;

procedure TDBLabeledEditEx.SetBotaoClicar(const Value: TSpeedButton);
begin
  FBotaoClicar.Assign(value);
end;

procedure TDBLabeledEditEx.SetConfigurar(Value: TSearchFieldList);
begin
  FConfigurar.Assign(Value);
end;

procedure TDBLabeledEditEx.SetName(const Value: TComponentName);
var
  LClearText: Boolean;
begin

  if (csDesigning in ComponentState) and (FLabelClicar <> nil) and
     ((FLabelClicar.GetTextLen = 0) or
     (CompareText(FLabelClicar.Caption, Name) = 0)) then
  begin
    FLabelClicar.Caption := '<>';
  end;

  if (csDesigning in ComponentState) and (FBotaoClicar <> nil) and
     ((FBotaoClicar.GetTextLen = 0) or
     (CompareText(FBotaoClicar.Caption, Name) = 0)) then
  begin
    FBotaoClicar.Caption := '<>';
  end;

  LClearText := (csDesigning in ComponentState) and (Text = '');

  inherited SetName(Value);
  if LClearText then
    Text := '';
end;

procedure TSearchFieldList.Assign(Source: TPersistent);
var
  DestSearchDialog : TSearchFieldList;
begin
  if Source is TSearchFieldList then
  begin
    Campos      := TSearchFieldList(Source).FItems;
    Connection  := FConnection;
    SQL.Text    := FSQL.Text;
  end
  else
    inherited Assign(Source);
end;

constructor TSearchFieldList.Create(AOwner: TPersistent);
begin
  inherited Create;

  FTituloJanela    := _TITULO_JANELA;
  FSQL             := TStringList.Create;
  FItems           := TEditDialogFieldList.Create(Self);
  FCampoValor      := '';
  FCampoChave      := '';
  Resultado        := '';
  FFiltro          := '';
  RegistroExiste   := False;
  FMostrarTela     := True;
  FExigirValidar   := True;
  FEventoPesquisa  := epQuandoDigitar;
  FFormWidth       := _WIDTHFORM;
  FFormHeight      := _HEIGHTFORM;
  FMensagemVazio   := '["%s" não encontrado]';
  FTeclaPesquisa   := VK_F2; // F2 é padrão

  FRecursoExtra  := TAdicionaisEx.Create(Nil);
  FRecursoExtra.FOwnerConfigurar := Self;

end;

destructor TSearchFieldList.Destroy;
begin
  FRecursoExtra.Free;
  FItems.Free;
  FSQL.Free;
  inherited Destroy;
end;

function TSearchFieldList.GetLarguraTeclaAtalho: Integer;
begin
  Result := GetTextWidth(Trim(ShortCutToText(FTeclaPesquisa)), EditButtonExtra.Font ) + 10;
end;

function TSearchFieldList.GetOwner: TPersistent;
begin
  Result := FEditButtonExtra;
end;

procedure TSearchFieldList.SetCollectionItems(Value: TEditDialogFieldList);
begin
  FItems.Assign(Value);
end;

procedure TSearchFieldList.SetConnection(const Value: TFDConnection);
begin
  FConnection := Value;
end;

procedure TSearchFieldList.SetCampoResultado(const Value: String);
begin
  if Trim(FCampoResultado) <> Trim(Value) then
    FCampoResultado := Trim(Value);
end;

procedure TSearchFieldList.SetOwnerConfigurar(const Value: TDBLabeledEditEx);
begin
  FEditButtonExtra := Value;
end;

procedure TSearchFieldList.SetResultado(const Value: String);
begin
  if Trim(FResultado) <> Trim(Value) then
    FResultado := Trim(Value);
end;

procedure TSearchFieldList.SetSQL(const Value: TStringList);
begin
  FSQL.Assign(Value);
end;

procedure TSearchFieldList.SetTeclaPesquisa(const Value: TShortCut);
begin
  if FTeclaPesquisa <> Value then
  begin
    FTeclaPesquisa := Value;

    if FTeclaPesquisa = 0 then
    begin
      FRecursoExtra.SetTipoPesquisa(trNenhum)
    end
    else
    begin
      if FRecursoExtra.BotaoTipo = trNenhum then
      begin
        FRecursoExtra.SetTipoPesquisa(trBotao);
      end;
    end;

    if FRecursoExtra.BotaoTipo = trBotao then
      EditButtonExtra.BotaoClicar.Width :=  GetLarguraTeclaAtalho()
    else if FRecursoExtra.BotaoTipo = trLabel then
      EditButtonExtra.LabelClicar.Width :=  GetLarguraTeclaAtalho();

    case FRecursoExtra.BotaoTipo of
      trBotao :  EditButtonExtra.SetarBotaoHint;
      trLabel :  EditButtonExtra.SetarLabelHint;
    end;
  end;
end;

procedure TSearchFieldList.SetWidthForm(const Value: Integer);
begin
  if FFormWidth <> Value then
  begin
    if Value >= _WIDTHFORM then
      FFormWidth := Value
    else
      FFormWidth := _WIDTHFORM;
  end;
  if Value > Screen.Width then
    FFormWidth := (Screen.Width - 100);
end;

procedure TSearchFieldList.SetHeightForm(const Value: Integer);
begin
  if FFormWidth <> Value then
  begin
    if Value >= _HEIGHTFORM then
      FFormHeight := Value
    else
      FFormHeight := _HEIGHTFORM;
  end;
  if Value > Screen.Height then
    FFormWidth := (Screen.Height - 100);
end;

procedure TSearchFieldList.SetMensagemVazio(const Value: String);
begin
  if FMensagemVazio <> Value then
    FMensagemVazio := Trim(Value);
end;

procedure TSearchFieldList.SetMostrarPosicaoLocal;
var
  P: TPoint;
  Largura    : Integer;
  mEsquerda  : Integer;
  mTopo      : Integer;
  mAltura    : Integer;
begin
  Largura    := 0;
  mEsquerda  := 0;
  mTopo      := 0;
  mAltura    := 0;

  if not Assigned(FEditButtonExtra) then
    Exit;

  if FRecursoExtra.LabelResultado  = lmNenhum then
    Exit;

  if FRecursoExtra.LabelResultado = lmLabel then
  begin
    FEditButtonExtra.LabelMostrar.Width := FRecursoExtra.LabelWidth;
    FEditButtonExtra.LabelMostrar.Color := FRecursoExtra.LabelColor;
  end;

  mTopo      := FEditButtonExtra.Top - 1;
  mAltura    := FEditButtonExtra.Height + 2;
  Largura    := FEditButtonExtra.Width;

  case FRecursoExtra.BotaoTipo of
    trNenhum  : Largura := Largura + 3;
    trLabel   : Largura := Largura + FEditButtonExtra.LabelClicar.Width;
    trBotao   : Largura := Largura + FEditButtonExtra.BotaoClicar.Width;
  end;
  mEsquerda  := FEditButtonExtra.Left + Largura;

  if (FRecursoExtra.LocalPosicao = lpAbaixo)  then
  begin
    mTopo      := FEditButtonExtra.Top + FEditButtonExtra.Height + 3;
    mEsquerda  := FEditButtonExtra.Left;
  end;

  case FRecursoExtra.LabelResultado of
    lmLabel : begin
                FEditButtonExtra.LabelMostrar.Height := mAltura;
                FEditButtonExtra.LabelMostrar.SetBounds(mEsquerda, mTopo, FEditButtonExtra.LabelMostrar.Width, FEditButtonExtra.LabelMostrar.Height);
              end;

  end;
end;

{ TDBLabeledEditPlus }
procedure TDBLabeledEditPlus.CNNotify(var Message: TWMNotify);
begin
 // hand off control of the selection to the boss i.e. the espDateEdit that I belong to
  // skip for demo ... just closeup
  if ( Message.NMHdr^.code = MCN_SELECT) then
    EventoExit(Self);

  inherited;
end;

constructor TDBLabeledEditPlus.Create(AOwner: TComponent);
begin
  inherited;

  if Trim(Self.Name) = '' then
    Self.Name := '_TDBLabeledEditPlus_' + Random(255).ToString;

  TabStop     := True;
  OnKeyDown   := EventoKeyDown;
  OnChange    := EventoChange;
  OnExit      := EventoExit;

  FConfigurar.FEditButtonExtra := Self;
  FConfigurar.EventoPesquisa   := epQuandoDigitar;

  FConfigurar.RecursoExtra.LocalPosicao     := lpLado;
  FConfigurar.RecursoExtra.LabelResultado   := lmLabel;
  FConfigurar.RecursoExtra.BotaoTipo        := trBotao;
  FConfigurar.RecursoExtra.LabelWidth       := 400;
  FConfigurar.RecursoExtra.LabelColor       := clActiveBorder;
  FConfigurar.RecursoExtra.LabelTransparent := False;
  FConfigurar.RecursoExtra.FLabelResultado  := lmLabel;
  FConfigurar.RecursoExtra.FLocalPosicao    := lpLado;
  FConfigurar.RecursoExtra.FTipoBotao       := trBotao;

end;

destructor TDBLabeledEditPlus.Destroy;
begin
  inherited Destroy;
end;

procedure TDBLabeledEditPlus.EventoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (FConfigurar.TeclaPesquisa <> 0)  and (FConfigurar.FTeclaPesquisa = ShortCut(Key, KeyDataToShiftState(Key))  ) then
  begin
    Key := 0;
    if FConfigurar.MostrarTela then
      Pesquisar;
  end;

end;

procedure TDBLabeledEditPlus.EventoChange(Sender: TObject);
begin

  if (csDesigning in ComponentState ) then
    Exit;

  if FConfigurar.EventoPesquisa = epQuandoDigitar  then
  begin
    if FConfigurar.Connection = nil  then
      Exit;

    FConfigurar.RegistroExiste := False;

    if Trim(Self.Text).IsEmpty then
    begin
      FConfigurar.Resultado := '';
      SetResultPesquisa();
      Exit;
    end;

    GetSQLResult(Trim(Self.Text));
  end;
end;

procedure TDBLabeledEditPlus.EventoExit(Sender: TObject);
var
  sMensagem    : String;
  cTituloCampo : String;
  cValorCampo  : String;

begin
  if (csDesigning in ComponentState ) then
    Exit;

  if FConfigurar.ExigirValidar then
  begin
    cValorCampo  := Trim(DataSource.DataSet.FieldByName(Self.DataField).AsString);
    if cValorCampo <> '' then
    begin
      if FConfigurar.EventoPesquisa <> epNaoPesquisar  then
      begin
        if not FConfigurar.RegistroExiste then
        begin
          if (DataSource.DataSet.State in [dsEdit, dsInsert] )then
          begin
            cTituloCampo := Self.EditLabel.Caption;
            sMensagem    := Format('%s "%s" não encontrado.', [cTituloCampo, cValorCampo ]);
            Informar('Registro não encontrado.',
                      sMensagem +
                      sLineBreak +
                      'Dica: Se preferir tecle ' + Trim(ShortCutToText(FConfigurar.FTeclaPesquisa)) + ' para pesquisar.',
                      'Campo "' + cTituloCampo + '"');
            DataSource.DataSet.FieldByName(Self.DataField).Clear;
            if Self.CanFocus then
              Self.SetFocus;

          end;
        end;
      end;
    end;
  end;
  inherited;
end;

function TDBLabeledEditPlus.ExecPesquisar(const aSQL : String): String;
begin
  Result := Unassigned;
  Result := Trim(FConfigurar.Connection.ExecSQLScalar(aSQL));
end;

function TDBLabeledEditEx.Pesquisar(): Boolean;
var
  bConfirmado : Boolean;
begin
  Result := False;
  bConfirmado := False;
  FTesteVirtual := false;

  if FDataSource = nil then
    exit;

//  if FConfigurar.RecursoExtra.BotaoTipo = trNenhum then
//    Exit;

  if (Trim(LowerCase(FDataSource.Name)) = Trim(LowerCase(DataSource.Name))) then;
    FTesteVirtual := True;

  if FConfigurar.Connection = nil then
    raise Exception.Create(format(_PROPRIEDADE_VAZIA, ['Connection']));

  if FConfigurar.Campos.Count < 0 then
    raise Exception.Create(format(_PROPRIEDADE_VAZIA, ['Campos']));

  if Trim(Self.Configurar.CampoChave).IsEmpty then
    raise Exception.Create(format(_PROPRIEDADE_VAZIA, ['CampoChave']));

  if Trim(Self.Configurar.CampoResultado).IsEmpty then
    raise Exception.Create(format(_PROPRIEDADE_VAZIA, ['CampoResultado']));

  try
    FrmDBLabeledEditPlusPesquisar := TFrmDBLabeledEditPlusPesquisar.Create(nil);
    FrmDBLabeledEditPlusPesquisar.Caption := _TITULO_JANELA;
    FrmDBLabeledEditPlusPesquisar.LblBarraTitulo.Caption := FConfigurar.TituloJanela;
    FrmDBLabeledEditPlusPesquisar.Busca := FConfigurar;
    FrmDBLabeledEditPlusPesquisar.Width := FConfigurar.FormWidth;
    bConfirmado := FrmDBLabeledEditPlusPesquisar.ShowModal= mrOk;

    if not bConfirmado then
    begin
      if Assigned(FOnGetRetorno) then
      begin
        FOnGetRetorno(False, String(''), String(''));
      end;
      Exit;
    end;

    SetLength(FResultRecord, 0);
    FResultRecord := GetResultRecord(FrmDBLabeledEditPlusPesquisar.DataSetOut);

    // Somente se não estiver em modo leitura
    if not TFDQuery(DataSource.DataSet).UpdateOptions.ReadOnly then
    begin
      if not (DataSource.DataSet.State in [dsEdit, dsInsert] )then
      begin
        DataSource.DataSet.Edit;
      end;
      DataSource.DataSet.FieldByName(Self.DataField).AsString := FConfigurar.CampoValor;
      if Assigned(Self.Parent) then
        Self.SelStart := Length(Self.Text) + 1; // focar no final fo campo

      Application.ProcessMessages;
    end
    else
    begin
      Informar('Registro está somente em modo leitura.', 'Não é permitido alteração', 'Proteção de Registro');
    end;

  finally
    FrmDBLabeledEditPlusPesquisar.Free;
  end;

  Result := True;
  if ((Result) and (Trim(FConfigurar.CampoValor) <> '')) then
  begin
    if Assigned(FOnGetRetorno) then
    begin
      FOnGetRetorno(True, String(FConfigurar.CampoValor), String(FConfigurar.Resultado));
    end;
  end;

end;

function TDBLabeledEditEx.GetSQLResult(const aValue : String): Boolean;
var
  mDataSet   : TDataSet;
  mWhere     : String;
  mScript    : String;
  i          : Integer;
  mCampo     : TEditDialogField;
  mFieldType : TFieldType;
begin
  Result := False;
  if Trim(aValue) = '' then
    Exit;

  if FConfigurar.EventoPesquisa = epNaoPesquisar then
    Exit;

  FConfigurar.Resultado := '';
  mScript := Trim(FConfigurar.SQL.Text);

  if mScript = '' then
    exit;

  FConfigurar.RegistroExiste := False;

  for i := 0 to FConfigurar.Campos.Count - 1 do
  begin
    mCampo := TEditDialogField(FConfigurar.Campos[i]);
    if mCampo.FieldName = FConfigurar.CampoChave then
    begin
      mFieldType := mCampo.FieldType;
      Break;
    end;
  end;

  mWhere := '';
  if (mFieldType in [ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint, ftByte, ftBytes, ftLongWord]) then
  begin
    mWhere := FConfigurar.CampoChave + ' = ' + StringReplace(aValue, '.', '', [rfReplaceAll]);
  end
  else
  begin
    mWhere := FConfigurar.CampoChave + ' = ' + QuotedStr(aValue)
  end;

  mScript := StringReplace(mScript, WHERE_TAG, mWhere, [rfIgnoreCase]);
  try
    FConfigurar.Connection.ExecSQL(mScript, nil, mDataSet);
    if not mDataSet.Active then
      Exit;

    // Fazer os devidos tratamentos caso não tenha encontrado.
    if mDataSet.IsEmpty then
    begin
      FConfigurar.Resultado := Format(FConfigurar.MensagemVazio, [aValue]);
      Exit;
    end;

    FConfigurar.Resultado := Trim(mDataSet.FieldByName(FConfigurar.CampoResultado).AsString);
    FConfigurar.RegistroExiste := (FConfigurar.Resultado <> '');
  finally
    SetResultPesquisa();
    mDataSet.Close;
    mDataSet.Free;
  end;

  Result := FConfigurar.RegistroExiste;
end;

procedure TDBLabeledEditEx.Instanciar;
begin

  if not Assigned(FConfigurar) then
    Exit;

  if FLabelMostrar <> nil then
     FreeAndNil(FLabelMostrar);

  if  FConfigurar.RecursoExtra.LabelResultado = lmNenhum then
    Exit;

  if FConfigurar.RecursoExtra.LabelResultado = lmLabel then
  begin
    FLabelMostrar                   := TPanel.Create(Self.Parent);
    FLabelMostrar.Name              := '_FMostrarTPanel_' + Random(255).ToString;
    FLabelMostrar.Parent            := Self.Parent;
    FLabelMostrar.Alignment         := taLeftJustify;
    FLabelMostrar.Enabled           := False; // Deixar desabilitado
    FLabelMostrar.Visible           := True;
    FLabelMostrar.AutoSize          := False;
    FLabelMostrar.AlignWithMargins  := True;
    FLabelMostrar.UseDockManager    := False;
    FLabelMostrar.BorderStyle       := bsNone;
    FLabelMostrar.BevelInner        := bvNone;
    FLabelMostrar.BevelKind         := bkTile;
    FLabelMostrar.BevelOuter        := bvNone;
    FLabelMostrar.BevelWidth        := 1;
    FLabelMostrar.BorderWidth       := 3;

    FLabelMostrar.ParentBackground  := False;
    FLabelMostrar.ParentColor       := False;
    FLabelMostrar.Color             :=  FConfigurar.RecursoExtra.LabelColor;
    FLabelMostrar.Caption           := '';

    FLabelMostrar.Font.Assign(FConfigurar.RecursoExtra.LabelFont);
  end;

end;

function TDBLabeledEditEx.GetResultRecord(Const aDataSet: TFDMemTable): TRegistroArray;
var
  i : Integer;
  f : TRegistro;
begin
  if (aDataSet.Active) and (not aDataSet.IsEmpty) then
  begin
    SetLength(Result, aDataSet.Fields.Count);
    for i := 0 to aDataSet.Fields.Count - 1 do
    begin
      f.FieldName := aDataSet.Fields[i].FieldName;
      f.FieldValue := aDataSet.Fields[i].AsString;
      f.IsNull := aDataSet.Fields[i].IsNull;
      Result[i] := f;
    end;
  end;
end;

function TDBLabeledEditEx.ResultAsString(const aCampo: String): String;
var
  i : Integer;
  mFound : Boolean;
begin
  mFound := False;
  for i := 0 to Length(FResultRecord) - 1 do
  begin
    if SameText(FResultRecord[i].FieldName, aCampo) then
    begin
      Result := FResultRecord[i].FieldValue;
      mFound := True;
      Break;
    end;
  end;
  if not mFound then
    raise EEditDialog.CreateFmt('Campo %s não encontrado.', [aCampo]);
end;

function TDBLabeledEditEx.ResultAsInteger(const aCampo: String): Integer;
begin
  Result := StrToInt(ResultAsString(aCampo));
end;

function TDBLabeledEditEx.ResultAsFloat(const aCampo: String): Double;
begin
  Result := StrToFloat(ResultAsString(aCampo));
end;

function TDBLabeledEditEx.ResultAsDateTime(const aCampo: String): TDateTime;
begin
  Result := StrToDateTime(ResultAsString(aCampo));
end;

end.

