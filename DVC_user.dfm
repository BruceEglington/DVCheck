object dmUser: TdmUser
  Height = 539
  Width = 806
  object sqlcUser: TSQLConnection
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=c:\exe64\dbexpida41.dll'
      'VendorLib=c:\exe64\fbclient.dll'
      'DataBase=c:\data\firebird\usercontrol2025v50_utf8.fdb'
      'User_Name=SYSDBA'
      'Password=V0lcano3^'
      'SQLDialect=3'
      'DevartFirebird TransIsolation=ReadCommitted'
      'ProductName=DevartFirebird'
      'DriverUnit=DbxDevartInterBase'
      'Charset=UTF8'
      'UseUnicode=true'
      '')
    Left = 32
    Top = 8
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcUser
    Left = 32
    Top = 64
  end
  object qDevInfo: TSQLQuery
    NumericMapping = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from DevInfo'
      'order by DevInfo.DevInfoOrder')
    SQLConnection = sqlcUser
    Left = 40
    Top = 176
  end
  object dspDevInfo: TDataSetProvider
    DataSet = qDevInfo
    UpdateMode = upWhereChanged
    Left = 88
    Top = 176
  end
  object cdsDevInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDevInfo'
    Left = 136
    Top = 176
    object cdsDevInfoDEVINFOORDER: TIntegerField
      FieldName = 'DEVINFOORDER'
      Required = True
    end
    object cdsDevInfoDATESAVED: TSQLTimeStampField
      FieldName = 'DATESAVED'
    end
    object cdsDevInfoQUERYCHECK: TWideStringField
      FieldName = 'QUERYCHECK'
      FixedChar = True
      Size = 4096
    end
  end
  object dsDevInfo: TDataSource
    DataSet = cdsDevInfo
    Left = 192
    Top = 176
  end
  object qInsertDevInfo: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'tDatesaved'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tDateSavedStr'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tmpStr'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'Insert into DevTest'
      '(DateSaved,DateSavedStr,QueryCheckStr)'
      'Values(:tDatesaved,:tDatesavedStr,:tmpStr)')
    SQLConnection = sqlcUser
    Left = 32
    Top = 320
  end
  object qMaxDevInfo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select max(DevInfoOrder) as MAXIMUM from devinfo')
    SQLConnection = sqlcUser
    Left = 40
    Top = 248
  end
  object dspMaxDevInfo: TDataSetProvider
    DataSet = qMaxDevInfo
    Options = [poFetchBlobsOnDemand, poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 88
    Top = 248
  end
  object cdsMaxDevInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaxDevInfo'
    Left = 136
    Top = 248
    object cdsMaxDevInfoMAXIMUM: TIntegerField
      FieldName = 'MAXIMUM'
    end
  end
  object dsMaxDevInfo: TDataSource
    DataSet = cdsMaxDevInfo
    Left = 192
    Top = 248
  end
end
