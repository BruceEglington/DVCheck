object DVCreclim: TDVCreclim
  Left = 294
  Top = 299
  Width = 302
  Height = 155
  Caption = 'Record limits to check'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 20
    Width = 56
    Height = 13
    Caption = 'From record'
  end
  object Label2: TLabel
    Left = 20
    Top = 48
    Width = 46
    Height = 13
    Caption = 'To record'
  end
  object eStartRecord: TEdit
    Left = 116
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object eEndRecord: TEdit
    Left = 116
    Top = 44
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object bbOK: TBitBtn
    Left = 40
    Top = 84
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = bbOKClick
    Kind = bkOK
  end
  object bbCancel: TBitBtn
    Left = 172
    Top = 84
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
end
