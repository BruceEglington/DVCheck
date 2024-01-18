object Form1: TForm1
  Left = 2
  Top = 114
  Width = 952
  Height = 656
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
  object Label1: TLabel
    Left = 40
    Top = 64
    Width = 22
    Height = 13
    Caption = 'Start'
  end
  object Label2: TLabel
    Left = 40
    Top = 88
    Width = 19
    Height = 13
    Caption = 'End'
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 108
    Width = 813
    Height = 329
    DataSource = ds1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 408
    Top = 64
    Width = 240
    Height = 25
    DataSource = ds1
    TabOrder = 1
  end
  object DBEdit1: TDBEdit
    Left = 188
    Top = 464
    Width = 357
    Height = 21
    DataSource = ds2
    TabOrder = 2
  end
  object bOpen: TButton
    Left = 388
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 3
    OnClick = bOpenClick
  end
  object bUpdate: TButton
    Left = 516
    Top = 12
    Width = 149
    Height = 25
    Caption = 'Copy and Update'
    TabOrder = 4
    OnClick = bUpdateClick
  end
  object bShow: TButton
    Left = 728
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Show'
    TabOrder = 5
    OnClick = bShowClick
  end
  object bHide: TButton
    Left = 820
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Hide'
    TabOrder = 6
    OnClick = bHideClick
  end
  object eStartNum: TEdit
    Left = 88
    Top = 60
    Width = 73
    Height = 21
    TabOrder = 7
    Text = '0'
  end
  object eEndNum: TEdit
    Left = 88
    Top = 84
    Width = 73
    Height = 21
    TabOrder = 8
    Text = '10000'
  end
  object SQLConnection1: TSQLConnection
    Connected = True
    ConnectionName = 'DateView2_Anak'
    DriverName = 'UIBFirebird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpuibfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIBFirebird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=anak:c:\data\dateview2.fdb'
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
    Left = 40
    Top = 16
  end
  object q1: TSQLQuery
    NoMetadata = True
    SQLConnection = SQLConnection1
    Params = <
      item
        DataType = ftInteger
        Name = 'StartNum'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EndNum'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select SOURCEA.RECORDID, SOURCEA.SOURCEID, SOURCEA.REFNUM'
      'from SOURCEA'
      'where SOURCEA.REFNUM = 1'
      'and SOURCEA.RECORDID >= :StartNum'
      'and SOURCEA.RECORDID < :EndNum'
      'order by SOURCEA.RECORDID, SOURCEA.SOURCEID')
    Left = 120
    Top = 16
    object q1RECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object q1SOURCEID: TStringField
      FieldName = 'SOURCEID'
      Required = True
      Size = 100
    end
    object q1REFNUM: TIntegerField
      FieldName = 'REFNUM'
      Required = True
    end
  end
  object q2: TSQLQuery
    NoMetadata = True
    SQLConnection = SQLConnection1
    Params = <
      item
        DataType = ftString
        Name = 'SOURCEID'
        ParamType = ptInput
        Size = 101
      end>
    SQL.Strings = (
      'select SOURCELISTB.REFNUM, SOURCELISTB.SOURCEID'
      'from SOURCELISTB'
      'where SOURCELISTB.SOURCEID = :SOURCEID')
    Left = 120
    Top = 48
    object q2REFNUM: TIntegerField
      FieldName = 'REFNUM'
      Required = True
    end
    object q2SOURCEID: TStringField
      FieldName = 'SOURCEID'
      Required = True
      Size = 100
    end
  end
  object dsq1: TDataSource
    DataSet = q1
    Left = 148
    Top = 16
  end
  object dsp1: TDataSetProvider
    DataSet = q1
    Constraints = True
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 176
    Top = 16
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 204
    Top = 16
    object cds1RECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds1SOURCEID: TStringField
      FieldName = 'SOURCEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 100
    end
    object cds1REFNUM: TIntegerField
      FieldName = 'REFNUM'
      Required = True
    end
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 232
    Top = 16
  end
  object cds2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp2'
    Left = 204
    Top = 48
    object cds2REFNUM: TIntegerField
      FieldName = 'REFNUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds2SOURCEID: TStringField
      FieldName = 'SOURCEID'
      Required = True
      Size = 100
    end
  end
  object ds2: TDataSource
    DataSet = cds2
    Left = 232
    Top = 48
  end
  object dsp2: TDataSetProvider
    DataSet = q2
    Constraints = True
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 148
    Top = 48
  end
end
