unit ListaCompra;

interface

uses
  // unit de formatar texto
  uFormat,
  // _______________________
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Layouts, FMX.MultiView, FMX.StdCtrls, FMX.TabControl,
  FMX.Controls.Presentation, FMX.Objects, FMX.Edit, System.Permissions,
  FMX.MediaLibrary.Actions, System.Actions, FMX.ActnList, FMX.StdActns, uDM,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.Effects;

type
  TListaCompras = class(TForm)
    ToolBar: TToolBar;
    TabControl: TTabControl;
    ButtonMenu: TButton;
    MultiViewMenu: TMultiView;
    ListMenu: TListBox;
    Login: TListBoxItem;
    MinhaLista: TListBoxItem;
    CriasLista: TListBoxItem;
    CompartilharLista: TListBoxItem;
    Info: TListBoxItem;
    ImageFundoLogin: TImage;
    LayoutStyleLoginImg: TLayout;
    LayoutStyleLoginName: TLayout;
    LabelNomeUsuario: TLabel;
    RectangleNameUsuario: TRectangle;
    LayoutStyleLoginBt: TLayout;
    ButtonEditarLogin: TButton;
    RectangleEditarLogin: TRectangle;
    LayoutUsuario: TLayout;
    RectangleFundoUsuario: TRectangle;
    LayoutUsuario2: TLayout;
    LayoutUsuario3: TLayout;
    LayoutUsuario4: TLayout;
    LayoutUsuario5: TLayout;
    SalvaEdicaoUsuario: TButton;
    Style1: TRectangle;
    StyleLabel: TLabel;
    ImageUsuarioEdicao: TImage;
    EditUsuario: TEdit;
    tabInformacao: TTabItem;
    TabInicio: TTabItem;
    ActionList1: TActionList;
    ActPhotoLibrary: TTakePhotoFromLibraryAction;
    ActPhotoCamera: TTakePhotoFromCameraAction;
    Layout1: TLayout;
    ImageCamera: TImage;
    Layout2: TLayout;
    circle_foto: TCircle;
    Circle_img_perfil: TCircle;
    Line1: TLine;
    Linha: TListBoxItem;
    ButtonInfo: TButton;
    LabelInfo: TLabel;
    Linha2: TListBoxItem;
    Line2: TLine;
    imgCriarLista: TCircle;
    LabelCriaLista: TLabel;
    imgMinhaLista: TCircle;
    LabelMinhaLista: TLabel;
    LabelComoUsar: TLabel;
    ButtonCompartilhar: TButton;
    ChangeTab: TChangeTabAction;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Rectangle2: TRectangle;
    Layout5: TLayout;
    ImageCarne: TImage;
    Label4: TLabel;
    BtnLimpeza: TButton;
    ImageLimpeza: TImage;
    Label5: TLabel;
    BtnMantimento: TButton;
    Image2: TImage;
    Label6: TLabel;
    lvLista: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    TabLista: TTabItem;
    cbCategoria: TComboBox;
    Layout6: TLayout;
    Label7: TLabel;
    btnHome: TRectangle;
    LinkListControlToField1: TLinkListControlToField;
    BtnCarne: TButton;
    TabControl1: TTabControl;
    TabControlMontarLista: TTabControl;
    TabItemLista: TTabItem;
    TabItemCadProd: TTabItem;
    Layout7: TLayout;
    btnAddProd: TCircle;
    Label8: TLabel;
    btnRevProd: TCircle;
    Label9: TLabel;
    lvProd: TListView;
    BlurEffect: TBlurEffect;
    LayoutCadProd: TLayout;
    RecFundoCadProd: TRectangle;
    LayoutCadProdTop: TLayout;
    Label10: TLabel;
    lblCadProdCategoria: TLabel;
    LayoutCadProdTop2: TLayout;
    Label11: TLabel;
    lblCadProdSubCategoria: TLabel;
    LayoutCadProdLeft: TLayout;
    Label12: TLabel;
    Line3: TLine;
    Label13: TLabel;
    LayoutCadProdBottom: TLayout;
    EditCadProdProduto: TEdit;
    LayoutCadProdClient: TLayout;
    EditCadProdValor: TEdit;
    btnCadProdCancela: TRectangle;
    btnCadProdConfirma: TRectangle;
    Label14: TLabel;
    Label15: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    procedure ButtonEditarLoginClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ActPhotoLibraryDidFinishTaking(Image: TBitmap);
    procedure ActPhotoCameraDidFinishTaking(Image: TBitmap);
    procedure ImageCameraClick(Sender: TObject);
    procedure ImageUsuarioEdicaoClick(Sender: TObject);
    procedure SalvaEdicaoUsuarioClick(Sender: TObject);
    procedure InfoClick(Sender: TObject);
    procedure CriasListaClick(Sender: TObject);
    procedure MinhaListaClick(Sender: TObject);
    procedure CompartilharListaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCarneClick(Sender: TObject);
    procedure BtnMantimentoClick(Sender: TObject);
    procedure BtnLimpezaClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure cbCarneClick(Sender: TObject);
    procedure lvListaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnAddProdClick(Sender: TObject);
    procedure btnCadProdCancelaClick(Sender: TObject);
    procedure EditCadProdValorTyping(Sender: TObject);
    procedure btnCadProdConfirmaClick(Sender: TObject);

  private
    { Private declarations }
{$IFDEF ANDROID}
    PermissaoCamera, PermissaoReadStorage, PermissaoWriteStorage: string;
    procedure TakePicturePermissionRequestResult(Sender: TObject;
      const APermissions: TArray<string>;
      const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayMessageCamera(Sender: TObject;
      const APermissions: TArray<string>; const APostProc: TProc);
    procedure LibraryPermissionRequestResult(Sender: TObject;
      const APermissions: TArray<string>;
      const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayMessageLibrary(Sender: TObject;
      const APermissions: TArray<string>; const APostProc: TProc);
{$ENDIF}
  public
    { Public declarations }
  end;

var
  ListaCompras: TListaCompras;
  VGCategoria: Integer;

implementation

{$R *.fmx}

uses FMX.DialogService

{$IFDEF ANDROID}
    , Androidapi.Helpers, Androidapi.JNI.JavaTypes, Androidapi.JNI.Os
{$ENDIF}
    ;

{ ******************************* Rotina que verifica a permisão para uso de cameras ********************** }
{$IFDEF ANDROID}

procedure TListaCompras.TakePicturePermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
  // 3 Permissoes: CAMERA, READ_EXTERNAL_STORAGE e WRITE_EXTERNAL_STORAGE

  if (Length(AGrantResults) = 3) and
    (AGrantResults[0] = TPermissionStatus.Granted) and
    (AGrantResults[1] = TPermissionStatus.Granted) and
    (AGrantResults[2] = TPermissionStatus.Granted) then
    ActPhotoCamera.Execute
  else
    TDialogService.ShowMessage('Você não tem permissão para tirar fotos');
end;

procedure TListaCompras.LibraryPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
  // 2 Permissoes: READ_EXTERNAL_STORAGE e WRITE_EXTERNAL_STORAGE

  if (Length(AGrantResults) = 2) and
    (AGrantResults[0] = TPermissionStatus.Granted) and
    (AGrantResults[1] = TPermissionStatus.Granted) then
    ActPhotoLibrary.Execute
  else
    TDialogService.ShowMessage('Você não tem permissão para acessar as fotos');
end;

procedure TListaCompras.DisplayMessageCamera(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
  TDialogService.ShowMessage
    ('O app precisa acessar a câmera e as fotos do seu dispositivo',
    procedure(const AResult: TModalResult)
    begin
      APostProc;
    end);
end;

procedure TListaCompras.DisplayMessageLibrary(Sender: TObject;
const APermissions: TArray<string>; const APostProc: TProc);
begin
  TDialogService.ShowMessage
    ('O app precisa acessar as fotos do seu dispositivo',
    procedure(const AResult: TModalResult)
    begin
      APostProc;
    end);
end;
{$ENDIF}
{ ************************** fim da rotina **************************************************** }

{ *************************** iniciando os eventos para os botões de foto ********************* }
procedure TListaCompras.ActPhotoCameraDidFinishTaking(Image: TBitmap);
begin
  circle_foto.Fill.Bitmap.Bitmap := Image;
  Circle_img_perfil.Fill.Bitmap.Bitmap := Image;
end;

procedure TListaCompras.ActPhotoLibraryDidFinishTaking(Image: TBitmap);
begin
  circle_foto.Fill.Bitmap.Bitmap := Image;
  Circle_img_perfil.Fill.Bitmap.Bitmap := Image;
end;

{ ************************ BOTÕES DE USO DA CAMERA **************************************** }
procedure TListaCompras.ImageCameraClick(Sender: TObject);
begin
{$IFDEF ANDROID}
  PermissionsService.RequestPermissions([PermissaoCamera, PermissaoReadStorage,
    PermissaoWriteStorage], TakePicturePermissionRequestResult,
    DisplayMessageCamera);
{$ENDIF}
{$IFDEF IOS}
  ActPhotoCamera.Execute;
{$ENDIF}
end;

procedure TListaCompras.ImageUsuarioEdicaoClick(Sender: TObject);
begin
{$IFDEF ANDROID}
  PermissionsService.RequestPermissions([PermissaoReadStorage,
    PermissaoWriteStorage], LibraryPermissionRequestResult,
    DisplayMessageLibrary);
{$ENDIF}
{$IFDEF IOS}
  ActPhotoLibrary.Execute;
{$ENDIF}
end;
{ ********************************************************************************************** }

procedure TListaCompras.FormActivate(Sender: TObject);
begin
{$IFDEF ANDROID}
  PermissaoCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
  PermissaoReadStorage := JStringToString
    (TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  PermissaoWriteStorage := JStringToString
    (TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
{$ENDIF}
end;

procedure TListaCompras.FormCreate(Sender: TObject);
begin

  // CARREGANDO O USUARIO //
  if not DataBase.FDConnection.Connected then
  begin
    DataBase.FDConnection.Connected := True;
  end;

  DataBase.FDQuery.Close;
  DataBase.FDQuery.SQL.Clear;
  DataBase.FDQuery.SQL.Add('SELECT * FROM USUARIO');
  DataBase.FDQuery.Open();

  EditUsuario.Text := DataBase.FDQuery.FieldByName('USUARIO').AsString;
  LabelNomeUsuario.Text := DataBase.FDQuery.FieldByName('USUARIO').AsString;

  // CARREGANDO A LISTA CATEGORIAS //

  DataBase.qryCategorias.Close;
  DataBase.qryCategorias.Open;

  LayoutCadProd.Visible := False;
  BlurEffect.Enabled := False;

end;

procedure TListaCompras.BtnCarneClick(Sender: TObject);
begin

  // FILTRANDO POR CATEGORIA //
  DataBase.qryCategorias.Close;
  DataBase.qryCategorias.SQL.Strings[5] := '';
  DataBase.qryCategorias.SQL.Strings[5] := ' AND C.ID_CATE = :CATEGORIA';
  DataBase.qryCategorias.ParamByName('CATEGORIA').AsInteger := BtnCarne.Tag;
  DataBase.qryCategorias.Open;

  VGCategoria := BtnCarne.Tag;

end;

procedure TListaCompras.btnHomeClick(Sender: TObject);
begin
  ChangeTab.Tab := TabInicio;
  ChangeTab.ExecuteTarget(Sender);
  DataBase.qryCategorias.Close;
  DataBase.qryCategorias.SQL.Strings[5] := '';
  DataBase.qryCategorias.Open;

end;

procedure TListaCompras.BtnLimpezaClick(Sender: TObject);
begin
  // FILTRANDO POR CATEGORIA //
  DataBase.qryCategorias.Close;
  DataBase.qryCategorias.SQL.Strings[5] := '';
  DataBase.qryCategorias.SQL.Strings[5] := ' AND C.ID_CATE = :CATEGORIA';
  DataBase.qryCategorias.ParamByName('CATEGORIA').AsInteger := BtnLimpeza.Tag;
  DataBase.qryCategorias.Open;

  VGCategoria := BtnLimpeza.Tag;
end;

procedure TListaCompras.BtnMantimentoClick(Sender: TObject);
begin
  // FILTRANDO POR CATEGORIA //
  DataBase.qryCategorias.Close;
  DataBase.qryCategorias.SQL.Strings[5] := '';
  DataBase.qryCategorias.SQL.Strings[5] := ' AND C.ID_CATE = :CATEGORIA';
  DataBase.qryCategorias.ParamByName('CATEGORIA').AsInteger :=
    BtnMantimento.Tag;
  DataBase.qryCategorias.Open;

  VGCategoria := BtnMantimento.Tag;
end;

procedure TListaCompras.ButtonEditarLoginClick(Sender: TObject);
begin
  ButtonMenu.OnClick(self);
  LayoutUsuario.Visible := True;
end;

procedure TListaCompras.cbCarneClick(Sender: TObject);
begin
  // FILTRANDO POR CATEGORIA //
  DataBase.qryCategorias.Close;
  DataBase.qryCategorias.SQL.Strings[5] := '';
  DataBase.qryCategorias.SQL.Strings[5] := ' AND C.ID_CATE = :CATEGORIA';
  DataBase.qryCategorias.ParamByName('CATEGORIA').AsInteger := BtnLimpeza.Tag;
  DataBase.qryCategorias.Open;

  VGCategoria := BtnLimpeza.Tag;
end;

procedure TListaCompras.SalvaEdicaoUsuarioClick(Sender: TObject);
begin
  LabelNomeUsuario.Text := EditUsuario.Text;
  LayoutUsuario.Visible := False;

end;

{ *************************** botões do menu *********************************** }
procedure TListaCompras.CriasListaClick(Sender: TObject);
begin
  ButtonMenu.OnClick(self);
  // criar lista de compras
  ChangeTab.Tab := TabInicio;
  ChangeTab.ExecuteTarget(Sender);
  DataBase.qryCategorias.Close;
  DataBase.qryCategorias.SQL.Strings[5] := '';
  DataBase.qryCategorias.Open;
end;

procedure TListaCompras.MinhaListaClick(Sender: TObject);
begin
  ButtonMenu.OnClick(self);
  // Minha Lista
end;

procedure TListaCompras.CompartilharListaClick(Sender: TObject);
begin
  ButtonMenu.OnClick(self);
  // Como Usar
end;

procedure TListaCompras.InfoClick(Sender: TObject);
begin
  ButtonMenu.OnClick(self);
  // mudar para tela informações do app.
  // ChangeTab.Tab := tb
end;

procedure TListaCompras.lvListaItemClick(const Sender: TObject;
const AItem: TListViewItem);
begin
  ChangeTab.Tab := TabItemCadProd;
  ChangeTab.ExecuteTarget(Sender);

end;

{ ****************************************************************************** }

procedure TListaCompras.btnAddProdClick(Sender: TObject);
begin
  BlurEffect.Enabled := True;
  LayoutCadProd.Visible := True;
end;

procedure TListaCompras.btnCadProdCancelaClick(Sender: TObject);
begin

  EditCadProdProduto.Text := '';
  EditCadProdValor.Text := '';
  BlurEffect.Enabled := False;
  LayoutCadProd.Visible := False;
end;

procedure TListaCompras.btnCadProdConfirmaClick(Sender: TObject);
begin
  // inserindo os produtos

  try
    DataBase.FDQuery.SQL.Clear;
    DataBase.FDQuery.SQL.Add
      ('SELECT IFNULL(MAX(ID_PROD),0) AS COUNT FROM PRODUTO');
    DataBase.FDQuery.Open();

    DataBase.FDConnection.StartTransaction;
    DataBase.FDCommand.SQL.Clear;
    DataBase.FDCommand.SQL.Add
      ('INSERT INTO PRODUTO( ID_PROD, ID_CATE, ID_SUBCATE, PRODUTO, VALOR)');
    DataBase.FDCommand.SQL.Add
      ('             VALUES(:ID_PROD,:ID_CATE,:ID_SUBCATE,:PRODUTO,:VALOR)');
    DataBase.FDCommand.ParamByName('ID_PROD').AsInteger :=
      DataBase.FDQuery.FieldByName('COUNT').AsInteger + 1;
    DataBase.FDCommand.ParamByName('ID_CATE').AsInteger :=
      DataBase.qryCategorias.FieldByName('ID_CATE').AsInteger;
    DataBase.FDCommand.ParamByName('ID_SUBCATE').AsInteger :=
      DataBase.qryCategorias.FieldByName('ID_SUBCATE').AsInteger;
    DataBase.FDCommand.ParamByName('PRODUTO').AsString :=
      EditCadProdProduto.Text;
    DataBase.FDCommand.ParamByName('VALOR').AsFloat :=
      StrToFloatDef(EditCadProdValor.Text,0);
    DataBase.FDCommand.ExecSQL;

    DataBase.FDConnection.Commit;

  except
    on Eror: Exception do
    begin
      DataBase.FDConnection.Rollback;
      ShowMessage('Erro ao Salvar');
    end;

  end;

  EditCadProdProduto.Text := '';
  EditCadProdValor.Text := '';

  btnCadProdCancela.OnClick(Sender);

end;

procedure TListaCompras.EditCadProdValorTyping(Sender: TObject);
begin
  Formatar(EditCadProdValor, Valor);
end;

end.
