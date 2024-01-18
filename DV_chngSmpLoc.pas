unit DV_chngSmpLoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, StdCtrls, Grids, DBGrids, DB, DBClient,
  Provider, SqlExpr;

type
  TForm1 = class(TForm)
    sqlc1: TSQLConnection;
    qSmpLoc: TSQLQuery;
    dspSmpLoc: TDataSetProvider;
    cdsSmpLoc: TClientDataSet;
    dsSmpLoc: TDataSource;
    cdsSmpLocSAMPLENO: TStringField;
    cdsSmpLocORIGINALNO: TStringField;
    DBGrid1: TDBGrid;
    Button1: TButton;
    bClose: TButton;
    procedure Button1Click(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  cdsSmpLoc.Open;
  repeat
    cdsSmpLoc.Edit;
    cdsSmpLocORIGINALNO.AsString := cdsSmpLocSAMPLENO.AsString;
    cdsSmpLoc.Next;
    try
      cdsSmpLoc.ApplyUpdates(0);
    except
    end;
  until cdsSmpLoc.Eof;
  cdsSmpLoc.First;
end;

procedure TForm1.bCloseClick(Sender: TObject);
begin
  cdsSmpLoc.Close;
end;

end.
