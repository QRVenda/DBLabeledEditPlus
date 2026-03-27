{==============================================================================]
[ Unit           : DBLabeledEditPlusUtils.pas                                  ]
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

unit DBLabeledEditPlusUtils;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,  System.Variants,  System.Classes,
  System.DateUtils, System.StrUtils,  System.Math, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Comp.DataSet,
  Vcl.ExtCtrls;

  procedure VerificarConexao(aConnection: TFDConnection);
  procedure QueryCriar(var aQuery: TFDQuery; aConexao: TFDConnection);
  procedure QueryLiberar(var aQuery: TFDQuery);
  // Gera consulta SQL e copia todos registros para o objeto "TFDMemTable"
  procedure GetToMemTable(var aDataSet: TFDMemTable; const aSQL: String; aConnection: TFDConnection);
  function NormalizeFieldType(AType: TFieldType): TFieldType;
  procedure Informar(const aMensagem: String; aDica: String; aCaption: String = 'Atenção');
  procedure PlanarObjeto(aObjetos: TArray<TCustomControl>);

implementation

procedure VerificarConexao(aConnection: TFDConnection);
begin
  if aConnection = nil then
    Raise Exception.Create('Classe de banco de dados não foi definida.')
end;

procedure QueryCriar(var aQuery: TFDQuery; aConexao: TFDConnection);
begin
  VerificarConexao(aConexao);
  aQuery := TFDQuery.Create(nil);
  aQuery.Name := '_FDQuery_' + (aQuery.GetHashCode).ToString;
  aQuery.DisableControls; // A desativação dos controles acelera o desempenho, pois os dados não precisam ser gravados na tela a cada interação.
  aQuery.SQL.Clear;      // Já garantir que fique limpo
  aQuery.Connection := aConexao;
end;

procedure QueryLiberar(var aQuery: TFDQuery);
begin
  if aQuery = nil then
    Exit;
  aQuery.Close;
  FreeAndNil(aQuery);
end;

// --------------------------------------------------------------------------------
//  GetToMemTable():
//  Gera consulta SQL e copia todos registros para o objeto "TFDMemTable"
// --------------------------------------------------------------------------------
procedure GetToMemTable(var aDataSet: TFDMemTable; const aSQL: String; aConnection: TFDConnection);
var
  oQuery : TFDQuery;
begin
  aDataSet.DisableControls;
  if aDataSet.Active then
    aDataSet.EmptyDataSet;
  aDataSet.Close;
  QueryCriar(oQuery, aConnection);
  try
    oQuery.Close;
    oQuery.SQL.Clear;
    oQuery.SQL.Add(aSQL);
    oQuery.Open;
    if oQuery.IsEmpty then
      Exit;
    // Copiar para a memoria (para o TFDMemTable)
    aDataSet.CopyDataSet(oQuery, [coStructure, coRestart, coAppend]);
    aDataSet.First;
  finally
    QueryLiberar(oQuery);
    aDataSet.EnableControls;
  end;
end;

function NormalizeFieldType(AType: TFieldType): TFieldType;
const
  SDecimals  = [ftFloat, ftExtended, ftCurrency, ftBCD, ftFMTBcd, ftSingle];
  SIntegers  = [ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint, ftLongWord, ftShortint, ftByte];
  SDatetimes = [ftDate, ftTime, ftDateTime, ftTimeStamp, ftOraTimeStamp, ftTimeStampOffset];
  SStrings   = [ftString, ftFixedChar, ftWideString, ftFixedWideChar];
  SText      = [ftMemo, ftWideMemo, ftFmtMemo, ftOraClob];
  SBinary    = [ftBlob, ftGraphic, ftOraBlob, ftBytes, ftVarBytes, ftTypedBinary, ftParadoxOle, ftDBaseOle, ftStream];
  SLogical   = [ftBoolean];
  SGuid      = [ftGuid];
  SVariant   = [ftVariant];
  SObject    = [ftADT, ftArray, ftReference, ftDataSet, ftCursor, ftConnection, ftParams, ftObject];
begin
  if AType in SDecimals  then Exit(ftCurrency);
  if AType in SIntegers  then Exit(ftInteger);
  if AType in SDatetimes then Exit(ftDateTime);
  if AType in SStrings   then Exit(ftWideString);
  if AType in SText      then Exit(ftMemo);
  if AType in SBinary    then Exit(ftBlob);
  if AType in SLogical   then Exit(ftBoolean);
  if AType in SGuid      then Exit(ftGuid);
  if AType in SVariant   then Exit(ftVariant);
  if AType in SObject    then Exit(ftObject);
  Result := ftUnknown;

end;

procedure Informar(const aMensagem: String; aDica: String; aCaption: String);
begin
  with TTaskDialog.Create(nil) do
  begin
    try
      Caption       := aCaption;
      Title         := aMensagem;
      Text          := aDica;
      MainIcon      := tdiWarning;
      CommonButtons := [tcbOk];
      Execute;
    finally
      Free;
    end;
  end;
end;

procedure PlanarObjeto(aObjetos: TArray<TCustomControl>);
var
  i: Integer;
begin
  for i := Low(aObjetos) to High(aObjetos) do
  begin
    TPanel(aObjetos[i]).BevelInner  := bvNone;
    TPanel(aObjetos[i]).BevelKind   := bkNone;
    TPanel(aObjetos[i]).BevelInner  := bvNone;
    TPanel(aObjetos[i]).BorderStyle := bsNone;
  end;
end;

end.

