object Form1: TForm1
  Left = 2
  Top = 114
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 24
    Top = 56
    Width = 625
    Height = 265
    DataSource = ds2
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 408
    Top = 28
    Width = 240
    Height = 25
    DataSource = ds2
    TabOrder = 1
  end
  object Button1: TButton
    Left = 132
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 332
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Database1: TDatabase
    AliasName = 'GSC'
    DatabaseName = 'GSC'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 16
    Top = 8
  end
  object q1: TQuery
    DatabaseName = 'GSC'
    RequestLive = True
    SQL.Strings = (
      'select * from GSCsamplesBME')
    Left = 44
    Top = 8
    object q1LABNO: TFloatField
      FieldName = 'LABNO'
      Origin = 'GSC."GSCsamplesBME.DB".LABNO'
    end
    object q1SAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Origin = 'GSC."GSCsamplesBME.DB".SAMPLENO'
    end
    object q1LATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Origin = 'GSC."GSCsamplesBME.DB".LATITUDE'
    end
    object q1LONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Origin = 'GSC."GSCsamplesBME.DB".LONGITUDE'
    end
    object q1RecordNum: TIntegerField
      FieldName = 'RecordNum'
      Origin = 'GSC."GSCsamplesBME.DB".RecordNum'
    end
    object q1SampleOrig: TStringField
      FieldName = 'SampleOrig'
      Origin = 'GSC."GSCsamplesBME.DB".SampleOrig'
    end
    object q1GSCnum: TStringField
      FieldName = 'GSCnum'
      Origin = 'GSC."GSCsamplesBME.DB".GSCnum'
    end
  end
  object ds1: TDataSource
    DataSet = q1
    Left = 72
    Top = 8
  end
  object SQLConnection1: TSQLConnection
    Connected = True
    ConnectionName = 'DateView2_Local'
    DriverName = 'UIBFirebird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpuibfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIBFirebird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=c:\data\firebird\dateview2.fdb'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=1'
      'Firebird15 TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'fbclient.DLL'
    Left = 224
    Top = 24
  end
  object q2: TSQLQuery
    NoMetadata = True
    SQLConnection = SQLConnection1
    Params = <>
    SQL.Strings = (
      'select * from SMPLOC')
    Left = 252
    Top = 24
  end
  object ds2: TDataSource
    DataSet = cds2
    Left = 332
    Top = 24
  end
  object dsp2: TDataSetProvider
    DataSet = q2
    Constraints = True
    Options = [poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 280
    Top = 24
  end
  object cds2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp2'
    Left = 308
    Top = 24
    object cds2SAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds2CONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cds2COUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cds2ORIGINALNO: TStringField
      FieldName = 'ORIGINALNO'
      Required = True
    end
  end
end
