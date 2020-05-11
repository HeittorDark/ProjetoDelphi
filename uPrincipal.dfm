object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 369
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = maPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object maPrincipal: TMainMenu
    Left = 160
    Top = 160
    object Cadastro1: TMenuItem
      Caption = '&Cadastro'
      object mnuCliente: TMenuItem
        Caption = 'Client&e'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuCategoria: TMenuItem
        Caption = 'C&ategoria'
        OnClick = mnuCategoriaClick
      end
      object mnuProduto: TMenuItem
        Caption = '&Produto'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuFechar: TMenuItem
        Caption = '&Fechar'
        OnClick = mnuFecharClick
      end
    end
    object mnuVendas: TMenuItem
      Caption = '&Movimenta'#231#227'o'
      object Vendas1: TMenuItem
        Caption = '&Vendas'
      end
    end
    object Relatrio1: TMenuItem
      Caption = '&Relat'#243'rio'
      object mnuRelCliente: TMenuItem
        Caption = 'Cl&iente'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuRelProduto: TMenuItem
        Caption = '&Produto'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuRelVendaDt: TMenuItem
        Caption = '&Venda por Data'
      end
    end
  end
end
