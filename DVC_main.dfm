object DVCmain: TDVCmain
  Left = 1
  Top = 1
  Caption = 
    'DVCheck - check for and correct missing records in the DateView ' +
    'database'
  ClientHeight = 681
  ClientWidth = 944
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesigned
  OnShow = FormShow
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 445
    Width = 8
    Height = 217
    Beveled = True
    ExplicitHeight = 138
  end
  object Splitter3: TSplitter
    Left = 0
    Top = 437
    Width = 944
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 662
    Width = 944
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 50
      end
      item
        Width = 400
      end
      item
        Width = 50
      end>
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 944
    Height = 437
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 117
      Height = 433
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object dbgRecordIDs: TDBGrid
        Left = 2
        Top = 21
        Width = 113
        Height = 410
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object dbnRecordIDs: TDBNavigator
        Left = 2
        Top = 2
        Width = 113
        Height = 19
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
        Align = alTop
        TabOrder = 1
      end
    end
    object Panel2: TPanel
      Left = 119
      Top = 2
      Width = 823
      Height = 433
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 491
        Top = 2
        Width = 8
        Height = 429
        Beveled = True
        ExplicitLeft = 521
      end
      object Panel3: TPanel
        Left = 2
        Top = 2
        Width = 489
        Height = 429
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object dbn2: TDBNavigator
          Left = 2
          Top = 2
          Width = 485
          Height = 25
          Align = alTop
          TabOrder = 0
        end
        object dbg2: TDBGrid
          Left = 2
          Top = 27
          Width = 485
          Height = 400
          Align = alClient
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object DBGrid1: TDBGrid
          Left = 16
          Top = 64
          Width = 467
          Height = 321
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'GDUID'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGEERROR'
              Visible = True
            end>
        end
      end
      object Panel4: TPanel
        Left = 499
        Top = 2
        Width = 322
        Height = 429
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object dbn3: TDBNavigator
          Left = 2
          Top = 2
          Width = 318
          Height = 25
          Align = alTop
          TabOrder = 0
        end
        object dbg3: TDBGrid
          Left = 2
          Top = 27
          Width = 318
          Height = 400
          Align = alClient
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
  end
  object Panel6: TPanel
    Left = 8
    Top = 445
    Width = 936
    Height = 217
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Splitter4: TSplitter
      Left = 473
      Top = 2
      Width = 8
      Height = 213
      Beveled = True
      ExplicitHeight = 134
    end
    object Panel7: TPanel
      Left = 2
      Top = 2
      Width = 471
      Height = 213
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Memo1: TMemo
        Left = 2
        Top = 2
        Width = 467
        Height = 209
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 0
      end
    end
    object Panel8: TPanel
      Left = 481
      Top = 2
      Width = 453
      Height = 213
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Memo2: TMemo
        Left = 2
        Top = 2
        Width = 449
        Height = 209
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 624
    Top = 12
    object File1: TMenuItem
      Caption = '&File'
      object Exit1: TMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      object Countrieshaverecords1: TMenuItem
        Caption = '&Countries have records'
        OnClick = Countrieshaverecords1Click
      end
      object CountNumberofrecordsindatabase1: TMenuItem
        Caption = 'Count &number of records in database'
        OnClick = CountNumberofrecordsindatabase1Click
      end
      object Countrecordspercontributor1: TMenuItem
        Caption = 'Count records &per contributor'
        OnClick = Countrecordspercontributor1Click
      end
      object Countisotoperecordsperdeposit1: TMenuItem
        Caption = 'Count &isotope records per deposit'
        OnClick = Countisotoperecordsperdeposit1Click
      end
      object CopyisotopecountstoStratDB1: TMenuItem
        Caption = 'Copy isotope counts to StratDB'
        OnClick = CopyisotopecountstoStratDB1Click
      end
      object UpdateUndefinedSampleLithologies1: TMenuItem
        Caption = 'Update undefined sample lithologies'
        OnClick = UpdateUndefinedLithologies1Click
      end
      object UpdateUndefinedRecordLithologies1: TMenuItem
        Caption = 'Update undefined record lithologies'
        OnClick = UpdateUndefinedLithologies1Click
      end
      object InsertT2DMfromEpsilonrecords1: TMenuItem
        Caption = 'Insert T(2DM) from Epsilon records'
        OnClick = InsertT2DMfromEpsilonrecords1Click
      end
      object RecalculateDM: TMenuItem
        Caption = 'Recalculate Nd or Hf T(2DM) or T(DM)'
        Visible = False
        OnClick = RecalculateDMClick
      end
      object RecalculateEpsilonNd1: TMenuItem
        Caption = 'Recalculate Epsilon Nd, Hf or Sr'
        Visible = False
        OnClick = RecalculateEpsilonNd1Click
      end
      object RecalculateMu1: TMenuItem
        Caption = 'Recalculate Mu'
        Visible = False
      end
      object RecalculateEpsilonHf1: TMenuItem
        Caption = 'Recalculate Epsilon Hf'
        Visible = False
        OnClick = RecalculateEpsilonHf1Click
      end
      object RecalculateUPbageminusHfTDMage1: TMenuItem
        Caption = 'Recalculate U-Pb age minus Hf or Nd T(2DM) age'
        Visible = False
        OnClick = RecalculateUPbageminusHfTDMage1Click
      end
      object Updatedepositlocationsfromsamplelocations1: TMenuItem
        Caption = 'Update deposit locations from sample locations'
        OnClick = Updatedepositlocationsfromsamplelocations1Click
      end
      object Updatesamplelocationsfromdepositlocations1: TMenuItem
        Caption = 'Update sample locations from deposit locations'
        OnClick = Updatedepositlocationsfromsamplelocations1Click
      end
    end
    object Check1: TMenuItem
      Caption = '&Check'
      object Whoforrecordsexist1: TMenuItem
        Caption = 'Who &for records exist'
        OnClick = Whoforrecordsexist1Click
      end
      object Referencerecordsexist1: TMenuItem
        Caption = '&Reference records exist'
        OnClick = Referencerecordsexist1Click
      end
      object Deleteunlinkedsamples1: TMenuItem
        Caption = 'Delete unlinked &samples'
        Visible = False
      end
      object Validityrecordsexist1: TMenuItem
        Caption = '&Validity records exist'
        OnClick = Validityrecordsexist1Click
      end
      object AreaIDsareconsistent1: TMenuItem
        Caption = 'Area &IDs are consistent'
        OnClick = AreaIDsareconsistent1Click
      end
      object Deleteunlinkedunits1: TMenuItem
        Caption = 'Delete unlinked &units'
        Visible = False
        OnClick = Deleteunlinkedunits1Click
      end
      object Checkrecordsforunits1: TMenuItem
        Caption = '&Check records for units'
        Visible = False
        OnClick = Checkrecordsforunits1Click
      end
      object Deleteuserswherelastused1yr1: TMenuItem
        Caption = 'Delete users where Lastused > &1 yr'
        Visible = False
        OnClick = Deleteuserswherelastused1yr1Click
      end
      object Laboratoryrecordsexist1: TMenuItem
        Caption = '&Laboratory records exist'
        OnClick = Laboratoryrecordsexist1Click
      end
      object Duplicateagerecords1: TMenuItem
        Caption = 'Duplicate age records'
        OnClick = Duplicateagerecords1Click
      end
    end
    object Link1: TMenuItem
      Caption = '&Link'
      object RecordstoStratDB1: TMenuItem
        Caption = 'Records to &StratDB units'
        Visible = False
        OnClick = RecordstoStratDB1Click
      end
      object RecordstoStratDBparents1: TMenuItem
        Caption = 'Records to StratDB &parents'
        Visible = False
        OnClick = RecordstoStratDBparents1Click
      end
      object StratDBunitstoDateView1: TMenuItem
        Caption = 'StratDB units to DateView'
        OnClick = StratDBunitstoDateView1Click
      end
      object StratDBparentstoDateView1: TMenuItem
        Caption = 'StratDB parents to DateView'
        Visible = False
        OnClick = StratDBparentstoDateView1Click
      end
    end
    object GDU1: TMenuItem
      Caption = 'GDU'
      object CreateEmptyRecords1: TMenuItem
        Caption = 'Create empty records'
        OnClick = CreateEmptyRecords1Click
      end
      object CrystallisationAges1: TMenuItem
        Caption = 'Crystallisation ages'
        OnClick = CrystallisationAges1Click
      end
      object Metamorphismages1: TMenuItem
        Caption = 'Metamorphism ages'
        OnClick = Metamorphismages1Click
      end
      object CrustalResidenceAges1: TMenuItem
        Caption = 'WR Crustal residence ages'
        OnClick = CrustalResidenceAges1Click
      end
      object DetritalAges1: TMenuItem
        Caption = 'Detrital ages'
        OnClick = DetritalAges1Click
      end
      object DetritalResidenceAges1: TMenuItem
        Caption = 'Detrital residence ages'
        OnClick = DetritalResidenceAges1Click
      end
      object GDUzr2DM: TMenuItem
        Caption = 'Igneous zr 2DM'
        OnClick = GDUzr2DMClick
      end
      object GDULIPS: TMenuItem
        Caption = 'LIP ages'
        OnClick = GDULIPSClick
      end
      object GDUCoolIntermediate: TMenuItem
        Caption = 'Cooling - intermediate closure T'
        OnClick = GDUCoolIntermediateClick
      end
      object GDUCoolLow: TMenuItem
        Caption = 'Cooling - low closure T'
        OnClick = GDUCoolLowClick
      end
      object GDUCoolVeryLow: TMenuItem
        Caption = 'Cooling - very low closure T'
        Enabled = False
        OnClick = GDUCoolVeryLowClick
      end
      object AllAgeInterpretations1: TMenuItem
        Caption = 'All age interpretations'
        OnClick = AllAgeInterpretations1Click
      end
      object MaxAgeReferences1: TMenuItem
        Caption = 'Max age references'
        OnClick = MaxAgeReferences1Click
      end
      object GDU2500: TMenuItem
        Caption = 'Steps = 2500'
        Checked = True
        OnClick = GDU2500Click
      end
      object GDU45: TMenuItem
        Caption = 'Steps = 45'
        OnClick = GDU45Click
      end
      object GDUDepositVMS: TMenuItem
        Caption = 'Deposits - VMS'
        OnClick = GDUDepositVMSClick
      end
      object GDUDepositPorphyry: TMenuItem
        Caption = 'Deposits - Porphyry'
        OnClick = GDUDepositPorphyryClick
      end
      object GDUDepositIOCG: TMenuItem
        Caption = 'Deposits - IOCG'
        OnClick = GDUDepositIOCGClick
      end
      object GDUDepositLodeGold: TMenuItem
        Caption = 'Deposits - Orogenic gold'
        OnClick = GDUDepositLodeGoldClick
      end
      object GDUDepositClasticPbZn: TMenuItem
        Caption = 'Deposits - Clastic Pb-Zn'
        OnClick = GDUDepositClasticPbZnClick
      end
      object GDUDepositNiCuPGE_ign: TMenuItem
        Caption = 'Deposits - Igneous Ni-Cu-PGE'
        OnClick = GDUDepositNiCuPGE_ignClick
      end
      object GDUDepositAlkaline: TMenuItem
        Caption = 'Deposits - Alkaline'
        OnClick = GDUDepositAlkalineClick
      end
      object GDUDepositLimberliteLamproite: TMenuItem
        Caption = 'Deposits - Kimberlites and lamproites'
        OnClick = GDUDepositLimberliteLamproiteClick
      end
      object GDUDepositSedimentaryCopper: TMenuItem
        Caption = 'Deposits - Sedimentary copper'
        OnClick = GDUDepositSedimentaryCopperClick
      end
      object GDUDepositMVT: TMenuItem
        Caption = 'Deposits - MVT'
        OnClick = GDUDepositMVTClick
      end
      object GDUDepositPegmatite: TMenuItem
        Caption = 'Deposits - Pegmatite'
        OnClick = GDUDepositPegmatiteClick
      end
      object CrystallisationMinAge1: TMenuItem
        Caption = 'Crystallisation minimum age'
        OnClick = CrystallisationMinAge1Click
      end
    end
    object About1: TMenuItem
      Caption = '&Help'
      object About2: TMenuItem
        Caption = '&About'
        OnClick = About2Click
      end
    end
    object Models1: TMenuItem
      Caption = 'Models'
      object Models_PalaeoPlates1: TMenuItem
        Caption = 'PalaeoPlates'
        Checked = True
        OnClick = Models_PalaeoPlates1Click
      end
      object Models_Global1: TMenuItem
        Caption = 'Global'
        OnClick = Models_Global1Click
      end
    end
  end
end
