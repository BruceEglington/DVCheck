unit DV_chngRefNo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, DBClient, Provider, DB, SqlExpr, StdCtrls,
  Mask, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    SQLConnection1: TSQLConnection;
    q1: TSQLQuery;
    q2: TSQLQuery;
    dsq1: TDataSource;
    dsp1: TDataSetProvider;
    cds1: TClientDataSet;
    ds1: TDataSource;
    cds2: TClientDataSet;
    ds2: TDataSource;
    q1RECORDID: TIntegerField;
    q1SOURCEID: TStringField;
    q1REFNUM: TIntegerField;
    cds1RECORDID: TIntegerField;
    cds1SOURCEID: TStringField;
    cds1REFNUM: TIntegerField;
    q2REFNUM: TIntegerField;
    q2SOURCEID: TStringField;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    bOpen: TButton;
    bUpdate: TButton;
    dsp2: TDataSetProvider;
    cds2REFNUM: TIntegerField;
    cds2SOURCEID: TStringField;
    bShow: TButton;
    bHide: TButton;
    eStartNum: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    eEndNum: TEdit;
    procedure bOpenClick(Sender: TObject);
    procedure bUpdateClick(Sender: TObject);
    procedure bShowClick(Sender: TObject);
    procedure bHideClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.bOpenClick(Sender: TObject);
begin
  q1.Close;
  q1.ParamByName('STARTNUM').AsString := eStartNum.Text;
  q1.ParamByName('ENDNUM').AsString := eEndNum.Text;
  cds1.Close;
  cds1.Open;
end;

procedure TForm1.bUpdateClick(Sender: TObject);
begin
  cds1.First;
  repeat
    q2.Close;
    q2.ParamByName('SOURCEID').AsString := cds1SOURCEID.AsString;
    cds2.Close;
    cds2.Open;
    cds1.Edit;
    cds1REFNUM.AsInteger := cds2REFNUM.AsInteger;
    cds1.Post;
    cds1.ApplyUpdates(-1);
    cds1.Next;
  until cds1.Eof;
  cds1.First;
end;

procedure TForm1.bShowClick(Sender: TObject);
begin
  DBGrid1.DataSource := ds1;
  DBNavigator1.DataSource := ds1;
end;

procedure TForm1.bHideClick(Sender: TObject);
begin
  DBGrid1.DataSource := nil;
  DBNavigator1.DataSource := nil;
end;

end.
