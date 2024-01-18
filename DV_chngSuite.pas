unit DV_chngSuite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids,
  DB, DBClient, Provider, SqlExpr, ComCtrls;

type
  TForm1 = class(TForm)
    sqlc1: TSQLConnection;
    qOriginal: TSQLQuery;
    qNew: TSQLQuery;
    dspOriginal: TDataSetProvider;
    cdsOriginal: TClientDataSet;
    dsOriginal: TDataSource;
    dspNew: TDataSetProvider;
    cdsNew: TClientDataSet;
    dsNew: TDataSource;
    cdsOriginalUNITNAME: TStringField;
    cdsNewOLDNAME: TStringField;
    cdsNewNEWNAME: TStringField;
    cdsOriginalNew: TClientDataSet;
    dsqOriginal: TDataSource;
    dsOriginalNew: TDataSource;
    qOriginalNew: TSQLQuery;
    cdsOriginalqOriginalNew: TDataSetField;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBNavigator1: TDBNavigator;
    bOpen: TButton;
    bUpdate: TButton;
    cdsOriginalNewOLDNAME: TStringField;
    cdsOriginalNewNEWNAME: TStringField;
    cdsOriginalNewDONE: TSmallintField;
    eStart: TEdit;
    eEnd: TEdit;
    bClose: TButton;
    StatusBar1: TStatusBar;
    bApplyUpdates: TButton;
    cdsOriginalUNITID: TIntegerField;
    cdsOriginalCOUNTRYID: TStringField;
    cdsOriginalRANKID: TStringField;
    cdsOriginalPARENTID: TIntegerField;
    cdsOriginalAPPROVALID: TStringField;
    cdsOriginalAGEYEARS: TFloatField;
    cdsOriginalGISID: TIntegerField;
    procedure bOpenClick(Sender: TObject);
    procedure bUpdateClick(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure bApplyUpdatesClick(Sender: TObject);
  private
    { Private declarations }
    StartStr, EndStr : string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.bOpenClick(Sender: TObject);
begin
  StartStr := trim(eStart.Text);
  EndStr := trim(eEnd.Text);
  qOriginal.Close;
  qOriginal.ParamByName('StartStr').AsString := StartStr;
  qOriginal.ParamByName('EndStr').AsString := EndStr;
  cdsOriginal.Open;
  cdsNew.Open;
end;

procedure TForm1.bUpdateClick(Sender: TObject);
var
  NumDone : integer;
begin
  NumDone := 0;
  repeat
    NumDone := NumDone + 1;
    StatusBar1.Panels[0].Text := IntToStr(NumDone);
    StatusBar1.Refresh;
    try
      if (cdsOriginalNew.RecordCount > 0) then
      begin
          StatusBar1.Panels[1].Text := cdsOriginalUnitName.AsString;
          StatusBar1.Refresh;
          cdsOriginal.Edit;
          cdsOriginalUnitName.AsString := cdsOriginalNewNewName.AsString;
          cdsOriginal.Post;
          {
          cdsOriginalNew.Edit;
          cdsOriginalNewDone.AsInteger := -1;
          cdsOriginalNew.Post;
          }
          cdsOriginal.ApplyUpdates(0);
      end;
    except
      MessageDlg('Not able to change '+cdsOriginalUnitName.AsString,mtWarning,[mbOK],0);
    end;
    cdsOriginal.Next;
  until cdsOriginal.Eof;
  cdsOriginal.First;
  try
    {
    cdsOriginalNew.ApplyUpdates(-1);
    }
    {
    cdsOriginal.ApplyUpdates(-1);
    }
  except
  end;
end;

procedure TForm1.bCloseClick(Sender: TObject);
begin
  cdsOriginal.Close;
end;

procedure TForm1.bApplyUpdatesClick(Sender: TObject);
begin
  try
    cdsOriginal.ApplyUpdates(-1);
  except
      MessageDlg('Not able to apply updates',mtWarning,[mbOK],0);
  end;
end;

end.
