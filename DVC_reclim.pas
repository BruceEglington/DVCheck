unit DVC_reclim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TDVCreclim = class(TForm)
    Label1: TLabel;
    eStartRecord: TEdit;
    Label2: TLabel;
    eEndRecord: TEdit;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    procedure bbOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DVCreclim: TDVCreclim;

implementation

uses DVC_dm;

{$R *.dfm}

procedure TDVCreclim.bbOKClick(Sender: TObject);
var
  iCode : integer;
  done : boolean;
begin
  done := false;
  Val(eStartRecord.Text,dmDVC.StartRecord,iCode);
  if (iCode = 0) then done := true;
  Val(eEndRecord.Text,dmDVC.EndRecord,iCode);
  if (iCode = 0) then done := true;
  {
  if done then bbOK.ModalResult := true
          else bbOK.ModalResult := false;
  }
end;

procedure TDVCreclim.FormCreate(Sender: TObject);
begin
  eStartRecord.Text := IntToStr(dmDVC.StartRecord);
  eEndRecord.Text := IntToStr(dmDVC.EndRecord);
end;

end.
