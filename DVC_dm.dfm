object dmDVC: TdmDVC
  OnCreate = DataModuleCreate
  Height = 804
  Width = 1116
  object sqlcDateView: TSQLConnection
    ConnectionName = 'DateView_bromo2'
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=dbexpida41.dll'
      'VendorLib=c:\exe64\fbclient.dll'
      'DataBase=bromo2.usask.ca:s:/data/firebird/dateview2021v30.fdb'
      'User_Name=SYSDBA'
      'Password=V0lcano3^'
      'SQLDialect=3'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DevartFirebird TransIsolation=ReadCommitted'
      'ProductName=DevartFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver260.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartInterBaseMetaDataCommandFactory,' +
        'DbxDevartInterBaseDriver260.bpl'
      'DriverUnit=DbxDevartInterBase'
      'CharLength=1'
      'EnableBCD=false'
      'OptimizedNumerics=false'
      'LongStrings=True'
      'UseQuoteChar=False'
      'FetchAll=False'
      'UseUnicode=False'
      '')
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
    Top = 64
  end
  object dspRecordIDsSourceA: TDataSetProvider
    DataSet = qRecordIDsSourceA
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 56
    Top = 64
  end
  object dsRecordIDsSourceA: TDataSource
    DataSet = qRecordIDsSourceA
    Left = 84
    Top = 64
  end
  object cdsRecordIDsSourceA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDsSourceA'
    Left = 116
    Top = 64
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
    Top = 64
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
      'where SOURCEA.RECORDID = :RECORDID'
      'and SOURCEA.SOURCETYPEID='#39'A'#39)
    SQLConnection = sqlcDateView
    Left = 56
    Top = 104
  end
  object cdsSourceA: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsSourceAqSourceA
    Params = <>
    Left = 116
    Top = 104
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
    Left = 144
    Top = 104
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
    Top = 60
  end
  object cdsIsoValidCaptured: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsValidqIsoValidCaptured
    Params = <>
    Left = 336
    Top = 60
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
    Top = 60
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
    Top = 16
  end
  object dspRecordIDsValid: TDataSetProvider
    DataSet = qRecordIDsValid
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 268
    Top = 16
  end
  object dsqRecordIDsValid: TDataSource
    DataSet = qRecordIDsValid
    Left = 296
    Top = 16
  end
  object cdsRecordIDsValid: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDsValid'
    Left = 328
    Top = 16
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
    Top = 16
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
      'and ISOVALID.VALIDSTATUSID='#39'NotYt'#39)
    SQLConnection = sqlcDateView
    Left = 272
    Top = 108
  end
  object cdsIsoValidValidated: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsValidqIsoValidValidated
    Params = <>
    Left = 336
    Top = 108
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
    Top = 108
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
    object cdsRecordIDsCOUNT: TFMTBCDField
      FieldName = 'COUNT'
      Precision = 20
      Size = 0
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
    Top = 40
  end
  object dspRecordIDsIsoFor: TDataSetProvider
    DataSet = qRecordIDsIsoFor
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 520
    Top = 40
  end
  object dsqRecordIDsIsoFor: TDataSource
    DataSet = qRecordIDsIsoFor
    Left = 548
    Top = 40
  end
  object cdsRecordIDsIsoFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDsIsoFor'
    Left = 580
    Top = 40
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
    Top = 40
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
    Top = 88
  end
  object cdsIsoFor: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsIsoForqIsoFor
    Params = <>
    Left = 588
    Top = 88
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
    Top = 88
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
    object cdsCountryCountCOUNT: TFMTBCDField
      FieldName = 'COUNT'
      Precision = 20
      Size = 0
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
    object cdsNumContributionsCOUNT: TFMTBCDField
      FieldName = 'COUNT'
      Precision = 20
      Size = 0
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
    Top = 240
  end
  object dspUsers: TDataSetProvider
    DataSet = qUsers
    Left = 52
    Top = 240
  end
  object cdsUsers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsers'
    Left = 80
    Top = 240
    object cdsUsersUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsersNUMCONTRIBUTED: TIntegerField
      FieldName = 'NUMCONTRIBUTED'
    end
    object cdsUsersLASTUSED: TSQLTimeStampField
      FieldName = 'LASTUSED'
      DisplayFormat = 'yyyy/mm/dd'
    end
  end
  object dsUsers: TDataSource
    DataSet = cdsUsers
    Left = 108
    Top = 240
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
  object qUnitHasRecords: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select SUITE.UNITNAME'
      'from SUITE'
      'order by SUITE.UNITNAME'
      '')
    SQLConnection = sqlcDateView
    Left = 260
    Top = 540
  end
  object dspUnitHasRecords: TDataSetProvider
    DataSet = qUnitHasRecords
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 288
    Top = 540
  end
  object dsqUnitHasRecords: TDataSource
    DataSet = qUnitHasRecords
    Left = 316
    Top = 540
  end
  object cdsUnitHasRecords: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitHasRecords'
    Left = 344
    Top = 540
    object cdsUnitHasRecordsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 150
    end
    object cdsUnitHasRecordsqUnitRecordsYN: TDataSetField
      FieldName = 'qUnitRecordsYN'
    end
    object cdsUnitHasRecordsqSuiteCountryCount: TDataSetField
      FieldName = 'qSuiteCountryCount'
    end
  end
  object dsUnitHasRecords: TDataSource
    DataSet = cdsUnitHasRecords
    Left = 372
    Top = 540
  end
  object qUnitRecordsYN: TSQLQuery
    DataSource = dsqUnitHasRecords
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UNITNAME'
        ParamType = ptInput
        Size = 10
      end>
    SQL.Strings = (
      'select SUITECOUNTRY.UNITNAME,SUITECOUNTRY.COUNTRYABR,'
      '  SUITECOUNTRY.UNITHASRECORDS'
      'from SUITECOUNTRY'
      'where SUITECOUNTRY.UNITNAME=:UnitName'
      'Order by SUITECountry.CountryAbr,SuiteCountry.UnitName')
    SQLConnection = sqlcDateView
    Left = 280
    Top = 636
  end
  object cdsUnitRecordsYN: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitHasRecordsqUnitRecordsYN
    Params = <>
    Left = 336
    Top = 636
    object cdsUnitRecordsYNUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 150
    end
    object cdsUnitRecordsYNCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsUnitRecordsYNUNITHASRECORDS: TStringField
      FieldName = 'UNITHASRECORDS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsUnitRecordsYNqUnitCount: TDataSetField
      FieldName = 'qUnitCount'
    end
  end
  object dsUnitRecordsYN: TDataSource
    DataSet = cdsUnitRecordsYN
    Left = 364
    Top = 636
  end
  object qUnitCount: TSQLQuery
    DataSource = dsqUnitRecordsYN
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'COUNTRYABR'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftString
        Name = 'UNITNAME'
        ParamType = ptInput
        Size = 10
      end>
    SQL.Strings = (
      'select ISORGR30.UNITNAME,'
      '  COUNT(ISORGR30.RECORDID)'
      'from ISORGR30'
      'where ISORGR30.COUNTRYABR=:CountryAbr'
      'AND ISORGR30.UNITNAME=:UnitName'
      'group by ISORGR30.UNITNAME')
    SQLConnection = sqlcDateView
    Left = 284
    Top = 676
  end
  object cdsUnitCount: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitRecordsYNqUnitCount
    Params = <>
    Left = 340
    Top = 676
    object cdsUnitCountUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
      Size = 150
    end
    object cdsUnitCountCOUNT: TIntegerField
      FieldName = 'COUNT'
      ReadOnly = True
      Required = True
    end
  end
  object dsUnitCount: TDataSource
    DataSet = cdsUnitCount
    Left = 368
    Top = 676
  end
  object dsqUnitRecordsYN: TDataSource
    DataSet = qUnitRecordsYN
    Left = 308
    Top = 636
  end
  object qSuiteCountryCount: TSQLQuery
    DataSource = dsqUnitHasRecords
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UNITNAME'
        ParamType = ptInput
        Size = 10
      end>
    SQL.Strings = (
      'select COUNT(SUITECOUNTRY.UNITNAME)'
      'from SUITECOUNTRY'
      'where SUITECOUNTRY.UNITNAME=:UnitName'
      'and SUITECOUNTRY.UNITHASRECORDS='#39'Y'#39)
    SQLConnection = sqlcDateView
    Left = 280
    Top = 588
  end
  object cdsSuiteCountryCount: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitHasRecordsqSuiteCountryCount
    Params = <>
    Left = 336
    Top = 588
    object cdsSuiteCountryCountCOUNT: TIntegerField
      FieldName = 'COUNT'
      ReadOnly = True
      Required = True
    end
  end
  object dsSuiteCountryCount: TDataSource
    DataSet = cdsSuiteCountryCount
    Left = 364
    Top = 588
  end
  object qDepIsotopeCount: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPISOTOPECOUNT')
    SQLConnection = sqlcDateView
    Left = 32
    Top = 568
  end
  object dspDepIsotopeCount: TDataSetProvider
    DataSet = qDepIsotopeCount
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 60
    Top = 568
  end
  object cdsDepIsotopeCount: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepIsotopeCount'
    Left = 88
    Top = 568
    object cdsDepIsotopeCountDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      Required = True
    end
    object cdsDepIsotopeCountCOUNTPB: TIntegerField
      FieldName = 'COUNTPB'
      Required = True
    end
    object cdsDepIsotopeCountCOUNTSR: TIntegerField
      FieldName = 'COUNTSR'
      Required = True
    end
    object cdsDepIsotopeCountCOUNTND: TIntegerField
      FieldName = 'COUNTND'
      Required = True
    end
    object cdsDepIsotopeCountCOUNTOS: TIntegerField
      FieldName = 'COUNTOS'
      Required = True
    end
    object cdsDepIsotopeCountCOUNTS: TIntegerField
      FieldName = 'COUNTS'
      Required = True
    end
    object cdsDepIsotopeCountCOUNTSO4: TIntegerField
      FieldName = 'COUNTSO4'
      Required = True
    end
    object cdsDepIsotopeCountCOUNTO: TIntegerField
      FieldName = 'COUNTO'
      Required = True
    end
    object cdsDepIsotopeCountCOUNTHF: TIntegerField
      FieldName = 'COUNTHF'
      Required = True
    end
  end
  object dsDepIsotopeCount: TDataSource
    DataSet = cdsDepIsotopeCount
    Left = 116
    Top = 568
  end
  object qDeposits: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPOSITS')
    SQLConnection = sqlcDateView
    Left = 32
    Top = 616
  end
  object dspDeposits: TDataSetProvider
    DataSet = qDeposits
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 60
    Top = 616
  end
  object cdsDeposits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDeposits'
    Left = 88
    Top = 616
    object cdsDepositsSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      Required = True
    end
  end
  object dsDeposits: TDataSource
    DataSet = cdsDeposits
    Left = 116
    Top = 616
  end
  object DeleteRecords: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlcDateView
    Left = 192
    Top = 568
  end
  object qRecordIDRecalc: TSQLQuery
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
      end
      item
        DataType = ftString
        Name = 'tIsotopeSystem'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tApproachAbr'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tLithClassID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tIsotopeSystem'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select ISORGR30.RECORDID'
      'from ISORGR30,smpreg,Smploc,lithol,smpdata'
      'where ISORGR30.RECORDID >= :StartRecord'
      'and ISORGR30.RECORDID <= :EndRecord'
      'and isorgr30.recordid=smpreg.recordid'
      'and isorgr30.isotopesystem = :tIsotopeSystem'
      'and isorgr30.approachabr = :tApproachAbr'
      'and smploc.sampleno=smpreg.sampleno'
      'and smploc.lithology=lithol.lithology'
      'and lithol.lithclassid=:tLithClassID'
      'and smpreg.sampleno=smpdata.sampleno'
      'and smpreg.frac=smpdata.frac'
      'and smpdata.isosystem=:tIsotopeSystem'
      'ORDER BY ISORGR30.RECORDID')
    SQLConnection = sqlcDateView
    Left = 504
    Top = 192
  end
  object dspRecordIDRecalc: TDataSetProvider
    DataSet = qRecordIDRecalc
    Left = 568
    Top = 192
  end
  object cdsRecordIDRecalc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDRecalc'
    Left = 600
    Top = 192
    object cdsRecordIDRecalcRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
  end
  object dsqRecordIDRecalc: TDataSource
    DataSet = qRecordIDRecalc
    Left = 536
    Top = 192
  end
  object dsRecordIDRecalc: TDataSource
    DataSet = cdsRecordIDRecalc
    Left = 632
    Top = 192
  end
  object QdmSmp: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select SMPREG.RECORDID, SMPREG.SAMPLENO, SMPREG.FRAC, '
      '  SMPREG.INCLUDED, SMPREG.ISOSYSTEM, '
      '  SMPLOC.ORIGINALNO,LITHOL.LITHCLASSID'
      'from SMPREG, SMPLOC,LITHOL'
      'where SMPREG.RECORDID=:RECORDID'
      'and SMPREG.SAMPLENO=SMPLOC.SAMPLENO'
      'and SMPLOC.LITHOLOGY=LITHOL.LITHOLOGY'
      'Order by SMPREG.SAMPLENO, SMPREG.FRAC')
    SQLConnection = sqlcDateView
    Left = 522
    Top = 246
    object QdmSmpRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object QdmSmpISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object QdmSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object QdmSmpFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object QdmSmpINCLUDED: TStringField
      FieldName = 'INCLUDED'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QdmSmpORIGINALNO: TStringField
      FieldName = 'ORIGINALNO'
      Required = True
    end
    object QdmSmpLITHCLASSID: TStringField
      FieldName = 'LITHCLASSID'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsQdmSmpDB: TDataSource
    DataSet = QdmSmp
    Left = 550
    Top = 246
  end
  object dspQdmSmp: TDataSetProvider
    DataSet = QdmSmp
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 578
    Top = 246
  end
  object cdsQdmSmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQdmSmp'
    Left = 606
    Top = 244
    object cdsQdmSmpRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQdmSmpISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsQdmSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQdmSmpFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsQdmSmpINCLUDED: TStringField
      FieldName = 'INCLUDED'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsQdmSmpORIGINALNO: TStringField
      FieldName = 'ORIGINALNO'
      Required = True
    end
    object cdsQdmSmpLITHCLASSID: TStringField
      FieldName = 'LITHCLASSID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsQdmSmpqSmpDataX: TDataSetField
      FieldName = 'qSmpDataX'
    end
    object cdsQdmSmpqSmpDataXerr: TDataSetField
      FieldName = 'qSmpDataXerr'
    end
    object cdsQdmSmpqSmpDataY: TDataSetField
      FieldName = 'qSmpDataY'
    end
    object cdsQdmSmpqSmpDataYerr: TDataSetField
      FieldName = 'qSmpDataYerr'
    end
    object cdsQdmSmpqSmpDataR: TDataSetField
      FieldName = 'qSmpDataR'
    end
    object cdsQdmSmpqSmpDataPrecX: TDataSetField
      FieldName = 'qSmpDataPrecX'
    end
    object cdsQdmSmpqSmpDataPrecY: TDataSetField
      FieldName = 'qSmpDataPrecY'
    end
    object cdsQdmSmpqErrTypeX: TDataSetField
      FieldName = 'qErrTypeX'
    end
    object cdsQdmSmpqErrTypeY: TDataSetField
      FieldName = 'qErrTypeY'
    end
    object cdsQdmSmpqNormalisedValueY: TDataSetField
      FieldName = 'qNormalisedValueY'
    end
    object cdsQdmSmpqNormalisedValueX: TDataSetField
      FieldName = 'qNormalisedValueX'
    end
    object cdsQdmSmpqErrTypeZ: TDataSetField
      FieldName = 'qErrTypeZ'
    end
    object cdsQdmSmpqSmpDataZerr: TDataSetField
      FieldName = 'qSmpDataZerr'
    end
    object cdsQdmSmpqSmpDataPrecZ: TDataSetField
      FieldName = 'qSmpDataPrecZ'
    end
    object cdsQdmSmpqNormalisedValueZ: TDataSetField
      FieldName = 'qNormalisedValueZ'
    end
    object cdsQdmSmpqSmpDataZ: TDataSetField
      FieldName = 'qSmpDataZ'
    end
  end
  object dsQdmSmp: TDataSource
    DataSet = cdsQdmSmp
    Left = 632
    Top = 246
  end
  object qSmpDataX: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'3X'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 520
    Top = 296
  end
  object dsqSmpDataX: TDataSource
    DataSet = qSmpDataX
    Left = 548
    Top = 296
  end
  object cdsSmpDataX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataX
    Params = <>
    Left = 572
    Top = 296
    object cdsSmpDataXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsSmpDataXFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsSmpDataXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsSmpDataXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsSmpDataXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object cdsSmpDataXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsSmpDataXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object cdsSmpDataXVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object cdsSmpDataXqStandardValueX: TDataSetField
      FieldName = 'qStandardValueX'
    end
  end
  object dsSmpDataX: TDataSource
    DataSet = cdsSmpDataX
    Left = 600
    Top = 296
  end
  object qStandardValueX: TSQLQuery
    DataSource = dsqSmpDataX
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 654
    Top = 298
  end
  object cdsAcceptedValueX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsSmpDataXqStandardValueX
    Params = <>
    Left = 682
    Top = 298
    object cdsAcceptedValueXACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      Required = True
      DisplayFormat = '####0.000000'
    end
  end
  object dsAcceptedValueX: TDataSource
    DataSet = cdsAcceptedValueX
    Left = 710
    Top = 298
  end
  object qNormalisedValueX: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'3X'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 758
    Top = 298
  end
  object cdsNormalisedValueX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqNormalisedValueX
    Params = <>
    Left = 786
    Top = 298
    object cdsNormalisedValueXNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ReadOnly = True
      Required = True
      DisplayFormat = '####0.000000'
    end
  end
  object dsNormalisedValueX: TDataSource
    DataSet = cdsNormalisedValueX
    Left = 814
    Top = 298
  end
  object qSmpDataXerr: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'4Xerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 518
    Top = 344
  end
  object dsqSmpDataXerr: TDataSource
    DataSet = qSmpDataXerr
    Left = 548
    Top = 344
  end
  object cdsSmpDataXerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataXerr
    Params = <>
    Left = 574
    Top = 344
    object cdsSmpDataXerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsSmpDataXerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object cdsSmpDataXerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsSmpDataXerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object cdsSmpDataXerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dsSmpDataXerr: TDataSource
    DataSet = cdsSmpDataXerr
    Left = 598
    Top = 344
  end
  object qErrTypeX: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'CXert'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 654
    Top = 346
  end
  object cdsErrTypeX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqErrTypeX
    Params = <>
    Left = 682
    Top = 346
    object cdsErrTypeXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsErrTypeXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
  end
  object dsErrTypeX: TDataSource
    DataSet = cdsErrTypeX
    Left = 710
    Top = 346
  end
  object qSmpDataPrecX: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'AXpre'#39)
    SQLConnection = sqlcDateView
    Left = 520
    Top = 390
  end
  object cdsSmpDataPrecX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataPrecX
    Params = <>
    Left = 572
    Top = 390
    object cdsSmpDataPrecXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsSmpDataPrecXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
  end
  object dsSmpDataPrecX: TDataSource
    DataSet = cdsSmpDataPrecX
    Left = 600
    Top = 390
  end
  object qSmpDataY: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'5Y'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 520
    Top = 434
  end
  object dsqSmpDataY: TDataSource
    DataSet = qSmpDataY
    Left = 550
    Top = 434
  end
  object cdsSmpDataY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataY
    Params = <>
    Left = 572
    Top = 434
    object StringField1: TStringField
      DisplayLabel = 'VariableID'
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Value measured'
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField2: TStringField
      DisplayLabel = 'Normalising standard'
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Value measured for standard'
      FieldName = 'STANDARDVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField3: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object StringField5: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object StringField6: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object cdsSmpDataYqStandardValueY: TDataSetField
      FieldName = 'qStandardValueY'
    end
  end
  object dsSmpDataY: TDataSource
    DataSet = cdsSmpDataY
    Left = 600
    Top = 434
  end
  object qStandardValueY: TSQLQuery
    DataSource = dsqSmpDataY
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID'
      '')
    SQLConnection = sqlcDateView
    Left = 654
    Top = 436
  end
  object cdsAcceptedValueY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsSmpDataYqStandardValueY
    Params = <>
    Left = 682
    Top = 436
    object FloatField3: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      DisplayFormat = '####0.000000'
    end
  end
  object dsAcceptedValueY: TDataSource
    DataSet = cdsAcceptedValueY
    Left = 710
    Top = 436
  end
  object qNormalisedValueY: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'5Y'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 762
    Top = 436
  end
  object cdsNormalisedValueY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqNormalisedValueY
    Params = <>
    Left = 790
    Top = 436
    object cdsNormalisedValueYNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ReadOnly = True
      Required = True
      DisplayFormat = '####0.000000'
    end
  end
  object dsNormalisedValueY: TDataSource
    DataSet = cdsNormalisedValueY
    Left = 818
    Top = 436
  end
  object qSmpDataYerr: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'6Yerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 522
    Top = 480
  end
  object dsqSmpDataYerr: TDataSource
    DataSet = qSmpDataYerr
    Left = 548
    Top = 480
  end
  object cdsSmpDataYerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataYerr
    Params = <>
    Left = 574
    Top = 480
    object StringField8: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object FloatField4: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField9: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object FloatField5: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField10: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dsSmpDataYerr: TDataSource
    DataSet = cdsSmpDataYerr
    Left = 602
    Top = 480
  end
  object qErrTypeY: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'DYert'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 654
    Top = 482
  end
  object cdsErrTypeY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqErrTypeY
    Params = <>
    Left = 682
    Top = 482
    object cdsErrTypeYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsErrTypeYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
  end
  object dsErrTypeY: TDataSource
    DataSet = cdsErrTypeY
    Left = 710
    Top = 482
  end
  object qSmpDataPrecY: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'BYpre'#39)
    SQLConnection = sqlcDateView
    Left = 520
    Top = 526
  end
  object cdsSmpDataPrecY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataPrecY
    Params = <>
    Left = 572
    Top = 526
    object StringField7: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object FloatField8: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
  end
  object dsSmpDataPrecY: TDataSource
    DataSet = cdsSmpDataPrecY
    Left = 600
    Top = 526
  end
  object qSmpDataZ: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'EZ'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 524
    Top = 569
  end
  object qSmpDataZerr: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'FZerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 526
    Top = 619
  end
  object qSmpDataPrecZ: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'GZpre'#39)
    SQLConnection = sqlcDateView
    Left = 528
    Top = 669
  end
  object cdsSmpDataPrecZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataPrecZ
    Params = <>
    Left = 580
    Top = 669
    object StringField20: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object FloatField13: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
  end
  object cdsSmpDataZerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataZerr
    Params = <>
    Left = 578
    Top = 619
    object StringField21: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object FloatField14: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField22: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object FloatField15: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField23: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object cdsSmpDataZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqSmpDataZ
    Params = <>
    Left = 576
    Top = 569
    object StringField14: TStringField
      DisplayLabel = 'VariableID'
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object FloatField9: TFloatField
      DisplayLabel = 'Value measured'
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField15: TStringField
      DisplayLabel = 'Normalising standard'
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object FloatField10: TFloatField
      DisplayLabel = 'Value measured for standard'
      FieldName = 'STANDARDVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object StringField16: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object StringField17: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object StringField18: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object StringField19: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object cdsSmpDataZqStandardValueZ: TDataSetField
      FieldName = 'qStandardValueZ'
    end
  end
  object dsSmpDataZ: TDataSource
    DataSet = cdsSmpDataZ
    Left = 604
    Top = 569
  end
  object dsSmpDataZerr: TDataSource
    DataSet = cdsSmpDataZerr
    Left = 606
    Top = 619
  end
  object dsSmpDataPrecZ: TDataSource
    DataSet = cdsSmpDataPrecZ
    Left = 608
    Top = 669
  end
  object qErrTypeZ: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'HZert'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 658
    Top = 621
  end
  object qStandardValueZ: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID'
      '')
    SQLConnection = sqlcDateView
    Left = 658
    Top = 571
  end
  object dsSmpDataR: TDataSource
    Left = 864
    Top = 516
  end
  object cdsAcceptedValueZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsSmpDataZqStandardValueZ
    Params = <>
    Left = 686
    Top = 571
    object FloatField11: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      DisplayFormat = '####0.000000'
    end
  end
  object dsAcceptedValueZ: TDataSource
    DataSet = cdsAcceptedValueZ
    Left = 714
    Top = 571
  end
  object cdsErrTypeZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqErrTypeZ
    Params = <>
    Left = 686
    Top = 621
    object StringField24: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object FloatField16: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
  end
  object dsErrTypeZ: TDataSource
    DataSet = cdsErrTypeZ
    Left = 714
    Top = 621
  end
  object qNormalisedValueZ: TSQLQuery
    DataSource = dsQdmSmpDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND SMPDATA.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'EZ'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 766
    Top = 571
  end
  object cdsNormalisedValueZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQdmSmpqNormalisedValueZ
    Params = <>
    Left = 794
    Top = 571
    object FloatField12: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ReadOnly = True
      Required = True
      DisplayFormat = '####0.000000'
    end
  end
  object dsNormalisedValueZ: TDataSource
    DataSet = cdsNormalisedValueZ
    Left = 822
    Top = 571
  end
  object qRecalcSmp: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'IsotopeSystem'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT SMPDATA.SAMPLENO, SMPDATA.FRAC, '
      '  SMPDATA.ISOSYSTEM'
      'from SMPDATA'
      'where SMPDATA.ISOSYSTEM=:IsotopeSystem'
      'and SMPDATA.SAMPLENO='#39'A'#39
      'Order by SMPDATA.SAMPLENO, SMPDATA.FRAC')
    SQLConnection = sqlcDateView
    Left = 706
    Top = 38
    object qRecalcSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRecalcSmpFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRecalcSmpISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
  end
  object dsqRecalcSmp: TDataSource
    DataSet = qRecalcSmp
    Left = 734
    Top = 38
  end
  object dspRecalcSmp: TDataSetProvider
    DataSet = qRecalcSmp
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 762
    Top = 38
  end
  object cdsRecalcSmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecalcSmp'
    Left = 790
    Top = 36
    object cdsRecalcSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsRecalcSmpFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsRecalcSmpISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsRecalcSmpqRecalcZ: TDataSetField
      FieldName = 'qRecalcZ'
    end
    object cdsRecalcSmpqRecalcAgePref: TDataSetField
      FieldName = 'qRecalcAgePref'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcSmpqRecalcNormalisedY: TDataSetField
      FieldName = 'qRecalcNormalisedY'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcSmpqRecalcY: TDataSetField
      FieldName = 'qRecalcY'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRecalcSmp: TDataSource
    DataSet = cdsRecalcSmp
    Left = 816
    Top = 38
  end
  object qRecalcY: TSQLQuery
    DataSource = dsqRecalcSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'5Y'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 704
    Top = 82
    object qRecalcYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRecalcYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcYVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsqRecalcY: TDataSource
    DataSet = qRecalcY
    Left = 734
    Top = 82
  end
  object cdsRecalcY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcSmpqRecalcY
    Params = <>
    Left = 756
    Top = 82
    object cdsRecalcYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRecalcYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcYVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsRecalcYqRecalcStandardY: TDataSetField
      FieldName = 'qRecalcStandardY'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRecalcY: TDataSource
    DataSet = cdsRecalcY
    Left = 784
    Top = 82
  end
  object qRecalcStandardY: TSQLQuery
    DataSource = dsqRecalcY
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID'
      '')
    SQLConnection = sqlcDateView
    Left = 838
    Top = 84
    object qRecalcStandardYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRecalcStandardY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcYqRecalcStandardY
    Params = <>
    Left = 866
    Top = 84
  end
  object dsRecalcStandardValueY: TDataSource
    DataSet = cdsRecalcStandardY
    Left = 894
    Top = 84
  end
  object qRecalcNormalisedY: TSQLQuery
    DataSource = dsqRecalcSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'5Y'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 946
    Top = 84
    object qRecalcNormalisedYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcNormalisedYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcNormalisedYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcNormalisedYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcNormalisedYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcNormalisedYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRecalcNormalisedYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcNormalisedYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcNormalisedYNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRecalcNormalisedY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcSmpqRecalcNormalisedY
    Params = <>
    Left = 974
    Top = 84
    object cdsRecalcNormalisedYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcNormalisedYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcNormalisedYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcNormalisedYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcNormalisedYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcNormalisedYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRecalcNormalisedYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcNormalisedYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcNormalisedYNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRecalcNormalisedY: TDataSource
    DataSet = cdsRecalcNormalisedY
    Left = 1002
    Top = 84
  end
  object qRecalcAgePref: TSQLQuery
    DataSource = dsqRecalcSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'JAge'#39)
    SQLConnection = sqlcDateView
    Left = 704
    Top = 134
    object qRecalcAgePrefSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRecalcAgePrefFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcAgePrefISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcAgePrefVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRecalcAgePrefDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsqRecalcAgePref: TDataSource
    DataSet = qRecalcAgePref
    Left = 732
    Top = 136
  end
  object cdsRecalcAgePref: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcSmpqRecalcAgePref
    Params = <>
    Left = 756
    Top = 134
    object cdsRecalcAgePrefSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecalcAgePrefFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcAgePrefISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcAgePrefVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecalcAgePrefDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRecalcAgePref: TDataSource
    DataSet = cdsRecalcAgePref
    Left = 784
    Top = 134
  end
  object qRecalcZ: TSQLQuery
    DataSource = dsqRecalcSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'ISOSYSTEM'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.ISOSYSTEM = :ISOSYSTEM'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'EZ'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 700
    Top = 185
    object qRecalcZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRecalcZFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRecalcZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qRecalcZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object qRecalcZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object qRecalcZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object qRecalcZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object qRecalcZVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dsqRecalcZ: TDataSource
    DataSet = qRecalcZ
    Left = 730
    Top = 185
  end
  object cdsRecalcZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecalcSmpqRecalcZ
    Params = <>
    Left = 752
    Top = 185
    object cdsRecalcZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsRecalcZFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsRecalcZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsRecalcZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsRecalcZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object cdsRecalcZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsRecalcZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object cdsRecalcZVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
  end
  object dsRecalcZ: TDataSource
    DataSet = cdsRecalcZ
    Left = 780
    Top = 185
  end
  object InsertDepIsotopeCount: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CountPb'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CountSr'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CountNd'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CountOs'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO DEPISOTOPECOUNT'
      '(DEPOSITID, COUNTPB, COUNTSR, COUNTND, COUNTOS)'
      'VALUES (:DepositID, :CountPb, :CountSr, :CountNd, :CountOs)')
    SQLConnection = sqlcDateView
    Left = 64
    Top = 672
  end
  object InsertIsoFor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'tRecordID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tWhoForID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO ISOFOR'
      '(RECORDID, WHOFORID)'
      'VALUES (:tRecordID, :tWhoForID)')
    SQLConnection = sqlcDateView
    Left = 64
    Top = 720
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcDateView
    Left = 96
    Top = 16
  end
  object qDVrecord: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select * '
      'from ISORGR30'
      'where ISORGR30.RECORDID=:RECORDID')
    SQLConnection = sqlcDateView
    Left = 450
    Top = 726
    object qDVrecordRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object qDVrecordCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object qDVrecordUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object qDVrecordMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object qDVrecordISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object qDVrecordAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object qDVrecordTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object qDVrecordINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object qDVrecordPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object qDVrecordIAGE: TIntegerField
      FieldName = 'IAGE'
      Required = True
    end
    object qDVrecordIAGEPERROR: TIntegerField
      FieldName = 'IAGEPERROR'
      Required = True
    end
    object qDVrecordIAGEMERROR: TIntegerField
      FieldName = 'IAGEMERROR'
      Required = True
    end
    object qDVrecordAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object qDVrecordAGERELID: TStringField
      FieldName = 'AGERELID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qDVrecordLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object qDVrecordMETHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDVrecordDATESTRING: TSQLTimeStampField
      FieldName = 'DATESTRING'
    end
    object qDVrecordDECAYCONST1: TFloatField
      FieldName = 'DECAYCONST1'
    end
    object qDVrecordDECAYCONST2: TFloatField
      FieldName = 'DECAYCONST2'
    end
    object qDVrecordSIGMAPERCENTDC1: TFloatField
      FieldName = 'SIGMAPERCENTDC1'
    end
    object qDVrecordSIGMAPERCENTDC2: TFloatField
      FieldName = 'SIGMAPERCENTDC2'
    end
    object qDVrecordREGISTEREDUSER: TStringField
      FieldName = 'REGISTEREDUSER'
      Required = True
    end
    object qDVrecordRAGE: TFloatField
      FieldName = 'RAGE'
    end
    object qDVrecordRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object qDVrecordRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
  end
  object dsqDVrecord: TDataSource
    DataSet = qDVrecord
    Left = 478
    Top = 726
  end
  object dspqDVrecord: TDataSetProvider
    DataSet = qDVrecord
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 506
    Top = 726
  end
  object cdsDVrecord: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQdmSmp'
    Left = 534
    Top = 724
  end
  object dsDVrecord: TDataSource
    DataSet = cdsDVrecord
    Left = 560
    Top = 726
  end
  object qRecordIDsLab: TSQLQuery
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
    Top = 152
  end
  object dspRecordIDsLab: TDataSetProvider
    DataSet = qRecordIDsLab
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 56
    Top = 152
  end
  object dsRecordIDsLab: TDataSource
    DataSet = qRecordIDsLab
    Left = 84
    Top = 152
  end
  object cdsRecordIDsLab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDsLab'
    Left = 116
    Top = 152
    object cdsRecordIDsLabRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsRecordIDsLabqIsoLab: TDataSetField
      FieldName = 'qIsoLab'
    end
  end
  object dscdsRecordIDsLab: TDataSource
    DataSet = cdsRecordIDsLab
    Left = 144
    Top = 152
  end
  object qIsoLab: TSQLQuery
    DataSource = dsRecordIDsLab
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select ISOLAB.RECORDID, ISOLAB.LABORATORYABR'
      'from ISOLAB'
      'where ISOLAB.RECORDID = :RECORDID')
    SQLConnection = sqlcDateView
    Left = 56
    Top = 192
  end
  object cdsIsoLab: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsLabqIsoLab
    Params = <>
    Left = 116
    Top = 192
    object cdsIsoLabRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsIsoLabLABORATORYABR: TStringField
      FieldName = 'LABORATORYABR'
      Required = True
      Size = 10
    end
  end
  object dsIsoLab: TDataSource
    DataSet = cdsIsoLab
    Left = 144
    Top = 192
  end
  object qRecordIDsLithol: TSQLQuery
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
      'select ISORGR30.RECORDID, ISORGR30.LITHOLOGY, '
      '  SMPLOC.sampleno,  SMPLOC.LITHOLOGY as smplith'
      'from ISORGR30,smploc, SMPREG'
      'where ISORGR30.RECORDID >= :StartRecord'
      'and ISORGR30.RECORDID <= :EndRecord'
      'and ISORGR30.LITHOLOGY <> '#39'Not defined'#39
      'and SMPLOC.LITHOLOGY = '#39'Not defined'#39
      'and ISORGR30.RECORDID = SMPREG.RECORDID'
      'and SMPREG.SAMPLENO = SMPLOC.SAMPLENO'
      'ORDER BY ISORGR30.RECORDID')
    SQLConnection = sqlcDateView
    Left = 230
    Top = 160
  end
  object dspRecordIDsLithol: TDataSetProvider
    DataSet = qRecordIDsLithol
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 256
    Top = 160
  end
  object dsRecordIDsLithol: TDataSource
    DataSet = qRecordIDsLithol
    Left = 284
    Top = 160
  end
  object cdsRecordIDsLithol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDsLithol'
    Left = 316
    Top = 160
    object cdsRecordIDsLitholRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRecordIDsLitholLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsRecordIDsLitholqSmpLithol: TDataSetField
      FieldName = 'qSmpLithol'
    end
    object cdsRecordIDsLitholSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsRecordIDsLitholSMPLITH: TStringField
      FieldName = 'SMPLITH'
      Required = True
      Size = 50
    end
  end
  object dscdsRecordIDsLithol: TDataSource
    DataSet = cdsRecordIDsLithol
    Left = 344
    Top = 160
  end
  object qSmpLithol: TSQLQuery
    DataSource = dsRecordIDsLithol
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select SMPLOC.SAMPLENO, SMPLOC.LITHOLOGY'
      'from SMPLOC,SMPREG'
      'where SMPREG.RECORDID = :RECORDID'
      'AND SMPREG.SAMPLENO = SMPLOC.SAMPLENO')
    SQLConnection = sqlcDateView
    Left = 272
    Top = 208
    object qSmpLitholSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSmpLitholLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
  end
  object cdsSmpLithol: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsLitholqSmpLithol
    Params = <>
    Left = 332
    Top = 208
    object cdsSmpLitholSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSmpLitholLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
  end
  object dsSmpLithol: TDataSource
    DataSet = cdsSmpLithol
    Left = 360
    Top = 208
  end
  object qNew: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlcDateView
    Left = 160
    Top = 672
  end
  object qDepositSamplesMissingLocations: TSQLQuery
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
      
        'select deposits.sdbdepositid, deposits.deplatitude,deposits.depl' +
        'ongitude,'
      '  smploc.sampleno, smploc.latitude,smploc.longitude'
      'from deposits, depositsamples, smploc'
      'where deposits.sdbdepositid=depositsamples.depositid'
      'and depositsamples.sampleno=smploc.sampleno'
      'and deposits.deplatitude > 89.9'
      'and smploc.latitude < 90.0'
      'and deposits.sdbdepositid >= :StartRecord'
      'and deposits.sdbdepositid <= :EndRecord'
      ''
      '')
    SQLConnection = sqlcDateView
    Left = 894
    Top = 152
  end
  object dspDepositSamplesMissingLocations: TDataSetProvider
    DataSet = qDepositSamplesMissingLocations
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 920
    Top = 152
  end
  object dsDepositSamplesMissingLocations: TDataSource
    DataSet = qDepositSamplesMissingLocations
    Left = 948
    Top = 152
  end
  object cdsDepositSamplesMissingLocations: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepositSamplesMissingLocations'
    Left = 980
    Top = 152
    object cdsDepositSamplesMissingLocationsSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      Required = True
    end
    object cdsDepositSamplesMissingLocationsDEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
    end
    object cdsDepositSamplesMissingLocationsDEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
    end
    object cdsDepositSamplesMissingLocationsSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsDepositSamplesMissingLocationsLATITUDE: TFloatField
      FieldName = 'LATITUDE'
    end
    object cdsDepositSamplesMissingLocationsLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
    end
  end
  object dscdsDepositSamplesMissingLocations: TDataSource
    DataSet = cdsDepositSamplesMissingLocations
    Left = 1008
    Top = 152
  end
  object qRecordIDsDup: TSQLQuery
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
      'select distinct IsoRgr30.RecordID, IsoRgr30.InterpAbr,'
      '  IsoRgr30.RAge,IsoRgr30.RagePError,'
      '  IsoRgr30.MaterialAbr, SmpReg.SampleNo,'
      '  IsoRgr30.PrefLevel,IsoRgr30.IsotopeSystem'
      'from ISORGR30, SmpReg'
      'where ISORGR30.RECORDID = SmpReg.RECORDID'
      'and IsoRgr30.Preflevel > 0'
      
        'and (IsoRgr30.InterpAbr = '#39'CrysI'#39' or IsoRgr30.InterpAbr = '#39'CrysV' +
        #39')'
      'and ISORGR30.RECORDID >= :StartRecord'
      'and ISORGR30.RECORDID <= :EndRecord'
      
        'order by SmpReg.SampleNo, IsoRgr30.RAge,IsoRgr30.PrefLevel,IsoRg' +
        'r30.RAgePError')
    SQLConnection = sqlcDateView
    Left = 888
    Top = 244
  end
  object dspRecordIDsDup: TDataSetProvider
    DataSet = qRecordIDsDup
    Left = 916
    Top = 244
  end
  object cdsRecordIDsDup: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecordIDsDup'
    Left = 992
    Top = 244
    object cdsRecordIDsDupRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsRecordIDsDupINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cdsRecordIDsDupISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRecordIDsDupRAGE: TFloatField
      FieldName = 'RAGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecordIDsDupRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecordIDsDupMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cdsRecordIDsDupSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRecordIDsDupPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object cdsRecordIDsDupqDup: TDataSetField
      FieldName = 'qDup'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dscdsRecordIDsDup: TDataSource
    DataSet = cdsRecordIDsDup
    Left = 1020
    Top = 244
  end
  object qDup: TSQLQuery
    DataSource = dsRecordIDsDup
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IsotopeSystem'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'RAge'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'RAgePError'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MaterialAbr'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'InterpAbr'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select distinct IsoRgr30.RecordID,SmpReg.SampleNo,SmpReg.Frac,'
      '  IsoRgr30.RAge, IsoRgr30.RAgePError,IsoRgr30.MaterialAbr,'
      '  IsoRgr30.PrefLevel, SmpReg.IsoSystem'
      'from ISORGR30,SMPREG'
      'where SMPREG.SampleNo = :SampleNo'
      'and SMPREG.IsoSystem = :IsotopeSystem'
      'and IsoRgr30.RAge = :RAge'
      'and IsoRgr30.RAgePError = :RAgePError'
      'and IsoRgr30.MaterialAbr = :MaterialAbr'
      'and IsoRgr30.InterpAbr = :InterpAbr'
      'and IsoRgr30.PrefLevel > 0'
      
        'and (IsoRgr30.InterpAbr = '#39'CrysI'#39' or IsoRgr30.InterpAbr = '#39'CrysV' +
        #39')'
      'ORDER by IsoRgr30.Preflevel, IsoRgr30.RecordID')
    SQLConnection = sqlcDateView
    Left = 920
    Top = 288
  end
  object cdsDup: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRecordIDsDupqDup
    Params = <>
    Left = 980
    Top = 288
    object cdsDupRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsDupSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
    end
    object cdsDupFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      Size = 15
    end
    object cdsDupPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsDupRAGE: TFloatField
      FieldName = 'RAGE'
      ProviderFlags = []
    end
    object cdsDupRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      ProviderFlags = []
    end
    object cdsDupMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      ProviderFlags = []
      Required = True
      Size = 5
    end
    object cdsDupISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
  end
  object dsDup: TDataSource
    DataSet = cdsDup
    Left = 1008
    Top = 288
  end
  object dsRecordIDsDup: TDataSource
    DataSet = qRecordIDsDup
    Left = 948
    Top = 240
  end
end
