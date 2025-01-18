object dmStrat: TdmStrat
  Height = 648
  Width = 584
  object sqlcStratDB: TSQLConnection
    ConnectionName = 'StratDB_Local'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=dbexpida41.dll'
      'VendorLib=c:\exe32\fbclient.dll'
      'DataBase=C:\Data\Firebird\STRATDB2024V30_UTF8.fdb'
      'User_Name=sysdba'
      'Password=Zbxc456~'
      'SQLDialect=3'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DevartFirebird TransIsolation=ReadCommitted'
      'ProductName=DevartFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver290.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartInterBaseMetaDataCommandFactory,' +
        'DbxDevartInterBaseDriver290.bpl'
      'DriverUnit=DbxDevartInterBase'
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
    object cdsCountryHasRecordsCOUNTRYID: TStringField
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
    object cdsUnitsStratDBUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object cdsUnitsStratDBCOUNTRYID: TStringField
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
    object cdsParentsStratDBUNITNAME: TStringField
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
  end
  object dspDepGDU: TDataSetProvider
    DataSet = qDepGDU
    Left = 152
    Top = 427
  end
  object cdsDepGDU: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepGDU'
    Left = 192
    Top = 427
    object cdsDepGDURECORDID: TIntegerField
      FieldName = 'RECORDID'
      KeyFields = 'RECORDID;GDUID;RCNMDLID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepGDURCNMDLID: TStringField
      FieldName = 'RCNMDLID'
      KeyFields = 'RECORDID;GDUID;RCNMDLID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsDepGDUGDUID: TFMTBCDField
      FieldName = 'GDUID'
      KeyFields = 'RECORDID;GDUID;RCNMDLID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 20
      Size = 0
    end
  end
  object dsDepGDU: TDataSource
    DataSet = cdsDepGDU
    Left = 232
    Top = 427
  end
  object qGDUDepositAges: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RcnMdlID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'GDUID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DEPOSITGDU.depositid,DEPOSITGDU.RCNMDLID,DEPOSITGDU.GDUID' +
        ','
      '  Deposits.approxage,Deposits.approxageuncertainty,'
      
        '  DepositClans.depositclanid, depositclans.depositclan,depositcl' +
        'ans.parentclan'
      'from depositGDU,deposits,depositclans,userswhofor, depositfor'
      'where deposits.sdbdepositid=depositgdu.depositid'
      'and deposits.sdbdepositid=depositfor.sdbdepositid'
      'and depositfor.whoforid=userswhofor.whoforid'
      'and userswhofor.userid=:UserID'
      'and depositGDU.RCNMDLID= :RcnMdlID'
      'and depositGDU.GDUID = :GDUID'
      'and deposits.approxage > 0.0'
      'and deposits.depositclanid=depositclans.depositclanid'
      'order by deposits.sdbdepositid')
    SQLConnection = sqlcStratDB
    Left = 112
    Top = 491
  end
  object dspGDUDepositAges: TDataSetProvider
    DataSet = qGDUDepositAges
    Left = 152
    Top = 491
  end
  object cdsGDUDepositAges: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGDUDepositAges'
    Left = 192
    Top = 491
    object cdsGDUDepositAgesDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      Required = True
    end
    object cdsGDUDepositAgesRCNMDLID: TStringField
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
    object cdsGDUDepositAgesDEPOSITCLAN: TStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 300
    end
    object cdsGDUDepositAgesPARENTCLAN: TStringField
      FieldName = 'PARENTCLAN'
      Size = 200
    end
  end
  object dsGDUDepositAges: TDataSource
    DataSet = cdsGDUDepositAges
    Left = 232
    Top = 491
  end
end
