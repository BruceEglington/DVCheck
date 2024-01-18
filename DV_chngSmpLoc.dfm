object Form1: TForm1
  Left = -2
  Top = 110
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
  object DBGrid1: TDBGrid
    Left = 28
    Top = 120
    Width = 861
    Height = 385
    DataSource = dsSmpLoc
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 304
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object bClose: TButton
    Left = 96
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = bCloseClick
  end
  object sqlc1: TSQLConnection
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
    Left = 44
    Top = 16
  end
  object qSmpLoc: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlc1
    Params = <>
    SQL.Strings = (
      'select SMPLOC.SAMPLENO, SMPLOC.ORIGINALNO'
      'from SMPLOC'
      'order by SMPLOC.SAMPLENO')
    Left = 68
    Top = 60
  end
  object dspSmpLoc: TDataSetProvider
    DataSet = qSmpLoc
    Constraints = True
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 96
    Top = 60
  end
  object cdsSmpLoc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSmpLoc'
    Left = 124
    Top = 60
    object cdsSmpLocSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSmpLocORIGINALNO: TStringField
      FieldName = 'ORIGINALNO'
      Required = True
    end
  end
  object dsSmpLoc: TDataSource
    DataSet = cdsSmpLoc
    Left = 152
    Top = 60
  end
end
