unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uDTMConexao, uEnum;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutenção: TTabSheet;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    dbtnNavigator: TDBNavigator;
    grdListagem: TDBGrid;
    pnlListagemTopo: TPanel;
    mskEdit: TMaskEdit;
    btnPesquisar: TBitBtn;
    qryListagem: TZQuery;
    dtsListagem: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
    EstadoCadastro: TEstadoCadastro;

    { Procedimentos de controle de tela}
    procedure ControlaBotoes(btnNovo, btnAlterar, btnCancelar,
      btnGravar, btnApagar: TBitBtn; Navegador: TDBNavigator;
      pgcPrincipal: TPageControl; Flag: Boolean);

    procedure ControlaIndiceTab(pgcPrincipal: TPageControl; indice: Integer);
  public
    { Public declarations }
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  ControlaBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
    dbtnNavigator, pgcPrincipal, False);

  EstadoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  ControlaBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
    dbtnNavigator, pgcPrincipal, True);

  EstadoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlaBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
    dbtnNavigator, pgcPrincipal, True);

  ControlaIndiceTab(pgcPrincipal, 0);

  EstadoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  try
    ControlaBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
      dbtnNavigator, pgcPrincipal, true);

    ControlaIndiceTab(pgcPrincipal, 0);
  finally
    EstadoCadastro := ecNenhum;
  end;
end;

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlaBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
    dbtnNavigator, pgcPrincipal, False);

  EstadoCadastro := ecInserir;
end;

procedure TfrmTelaHeranca.ControlaBotoes(btnNovo, btnAlterar, btnCancelar,
  btnGravar, btnApagar: TBitBtn; Navegador: TDBNavigator;
  pgcPrincipal: TPageControl; Flag: Boolean);
begin
  // Ativação de botões
  btnNovo.Enabled := Flag;
  btnApagar.Enabled := Flag;
  btnAlterar.Enabled := Flag;

  // Navigator
  Navegador.Enabled := Flag;

  // PageControl
  pgcPrincipal.Pages[0].TabVisible := Flag;

  btnCancelar.Enabled := not Flag;
  btnGravar.Enabled := not Flag;
end;

procedure TfrmTelaHeranca.ControlaIndiceTab(pgcPrincipal: TPageControl;
  indice: Integer);
begin
  if (pgcPrincipal.Pages[indice].TabVisible) then
  begin
    pgcPrincipal.TabIndex := 0;
  end;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
  qryListagem.Connection := dtmConexao.ConexaoDB;
  dtsListagem.DataSet := qryListagem;
end;

end.
