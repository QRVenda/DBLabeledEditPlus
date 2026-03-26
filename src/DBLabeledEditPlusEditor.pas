{==============================================================================]
[ Arquivo        : DBLabeledEditPlusEditor.pas                                 ]
[ Componente     : TDBLabeledEditPlus                                          ]
[ Descrição      : Registra e instala o componente na palheta 'Samples'        ]
[------------------------------------------------------------------------------]
[ Criado em      : julho/2025                                                  ]
[ Última modif.  : setembro/2025                                               ]
[------------------------------------------------------------------------------]
[ Autor          : Adriano Zanini                                              ]
[ Versão         : 1.0.2                                                       ]
[==============================================================================}

unit DBLabeledEditPlusEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DesignIntF, DesignEditors,
  DBLabeledEditPlus, FDBLabeledEditPlusConfig;

type

  TFrmConfigurarCamposClass = class of TFrmConfigurarCampos;

  TDBLabeledEditPlusEditor = class(TComponentEditor)
  private
    FSearchDialog : TDBLabeledEditPlus;
    procedure Configurar;
    procedure Testar;
    function GetEditDialog: TDBLabeledEditPlus;
    procedure SetEditDialog(const Value: TDBLabeledEditPlus);
    property SearchDialog : TDBLabeledEditPlus read FSearchDialog write SetEditDialog;
  public
    function GetVerbCount : integer; override;
    function GetVerb (Index : integer): string; override;
    procedure ExecuteVerb (Index : integer); override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TDBLabeledEditPlus]);
  RegisterComponentEditor(TDBLabeledEditPlus, TDBLabeledEditPlusEditor);
end;

{ TDBLabeledEditPlusEditor }
function TDBLabeledEditPlusEditor.GetEditDialog: TDBLabeledEditPlus;
begin
  Result := TDBLabeledEditPlus(Component);
end;

procedure TDBLabeledEditPlusEditor.ExecuteVerb(Index: integer);
begin
  inherited;
  case Index of
    0 : Configurar;
    1 : Testar;
  end;
end;

function TDBLabeledEditPlusEditor.GetVerb(Index: integer): string;
begin
  case Index of
    0 : Result := 'Configurar...';
    1 : Result := 'Testar...';
  end;
end;

function TDBLabeledEditPlusEditor.GetVerbCount: integer;
begin
   Result := 2;
end;

procedure TDBLabeledEditPlusEditor.SetEditDialog(const Value: TDBLabeledEditPlus);
begin
  FSearchDialog := Value;
end;

procedure TDBLabeledEditPlusEditor.Configurar;
begin
  FrmConfigurarCampos := TFrmConfigurarCampos.Create(Application);
  try
    FrmConfigurarCampos.Name := 'FormConfigurarCampos';
    FrmConfigurarCampos.SearchDialog := GetEditDialog;
    if FrmConfigurarCampos.ShowModal = mrOK then
      Designer.Modified;
  finally
    FrmConfigurarCampos.Free;
  end;
end;

procedure TDBLabeledEditPlusEditor.Testar;
begin
  FSearchDialog := GetEditDialog();
  FSearchDialog.Pesquisar;
end;

end.
