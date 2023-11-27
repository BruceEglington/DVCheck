unit DVC_About;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    OKButton: TButton;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Memo1: TMemo;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

//uses Cor_varb;

{$R *.DFM}

procedure TAboutBox.FormShow(Sender: TObject);
begin
  //Version.Caption := 'Version '+ CoranVersion;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
  //Version.Caption := 'version ' + Application.Version;
end;

end.

