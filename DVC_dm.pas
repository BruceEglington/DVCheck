unit DVC_dm;

interface

uses
  Windows,
  SysUtils, Classes,
  DBXCommon, Dialogs,
  DB, SqlExpr, FMTBcd, DBClient, Provider,
  midaslib,
  DVC_constants,  mathproc,
  WideStrings, DbxDevartInterBase, Data.DBXFirebird;

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
    qUsers: TSQLQuery;
    dspUsers: TDataSetProvider;
    cdsUsers: TClientDataSet;
    dsUsers: TDataSource;
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
    qUnitHasRecords: TSQLQuery;
    dspUnitHasRecords: TDataSetProvider;
    dsqUnitHasRecords: TDataSource;
    cdsUnitHasRecords: TClientDataSet;
    dsUnitHasRecords: TDataSource;
    qUnitRecordsYN: TSQLQuery;
    cdsUnitRecordsYN: TClientDataSet;
    dsUnitRecordsYN: TDataSource;
    qUnitCount: TSQLQuery;
    cdsUnitCount: TClientDataSet;
    dsUnitCount: TDataSource;
    dsqUnitRecordsYN: TDataSource;
    cdsUnitHasRecordsUNITNAME: TStringField;
    cdsUnitHasRecordsqUnitRecordsYN: TDataSetField;
    cdsUnitRecordsYNUNITNAME: TStringField;
    cdsUnitRecordsYNCOUNTRYABR: TStringField;
    cdsUnitRecordsYNUNITHASRECORDS: TStringField;
    cdsUnitRecordsYNqUnitCount: TDataSetField;
    cdsUnitCountUNITNAME: TStringField;
    cdsUnitCountCOUNT: TIntegerField;
    qSuiteCountryCount: TSQLQuery;
    cdsSuiteCountryCount: TClientDataSet;
    dsSuiteCountryCount: TDataSource;
    cdsUnitHasRecordsqSuiteCountryCount: TDataSetField;
    cdsSuiteCountryCountCOUNT: TIntegerField;
    qDepIsotopeCount: TSQLQuery;
    dspDepIsotopeCount: TDataSetProvider;
    cdsDepIsotopeCount: TClientDataSet;
    dsDepIsotopeCount: TDataSource;
    cdsDepIsotopeCountDEPOSITID: TIntegerField;
    qDeposits: TSQLQuery;
    dspDeposits: TDataSetProvider;
    cdsDeposits: TClientDataSet;
    dsDeposits: TDataSource;
    DeleteRecords: TSQLQuery;
    cdsDepositsSDBDEPOSITID: TIntegerField;
    qRecordIDRecalc: TSQLQuery;
    dspRecordIDRecalc: TDataSetProvider;
    cdsRecordIDRecalc: TClientDataSet;
    dsqRecordIDRecalc: TDataSource;
    dsRecordIDRecalc: TDataSource;
    QdmSmp: TSQLQuery;
    QdmSmpRECORDID: TIntegerField;
    QdmSmpISOSYSTEM: TStringField;
    QdmSmpSAMPLENO: TStringField;
    QdmSmpFRAC: TStringField;
    QdmSmpINCLUDED: TStringField;
    dsQdmSmpDB: TDataSource;
    dspQdmSmp: TDataSetProvider;
    cdsQdmSmp: TClientDataSet;
    cdsQdmSmpRECORDID: TIntegerField;
    cdsQdmSmpISOSYSTEM: TStringField;
    cdsQdmSmpSAMPLENO: TStringField;
    cdsQdmSmpFRAC: TStringField;
    cdsQdmSmpINCLUDED: TStringField;
    cdsQdmSmpqSmpDataX: TDataSetField;
    cdsQdmSmpqSmpDataXerr: TDataSetField;
    cdsQdmSmpqSmpDataY: TDataSetField;
    cdsQdmSmpqSmpDataYerr: TDataSetField;
    cdsQdmSmpqSmpDataR: TDataSetField;
    cdsQdmSmpqSmpDataPrecX: TDataSetField;
    cdsQdmSmpqSmpDataPrecY: TDataSetField;
    cdsQdmSmpqErrTypeX: TDataSetField;
    cdsQdmSmpqErrTypeY: TDataSetField;
    cdsQdmSmpqNormalisedValueY: TDataSetField;
    cdsQdmSmpqNormalisedValueX: TDataSetField;
    cdsQdmSmpqErrTypeZ: TDataSetField;
    cdsQdmSmpqSmpDataZerr: TDataSetField;
    cdsQdmSmpqSmpDataPrecZ: TDataSetField;
    cdsQdmSmpqNormalisedValueZ: TDataSetField;
    cdsQdmSmpqSmpDataZ: TDataSetField;
    dsQdmSmp: TDataSource;
    qSmpDataX: TSQLQuery;
    dsqSmpDataX: TDataSource;
    cdsSmpDataX: TClientDataSet;
    cdsSmpDataXSAMPLENO: TStringField;
    cdsSmpDataXFRAC: TStringField;
    cdsSmpDataXISOSYSTEM: TStringField;
    cdsSmpDataXVARIABLEID: TStringField;
    cdsSmpDataXDATAVALUE: TFloatField;
    cdsSmpDataXNORMALISINGSTANDARD: TStringField;
    cdsSmpDataXSTANDARDVALUE: TFloatField;
    cdsSmpDataXVARIABLENAME: TStringField;
    cdsSmpDataXqStandardValueX: TDataSetField;
    dsSmpDataX: TDataSource;
    qStandardValueX: TSQLQuery;
    cdsAcceptedValueX: TClientDataSet;
    cdsAcceptedValueXACCEPTEDVALUE: TFloatField;
    dsAcceptedValueX: TDataSource;
    qNormalisedValueX: TSQLQuery;
    cdsNormalisedValueX: TClientDataSet;
    cdsNormalisedValueXNORMALISEDVALUE: TFloatField;
    dsNormalisedValueX: TDataSource;
    qSmpDataXerr: TSQLQuery;
    dsqSmpDataXerr: TDataSource;
    cdsSmpDataXerr: TClientDataSet;
    cdsSmpDataXerrVARIABLEID: TStringField;
    cdsSmpDataXerrDATAVALUE: TFloatField;
    cdsSmpDataXerrNORMALISINGSTANDARD: TStringField;
    cdsSmpDataXerrSTANDARDVALUE: TFloatField;
    cdsSmpDataXerrVARIABLENAME: TStringField;
    dsSmpDataXerr: TDataSource;
    qErrTypeX: TSQLQuery;
    cdsErrTypeX: TClientDataSet;
    cdsErrTypeXVARIABLEID: TStringField;
    cdsErrTypeXDATAVALUE: TFloatField;
    dsErrTypeX: TDataSource;
    qSmpDataPrecX: TSQLQuery;
    cdsSmpDataPrecX: TClientDataSet;
    cdsSmpDataPrecXVARIABLEID: TStringField;
    cdsSmpDataPrecXDATAVALUE: TFloatField;
    dsSmpDataPrecX: TDataSource;
    qSmpDataY: TSQLQuery;
    dsqSmpDataY: TDataSource;
    cdsSmpDataY: TClientDataSet;
    StringField1: TStringField;
    FloatField1: TFloatField;
    StringField2: TStringField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    cdsSmpDataYqStandardValueY: TDataSetField;
    dsSmpDataY: TDataSource;
    qStandardValueY: TSQLQuery;
    cdsAcceptedValueY: TClientDataSet;
    FloatField3: TFloatField;
    dsAcceptedValueY: TDataSource;
    qNormalisedValueY: TSQLQuery;
    cdsNormalisedValueY: TClientDataSet;
    cdsNormalisedValueYNORMALISEDVALUE: TFloatField;
    dsNormalisedValueY: TDataSource;
    qSmpDataYerr: TSQLQuery;
    dsqSmpDataYerr: TDataSource;
    cdsSmpDataYerr: TClientDataSet;
    StringField8: TStringField;
    FloatField4: TFloatField;
    StringField9: TStringField;
    FloatField5: TFloatField;
    StringField10: TStringField;
    dsSmpDataYerr: TDataSource;
    qErrTypeY: TSQLQuery;
    cdsErrTypeY: TClientDataSet;
    cdsErrTypeYVARIABLEID: TStringField;
    cdsErrTypeYDATAVALUE: TFloatField;
    dsErrTypeY: TDataSource;
    qSmpDataPrecY: TSQLQuery;
    cdsSmpDataPrecY: TClientDataSet;
    StringField7: TStringField;
    FloatField8: TFloatField;
    dsSmpDataPrecY: TDataSource;
    qSmpDataZ: TSQLQuery;
    qSmpDataZerr: TSQLQuery;
    qSmpDataPrecZ: TSQLQuery;
    cdsSmpDataPrecZ: TClientDataSet;
    StringField20: TStringField;
    FloatField13: TFloatField;
    cdsSmpDataZerr: TClientDataSet;
    StringField21: TStringField;
    FloatField14: TFloatField;
    StringField22: TStringField;
    FloatField15: TFloatField;
    StringField23: TStringField;
    cdsSmpDataZ: TClientDataSet;
    StringField14: TStringField;
    FloatField9: TFloatField;
    StringField15: TStringField;
    FloatField10: TFloatField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    cdsSmpDataZqStandardValueZ: TDataSetField;
    dsSmpDataZ: TDataSource;
    dsSmpDataZerr: TDataSource;
    dsSmpDataPrecZ: TDataSource;
    qErrTypeZ: TSQLQuery;
    qStandardValueZ: TSQLQuery;
    dsSmpDataR: TDataSource;
    cdsAcceptedValueZ: TClientDataSet;
    FloatField11: TFloatField;
    dsAcceptedValueZ: TDataSource;
    cdsErrTypeZ: TClientDataSet;
    StringField24: TStringField;
    FloatField16: TFloatField;
    dsErrTypeZ: TDataSource;
    qNormalisedValueZ: TSQLQuery;
    cdsNormalisedValueZ: TClientDataSet;
    FloatField12: TFloatField;
    dsNormalisedValueZ: TDataSource;
    cdsRecordIDRecalcRECORDID: TIntegerField;
    qRecalcSmp: TSQLQuery;
    qRecalcSmpSAMPLENO: TStringField;
    qRecalcSmpFRAC: TStringField;
    qRecalcSmpISOSYSTEM: TStringField;
    dsqRecalcSmp: TDataSource;
    dspRecalcSmp: TDataSetProvider;
    cdsRecalcSmp: TClientDataSet;
    cdsRecalcSmpSAMPLENO: TStringField;
    cdsRecalcSmpFRAC: TStringField;
    cdsRecalcSmpISOSYSTEM: TStringField;
    cdsRecalcSmpqRecalcZ: TDataSetField;
    cdsRecalcSmpqRecalcAgePref: TDataSetField;
    cdsRecalcSmpqRecalcNormalisedY: TDataSetField;
    cdsRecalcSmpqRecalcY: TDataSetField;
    dsRecalcSmp: TDataSource;
    qRecalcY: TSQLQuery;
    qRecalcYSAMPLENO: TStringField;
    qRecalcYFRAC: TStringField;
    qRecalcYISOSYSTEM: TStringField;
    qRecalcYVARIABLEID: TStringField;
    qRecalcYDATAVALUE: TFloatField;
    qRecalcYNORMALISINGSTANDARD: TStringField;
    qRecalcYSTANDARDVALUE: TFloatField;
    qRecalcYVARIABLENAME: TStringField;
    dsqRecalcY: TDataSource;
    cdsRecalcY: TClientDataSet;
    cdsRecalcYSAMPLENO: TStringField;
    cdsRecalcYFRAC: TStringField;
    cdsRecalcYISOSYSTEM: TStringField;
    cdsRecalcYVARIABLEID: TStringField;
    cdsRecalcYDATAVALUE: TFloatField;
    cdsRecalcYNORMALISINGSTANDARD: TStringField;
    cdsRecalcYSTANDARDVALUE: TFloatField;
    cdsRecalcYVARIABLENAME: TStringField;
    cdsRecalcYqRecalcStandardY: TDataSetField;
    dsRecalcY: TDataSource;
    qRecalcStandardY: TSQLQuery;
    qRecalcStandardYACCEPTEDVALUE: TFloatField;
    cdsRecalcStandardY: TClientDataSet;
    dsRecalcStandardValueY: TDataSource;
    qRecalcNormalisedY: TSQLQuery;
    qRecalcNormalisedYSAMPLENO: TStringField;
    qRecalcNormalisedYFRAC: TStringField;
    qRecalcNormalisedYISOSYSTEM: TStringField;
    qRecalcNormalisedYVARIABLEID: TStringField;
    qRecalcNormalisedYDATAVALUE: TFloatField;
    qRecalcNormalisedYNORMALISINGSTANDARD: TStringField;
    qRecalcNormalisedYSTANDARDVALUE: TFloatField;
    qRecalcNormalisedYACCEPTEDVALUE: TFloatField;
    qRecalcNormalisedYNORMALISEDVALUE: TFloatField;
    cdsRecalcNormalisedY: TClientDataSet;
    cdsRecalcNormalisedYSAMPLENO: TStringField;
    cdsRecalcNormalisedYFRAC: TStringField;
    cdsRecalcNormalisedYISOSYSTEM: TStringField;
    cdsRecalcNormalisedYVARIABLEID: TStringField;
    cdsRecalcNormalisedYDATAVALUE: TFloatField;
    cdsRecalcNormalisedYNORMALISINGSTANDARD: TStringField;
    cdsRecalcNormalisedYSTANDARDVALUE: TFloatField;
    cdsRecalcNormalisedYACCEPTEDVALUE: TFloatField;
    cdsRecalcNormalisedYNORMALISEDVALUE: TFloatField;
    dsRecalcNormalisedY: TDataSource;
    qRecalcAgePref: TSQLQuery;
    qRecalcAgePrefSAMPLENO: TStringField;
    qRecalcAgePrefFRAC: TStringField;
    qRecalcAgePrefISOSYSTEM: TStringField;
    qRecalcAgePrefVARIABLEID: TStringField;
    qRecalcAgePrefDATAVALUE: TFloatField;
    dsqRecalcAgePref: TDataSource;
    cdsRecalcAgePref: TClientDataSet;
    cdsRecalcAgePrefSAMPLENO: TStringField;
    cdsRecalcAgePrefFRAC: TStringField;
    cdsRecalcAgePrefISOSYSTEM: TStringField;
    cdsRecalcAgePrefVARIABLEID: TStringField;
    cdsRecalcAgePrefDATAVALUE: TFloatField;
    dsRecalcAgePref: TDataSource;
    qRecalcZ: TSQLQuery;
    qRecalcZSAMPLENO: TStringField;
    qRecalcZFRAC: TStringField;
    qRecalcZISOSYSTEM: TStringField;
    qRecalcZVARIABLEID: TStringField;
    qRecalcZDATAVALUE: TFloatField;
    qRecalcZNORMALISINGSTANDARD: TStringField;
    qRecalcZSTANDARDVALUE: TFloatField;
    qRecalcZVARIABLENAME: TStringField;
    dsqRecalcZ: TDataSource;
    cdsRecalcZ: TClientDataSet;
    cdsRecalcZSAMPLENO: TStringField;
    cdsRecalcZFRAC: TStringField;
    cdsRecalcZISOSYSTEM: TStringField;
    cdsRecalcZVARIABLEID: TStringField;
    cdsRecalcZDATAVALUE: TFloatField;
    cdsRecalcZNORMALISINGSTANDARD: TStringField;
    cdsRecalcZSTANDARDVALUE: TFloatField;
    cdsRecalcZVARIABLENAME: TStringField;
    dsRecalcZ: TDataSource;
    cdsUsersLASTUSED: TSQLTimeStampField;
    InsertDepIsotopeCount: TSQLQuery;
    cdsUsersUSERID: TStringField;
    InsertIsoFor: TSQLQuery;
    SQLMonitor1: TSQLMonitor;
    qDVrecord: TSQLQuery;
    dsqDVrecord: TDataSource;
    dspqDVrecord: TDataSetProvider;
    cdsDVrecord: TClientDataSet;
    dsDVrecord: TDataSource;
    qDVrecordRECORDID: TIntegerField;
    qDVrecordCOUNTRYABR: TStringField;
    qDVrecordUNITID: TIntegerField;
    qDVrecordMATERIALABR: TStringField;
    qDVrecordISOTOPESYSTEM: TStringField;
    qDVrecordAPPROACHABR: TStringField;
    qDVrecordTECHABR: TStringField;
    qDVrecordINTERPABR: TStringField;
    qDVrecordPREFLEVEL: TSmallintField;
    qDVrecordIAGE: TIntegerField;
    qDVrecordIAGEPERROR: TIntegerField;
    qDVrecordIAGEMERROR: TIntegerField;
    qDVrecordAGEUNITS: TStringField;
    qDVrecordAGERELID: TStringField;
    qDVrecordLITHOLOGY: TStringField;
    qDVrecordMETHODABR: TStringField;
    qDVrecordDATESTRING: TSQLTimeStampField;
    qDVrecordDECAYCONST1: TFloatField;
    qDVrecordDECAYCONST2: TFloatField;
    qDVrecordSIGMAPERCENTDC1: TFloatField;
    qDVrecordSIGMAPERCENTDC2: TFloatField;
    qDVrecordREGISTEREDUSER: TStringField;
    qDVrecordRAGE: TFloatField;
    qDVrecordRAGEPERROR: TFloatField;
    qDVrecordRAGEMERROR: TFloatField;
    qRecordIDsLab: TSQLQuery;
    dspRecordIDsLab: TDataSetProvider;
    dsRecordIDsLab: TDataSource;
    cdsRecordIDsLab: TClientDataSet;
    dscdsRecordIDsLab: TDataSource;
    qIsoLab: TSQLQuery;
    cdsIsoLab: TClientDataSet;
    dsIsoLab: TDataSource;
    cdsRecordIDsLabRECORDID: TIntegerField;
    cdsRecordIDsLabqIsoLab: TDataSetField;
    cdsIsoLabRECORDID: TIntegerField;
    cdsIsoLabLABORATORYABR: TStringField;
    qRecordIDsLithol: TSQLQuery;
    dspRecordIDsLithol: TDataSetProvider;
    dsRecordIDsLithol: TDataSource;
    cdsRecordIDsLithol: TClientDataSet;
    dscdsRecordIDsLithol: TDataSource;
    cdsRecordIDsLitholRECORDID: TIntegerField;
    qSmpLithol: TSQLQuery;
    cdsSmpLithol: TClientDataSet;
    dsSmpLithol: TDataSource;
    cdsRecordIDsLitholLITHOLOGY: TStringField;
    cdsRecordIDsLitholqSmpLithol: TDataSetField;
    cdsSmpLitholSAMPLENO: TStringField;
    cdsSmpLitholLITHOLOGY: TStringField;
    qSmpLitholSAMPLENO: TStringField;
    qSmpLitholLITHOLOGY: TStringField;
    cdsRecordIDsLitholSAMPLENO: TStringField;
    cdsRecordIDsLitholSMPLITH: TStringField;
    qNew: TSQLQuery;
    qDepositSamplesMissingLocations: TSQLQuery;
    dspDepositSamplesMissingLocations: TDataSetProvider;
    dsDepositSamplesMissingLocations: TDataSource;
    cdsDepositSamplesMissingLocations: TClientDataSet;
    dscdsDepositSamplesMissingLocations: TDataSource;
    cdsDepositSamplesMissingLocationsSDBDEPOSITID: TIntegerField;
    cdsDepositSamplesMissingLocationsDEPLATITUDE: TFloatField;
    cdsDepositSamplesMissingLocationsDEPLONGITUDE: TFloatField;
    cdsDepositSamplesMissingLocationsSAMPLENO: TStringField;
    cdsDepositSamplesMissingLocationsLATITUDE: TFloatField;
    cdsDepositSamplesMissingLocationsLONGITUDE: TFloatField;
    qRecordIDsDup: TSQLQuery;
    dspRecordIDsDup: TDataSetProvider;
    cdsRecordIDsDup: TClientDataSet;
    dscdsRecordIDsDup: TDataSource;
    qDup: TSQLQuery;
    cdsDup: TClientDataSet;
    dsDup: TDataSource;
    dsRecordIDsDup: TDataSource;
    cdsDupRECORDID: TIntegerField;
    cdsDupSAMPLENO: TStringField;
    cdsDupFRAC: TStringField;
    cdsDupRAGE: TFloatField;
    cdsDupRAGEPERROR: TFloatField;
    cdsDupMATERIALABR: TStringField;
    cdsDupPREFLEVEL: TSmallintField;
    cdsRecordIDsDupRECORDID: TIntegerField;
    cdsRecordIDsDupINTERPABR: TStringField;
    cdsRecordIDsDupRAGE: TFloatField;
    cdsRecordIDsDupRAGEPERROR: TFloatField;
    cdsRecordIDsDupMATERIALABR: TStringField;
    cdsRecordIDsDupSAMPLENO: TStringField;
    cdsRecordIDsDupPREFLEVEL: TSmallintField;
    cdsRecordIDsDupqDup: TDataSetField;
    cdsRecordIDsDupISOTOPESYSTEM: TStringField;
    cdsDupISOSYSTEM: TStringField;
    QdmSmpORIGINALNO: TStringField;
    QdmSmpLITHCLASSID: TStringField;
    cdsQdmSmpORIGINALNO: TStringField;
    cdsQdmSmpLITHCLASSID: TStringField;
    cdsCountryRecordsqCountryCount: TDataSetField;
    cdsCountryCountCOUNT: TFMTBCDField;
    cdsRecordIDsCOUNT: TFMTBCDField;
    cdsNumContributionsCOUNT: TFMTBCDField;
    cdsDepIsotopeCountCOUNTPB: TIntegerField;
    cdsDepIsotopeCountCOUNTSR: TIntegerField;
    cdsDepIsotopeCountCOUNTND: TIntegerField;
    cdsDepIsotopeCountCOUNTOS: TIntegerField;
    cdsDepIsotopeCountCOUNTS: TIntegerField;
    cdsDepIsotopeCountCOUNTSO4: TIntegerField;
    cdsDepIsotopeCountCOUNTO: TIntegerField;
    cdsDepIsotopeCountCOUNTHF: TIntegerField;
    qGDUs: TSQLQuery;
    dspGDUs: TDataSetProvider;
    cdsGDUs: TClientDataSet;
    cdsGDUsGDUID: TFMTBCDField;
    cdsGDUsGDUNAME: TStringField;
    cdsGDUsRCNMDLID: TStringField;
    cdsGDUsMAXIGNEOUSAGE: TFloatField;
    cdsGDUsMAXMETAMORPHICAGE: TFloatField;
    cdsGDUsMAXCRUSTALRESAGE: TFloatField;
    cdsGDUsMAXDETRITALAGE: TFloatField;
    cdsGDUsLIMOLDP: TFloatField;
    dsGDUs: TDataSource;
    qIsoGDU: TSQLQuery;
    dspIsoGDU: TDataSetProvider;
    cdsIsoGDU: TClientDataSet;
    cdsIsoGDURECORDID: TIntegerField;
    cdsIsoGDURCNMDLID: TStringField;
    cdsIsoGDUGDUID: TFMTBCDField;
    dsIsoGDU: TDataSource;
    qGDUPDF: TSQLQuery;
    dspGDUPDF: TDataSetProvider;
    cdsGDUPDF: TClientDataSet;
    cdsGDUPDFRCNMDLID: TStringField;
    cdsGDUPDFGDUID: TFMTBCDField;
    cdsGDUPDFCURVEORDER: TSmallintField;
    cdsGDUPDFPDFORDER: TIntegerField;
    cdsGDUPDFAGE: TFloatField;
    cdsGDUPDFPDFVALUE: TFloatField;
    cdsGDUPDFCURVEINTERP: TStringField;
    dsGDUPDF: TDataSource;
    qGDURecordAges: TSQLQuery;
    dspGDURecordAges: TDataSetProvider;
    cdsGDURecordAges: TClientDataSet;
    cdsGDURecordAgesRECORDID: TIntegerField;
    cdsGDURecordAgesRCNMDLID: TStringField;
    cdsGDURecordAgesGDUID: TFMTBCDField;
    cdsGDURecordAgesRAGE: TFloatField;
    cdsGDURecordAgesRAGEPERROR: TFloatField;
    cdsGDURecordAgesRAGEMERROR: TFloatField;
    cdsGDURecordAgesINTERPABR: TStringField;
    dsGDURecordAges: TDataSource;
    qDelete: TSQLQuery;
    qUpdate: TSQLQuery;
    qMaxAgeRef: TSQLQuery;
    dspMaxAgeRef: TDataSetProvider;
    cdsMaxAgeRef: TClientDataSet;
    dsMaxAgeRef: TDataSource;
    cdsMaxAgeRefGDUID: TFMTBCDField;
    cdsMaxAgeRefMAXIGNEOUSAGE: TFloatField;
    cdsMaxAgeRefRECORDID: TIntegerField;
    cdsMaxAgeRefRAGE: TFloatField;
    cdsMaxAgeRefSOURCESHORT: TStringField;
    cdsGDUsMAXAGEREFS: TStringField;
    qGDUSmpdataAges: TSQLQuery;
    dspGDUSmpdataAges: TDataSetProvider;
    cdsGDUSmpdataAges: TClientDataSet;
    dsGDUSmpdataAges: TDataSource;
    cdsGDUSmpdataAgesSAMPLENO: TStringField;
    cdsGDUSmpdataAgesFRAC: TStringField;
    cdsGDUSmpdataAgesGDUID: TFMTBCDField;
    cdsGDUSmpdataAgesAGE: TFloatField;
    cdsGDUSmpdataAgesAGEERROR: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    StartRecord, EndRecord : integer;
    function GetUTCDateTime: TDateTime;
    procedure DeleteDepositIsotopeCount;
    procedure InsertDepositIsotopeCount(tDepositID,tCountPb,tCountSr,tCountNd,tCountHf,tCountOs,tCountS,tCountSO4,tCountO : integer);
    procedure InsertIsoForRecord(tRecordID : integer;tWhoForID : string);
    procedure RecalcTDM(RecordID : integer);
    procedure CalculateGDUPDFS(tRcnMdlID : string;
                               iGDUID : integer; iCurveOrder : integer;
                               CurveInterpID : string;
                           var CountRecords : integer;
                           var MaxAge : double;
                           var WasSuccessful : boolean);
    procedure FindMaxAgeReference(iGDUID : integer; tRcnMdlID : string;
                                  InterpID : string;
                                  ExistReference : string;
                              var WasSuccessful : boolean);
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

function TdmDVC.GetUTCDateTime: TDateTime;
var
  GMTST: Windows.TSystemTime;
begin
  windows.GetSystemTime(GMTST);
  result:=Sysutils.SystemTimeToDateTime(GMTST);
end;

procedure TdmDVC.DeleteDepositIsotopeCount;
var
  TD: TDBXTransaction;
begin
  try
    dmDVC.DeleteRecords.SQL.Clear;
    dmDVC.DeleteRecords.SQL.Add('Delete from DEPISOTOPECOUNT WHERE DEPISOTOPECOUNT.DEPOSITID < 150000000');
    if not dmDVC.sqlcDateView.InTransaction then
    begin
      TD := dmDVC.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDVC.DeleteRecords.ExecSQL(false);
        dmDVC.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDVC.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        //WasSuccessful := false;
      end;
    end;
  except
  end;
end;

procedure TdmDVC.InsertDepositIsotopeCount(tDepositID,tCountPb,tCountSr,tCountNd,tCountHf,tCountOs,tCountS,tCountSO4,tCountO : integer);
var
  TD: TDBXTransaction;
begin
  try
    //if not dmDVC.sqlcStratDB.InTransaction then
    //begin
      dmDVC.InsertDepIsotopeCount.Close;
      dmDVC.InsertDepIsotopeCount.ParamByName('DepositID').AsInteger := tDepositID;
      dmDVC.InsertDepIsotopeCount.ParamByName('CountPb').AsInteger := tCountPb;
      dmDVC.InsertDepIsotopeCount.ParamByName('CountSr').AsInteger := tCountSr;
      dmDVC.InsertDepIsotopeCount.ParamByName('CountNd').AsInteger := tCountNd;
      dmDVC.InsertDepIsotopeCount.ParamByName('CountHF').AsInteger := tCountHf;
      dmDVC.InsertDepIsotopeCount.ParamByName('CountOs').AsInteger := tCountOs;
      dmDVC.InsertDepIsotopeCount.ParamByName('CountS').AsInteger := tCountS;
      dmDVC.InsertDepIsotopeCount.ParamByName('CountSO4').AsInteger := tCountSO4;
      dmDVC.InsertDepIsotopeCount.ParamByName('CountO').AsInteger := tCountO;
      if not dmDVC.sqlcDateView.InTransaction then
      begin
        TD := dmDVC.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmDVC.InsertDepIsotopeCount.ExecSQL(false);
          dmDVC.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
        except
          dmDVC.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
          //WasSuccessful := false;
        end;
      end;
    //end;
  except
  end;
end;

procedure TdmDVC.InsertIsoForRecord(tRecordID : integer;tWhoForID : string);
var
  TD: TDBXTransaction;
begin
  try
    //if not dmDVC.sqlcStratDB.InTransaction then
    //begin
      dmDVC.InsertIsoFor.Close;
      dmDVC.InsertIsoFor.ParamByName('tRecordID').AsInteger := tRecordID;
      dmDVC.InsertIsoFor.ParamByName('tWhoForID').AsString := tWhoForID;
      if not dmDVC.sqlcDateView.InTransaction then
      begin
        TD := dmDVC.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmDVC.InsertIsoFor.ExecSQL(false);
          dmDVC.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
        except
          dmDVC.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
          //WasSuccessful := false;
        end;
      end;
    //end;
  except
  end;
end;

procedure TdmDVC.RecalcTDM(RecordID : integer);
var
  TD: TDBXTransaction;
  tXX, tYY,
  tX, tY, tZ,
  tsX, tsY, tsZ,
  teX, teY, teZ,
  tR : double;
  tIncl : string;
  tSampleNo, tFrac,
  tIsotopeSystem, tApproachID,
  tInterpID,
  tLithology, tLithClassID : string;
begin
  dmDVC.QdmSmp.Close;
  dmDVC.QdmSmp.ParamByName('RecordID').AsInteger := RecordID;
  dmDVC.QdmSmp.Close;
  dmDVC.QdmSmp.Open;
  if (dmDVC.QdmSmp.RecordCount > 0) then
  begin
    if (dmDVC.QdmSmp.RecordCount = 1) then
    begin
      tSampleNo := dmDVC.cdsQdmSmpSAMPLENO.AsString;
      tFrac := dmDVC.cdsQdmSmpFRAC.AsString;
      tIsotopeSystem := dmDVC.cdsQdmSmpISOSYSTEM.AsString;
      //tInterpID := dmDVC.cdsQdmSmpInterpAbr.AsString;
      //tApproachID := dmDVC.cdsQdmSmpApproachAbr.AsString;
      //tLithology := dmDVC.cdsQdmSmplLithology.AsString;
      tLithClassID := dmDVC.cdsQdmSmpLITHCLASSID.AsString;
      tX := dmDVC.cdsQdmSmpqNormalisedValueX.AsFloat;
      tsX := dmDVC.cdsQdmSmpqSmpDataXerr.AsFloat;
      teX := dmDVC.cdsQdmSmpqErrTypeX.AsFloat;
      if (teX > 0.5) then tsX := tsX*tX/100.0;   //value of 1 implies error expressed as percent
      tY := dmDVC.cdsQdmSmpqNormalisedValueY.AsFloat;
      tsY := dmDVC.cdsQdmSmpqSmpDataYerr.AsFloat;
      teY := dmDVC.cdsQdmSmpqErrTypeY.AsFloat;
      if (teY > 0.5) then tsY := tsY*tY/100.0;
      //tZ := dmDVC.cdsQdmSmpqNormalisedValueZ.AsFloat;
      //tsZ := dmDVC.cdsQdmSmpqSmpDataZerr.AsFloat;
      //teZ := dmDVC.cdsQdmSmpqErrTypeZ.AsFloat;
      //if (teZ > 0.5) then tsZ := tsZ*tZ/100.0;
      //tR := dmDVC.cdsQdmSmpqSmpDataR.AsFloat;
      tR := 0.0;
      if (tLithClassID = 'I') then
      begin
        // calculate T(2DM) for all igneous rocks
        //calculate T(2DM)
        tApproachID := 'DM2';
      end else
      begin
        //check whether assigned interprtation is actually igneous. If so, treat as igneous
        //calculate T(DM) for all rocks where one does not know them to be igneous
        if ((tInterpID = 'CrysI') OR (tInterpID = 'CrysV') OR (tInterpID = 'CrysGI')) then
        begin
          //calculate T(2DM)
          tApproachID := 'DM2';
        end else
        begin
          //calculate T(DM)
          tApproachID := 'DM';
        end;
      end;
    end;
    if (dmDVC.QdmSmp.RecordCount > 1) then
    begin
    end;
  end;
  try
    if not dmDVC.sqlcDateView.InTransaction then
    begin
      TD := dmDVC.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        //dmDVC.qUpdateResult.ExecSQL(false);
        dmDVC.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDVC.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
        //WasSuccessful := false;
      end;
    end;
  except
  end;
end;

procedure TdmDVC.CalculateGDUPDFS(tRcnMdlID : string;
                                  iGDUID : integer; iCurveOrder : integer;
                                  CurveInterpID : string;
                              var CountRecords : integer;
                              var MaxAge : double;
                              var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
  tmpStr : string;
  tCurveInterp : string;
  i, k, l, j : integer;
  X1, X2, Y2 : double;
  Spectrum2d : array[0..MaxSteps,0..1] of double;
  tx, tx1, txp, txm : double;
  MinimumUncertainty : double;
  tempGauss : double;
  tempmax : double;
begin
  tmpStr := '0.0';
  WasSuccessful := true;
  //open query with list of all GDUs
  //delete existing records for specified reconstruction model and GDU
  // if appropriate menu option is chosen
  dmDVC.qDelete.ParamByName('RCNMDLID').AsString := tRcnMdlID;
  dmDVC.qDelete.ParamByName('GDUID').AsInteger := iGDUID;
  if (iCurveOrder > 0) then
  begin
    dmDVC.qDelete.ParamByName('CURVEORDER').AsInteger := iCurveOrder;
  end;
  TD := dmDVC.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    dmDVC.qDelete.ExecSQL(false);
    dmDVC.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
  except
    dmDVC.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
    WasSuccessful := false;
  end;
  //calculate ages for probability distribution and set all probabilities
  //to zero
  for k := 0 to Steps do
  begin
    X1 := SpectrumStartAge + 1.0*k*((SpectrumEndAge-SpectrumStartAge)/Steps);
    Spectrum2d[k,0] := X1;
    Spectrum2d[k,1] := 0.0;
  end;
  //set query to select records for specified GDU and reconstruction model
  //from DateView summary records
  //ShowMessage('3'+tRcnMdlID);
  //ShowMessage(dmDVC.qGDURecordAges.SQL.Text);
  dmDVC.cdsGDURECORDAGES.Close;
  dmDVC.qGDURECORDAGES.Close;
  dmDVC.qGDURecordAges.ParamByName('RCNMDLID').AsString := tRcnMdlID;
  dmDVC.qGDURecordAges.ParamByName('GDUID').AsInteger := iGDUID;
  dmDVC.cdsGDURecordAges.Open;
  //ShowMessage('4'+tRcnMdlID);
  //set query to select records for specified GDU and reconstruction model
  //from DateView individual sample data records
  dmDVC.cdsGDURecordAges.First;
  j := 0;
  CountRecords := 0;
  tempmax := 0.0;
  MaxAge := 0.0;
  if (iCurveOrder > 0) then
  begin
    repeat
      j := j + 1;
      tx := dmDVC.cdsGDURecordAgesRAGE.AsFloat;
      if ((tx > 0.0) and (tx < 5000.0) and (tx > MaxAge)) then MaxAge := tx;
      txp := dmDVC.cdsGDURecordAgesRAGEPERROR.AsFloat;
      txm := dmDVC.cdsGDURecordAgesRAGEMERROR.AsFloat;
      tx1 := (txp+txm)/2.0;   //need to make this equally distributed about the age
      tx1 := tx1/1.96;   //convert to 1 sigma from original 95% confidence
      if (tx1 < MinimumUncertainty) then tx1 := MinimumUncertainty;
      for k := 0 to Steps do
      begin
        X1 := Spectrum2d[k,0];
        tempGauss := Gauss(X1,tx,tx1);
        Spectrum2d[k,1] := Spectrum2d[k,1] + tempGauss;
      end;
      dmDVC.cdsGDURecordAges.Next;
    until dmDVC.cdsGDURecordAges.EOF;
    if ((iCurveOrder = 4) or (iCurveOrder = 5)) then
    begin
      dmDVC.cdsGDUSMPDATAAGES.Close;
      dmDVC.qGDUSMPDATAAGES.Close;
      //dmDVC.qGDUSmpdataAges.ParamByName('RCNMDLID').AsString := tRcnMdlID;
      dmDVC.qGDUSmpdataAges.ParamByName('GDUID').AsInteger := iGDUID;
      dmDVC.cdsGDUSmpdataAges.Open;
      dmDVC.cdsGDUSmpdataAges.First;
      repeat
        j := j + 1;
        tx := dmDVC.cdsGDUSmpdataAgesAGE.AsFloat;
        if ((tx > 0.0) and (tx < 5000.0) and (tx > MaxAge)) then MaxAge := tx;
        txp := dmDVC.cdsGDUSmpdataAgesAGEERROR.AsFloat;
        txm := dmDVC.cdsGDUSmpdataAgesAGEERROR.AsFloat;
        tx1 := (txp+txm)/2.0;   //need to make this equally distributed about the age
        tx1 := tx1;   //convert to 1 sigma from original 95% confidence
        if (tx1 < MinimumUncertainty) then tx1 := MinimumUncertainty;
        for k := 0 to Steps do
        begin
          X1 := Spectrum2d[k,0];
          tempGauss := Gauss(X1,tx,tx1);
          Spectrum2d[k,1] := Spectrum2d[k,1] + tempGauss;
        end;
        dmDVC.cdsGDUSmpdataAges.Next;
      until dmDVC.cdsGDUSmpdataAges.EOF;
    end;
    CountRecords := j;
    tempmax := 0.0;
    for k := 0 to Steps do
    begin
      if (tempmax < Spectrum2d[k,1]) then tempmax := Spectrum2d[k,1];
    end;
    if (tempmax <= 0.0) then tempmax := 1.0e-9;
    tempmax := 100.0/tempmax;
    //ShowMessage('6'+tRcnMdlID);
    //now insert new records
    try
      for k := 0 to Steps do
      begin
        if ((Spectrum2d[k,1]*tempmax) > PDFcutoff) then
        begin
          dmDVC.qNew.ParamByName('RCNMDLID').AsString := tRcnMdlID;
          dmDVC.qNew.ParamByName('GDUID').AsInteger := iGDUID;
          dmDVC.qNew.ParamByName('CURVEORDER').AsInteger := iCurveOrder;
          dmDVC.qNew.ParamByName('PDFORDER').AsInteger := k;
          dmDVC.qNew.ParamByName('AGE').AsFloat := Spectrum2d[k,0];
          dmDVC.qNew.ParamByName('PDFVALUE').AsFloat := Spectrum2d[k,1]*tempmax;
          dmDVC.qNew.ParamByName('CURVEINTERP').AsString := CurveInterpID;
          TD := dmDVC.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
          try
            dmDVC.qNew.ExecSQL(false);
            dmDVC.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
          except
            dmDVC.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
            WasSuccessful := false;
          end;
        end;
      end;
    except
      WasSuccessful := false;
    end;
  end;
  // update count and maxage values for the GDU just processed
  //ShowMessage('7'+tRcnMdlID);
  try
    dmDVC.qUpdate.Close;
    dmDVC.qUpdate.ParamByName('RCNMDLID').AsString := tRcnMdlID;
    dmDVC.qUpdate.ParamByName('GDUID').AsInteger := iGDUID;
    dmDVC.qUpdate.ParamByName('COUNTRECORDS').AsInteger := CountRecords;
    dmDVC.qUpdate.ParamByName('MAXAGE').AsFloat := MaxAge;
    dmDVC.qUpdate.ParamByName('DATEUPDATED').AsDateTime := Now;
    TD := dmDVC.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmDVC.qUpdate.ExecSQL(false);
      dmDVC.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
    except
      dmDVC.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
      WasSuccessful := false;
    end;
  except
    WasSuccessful := false;
  end;
end;


procedure TdmDVC.FindMaxAgeReference(iGDUID : integer; tRcnMdlID : string;
                                  InterpID : string;
                                  ExistReference : string;
                              var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
  tmpStr : string;
  tSourceTypeID : string;
  tRef1 : string;
begin
  tSourceTypeID := ValueForSourceTypeA;
  tmpStr := '0.0';
  WasSuccessful := true;
  //find refere nce for maxcrystallisation
  dmDVC.cdsMAXAGEREF.Close;
  dmDVC.qMAXAGEREF.Close;
  dmDVC.qMAXAGEREF.ParamByName('SourceTypeID').AsString := tSourceTypeID;
  dmDVC.qMAXAGEREF.ParamByName('GDUID').AsInteger := iGDUID;
  dmDVC.qMAXAGEREF.ParamByName('RCNMDLID').AsString := tRcnMdlID;
  //ShowMessage(dmDVC.qMAXAGEREF.SQL.Text);
  dmDVC.cdsMAXAGEREF.Open;
  tRef1 := dmDVC.cdsMaxAgeRefSOURCESHORT.AsString;
  //ShowMessage('Add '+IntToStr(iGDUID)+' '+tRef1);
  if (InterpID = ValueForCrsRs) then
  begin
    //ShowMessage('Existing '+IntToStr(iGDUID)+' '+ExistReference);
    tRef1 := ExistReference + '; ' + tRef1;
    //ShowMessage(IntToStr(iGDUID)+' '+tRef1+'****');
  end;
  try
    dmDVC.qUpdate.Close;
    dmDVC.qUpdate.ParamByName('RCNMDLID').AsString := tRcnMdlID;
    dmDVC.qUpdate.ParamByName('GDUID').AsInteger := iGDUID;
    dmDVC.qUpdate.ParamByName('tRef').AsString := tRef1;
    //ShowMessage(IntToStr(iGDUID)+' '+tRef1);
    TD := dmDVC.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmDVC.qUpdate.ExecSQL(false);
      dmDVC.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
    except
      dmDVC.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
      WasSuccessful := false;
    end;
  except
    WasSuccessful := false;
  end;
end;

end.
