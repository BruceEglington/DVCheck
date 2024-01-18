object dmDVC: TdmDVC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 804
  Width = 1116
  object sqlcDateView: TSQLConnection
    ConnectionName = 'DateView2_Opus'
    DriverName = 'Firebird2'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBFire20.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird2'
      'Database=opus:/opt/firebird/firebirddata/dateview2.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=1'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000')
    VendorLib = 'fbclient.dll'
    Connected = True
    Left = 36
    Top = 14
  end
  object qRecordIDsSourceA: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'StartRecord'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EndRecord'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select ISORGR30.RECORDID from ISORGR30'
      'where ISORGR30.RECORDID >= :StartRecord'
      'and ISORGR30.RECORDID <= :EndRecord'
      'ORDER BY ISORGR30.RECORDID')
    SQLConnection = sqlcDateView
    Left = 30
    Top = 80
  end
  object dspRecordIDsSourceA: TDataSetProvider
    DataSet = qRecordIDsSourceA
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 56
    Top = 80
  end
  object dsRecordIDsSourceA: TDataSource
    DataSet = qRecordIDsSourceA
    Left = 84
    Top = 80
  end
  object cdsRecordIDsSourceA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDsSourceA'
    Left = 116
    Top = 80
    object cdsRecordIDsSourceARECORDID: TIntegerField
      DisplayLabel = 'Record ID'
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRecordIDsSourceAqSourceA: TDataSetField
      FieldName = 'qSourceA'
    end
  end
  object dscdsRecordIDsSourceA: TDataSource
    DataSet = cdsRecordIDsSourceA
    Left = 144
    Top = 80
  end
  object qSourceA: TSQLQuery
    DataSource = dsRecordIDsSourceA
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select SOURCEA.RECORDID, SOURCEA.SOURCETYPEID, SOURCEA.REFNUM'
      'from SOURCEA'
      'where SOURCEA.RECORDID = :RECORDID')
    SQLConnection = sqlcDateView
    Left = 64
    Top = 144
  end
  object cdsSourceA: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsSourceAqSourceA
    Params = <>
    Left = 124
    Top = 144
    object cdsSourceARECORDID: TIntegerField
      DisplayLabel = 'Record ID'
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSourceASOURCETYPEID: TStringField
      DisplayLabel = 'Ref. Type ID'
      FieldName = 'SOURCETYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSourceAREFNUM: TIntegerField
      DisplayLabel = 'Ref. #'
      FieldName = 'REFNUM'
      Required = True
    end
  end
  object dsSourceA: TDataSource
    DataSet = cdsSourceA
    Left = 152
    Top = 144
  end
  object qIsoValidCaptured: TSQLQuery
    DataSource = dsqRecordIDsValid
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select * from ISOVALID'
      'where ISOVALID.RECORDID = :RECORDID'
      'and ISOVALID.VALIDSTATUSID='#39'Capt'#39)
    SQLConnection = sqlcDateView
    Left = 272
    Top = 148
  end
  object cdsIsoValidCaptured: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsRecordIDsValidqIsoValidCaptured
    Params = <>
    Left = 336
    Top = 148
    object cdsIsoValidCapturedRECORDID: TIntegerField
      DisplayLabel = 'Record ID'
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoValidCapturedVALIDSTATUSID: TStringField
      DisplayLabel = 'Status ID'
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsIsoValidCapturedDATEDONE: TSQLTimeStampField
      DisplayLabel = 'Date Done'
      FieldName = 'DATEDONE'
      Required = True
    end
    object cdsIsoValidCapturedDONEBY: TStringField
      DisplayLabel = 'Done By'
      FieldName = 'DONEBY'
      Required = True
    end
  end
  object dsIsoValidCaptured: TDataSource
    DataSet = cdsIsoValidCaptured
    Left = 364
    Top = 148
  end
  object qRecordIDsValid: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'StartRecord'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EndRecord'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select ISORGR30.RECORDID from ISORGR30'
      'where ISORGR30.RECORDID >= :StartRecord'
      'and ISORGR30.RECORDID <= :EndRecord'
      'ORDER BY ISORGR30.RECORDID')
    SQLConnection = sqlcDateView
    Left = 242
    Top = 80
  end
  object dspRecordIDsValid: TDataSetProvider
    DataSet = qRecordIDsValid
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 268
    Top = 80
  end
  object dsqRecordIDsValid: TDataSource
    DataSet = qRecordIDsValid
    Left = 296
    Top = 80
  end
  object cdsRecordIDsValid: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDsValid'
    Left = 328
    Top = 80
    object cdsRecordIDsValidRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRecordIDsValidqIsoValidValidated: TDataSetField
      FieldName = 'qIsoValidValidated'
    end
    object cdsRecordIDsValidqIsoValidCaptured: TDataSetField
      FieldName = 'qIsoValidCaptured'
    end
  end
  object dsRecordIDsValid: TDataSource
    DataSet = cdsRecordIDsValid
    Left = 356
    Top = 80
  end
  object qIsoValidValidated: TSQLQuery
    DataSource = dsqRecordIDsValid
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select * from ISOVALID'
      'where ISOVALID.RECORDID = :RECORDID'
      'and ISOVALID.VALIDSTATUSID='#39'Capt'#39)
    SQLConnection = sqlcDateView
    Left = 272
    Top = 196
  end
  object cdsIsoValidValidated: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsRecordIDsValidqIsoValidValidated
    Params = <>
    Left = 336
    Top = 196
    object cdsIsoValidValidatedRECORDID: TIntegerField
      DisplayLabel = 'Record ID'
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoValidValidatedVALIDSTATUSID: TStringField
      DisplayLabel = 'Status ID'
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsIsoValidValidatedDATEDONE: TSQLTimeStampField
      DisplayLabel = 'Date Done'
      FieldName = 'DATEDONE'
      Required = True
    end
    object cdsIsoValidValidatedDONEBY: TStringField
      DisplayLabel = 'Done By'
      FieldName = 'DONEBY'
      Required = True
    end
  end
  object dsIsoValidValidated: TDataSource
    DataSet = cdsIsoValidValidated
    Left = 364
    Top = 196
  end
  object qRecordIDs: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select Count(ISORGR30.RECORDID) from ISORGR30, ISOFOR'
      'where ISORGR30.RECORDID = ISOFOR.RECORDID'
      'and ISOFOR.WHOFORID='#39'Publ'#39)
    SQLConnection = sqlcDateView
    Left = 24
    Top = 284
  end
  object dspRecordIDs: TDataSetProvider
    DataSet = qRecordIDs
    Left = 52
    Top = 284
  end
  object cdsRecordIDs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDs'
    Left = 80
    Top = 284
    object cdsRecordIDsCOUNT: TIntegerField
      FieldName = 'COUNT'
      ReadOnly = True
      Required = True
    end
  end
  object dsRecordIDs: TDataSource
    DataSet = cdsRecordIDs
    Left = 108
    Top = 284
  end
  object qNumRecords: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from NUMRECORDS')
    SQLConnection = sqlcDateView
    Left = 24
    Top = 332
  end
  object dspNumRecords: TDataSetProvider
    DataSet = qNumRecords
    Left = 52
    Top = 332
  end
  object cdsNumRecords: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNumRecords'
    Left = 80
    Top = 332
    object cdsNumRecordsDATECOUNTED: TSQLTimeStampField
      DisplayLabel = 'Date Counted'
      FieldName = 'DATECOUNTED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNumRecordsNUMTOTALRECORDS: TIntegerField
      DisplayLabel = 'Total # Records'
      FieldName = 'NUMTOTALRECORDS'
      Required = True
    end
    object cdsNumRecordsNUMPUBLRECORDS: TIntegerField
      DisplayLabel = '# Public Records'
      FieldName = 'NUMPUBLRECORDS'
      Required = True
    end
  end
  object dsNumRecords: TDataSource
    DataSet = cdsNumRecords
    Left = 108
    Top = 332
  end
  object qRecordIDsIsoFor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'StartRecord'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EndRecord'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select ISORGR30.RECORDID from ISORGR30'
      'where ISORGR30.RECORDID >= :StartRecord'
      'and ISORGR30.RECORDID <= :EndRecord'
      'ORDER BY ISORGR30.RECORDID')
    SQLConnection = sqlcDateView
    Left = 494
    Top = 80
  end
  object dspRecordIDsIsoFor: TDataSetProvider
    DataSet = qRecordIDsIsoFor
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 520
    Top = 80
  end
  object dsqRecordIDsIsoFor: TDataSource
    DataSet = qRecordIDsIsoFor
    Left = 548
    Top = 80
  end
  object cdsRecordIDsIsoFor: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDsIsoFor'
    Left = 580
    Top = 80
    object cdsRecordIDsIsoForRECORDID: TIntegerField
      DisplayLabel = 'Record ID'
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRecordIDsIsoForqIsoFor: TDataSetField
      FieldName = 'qIsoFor'
    end
  end
  object dsRecordIDsIsoFor: TDataSource
    DataSet = cdsRecordIDsIsoFor
    Left = 608
    Top = 80
  end
  object qIsoFor: TSQLQuery
    DataSource = dsqRecordIDsIsoFor
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select * from ISOFOR'
      'where ISOFOR.RECORDID = :RECORDID')
    SQLConnection = sqlcDateView
    Left = 528
    Top = 144
  end
  object cdsIsoFor: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsRecordIDsIsoForqIsoFor
    Params = <>
    Left = 588
    Top = 144
    object cdsIsoForRECORDID: TIntegerField
      DisplayLabel = 'Record ID'
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIsoForWHOFORID: TStringField
      DisplayLabel = 'Who For ID'
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
  end
  object dsIsoFor: TDataSource
    DataSet = cdsIsoFor
    Left = 616
    Top = 144
  end
  object qCountryRecords: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select COUNTRY.COUNTRYABR, COUNTRY.COUNTRYHASRECORDS,'
      '  COUNTRY.NUMRECORDS'
      'from COUNTRY'
      'order by COUNTRY.COUNTRYABR')
    SQLConnection = sqlcDateView
    Left = 292
    Top = 284
  end
  object dspCountryRecords: TDataSetProvider
    DataSet = qCountryRecords
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 320
    Top = 284
  end
  object cdsCountryRecords: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCountryRecords'
    Left = 376
    Top = 284
    object cdsCountryRecordsCOUNTRYABR: TStringField
      DisplayLabel = 'Country ID'
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsCountryRecordsCOUNTRYHASRECORDS: TStringField
      DisplayLabel = 'Country Has Records'
      FieldName = 'COUNTRYHASRECORDS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCountryRecordsNUMRECORDS: TIntegerField
      DisplayLabel = '# Records'
      FieldName = 'NUMRECORDS'
      Required = True
    end
    object cdsCountryRecordsqCountryCount: TDataSetField
      FieldName = 'qCountryCount'
    end
  end
  object dsCountryRecords: TDataSource
    DataSet = cdsCountryRecords
    Left = 404
    Top = 284
  end
  object dsqCountryRecords: TDataSource
    DataSet = qCountryRecords
    Left = 348
    Top = 284
  end
  object qCountryCount: TSQLQuery
    DataSource = dsqCountryRecords
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'COUNTRYABR'
        ParamType = ptInput
        Size = 2
      end>
    SQL.Strings = (
      'select ISORGR30.COUNTRYABR, count(ISORGR30.RECORDID)'
      'from ISORGR30'
      'where ISORGR30.COUNTRYABR = :CountryAbr'
      'group by ISORGR30.COUNTRYABR')
    SQLConnection = sqlcDateView
    Left = 312
    Top = 332
  end
  object cdsCountryCount: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsCountryRecordsqCountryCount
    Params = <>
    Left = 368
    Top = 332
    object cdsCountryCountCOUNTRYABR: TStringField
      DisplayLabel = 'Country ID'
      FieldName = 'COUNTRYABR'
      ReadOnly = True
      Required = True
      Size = 3
    end
    object cdsCountryCountCOUNT: TIntegerField
      DisplayLabel = 'Count'
      FieldName = 'COUNT'
      ReadOnly = True
      Required = True
    end
  end
  object dsCountryCount: TDataSource
    DataSet = cdsCountryCount
    Left = 396
    Top = 332
  end
  object qSmpLocC: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select DISTINCT SMPLOC.SAMPLENO,SMPLOC.CONTINENTID,'
      '  SMPLOC.COUNTRYABR,'
      '  ISORGR30.COUNTRYABR as C, COUNTRY.CONTINENTID as D,'
      '  SMPLOC.LATITUDE,SMPLOC.LONGITUDE,SMPLOC.ELEVATION'
      'from SMPLOC,ISORGR30,SMPREG,COUNTRY'
      'where SMPLOC.SAMPLENO=SMPREG.SAMPLENO'
      'and SMPREG.RECORDID=ISORGR30.RECORDID'
      'and SMPLOC.COUNTRYABR<>ISORGR30.COUNTRYABR'
      'and COUNTRY.COUNTRYABR=ISORGR30.COUNTRYABR')
    SQLConnection = sqlcDateView
    Left = 180
    Top = 392
    object qSmpLocCSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qSmpLocCCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qSmpLocCCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object qSmpLocCC: TStringField
      FieldName = 'C'
      ProviderFlags = []
      Size = 3
    end
    object qSmpLocCD: TStringField
      FieldName = 'D'
      ProviderFlags = []
      Size = 3
    end
  end
  object dspSmpLocC: TDataSetProvider
    DataSet = qSmpLocC
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 208
    Top = 392
  end
  object cdsSmpLocC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSmpLocC'
    Left = 236
    Top = 392
    object cdsSmpLocCSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSmpLocCCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsSmpLocCCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cdsSmpLocCC: TStringField
      FieldName = 'C'
      ProviderFlags = []
      Size = 3
    end
    object cdsSmpLocCD: TStringField
      FieldName = 'D'
      ProviderFlags = []
      Size = 3
    end
  end
  object dsSmpLocC: TDataSource
    DataSet = cdsSmpLocC
    Left = 264
    Top = 392
  end
  object qUnitRecords: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'StartRecord'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EndRecord'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT SUITE.GISID, ISORGR30.RECORDID'
      'from SUITE, ISORGR30, SUITECOUNTRY'
      'where SUITECOUNTRY.UNITHASRECORDS='#39'Y'#39
      'and SUITE.GISID > 0'
      'and SUITECOUNTRY.COUNTRYABR='#39'ZAF'#39
      'and SUITECOUNTRY.UNITNAME=ISORGR30.UNITNAME'
      'and SUITECOUNTRY.UNITNAME=SUITE.UNITNAME'
      'and ISORGR30.RECORDID >= :StartRecord'
      'and ISORGR30.RECORDID <= :EndRecord'
      'order by SUITE.GISID, ISORGR30.RECORDID')
    SQLConnection = sqlcDateView
    Left = 32
    Top = 456
  end
  object dspUnitRecords: TDataSetProvider
    DataSet = qUnitRecords
    Left = 56
    Top = 456
  end
  object cdsUnitRecords: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitRecords'
    Left = 84
    Top = 456
    object cdsUnitRecordsGISID: TIntegerField
      FieldName = 'GISID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsUnitRecordsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsUnitRecords: TDataSource
    DataSet = cdsUnitRecords
    Left = 112
    Top = 456
  end
  object qDomainRecords: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'StartRecord'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EndRecord'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT PROVINCELIST.DOMAINID, ISORGR30.RECORDID'
      'from PROVINCELIST, ISORGR30, PROVINCE'
      'where PROVINCE.PROVINCE=PROVINCELIST.PROVINCE'
      'and PROVINCELIST.DOMAINID > 0'
      'and PROVINCE.RECORDID=ISORGR30.RECORDID'
      'and (ISORGR30.INTERPABR = '#39'MetpR'#39
      '  or ISORGR30.INTERPABR = '#39'MetpC'#39')'
      'and ISORGR30.RECORDID >= :StartRecord'
      'and ISORGR30.RECORDID <= :EndRecord'
      'order by ISORGR30.RECORDID')
    SQLConnection = sqlcDateView
    Left = 32
    Top = 504
  end
  object dspDomainRecords: TDataSetProvider
    DataSet = qDomainRecords
    Left = 56
    Top = 504
  end
  object cdsDomainRecords: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainRecords'
    Left = 84
    Top = 504
    object cdsDomainRecordsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainRecordsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsDomainRecords: TDataSource
    DataSet = cdsDomainRecords
    Left = 112
    Top = 504
  end
  object qNumContributions: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT ISOVALID.DONEBY,  COUNT(ISOVALID.DONEBY)'
      'FROM ISOVALID'
      'WHERE ISOVALID.VALIDSTATUSID='#39'Capt'#39
      'GROUP BY ISOVALID.DONEBY'
      '')
    SQLConnection = sqlcDateView
    Left = 24
    Top = 384
  end
  object dspNumContributions: TDataSetProvider
    DataSet = qNumContributions
    Left = 52
    Top = 384
  end
  object cdsNumContributions: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNumContributions'
    Left = 80
    Top = 384
    object cdsNumContributionsDONEBY: TStringField
      FieldName = 'DONEBY'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object cdsNumContributionsCOUNT: TIntegerField
      FieldName = 'COUNT'
      ReadOnly = True
      Required = True
    end
  end
  object dsNumContributions: TDataSource
    DataSet = cdsNumContributions
    Left = 108
    Top = 384
  end
  object qUsers: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM USERS')
    SQLConnection = sqlcDateView
    Left = 24
    Top = 224
  end
  object dspUsers: TDataSetProvider
    DataSet = qUsers
    Left = 52
    Top = 224
  end
  object cdsUsers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsers'
    Left = 80
    Top = 224
    object cdsUsersUSERNAMEID: TStringField
      FieldName = 'USERNAMEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsersNUMCONTRIBUTED: TIntegerField
      FieldName = 'NUMCONTRIBUTED'
    end
  end
  object dsUsers: TDataSource
    DataSet = cdsUsers
    Left = 108
    Top = 224
  end
  object qUnitsDV: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select DISTINCT  SUITE.UNITNAME, SUITE.GISID,'
      '  SUITECOUNTRY.COUNTRYABR'
      'from SUITE, SUITECOUNTRY'
      'where SUITECOUNTRY.UNITHASRECORDS='#39'Y'#39
      'and SUITE.GISID = -1'
      'and SUITECOUNTRY.COUNTRYABR='#39'ZAF'#39
      'and SUITECOUNTRY.UNITNAME=SUITE.UNITNAME'
      'order by SUITECOUNTRY.COUNTRYABR, SUITE.GISID')
    SQLConnection = sqlcDateView
    Left = 184
    Top = 456
    object qUnitsDVUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 150
    end
    object qUnitsDVGISID: TIntegerField
      FieldName = 'GISID'
      Required = True
    end
    object qUnitsDVCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = []
      Size = 3
    end
  end
  object dspUnitsDV: TDataSetProvider
    DataSet = qUnitsDV
    Left = 208
    Top = 456
  end
  object cdsUnitsDV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitsDV'
    Left = 236
    Top = 456
    object cdsUnitsDVUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 150
    end
    object cdsUnitsDVGISID: TIntegerField
      FieldName = 'GISID'
      Required = True
    end
    object cdsUnitsDVCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = []
      Size = 3
    end
  end
  object dsUnitsDV: TDataSource
    DataSet = cdsUnitsDV
    Left = 264
    Top = 456
  end
  object qParentUnitsDV: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select SUITE.UNITNAME, SUITE.GISID, SUITE.PARENTID'
      'from SUITE'
      'where SUITE.GISID > 0'
      'order by SUITE.GISID')
    SQLConnection = sqlcDateView
    Left = 336
    Top = 456
    object qParentUnitsDVUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 150
    end
    object qParentUnitsDVGISID: TIntegerField
      FieldName = 'GISID'
      Required = True
    end
    object qParentUnitsDVPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
  end
  object dspParentUnitsDV: TDataSetProvider
    DataSet = qParentUnitsDV
    Left = 360
    Top = 456
  end
  object cdsParentUnitsDV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParentUnitsDV'
    Left = 388
    Top = 456
    object cdsParentUnitsDVUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 150
    end
    object cdsParentUnitsDVGISID: TIntegerField
      FieldName = 'GISID'
      Required = True
    end
    object cdsParentUnitsDVPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
  end
  object dsParentUnitsDV: TDataSource
    DataSet = cdsParentUnitsDV
    Left = 416
    Top = 456
  end
end
