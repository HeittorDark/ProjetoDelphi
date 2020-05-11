object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Informe o t'#237'tulo'
  ClientHeight = 406
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 636
    Height = 370
    ActivePage = tabListagem
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 365
    object tabListagem: TTabSheet
      Caption = 'Listagem'
      ExplicitHeight = 337
      object grdListagem: TDBGrid
        Left = 0
        Top = 41
        Width = 628
        Height = 301
        Align = alClient
        DataSource = dtsListagem
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 628
        Height = 41
        Align = alTop
        TabOrder = 1
        ExplicitTop = 8
        object mskEdit: TMaskEdit
          Left = 11
          Top = 8
          Width = 121
          Height = 21
          TabOrder = 0
          Text = ''
          TextHint = 'Digite sua pesquisa'
        end
        object btnPesquisar: TBitBtn
          Left = 138
          Top = 4
          Width = 75
          Height = 25
          Caption = '&Pesquisar'
          TabOrder = 1
        end
      end
    end
    object tabManutenção: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
      ExplicitHeight = 337
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 370
    Width = 636
    Height = 36
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 369
    object btnNovo: TBitBtn
      Left = 11
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TBitBtn
      Left = 85
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 159
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Left = 233
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object btnApagar: TBitBtn
      Left = 306
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Apaga&r'
      TabOrder = 4
      OnClick = btnApagarClick
    end
    object btnFechar: TBitBtn
      Left = 557
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 5
      OnClick = btnFecharClick
    end
    object dbtnNavigator: TDBNavigator
      Left = 383
      Top = 7
      Width = 168
      Height = 25
      DataSource = dtsListagem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 6
    end
  end
  object qryListagem: TZQuery
    Connection = dtmConexao.ConexaoDB
    Params = <>
    Left = 180
    Top = 72
  end
  object dtsListagem: TDataSource
    DataSet = qryListagem
    Left = 244
    Top = 72
  end
end
