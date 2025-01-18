unit DVC_constants;

interface

const
  MaxSamp    = 5000;
  MaxSeries  = 5;
  MaxGuestRecords = 500;
  AgeTolerance = 20000.0;
  //MaxSteps        = 2500;
  MaxSteps        = 2500;
  SpectrumStartAge = 0.0;
  SpectrumEndAge = 4500.0;
  DefaultMissingValue = -999.99;
  //PDFcutoff = 100.1;   // original cutoof
  PDFcutoff = 0.01;  //experimental

  DecayConst147Sm : double = 6.54e-12;
  DecayConst176Hf : double = 1.867e-11;

  DM147Sm144Nd : double = 0.2136;
  DM143Nd144Nd : double = 0.513074;
  CHUR147Sm144Nd : double = 0.1967;
  CHUR143Nd144Nd : double = 0.512640;
  CC147Sm144Nd : double = 0.11;

  DM176Lu177Hf : double = 0.0384;
  DM176Hf177Hf : double = 0.283250;
  CHUR176Lu177Hf : double = 0.0336;
  CHUR176Hf177Hf : double = 0.282785;
  CC176Lu144Hf : double = 0.015;

  ValueForCrysI : string = 'CrysI';
  ValueForCrysV : string = 'CrysV';
  ValueForGlacialEraticCrysI : string = 'CrysGI';
  ValueForApproachIDT2DM = 'DM2';
  ValueForApproachIDTDM  = 'DM';
  ValueForIgneous : string = 'I';
  ValueForCrys : string = 'Crys';
  ValueForMetpR : string = 'MetpR';
  ValueForCrsRs : string = 'CrsRs';
  ValueForCool : string = 'Cool';
  ValueForLIPS : string = 'LIPS';
  ValueForDetrital : string = 'Detri';
  ValueForDetrital2DM : string = 'DetDM';
  ValueForIgneousZr2DM : string = 'IgnDM';
  ValueForSourceTypeA : string = 'A';
  ValueForSourceTypeC : string = 'C';
  ValueForEmptyRecords : string = 'Empty';
  ValueForDeposit : string = 'Dpst';


var
  Steps : integer;

implementation


end.
