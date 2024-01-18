object Form1: TForm1
  Left = -2
  Top = 110
  Width = 952
  Height = 671
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
    Left = 36
    Top = 60
    Width = 809
    Height = 281
    DataSource = dsOriginal
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'UNITNAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qOriginalNew'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 40
    Top = 492
    Width = 729
    Height = 120
    DataSource = dsNew
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 36
    Top = 348
    Width = 733
    Height = 120
    DataSource = dsOriginalNew
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 36
    Top = 24
    Width = 240
    Height = 25
    DataSource = dsOriginal
    TabOrder = 3
  end
  object bOpen: TButton
    Left = 416
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 4
    OnClick = bOpenClick
  end
  object bUpdate: TButton
    Left = 600
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 5
    OnClick = bUpdateClick
  end
  object eStart: TEdit
    Left = 300
    Top = 28
    Width = 49
    Height = 21
    TabOrder = 6
    Text = 'A'
  end
  object eEnd: TEdit
    Left = 356
    Top = 28
    Width = 49
    Height = 21
    TabOrder = 7
    Text = 'B'
  end
  object bClose: TButton
    Left = 508
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 8
    OnClick = bCloseClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 618
    Width = 944
    Height = 19
    Panels = <
      item
        Width = 80
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object bApplyUpdates: TButton
    Left = 692
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 10
    OnClick = bApplyUpdatesClick
  end
  object sqlc1: TSQLConnection
    Connected = True
    ConnectionName = 'IGCP509_Local'
    DriverName = 'UIBFirebird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpuibfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIBFirebird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=c:\data\firebird\igcp509.fdb'
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
    Top = 20
  end
  object qOriginal: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlc1
    Params = <
      item
        DataType = ftString
        Name = 'StartStr'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EndStr'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from STRATUNITS'
      'where STRATUNITS.UNITNAME >= :StartStr'
      'and STRATUNITS.UNITNAME <= :EndStr'
      'order by STRATUNITS.UNITNAME')
    Left = 60
    Top = 64
  end
  object qNew: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlc1
    Params = <>
    SQL.Strings = (
      'select * from SUITECHANGE'
      'order by SUITECHANGE.OLDNAME')
    Left = 60
    Top = 156
  end
  object dspOriginal: TDataSetProvider
    DataSet = qOriginal
    Constraints = True
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 112
    Top = 64
  end
  object cdsOriginal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOriginal'
    Left = 140
    Top = 64
    object cdsOriginalUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsOriginalqOriginalNew: TDataSetField
      FieldName = 'qOriginalNew'
    end
    object cdsOriginalUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOriginalCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsOriginalRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsOriginalPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsOriginalAPPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsOriginalAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
    object cdsOriginalGISID: TIntegerField
      FieldName = 'GISID'
      Required = True
    end
  end
  object dsOriginal: TDataSource
    DataSet = cdsOriginal
    Left = 168
    Top = 64
  end
  object dspNew: TDataSetProvider
    DataSet = qNew
    Constraints = True
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 88
    Top = 156
  end
  object cdsNew: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNew'
    Left = 116
    Top = 156
    object cdsNewOLDNAME: TStringField
      FieldName = 'OLDNAME'
      Required = True
      Size = 50
    end
    object cdsNewNEWNAME: TStringField
      FieldName = 'NEWNAME'
      Required = True
      Size = 50
    end
  end
  object dsNew: TDataSource
    DataSet = cdsNew
    Left = 144
    Top = 156
  end
  object cdsOriginalNew: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOriginalqOriginalNew
    Params = <>
    Left = 136
    Top = 96
    object cdsOriginalNewOLDNAME: TStringField
      FieldName = 'OLDNAME'
      Required = True
      Size = 50
    end
    object cdsOriginalNewNEWNAME: TStringField
      FieldName = 'NEWNAME'
      Required = True
      Size = 50
    end
    object cdsOriginalNewDONE: TSmallintField
      FieldName = 'DONE'
      Required = True
    end
  end
  object dsqOriginal: TDataSource
    DataSet = qOriginal
    Left = 88
    Top = 64
  end
  object dsOriginalNew: TDataSource
    DataSet = cdsOriginalNew
    Left = 164
    Top = 96
  end
  object qOriginalNew: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlc1
    DataSource = dsqOriginal
    Params = <
      item
        DataType = ftString
        Name = 'UNITNAME'
        ParamType = ptInput
        Size = 51
      end>
    SQL.Strings = (
      'select * from SUITECHANGE'
      'where SUITECHANGE.OLDNAME=:UNITNAME')
    Left = 108
    Top = 96
  end
end
