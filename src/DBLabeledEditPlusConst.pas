{==============================================================================]
[ Arquivo        : DBLabeledEditPlus.pas                                       ]
[ Componente     : TDBLabeledEditPlus                                          ]
[ Descrição      : Tipos e Constantes                                          ]
[------------------------------------------------------------------------------]
[ Criado em      : julho/2025                                                  ]
[ Última modif.  : setembro/2025                                               ]
[------------------------------------------------------------------------------]
[ Autor          : Adriano Zanini                                              ]
[ Versão         : 1.0.2                                                       ]
[==============================================================================}

unit DBLabeledEditPlusConst;

interface

uses
  Data.DB;

type
  TSearchComparison = (scMenos, scMenosIgual, scIgual, scMaior, scMaiorIgual, scNaoIgual,
                       scIniciaCom, scNaoInicia, scContem, scNaoContem, scTerminaCom,
                       scNaoTerminaCom, scMenosCaractere, scMenosCaractereIgual,
                       scIgualCaractere, scCaractereMaior, scMaiorCaractereIgual, scNaoIgualCaractere);

  TSearchComparisons = set of TSearchComparison;

  TSearchComparisonRecord = record
    FieldType         : TFieldType;
    Comparisons       : TSearchComparisons;
    DefaultComparison : TSearchComparison;
  end;

  TOperator           = (soAnd, soOr, soAndAll, soOrAll);
  TSearchStyle        = (ssModal, ssNormal, ssMDIChild);
  TSearchCase         = (scAll, scUpper, scLower);
  TArrowAction        = (aaField, aaComparison, aaOperator, aaGrid);
  TEventoPesquisa     = (epQuandoDigitar, epSairDoCampo, epNaoPesquisar);

  TBotaoTipo          = (trNenhum, trBotao, trLabel, trOcultar);
  //TLocalTexto         = (lmLabel, lmEdit, lmNenhum);
  TLocalResultado     = (lmLabel, lmNenhum);
  TLocalPosicao       = (lpLado, lpAbaixo);

const
  REG_SDL_FIELD = 'Field';
  REG_SDL_COMPARISON = 'Comparison';
  REG_SDL_OPERATOR = 'Operator';
  REG_SDL_VALUE = 'Value';
  REG_SDL_VERSION = 'StoreVersion';
  REG_SDL_CUSTOMPRESETS = 'Presets';
  REG_SDL_CUSTOMPRESETCOUNT = 'PresetCount';
  REG_SDL_PRESETNAME = 'Name';
  REG_SDL_PRESETSHORTCUT = 'Shortcut';
  WHERE_TAG = '%WHERE%';
  SEARCH_COMPARISON: array[scMenos..scNaoIgualCaractere] of String =
                       ('< %s',
                        '<= %s',
                        '= %s',
                        '> %s',
                        '>= %s',
                        '<> %s',
                        'LIKE "%s%%"',
                        'NOT LIKE "%s%%"',
                        'LIKE "%%%s%%"',
                        'NOT LIKE "%%%s%%"',
                        'LIKE "%%%s"',
                        'NOT LIKE "%%%s"',
                        '< "%s"',
                        '<= "%s"',
                        '= "%s"',
                        '> "%s"',
                        '>= "%s"',
                        '<> "%s"');
  VALIDCOMPARISON_NONE = [];
  VALIDCOMPARISON_NUMBER = [scMenos, scMenosIgual, scIgual, scMaior, scMaiorIgual, scNaoIgual];
  VALIDCOMPARISON_BOOLEAN = [scIgual, scNaoIgual];
  VALIDCOMPARISON_DATETIME = VALIDCOMPARISON_NUMBER;
  VALIDCOMPARISON_STRING = [scMenosCaractere, scMenosCaractereIgual, scIgualCaractere, scCaractereMaior, scMaiorCaractereIgual,
                            scIniciaCom, scNaoInicia, scContem, scNaoContem, scTerminaCom, scNaoTerminaCom];
  QUOTEDFIELDTYPES = [ftString, ftFixedChar, ftWideString];
  VALIDCOMPARISONS: array[0..37] of TSearchComparisonRecord = (
                        (FieldType:             ftUnknown;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftString;
                         Comparisons:           VALIDCOMPARISON_STRING;
                         DefaultComparison:     scIniciaCom),
                        (FieldType:             ftSmallint;
                         Comparisons:           VALIDCOMPARISON_NUMBER;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftInteger;
                         Comparisons:           VALIDCOMPARISON_NUMBER;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftWord;
                         Comparisons:           VALIDCOMPARISON_NUMBER;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftBoolean;
                         Comparisons:           VALIDCOMPARISON_BOOLEAN;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftFloat;
                         Comparisons:           VALIDCOMPARISON_NUMBER;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftCurrency;
                         Comparisons:           VALIDCOMPARISON_NUMBER;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftBCD;
                         Comparisons:           VALIDCOMPARISON_NUMBER;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftDate;
                         Comparisons:           VALIDCOMPARISON_DATETIME;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftTime;
                         Comparisons:           VALIDCOMPARISON_DATETIME;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftDateTime;
                         Comparisons:           VALIDCOMPARISON_DATETIME;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftBytes;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftVarBytes;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftAutoInc;
                         Comparisons:           VALIDCOMPARISON_NUMBER;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftBlob;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftMemo;
                         Comparisons:           VALIDCOMPARISON_STRING;
                         DefaultComparison:     scIniciaCom),
                        (FieldType:             ftGraphic;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftFmtMemo;
                         Comparisons:           VALIDCOMPARISON_STRING;
                         DefaultComparison:     scIniciaCom),
                        (FieldType:             ftParadoxOle;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftDBaseOle;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftTypedBinary;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftCursor;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftFixedChar;
                         Comparisons:           VALIDCOMPARISON_STRING;
                         DefaultComparison:     scIniciaCom),
                        (FieldType:             ftWideString;
                         Comparisons:           VALIDCOMPARISON_STRING;
                         DefaultComparison:     scIniciaCom),
                        (FieldType:             ftLargeint;
                         Comparisons:           VALIDCOMPARISON_NUMBER;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftADT;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftArray;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftReference;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftDataSet;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftOraBlob;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftOraClob;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftVariant;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftInterface;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftIDispatch;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftGuid;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftTimeStamp;
                         Comparisons:           VALIDCOMPARISON_DATETIME;
                         DefaultComparison:     scIgual),
                        (FieldType:             ftFMTBcd;
                         Comparisons:           VALIDCOMPARISON_NONE;
                         DefaultComparison:     scIgual));
  OPERATOR_SQL: array[soAnd..soOrAll] of String =
                   ('AND',
                    'OR',
                    'AND',
                    'OR');
  _ComparisonContains      = 'contenha';
  _ComparisonBeginsWith    = 'inície com';
  _ComparisonNotBeginsWith = 'não inicia com';
  _ComparisonNotContains   = 'não deve conter';
  _ComparisonEndsWith      = 'termina com';
  _ComparisonNotEndsWith   = 'não termina com';

  _TITULO_JANELA      = 'Procurar Registro';
  _CAMPOVIRTUAL       = 'VirtualField';
  _CAMPOLARGURA       = 64;
  _PROPRIEDADE_VAZIA  = 'A propriedade %s não foi definida.';
  _SQL                = 'SELECT %s FROM %s %s %s';
  _REGISTROS          = '%d registros';
  _WIDTHFORM          = 800;
  _HEIGHTFORM         = 600;
  _MAXLENGTH          = 100;
  _1WHERE1_           = '1 = 1';
  _MSG_HINT           =  'Digite aqui';

implementation
end.
