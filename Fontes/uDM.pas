unit uDM;

interface

uses
  System.SysUtils, System.Classes,System.IOUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.UI,
  FireDAC.Comp.DataSet;

type
  TDataBase = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysSQLiteDriver: TFDPhysSQLiteDriverLink;
    FDQuery: TFDQuery;
    FDCommand: TFDCommand;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    qryCategorias: TFDQuery;
    qryCategoriasID_CATE: TIntegerField;
    qryCategoriasCATEGORIA: TWideMemoField;
    qryCategoriasID_SUBCATE: TIntegerField;
    qryCategoriasSUB_CATEGORIA: TWideMemoField;
    qryCategoriasIMAGEM: TBlobField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataBase: TDataBase;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDataBase.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Params.Values['DriverID'] := 'SQLite';
  FDConnection.LoginPrompt := False;
  {$IF DEFINED (ANDROID) || (IOS)}
    FDConnection.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'Dados.sdb');
  {$ENDIF}

 if not DataBase.FDConnection.Connected then
 begin
   DataBase.FDConnection.Connected := True;
 end;

end;

end.
