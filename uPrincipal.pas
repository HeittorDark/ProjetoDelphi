unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.Menus, uDTMConexao, Enter;

type
  TfrmPrincipal = class(TForm)
    maPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    mnuVendas: TMenuItem;
    Relatrio1: TMenuItem;
    mnuCliente: TMenuItem;
    N1: TMenuItem;
    mnuCategoria: TMenuItem;
    mnuProduto: TMenuItem;
    N2: TMenuItem;
    mnuFechar: TMenuItem;
    Vendas1: TMenuItem;
    mnuRelCliente: TMenuItem;
    N3: TMenuItem;
    mnuRelProduto: TMenuItem;
    N4: TMenuItem;
    mnuRelVendaDt: TMenuItem;
    procedure mnuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuCategoriaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    uTeclaEnter: TMREnter;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(uTeclaEnter);
  FreeAndNil(dtmConexao);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  // Cria��o de formul�rio com sua conex�o
  dtmConexao := TdtmConexao.Create(Self);

  with dtmConexao.ConexaoDB do
  begin
    SQLHourGlass := true;
    Protocol := 'mssql';
    LibraryLocation := 'C:\ProjetoDelphi\ntwdblib.dll';
    HostName := '.\SQLEXPRESS';
    Port := 1433;
    User := 'sa';
    Password := '1234';
    Database := 'Vendas';
    Connected := true;
  end;

  uTeclaEnter :=  TMREnter.Create(Self);

  with uTeclaEnter do
  begin
    FocusEnabled := true;
    FocusColor := clInfoBk;
  end;
end;

procedure TfrmPrincipal.mnuCategoriaClick(Sender: TObject);
begin
  frmCadCategoria := TfrmCadCategoria.Create(Self);
  frmCadCategoria.ShowModal;

  // Ap�s mostrar, deve-se limpar da mem�ria
  frmCadCategoria.Release;
end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
  // Close ou Application.Terminate;
  Application.Terminate;
end;

end.
