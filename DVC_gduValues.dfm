object fmGDU_values: TfmGDU_values
  Left = 0
  Top = 0
  Caption = 'fmGDU_values'
  ClientHeight = 242
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object bOK: TButton
    Left = 88
    Top = 200
    Width = 161
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
    OnClick = bOKClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 177
    Align = alTop
    TabOrder = 1
    object lGDUmin: TLabel
      Left = 24
      Top = 40
      Width = 60
      Height = 15
      Caption = 'GDU ID >= '
    end
    object lGDUmax: TLabel
      Left = 24
      Top = 104
      Width = 60
      Height = 15
      Caption = 'GDU ID <= '
    end
    object eGDUmin: TEdit
      Left = 104
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 0
      Text = 'eGDUmin'
    end
    object eGDUmax: TEdit
      Left = 104
      Top = 101
      Width = 121
      Height = 23
      TabOrder = 1
      Text = 'eGDUmax'
    end
  end
end
