unit Cliente.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Cliente.ViewModel, Vcl.StdCtrls,
  Cliente.Model, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client;

type
  TClienteView = class(TForm)
    pnlTop: TPanel;
    edtNome: TEdit;
    edtBairro: TEdit;
    edtLogradouro: TEdit;
    edtNumero: TEdit;
    edtEstado: TEdit;
    edtCidade: TEdit;
    edtEmail: TEdit;
    btnSalvar: TButton;
    btnBuscarCliente: TButton;
    btnBuscarCEP: TButton;
    lblCPF: TLabel;
    lblNome: TLabel;
    lblEmail: TLabel;
    lblDataNascimento: TLabel;
    lblLogradouro: TLabel;
    lblEstado: TLabel;
    lblCidade: TLabel;
    lblNumero: TLabel;
    lblCEP: TLabel;
    lblBairro: TLabel;
    edtCodigoCliente: TEdit;
    lblCodigo: TLabel;
    btnExcluir: TButton;
    edtDataNasc: TMaskEdit;
    edtCPF: TMaskEdit;
    edtCEP: TMaskEdit;
    FDConnection1: TFDConnection;
    btnLimparFormulario: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnBuscarClienteClick(Sender: TObject);
    procedure btnBuscarCEPClick(Sender: TObject);
    procedure btnLimparFormularioClick(Sender: TObject);
  private
    FViewModel: TClienteViewModel;
    procedure SalvarCliente;
    procedure ExcluirCliente;
    procedure BuscarCEP;
    procedure BuscarCliente;
  public

  end;

var
  ClienteView: TClienteView;

implementation


{$R *.dfm}

{ TClienteView }

procedure TClienteView.btnBuscarCEPClick(Sender: TObject);
begin
  BuscarCEP;
end;

procedure TClienteView.btnBuscarClienteClick(Sender: TObject);
begin
  BuscarCliente;
end;

procedure TClienteView.btnExcluirClick(Sender: TObject);
begin
  ExcluirCliente;
end;

procedure TClienteView.btnLimparFormularioClick(Sender: TObject);
begin
  edtNome.Text := EmptyStr;
  edtBairro.Text := EmptyStr;
  edtLogradouro.Text := EmptyStr;
  edtNumero.Text := EmptyStr;
  edtEstado.Text := EmptyStr;
  edtCidade.Text := EmptyStr;
  edtEmail.Text := EmptyStr;
  edtCodigoCliente.Text := EmptyStr;
  edtDataNasc.Text := EmptyStr;
  edtCPF.Text := EmptyStr;
  edtCEP.Text := EmptyStr;
end;

procedure TClienteView.btnSalvarClick(Sender: TObject);
begin
  SalvarCliente;
end;

procedure TClienteView.BuscarCEP;
var
  Cliente: TCliente;
begin
  Cliente := TCliente.Create;
  try
    Cliente.CEP := edtCEP.Text;
    FViewModel.PopulateEnderecoByCEP(Cliente);
    edtLogradouro.Text := Cliente.Logradouro;
    edtBairro.Text := Cliente.Bairro;
    edtCidade.Text := Cliente.Cidade;
    edtEstado.Text := Cliente.Estado;
  finally
    Cliente.Free;
  end;
end;

procedure TClienteView.BuscarCliente;
var
  ClienteID: Integer;
  Cliente: TCliente;
begin
  ClienteID := StrToInt(edtCodigoCliente.Text);
  Cliente := FViewModel.ReadCliente(ClienteID);

  if Assigned(Cliente) then
  begin
    edtNome.Text := Cliente.Nome;
    edtCPF.Text := Cliente.CPF;
    edtDataNasc.Text := DateToStr(Cliente.DataNascimento);
    edtEmail.Text := Cliente.Email;
    edtLogradouro.Text := Cliente.Logradouro;
    edtNumero.Text := Cliente.Numero;
    edtBairro.Text := Cliente.Bairro;
    edtCidade.Text := Cliente.Cidade;
    edtEstado.Text := Cliente.Estado;
    edtCEP.Text := Cliente.CEP;
  end
  else
    ShowMessage('Cliente não encontrado.');
end;

procedure TClienteView.ExcluirCliente;
var
  ClienteID: string;
begin
  ClienteID := edtCodigoCliente.Text;

  if ClienteID = EmptyStr then
    ClienteID := InputBox('Excluir Cliente', 'Digite o ID do Cliente a ser excluído:', '');

  if MessageDlg('Confirma a exclusão do cliente?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FViewModel.DeleteCliente(StrToInt(ClienteID));
    ShowMessage('Cliente excluído com sucesso.');
  end;
end;

procedure TClienteView.FormCreate(Sender: TObject);
begin
  FViewModel := TClienteViewModel.Create(FDConnection1);
  edtCPF.EditMask := '000\.000\.000\-00;0;_';
  edtCEP.EditMask := '00000\-000;0;_';
  edtDataNasc.EditMask := '!99/99/0000;1;_';
end;

procedure TClienteView.FormDestroy(Sender: TObject);
begin
  FViewModel.Free;
end;

procedure TClienteView.SalvarCliente;
var
  Cliente: TCliente;
begin
  Cliente := TCliente.Create;
  try
    Cliente.Nome := edtNome.Text;
    Cliente.CPF := edtCPF.Text;
    Cliente.DataNascimento := StrToDate(edtDataNasc.Text);
    Cliente.Email := edtEmail.Text;
    Cliente.CEP := edtCEP.Text;
    Cliente.Numero := edtNumero.Text;

    if FViewModel.ClientExists(Cliente) then
    begin
      FViewModel.UpdateCliente(Cliente);
      ShowMessage('Cliente atualizado com sucesso!');
    end
    else
    begin
      FViewModel.CreateCliente(Cliente);
      ShowMessage('Cliente salvo com sucesso!');
    end;

  finally
    Cliente.Free;
  end;
end;

end.
