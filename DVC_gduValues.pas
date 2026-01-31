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
    procedure FormShow(Sender: TObject);
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
  if (tGDUmin < 20000) then
  begin
    if (tGDUmax >= 20000)  then
    begin
      tGDUmax := 19999;
    end;
  end else
  begin
    if (tGDUmax < 20000)  then
    begin
      tGDUmax := 29999;
    end;
  end;
  eGDUmin.Text := IntToStr(tGDUmin);
  eGDUmax.Text := IntToStr(tGDUmax);
end;

procedure TfmGDU_values.FormShow(Sender: TObject);
begin
  //
  eGDUmin.Text := IntToStr(tGDUmin);
  eGDUmax.Text := IntToStr(tGDUmax);
end;

end.
