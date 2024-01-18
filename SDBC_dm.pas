unit SDBC_dm;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider,
  WideStrings;

type
  TdmDVC = class(TDataModule)
    sqlcDateView: TSQLConnection;
    qRecordIDsSourceA: TSQLQuery;
    dspRecordIDsSourceA: TDataSetProvider;
    dsRecordIDsSourceA: TDataSource;
    cdsRecordIDsSourceA: TClientDataSet;
    dscdsRecordIDsSourceA: TDataSource;
    qSourceA: TSQLQuery;
    cdsSourceA: TClientDataSet;
    dsSourceA: TDataSource;
    cdsRecordIDsSourceARECORDID: TIntegerField;
    cdsRecordIDsSourceAqSourceA: TDataSetField;
    cdsSourceARECORDID: TIntegerField;
    cdsSourceAREFNUM: TIntegerField;
    cdsSourceASOURCETYPEID: TStringField;
    qIsoValidCaptured: TSQLQuery;
    cdsIsoValidCaptured: TClientDataSet;
    dsIsoValidCaptured: TDataSource;
    cdsIsoValidCapturedRECORDID: TIntegerField;
    cdsIsoValidCapturedVALIDSTATUSID: TStringField;
    cdsIsoValidCapturedDATEDONE: TSQLTimeStampField;
    cdsIsoValidCapturedDONEBY: TStringField;
    qRecordIDsValid: TSQLQuery;
    dspRecordIDsValid: TDataSetProvider;
    dsqRecordIDsValid: TDataSource;
    cdsRecordIDsValid: TClientDataSet;
    dsRecordIDsValid: TDataSource;
    cdsRecordIDsValidRECORDID: TIntegerField;
    qIsoValidValidated: TSQLQuery;
    cdsIsoValidValidated: TClientDataSet;
    dsIsoValidValidated: TDataSource;
    cdsRecordIDsValidqIsoValidValidated: TDataSetField;
    cdsRecordIDsValidqIsoValidCaptured: TDataSetField;
    cdsIsoValidValidatedRECORDID: TIntegerField;
    cdsIsoValidValidatedVALIDSTATUSID: TStringField;
    cdsIsoValidValidatedDATEDONE: TSQLTimeStampField;
    cdsIsoValidValidatedDONEBY: TStringField;
    qRecordIDs: TSQLQuery;
    dspRecordIDs: TDataSetProvider;
    cdsRecordIDs: TClientDataSet;
    dsRecordIDs: TDataSource;
    qNumRecords: TSQLQuery;
    dspNumRecords: TDataSetProvider;
    cdsNumRecords: TClientDataSet;
    dsNumRecords: TDataSource;
    cdsRecordIDsCOUNT: TIntegerField;
    cdsNumRecordsDATECOUNTED: TSQLTimeStampField;
    cdsNumRecordsNUMTOTALRECORDS: TIntegerField;
    cdsNumRecordsNUMPUBLRECORDS: TIntegerField;
    qRecordIDsIsoFor: TSQLQuery;
    dspRecordIDsIsoFor: TDataSetProvider;
    dsqRecordIDsIsoFor: TDataSource;
    cdsRecordIDsIsoFor: TClientDataSet;
    dsRecordIDsIsoFor: TDataSource;
    qIsoFor: TSQLQuery;
    cdsIsoFor: TClientDataSet;
    dsIsoFor: TDataSource;
    cdsRecordIDsIsoForRECORDID: TIntegerField;
    cdsRecordIDsIsoForqIsoFor: TDataSetField;
    cdsIsoForRECORDID: TIntegerField;
    cdsIsoForWHOFORID: TStringField;
    qCountryRecords: TSQLQuery;
    dspCountryRecords: TDataSetProvider;
    cdsCountryRecords: TClientDataSet;
    dsCountryRecords: TDataSource;
    dsqCountryRecords: TDataSource;
    qCountryCount: TSQLQuery;
    cdsCountryCount: TClientDataSet;
    dsCountryCount: TDataSource;
    cdsCountryRecordsCOUNTRYABR: TStringField;
    cdsCountryRecordsCOUNTRYHASRECORDS: TStringField;
    cdsCountryRecordsqCountryCount: TDataSetField;
    cdsCountryCountCOUNT: TIntegerField;
    cdsCountryRecordsNUMRECORDS: TIntegerField;
    cdsCountryCountCOUNTRYABR: TStringField;
    qSmpLocC: TSQLQuery;
    dspSmpLocC: TDataSetProvider;
    cdsSmpLocC: TClientDataSet;
    dsSmpLocC: TDataSource;
    cdsSmpLocCSAMPLENO: TStringField;
    cdsSmpLocCCONTINENTID: TStringField;
    cdsSmpLocCCOUNTRYABR: TStringField;
    qSmpLocCSAMPLENO: TStringField;
    qSmpLocCCONTINENTID: TStringField;
    qSmpLocCCOUNTRYABR: TStringField;
    qSmpLocCC: TStringField;
    cdsSmpLocCC: TStringField;
    qSmpLocCD: TStringField;
    cdsSmpLocCD: TStringField;
    qUnitRecords: TSQLQuery;
    dspUnitRecords: TDataSetProvider;
    cdsUnitRecords: TClientDataSet;
    dsUnitRecords: TDataSource;
    cdsUnitRecordsGISID: TIntegerField;
    cdsUnitRecordsRECORDID: TIntegerField;
    qDomainRecords: TSQLQuery;
    dspDomainRecords: TDataSetProvider;
    cdsDomainRecords: TClientDataSet;
    dsDomainRecords: TDataSource;
    cdsDomainRecordsDOMAINID: TIntegerField;
    cdsDomainRecordsRECORDID: TIntegerField;
    qNumContributions: TSQLQuery;
    dspNumContributions: TDataSetProvider;
    cdsNumContributions: TClientDataSet;
    dsNumContributions: TDataSource;
    cdsNumContributionsDONEBY: TStringField;
    cdsNumContributionsCOUNT: TIntegerField;
    qUsers: TSQLQuery;
    dspUsers: TDataSetProvider;
    cdsUsers: TClientDataSet;
    dsUsers: TDataSource;
    cdsUsersUSERNAMEID: TStringField;
    cdsUsersNUMCONTRIBUTED: TIntegerField;
    qUnitsDV: TSQLQuery;
    dspUnitsDV: TDataSetProvider;
    cdsUnitsDV: TClientDataSet;
    dsUnitsDV: TDataSource;
    cdsUnitsDVCOUNTRYABR: TStringField;
    cdsUnitsDVUNITNAME: TStringField;
    cdsUnitsDVGISID: TIntegerField;
    qUnitsDVCOUNTRYABR: TStringField;
    qUnitsDVUNITNAME: TStringField;
    qUnitsDVGISID: TIntegerField;
    qParentUnitsDV: TSQLQuery;
    dspParentUnitsDV: TDataSetProvider;
    cdsParentUnitsDV: TClientDataSet;
    dsParentUnitsDV: TDataSource;
    qParentUnitsDVUNITNAME: TStringField;
    qParentUnitsDVGISID: TIntegerField;
    qParentUnitsDVPARENTID: TIntegerField;
    cdsParentUnitsDVUNITNAME: TStringField;
    cdsParentUnitsDVGISID: TIntegerField;
    cdsParentUnitsDVPARENTID: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    StartRecord, EndRecord : integer;
  end;

var
  dmDVC: TdmDVC;

implementation

{$R *.dfm}

procedure TdmDVC.DataModuleCreate(Sender: TObject);
begin
  dmDVC.StartRecord := 0;
  dmDVC.EndRecord := 5000;
end;

end.
