object ClienteView: TClienteView
  Left = 0
  Top = 0
  Caption = 'Cliente'
  ClientHeight = 508
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 875
    Height = 508
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -1
    ExplicitTop = -5
    ExplicitHeight = 281
    object lblCPF: TLabel
      Left = 16
      Top = 57
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object lblNome: TLabel
      Left = 200
      Top = 11
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object lblEmail: TLabel
      Left = 336
      Top = 57
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object lblDataNascimento: TLabel
      Left = 200
      Top = 57
      Width = 53
      Height = 13
      Caption = 'Data Nasc.'
    end
    object lblLogradouro: TLabel
      Left = 16
      Top = 114
      Width = 55
      Height = 13
      Caption = 'Logradouro'
    end
    object lblEstado: TLabel
      Left = 385
      Top = 163
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object lblCidade: TLabel
      Left = 200
      Top = 163
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object lblNumero: TLabel
      Left = 568
      Top = 163
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object lblCEP: TLabel
      Left = 385
      Top = 114
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object lblBairro: TLabel
      Left = 16
      Top = 163
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object lblCodigo: TLabel
      Left = 16
      Top = 11
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object edtNome: TEdit
      Left = 200
      Top = 30
      Width = 441
      Height = 21
      TabOrder = 0
    end
    object edtBairro: TEdit
      Left = 16
      Top = 182
      Width = 169
      Height = 21
      TabOrder = 1
    end
    object edtLogradouro: TEdit
      Left = 18
      Top = 133
      Width = 351
      Height = 21
      TabOrder = 2
    end
    object edtNumero: TEdit
      Left = 568
      Top = 182
      Width = 75
      Height = 21
      TabOrder = 3
    end
    object edtEstado: TEdit
      Left = 385
      Top = 182
      Width = 169
      Height = 21
      TabOrder = 4
    end
    object edtCidade: TEdit
      Left = 200
      Top = 182
      Width = 169
      Height = 21
      TabOrder = 5
    end
    object edtEmail: TEdit
      Left = 336
      Top = 76
      Width = 305
      Height = 21
      TabOrder = 6
    end
    object btnSalvar: TButton
      Left = 16
      Top = 229
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 7
      OnClick = btnSalvarClick
    end
    object btnBuscarCliente: TButton
      Left = 110
      Top = 28
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 8
      OnClick = btnBuscarClienteClick
    end
    object btnBuscarCEP: TButton
      Left = 568
      Top = 132
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 9
      OnClick = btnBuscarCEPClick
    end
    object edtCodigoCliente: TEdit
      Left = 16
      Top = 30
      Width = 88
      Height = 21
      TabOrder = 10
    end
    object btnExcluir: TButton
      Left = 97
      Top = 229
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 11
      OnClick = btnExcluirClick
    end
    object edtDataNasc: TMaskEdit
      Left = 200
      Top = 76
      Width = 121
      Height = 21
      TabOrder = 12
      Text = ''
    end
    object edtCPF: TMaskEdit
      Left = 16
      Top = 76
      Width = 169
      Height = 21
      TabOrder = 13
      Text = ''
    end
    object edtCEP: TMaskEdit
      Left = 385
      Top = 133
      Width = 177
      Height = 21
      TabOrder = 14
      Text = ''
    end
    object btnLimparFormulario: TButton
      Left = 178
      Top = 229
      Width = 135
      Height = 25
      Caption = 'Limpar Formul'#225'rio'
      TabOrder = 15
      OnClick = btnLimparFormularioClick
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=DESKTOP-LQTA0BU\SQLEXPRESS'
      'OSAuthent=Yes'
      'Database=TesteSAG'
      'DriverID=MSSQL')
    Left = 432
    Top = 256
  end
end