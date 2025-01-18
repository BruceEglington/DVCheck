unit DVC_gduValues;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmGDU_values = class(TForm)
    bOK: TButton;
    Panel1: TPanel;
    lGDUmin: TLabel;
    lGDUmax: TLabel;
    eGDUmin: TEdit;
    eGDUmax: TEdit;
    procedure bOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    tGDUmin, tGDUmax : integer;
  end;

var
  fmGDU_values: TfmGDU_values;

implementation

{$R *.dfm}

procedure TfmGDU_values.bOKClick(Sender: TObject);
var
  iCode : integer;
begin
  eGDUmin.Text  := Trim(eGDUmin.Text);
  eGDUmax.Text  := Trim(eGDUmax.Text);
  Val(eGDUmin.Text,tGDUmin,iCode);
  Val(eGDUmax.Text,tGDUmax,iCode);

end;

procedure TfmGDU_values.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
  Close;
end;

procedure TfmGDU_values.FormCreate(Sender: TObject);
begin
  //
end;

procedure TfmGDU_values.FormShow(Sender: TObject);
begin
  //
  eGDUmin.Text := IntToStr(tGDUmin);
  eGDUmax.Text := IntToStr(tGDUmax);
end;

end.
