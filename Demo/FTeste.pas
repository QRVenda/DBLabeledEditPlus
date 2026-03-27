{---------------------------------------------------------------------------+
|                                                                           |
|  Unit.........: DBLabeledEditPlus.pas                                     |
|  Componente...: "DBLabeledEditPlus"                                       |
|  Herança......: "TDBLabeledEdit" (nativo do Delphi)                       |
|  Descrição....: Componente de pesquisa. As funcionalidades extras estão   |
|                 na propriedade "Configurar"                               |
|                                                                           |
|  Data.........: 15/07/2024 - 22:03h                                       |
|  Autoria......: Adriano Zanini                                            |
|                                                                           |
+---------------------------------------------------------------------------}

unit FTeste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Vcl.Menus,
  FireDAC.Comp.DataSet, Vcl.ExtCtrls, DBLabeledEditPlus, Vcl.Buttons;

type
  Ts = class(TForm)
    DBConexao: TFDConnection;
    FDTransacao: TFDTransaction;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    LabeledEdit1: TLabeledEdit;
    DBLabeledEditPlus1: TDBLabeledEditPlus;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLabeledEditPlus1GetRetorno(const aConfirmado: Boolean;
      const aChave, aResultado: string);
  private
    { Private declarations }
  protected
    
  public
    { Public declarations }
  end;

var
  s: Ts;

implementation

{$R *.dfm}

procedure Ts.BitBtn1Click(Sender: TObject);
begin
  DBLabeledEditPlus1.Pesquisar;
end;

procedure Ts.FormCreate(Sender: TObject);
begin
  DBConexao.Close;
end;

procedure Ts.DBLabeledEditPlus1GetRetorno(const aConfirmado: Boolean;
  const aChave, aResultado: string);
begin
  if aConfirmado then
    Showmessage('Confirmado: ' + aConfirmado.ToString(True)  + ' | Chave: ' + aChave + ' | aResultado: ' + aResultado)
  else
    Showmessage('Cancelado');
end;

procedure Ts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DBConexao.Close;
end;

procedure Ts.FormShow(Sender: TObject);
begin
  DBConexao.Open;
  FDQuery1.Close;
end;


end.

