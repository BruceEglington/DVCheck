object fmGDU_values: TfmGDU_values
  Left = 0
  Top = 0
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
  Caption = 'fmGDU_values'
  ClientHeight = 303
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 20
  object bOK: TButton
    Left = 110
    Top = 250
    Width = 201
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
    OnClick = bOKClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 454
    Height = 221
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    TabOrder = 1
    object lGDUmin: TLabel
      Left = 30
      Top = 50
      Width = 78
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'GDU ID >= '
    end
    object lGDUmax: TLabel
      Left = 30
      Top = 130
      Width = 78
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'GDU ID <= '
    end
    object eGDUmin: TEdit
      Left = 130
      Top = 46
      Width = 151
      Height = 28
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 0
      Text = 'eGDUmin'
    end
    object eGDUmax: TEdit
      Left = 130
      Top = 126
      Width = 151
      Height = 28
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 1
      Text = 'eGDUmax'
    end
  end
end
