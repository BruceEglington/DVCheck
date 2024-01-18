unit DV_chngGSC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids,
  DBXpress, FMTBcd, SqlExpr, DBClient, Provider;

type
  TForm1 = class(TForm)
    Database1: TDatabase;
    q1: TQuery;
    ds1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    q1LABNO: TFloatField;
    q1SAMPLENO: TStringField;
    q1LATITUDE: TFloatField;
    q1LONGITUDE: TFloatField;
    q1RecordNum: TIntegerField;
    q1SampleOrig: TStringField;
    q1GSCnum: TStringField;
    SQLConnection1: TSQLConnection;
    q2: TSQLQuery;
    ds2: TDataSource;
    Button2: TButton;
    dsp2: TDataSetProvider;
    cds2: TClientDataSet;
    cds2SAMPLENO: TStringField;
    cds2CONTINENTID: TStringField;
    cds2COUNTRYABR: TStringField;
    cds2ORIGINALNO: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  q1.Open;
  repeat
    if (Length(q1Sampleno.AsString) < 15) then
    begin
      q1.Edit;
      q1GSCnum.AsString := 'GSC_'+q1Sampleno.AsString;
      q1.Post;
    end else
    begin
      q1.Edit;
      q1GSCnum.AsString := q1Sampleno.AsString;
      q1.Post;
    end;
    q1.Next;
  until q1.Eof;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  cds2.Open;
  repeat
      cds2.Edit;
      cds2OriginalNo.AsString := cds2Sampleno.AsString;
      cds2.Post;
    cds2.Next;
  until cds2.Eof;
  cds2.ApplyUpdates(-1);
end;

end.
