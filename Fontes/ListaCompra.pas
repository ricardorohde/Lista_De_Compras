unit ListaCompra;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Layouts, FMX.MultiView, FMX.StdCtrls, FMX.TabControl,
  FMX.Controls.Presentation, FMX.Objects, FMX.Edit, System.Permissions,
  FMX.MediaLibrary.Actions, System.Actions, FMX.ActnList, FMX.StdActns,uDM,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

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
    BtnCarne: TButton;
    ImageCarne: TImage;
    Label4: TLabel;
    BtnLimpeza: TButton;
    ImageLimpeza: TImage;
    Label5: TLabel;
    BtnMantimento: TButton;
    Image2: TImage;
    Label6: TLabel;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
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
{************************ BOTÕES DE USO DA CAMERA ****************************************}
procedure TListaCompras.ImageCameraClick(Sender: TObject);
begin
        {$IFDEF ANDROID}
        PermissionsService.RequestPermissions([PermissaoCamera,
                                               PermissaoReadStorage,
                                               PermissaoWriteStorage],
                                               TakePicturePermissionRequestResult,
                                               DisplayMessageCamera
                                               );
        {$ENDIF}

        {$IFDEF IOS}
        ActPhotoCamera.Execute;
        {$ENDIF}
end;

procedure TListaCompras.ImageUsuarioEdicaoClick(Sender: TObject);
begin
        {$IFDEF ANDROID}
        PermissionsService.RequestPermissions([PermissaoReadStorage,
                                               PermissaoWriteStorage],
                                               LibraryPermissionRequestResult,
                                               DisplayMessageLibrary
                                               );
        {$ENDIF}

        {$IFDEF IOS}
        ActPhotoLibrary.Execute;
        {$ENDIF}
end;
{**********************************************************************************************}

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



end;

procedure TListaCompras.BtnCarneClick(Sender: TObject);
begin

// FILTRANDO POR CATEGORIA //
DataBase.qryCategorias.Close;
DataBase.qryCategorias.SQL.Strings[5]:= '';
DataBase.qryCategorias.SQL.Strings[5] := ' AND C.ID_CATE = :CATEGORIA';
DataBase.qryCategorias.ParamByName('CATEGORIA').AsInteger :=  BtnCarne.Tag;
DataBase.qryCategorias.Open;

end;

procedure TListaCompras.BtnLimpezaClick(Sender: TObject);
begin
// FILTRANDO POR CATEGORIA //
DataBase.qryCategorias.Close;
DataBase.qryCategorias.SQL.Strings[5]:= '';
DataBase.qryCategorias.SQL.Strings[5] := ' AND C.ID_CATE = :CATEGORIA';
DataBase.qryCategorias.ParamByName('CATEGORIA').AsInteger :=  BtnLimpeza.Tag;
DataBase.qryCategorias.Open;
end;

procedure TListaCompras.BtnMantimentoClick(Sender: TObject);
begin
// FILTRANDO POR CATEGORIA //
DataBase.qryCategorias.Close;
DataBase.qryCategorias.SQL.Strings[5]:= '';
DataBase.qryCategorias.SQL.Strings[5] := ' AND C.ID_CATE = :CATEGORIA';
DataBase.qryCategorias.ParamByName('CATEGORIA').AsInteger :=  BtnMantimento.Tag;
DataBase.qryCategorias.Open;
end;

procedure TListaCompras.ButtonEditarLoginClick(Sender: TObject);
begin
  ButtonMenu.OnClick(self);
  LayoutUsuario.Visible := True;
end;

procedure TListaCompras.SalvaEdicaoUsuarioClick(Sender: TObject);
begin
LabelNomeUsuario.text := EditUsuario.Text;
LayoutUsuario.Visible := False;

end;


{*************************** botões do menu ***********************************}
procedure TListaCompras.CriasListaClick(Sender: TObject);
begin
ButtonMenu.OnClick(self);
// criar lista de compras
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
//ChangeTab.Tab := tb
end;
{******************************************************************************}





end.
