object dmStrat: TdmStrat
  Height = 648
  Width = 584
  object sqlcStratDB: TSQLConnection
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=c:\exe64\dbexpida41.dll'
      'VendorLib=c:\exe64\fbclient.dll'
      'DataBase=c:\data\firebird\stratdb2025v50_utf8.fdb'
      'User_Name=SYSDBA'
      'Password=V0lcano3^'
      'SQLDialect=3'
      'LocaleCode=0000'
      'DevartFirebird TransIsolation=ReadCommitted'
      'ProductName=DevartFirebird'
      'DriverUnit=DbxDevartInterBase'
      'Charset=UTF8'
      'UseUnicode=true'
      '')
    Left = 28
    Top = 16
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
      'select UNITRECORDS.UNITID, UNITRECORDS.RECORDID'
      'from UNITRECORDS'
      'where UNITRECORDS.RECORDID >= :StartRecord'
      'and UNITRECORDS.RECORDID <= :EndRecord'
      'order by UNITRECORDS.RECORDID, UNITRECORDS.UNITID')
    SQLConnection = sqlcStratDB
    Left = 48
    Top = 84
  end
  object dspUnitRecords: TDataSetProvider
    DataSet = qUnitRecords
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 76
    Top = 84
  end
  object cdsUnitRecords: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitRecords'
    Left = 104
    Top = 84
    object cdsUnitRecordsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitRecordsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsUnitRecords: TDataSource
    DataSet = cdsUnitRecords
    Left = 132
    Top = 84
  end
  object qCountryHasRecords: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select COUNTRIES.COUNTRYID'
      'from COUNTRIES'
      'where COUNTRIES.COUNTRYHASRECORDS='#39'Y'#39
      '')
    SQLConnection = sqlcStratDB
    Left = 48
    Top = 140
  end
  object dspCountryHasRecords: TDataSetProvider
    DataSet = qCountryHasRecords
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 76
    Top = 140
  end
  object cdsCountryHasRecords: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCountryHasRecords'
    Left = 104
    Top = 140
    object cdsCountryHasRecordsCOUNTRYID: TWideStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
  end
  object dsCountryHasRecords: TDataSource
    DataSet = cdsCountryHasRecords
    Left = 136
    Top = 140
  end
  object qNew: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlcStratDB
    Left = 304
    Top = 32
  end
  object qParentRecords: TSQLQuery
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
      'select UNITRECORDS.UNITID, UNITRECORDS.RECORDID,'
      '  STRATUNITS.PARENTID'
      'from UNITRECORDS, STRATUNITS'
      'where UNITRECORDS.RECORDID >= :StartRecord'
      'and UNITRECORDS.RECORDID <= :EndRecord'
      'and UNITRECORDS.UNITID=STRATUNITS.UNITID'
      'and STRATUNITS.PARENTID <> 0'
      'order by UNITRECORDS.RECORDID, UNITRECORDS.UNITID')
    SQLConnection = sqlcStratDB
    Left = 52
    Top = 196
  end
  object dspParentRecords: TDataSetProvider
    DataSet = qParentRecords
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 80
    Top = 196
  end
  object cdsParentRecords: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParentRecords'
    Left = 108
    Top = 196
    object cdsParentRecordsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsParentRecordsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsParentRecordsPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
  end
  object dsParentRecords: TDataSource
    DataSet = cdsParentRecords
    Left = 136
    Top = 196
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
      'select DOMAINRECORDS.DOMAINID, DOMAINRECORDS.RECORDID'
      'from DOMAINRECORDS'
      'where DOMAINRECORDS.RECORDID >= :StartRecord'
      'and DOMAINRECORDS.RECORDID <= :EndRecord'
      'order by DOMAINRECORDS.RECORDID, DOMAINRECORDS.DOMAINID')
    SQLConnection = sqlcStratDB
    Left = 48
    Top = 248
  end
  object dspDomainRecords: TDataSetProvider
    DataSet = qDomainRecords
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 76
    Top = 248
  end
  object cdsDomainRecords: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainRecords'
    Left = 104
    Top = 248
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
    Left = 132
    Top = 248
  end
  object qUnitsStratDB: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CountryID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select STRATUNITS.COUNTRYID,'
      '  STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID'
      'from STRATUNITS'
      'where STRATUNITS.COUNTRYID = :CountryID'
      'order by STRATUNITS.UNITID')
    SQLConnection = sqlcStratDB
    Left = 220
    Top = 84
  end
  object dspUnitsStratDB: TDataSetProvider
    DataSet = qUnitsStratDB
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 248
    Top = 84
  end
  object cdsUnitsStratDB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitsStratDB'
    Left = 276
    Top = 84
    object cdsUnitsStratDBUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitsStratDBUNITNAME: TWideStringField
      FieldName = 'UNITNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object cdsUnitsStratDBCOUNTRYID: TWideStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
  end
  object dsUnitsStratDB: TDataSource
    DataSet = cdsUnitsStratDB
    Left = 304
    Top = 84
  end
  object qParentsStratDB: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select  STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID'
      'from STRATUNITS'
      'order by STRATUNITS.UNITID')
    SQLConnection = sqlcStratDB
    Left = 388
    Top = 84
  end
  object dspParentsStratDB: TDataSetProvider
    DataSet = qParentsStratDB
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 416
    Top = 84
  end
  object cdsParentsStratDB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParentsStratDB'
    Left = 444
    Top = 84
    object cdsParentsStratDBUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsParentsStratDBUNITNAME: TWideStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsParentsStratDBPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
  end
  object dsParentsStratDB: TDataSource
    DataSet = cdsParentsStratDB
    Left = 472
    Top = 84
  end
  object qDepIsotopeCount: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPISOTOPECOUNT')
    SQLConnection = sqlcStratDB
    Left = 44
    Top = 304
  end
  object dspDepIsotopeCount: TDataSetProvider
    DataSet = qDepIsotopeCount
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 72
    Top = 304
  end
  object cdsDepIsotopeCount: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepIsotopeCount'
    Left = 100
    Top = 304
    object cdsDepIsotopeCountDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      Required = True
    end
    object cdsDepIsotopeCountCOUNTPB: TIntegerField
      FieldName = 'COUNTPB'
    end
    object cdsDepIsotopeCountCOUNTSR: TIntegerField
      FieldName = 'COUNTSR'
    end
    object cdsDepIsotopeCountCOUNTND: TIntegerField
      FieldName = 'COUNTND'
    end
    object cdsDepIsotopeCountCOUNTOS: TIntegerField
      FieldName = 'COUNTOS'
    end
    object cdsDepIsotopeCountCOUNTS: TIntegerField
      FieldName = 'COUNTS'
    end
    object cdsDepIsotopeCountCOUNTSO4: TIntegerField
      FieldName = 'COUNTSO4'
    end
    object cdsDepIsotopeCountCOUNTO: TIntegerField
      FieldName = 'COUNTO'
    end
    object cdsDepIsotopeCountCOUNTHF: TIntegerField
      FieldName = 'COUNTHF'
      Required = True
    end
  end
  object dsDepIsotopeCount: TDataSource
    DataSet = cdsDepIsotopeCount
    Left = 128
    Top = 304
  end
  object DeleteRecords: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'DELETE FROM DEPISOTOPECOUNT')
    SQLConnection = sqlcStratDB
    Left = 224
    Top = 304
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
        DataType = ftUnknown
        Name = 'CountHf'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CountOs'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO DEPISOTOPECOUNT'
      '(DEPOSITID, COUNTPB, COUNTSR, COUNTND, COUNTHF, COUNTOS)'
      
        'VALUES (:DepositID, :CountPb, :CountSr, :CountNd, :CountHf, :Cou' +
        'ntOs)')
    SQLConnection = sqlcStratDB
    Left = 336
    Top = 304
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcStratDB
    Left = 88
    Top = 16
  end
  object qDepGDU: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * '
      'from DepositGDU'
      '')
    SQLConnection = sqlcStratDB
    Left = 112
    Top = 427
    object qDepGDUDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      Required = True
    end
    object qDepGDURCNMDLID: TWideStringField
      FieldName = 'RCNMDLID'
      Required = True
      Size = 40
    end
    object qDepGDUGDUID: TFMTBCDField
      FieldName = 'GDUID'
      Required = True
      Precision = 20
      Size = 0
    end
  end
  object qGDUDepositAges: TSQLQuery
    ObjectView = True
    DataSource = dsqDepGDU
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'RCNMDLID'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'GDUID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DEPOSITGDU.depositid,DEPOSITGDU.RCNMDLID,DEPOSITGDU.GDUID' +
        ','
      '  Deposits.approxage,Deposits.approxageuncertainty,'
      
        '  DepositClans.depositclanid, depositclans.depositclan,depositcl' +
        'ans.parentclan'
      'from depositGDU,deposits,depositclans'
      'where deposits.sdbdepositid=depositgdu.depositid'
      'and depositGDU.RCNMDLID= :RcnMdlID'
      'and depositGDU.GDUID = :GDUID'
      'and deposits.approxage > 0.0'
      'and deposits.depositclanid=depositclans.depositclanid'
      'and deposits.depositclanid < 90000'
      'order by deposits.sdbdepositid')
    SQLConnection = sqlcStratDB
    Left = 112
    Top = 491
  end
  object dsDepositIDDepFor: TDataSource
    DataSet = cdsDepositIDDepFor
    Left = 400
    Top = 184
  end
  object cdsDepositIDDepFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepositIDDepFor'
    Left = 376
    Top = 184
    object cdsDepositIDDepForSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      Required = True
    end
    object cdsDepositIDDepForqDepFor: TDataSetField
      FieldName = 'qDepFor'
    end
  end
  object dsqDepositIDDepFor: TDataSource
    DataSet = qDepositIDDepFor
    Left = 348
    Top = 184
  end
  object dsDepFor: TDataSource
    DataSet = cdsDepFor
    Left = 432
    Top = 240
  end
  object cdsDepFor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 240
    object cdsDepForSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      Required = True
    end
    object cdsDepForWHOFORID: TWideStringField
      FieldName = 'WHOFORID'
      Required = True
    end
  end
  object qDepositIDDepFor: TSQLQuery
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
      'select DEPOSITS.SDBDEPOSITID from DEPOSITS'
      'where DEPOSITS.SDBDEPOSITID >= :StartRecord'
      'and DEPOSITS.SDBDEPOSITID <= :EndRecord'
      'ORDER BY DEPOSITS.SDBDEPOSITID')
    SQLConnection = sqlcStratDB
    Left = 296
    Top = 184
    object qDepositIDDepForSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      Required = True
    end
  end
  object InsertDepFor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'INSERT INTO DEPOSITFOR'
      '(SDBDEPOSITID, WHOFORID)'
      'VALUES (:tDepositID, :tWhoForID)')
    Left = 8
    Top = 368
  end
  object qDepFor: TSQLQuery
    DataSource = dsqDepositIDDepFor
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'DepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from depositfor'
      'where Depositfor.sdbdepositid = :DepositID')
    SQLConnection = sqlcStratDB
    Left = 312
    Top = 240
    object qDepForSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      Required = True
    end
    object qDepForWHOFORID: TWideStringField
      FieldName = 'WHOFORID'
      Required = True
    end
  end
  object dspDepositIDDepFor: TDataSetProvider
    DataSet = qDepositIDDepFor
    Left = 320
    Top = 184
  end
  object dspDepGDU: TDataSetProvider
    DataSet = qDepGDU
    Left = 144
    Top = 424
  end
  object dsqDepGDU: TDataSource
    DataSet = qDepGDU
    Left = 176
    Top = 424
  end
  object cdsDepGDU: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepGDU'
    Left = 208
    Top = 424
    object cdsDepGDUDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      Required = True
    end
    object cdsDepGDURCNMDLID: TWideStringField
      FieldName = 'RCNMDLID'
      Required = True
      Size = 40
    end
    object cdsDepGDUGDUID: TFMTBCDField
      FieldName = 'GDUID'
      Required = True
      Precision = 20
      Size = 0
    end
    object cdsDepGDUqGDUDepositAges: TDataSetField
      FieldName = 'qGDUDepositAges'
    end
  end
  object dsDepGDU: TDataSource
    DataSet = cdsDepGDU
    Left = 240
    Top = 424
  end
  object cdsGDUDepositAges: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepGDUqGDUDepositAges
    Params = <>
    Left = 208
    Top = 488
    object cdsGDUDepositAgesDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      Required = True
    end
    object cdsGDUDepositAgesRCNMDLID: TWideStringField
      FieldName = 'RCNMDLID'
      Required = True
      Size = 40
    end
    object cdsGDUDepositAgesGDUID: TFMTBCDField
      FieldName = 'GDUID'
      Required = True
      Precision = 20
      Size = 0
    end
    object cdsGDUDepositAgesAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
    end
    object cdsGDUDepositAgesAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
    end
    object cdsGDUDepositAgesDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object cdsGDUDepositAgesDEPOSITCLAN: TWideStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 300
    end
    object cdsGDUDepositAgesPARENTCLAN: TWideStringField
      FieldName = 'PARENTCLAN'
      Size = 200
    end
  end
  object dsGDUDepositAges: TDataSource
    DataSet = cdsGDUDepositAges
    Left = 240
    Top = 488
  end
end
