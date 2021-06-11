program ListaDeCompra;

uses
  System.StartUpCopy,
  FMX.Forms,
  ListaCompra in 'ListaCompra.pas' {ListaCompras},
  uDM in 'uDM.pas' {DataBase: TDataModule},
  uFormat in 'uFormat.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataBase, DataBase);
  Application.CreateForm(TListaCompras, ListaCompras);
  Application.Run;
end.
