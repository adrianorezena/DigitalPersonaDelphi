unit uCapturar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, AXCtrls, ActiveX,
  DPFPCtlXLib_TLB, DPFPDevXLib_TLB, DPFPShrXLib_TLB,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmCapturar = class(TForm)
    DPFPEnrollmentControl1: TDPFPEnrollmentControl;
    btClose: TButton;
    procedure DPFPEnrollmentControl1Enroll(ASender: TObject; lFingerMask: Integer; const pTemplate, pStatus: IDispatch);
    procedure btCloseClick(Sender: TObject);
  private
    FPGetImage: TDPFPSampleConversion;
  public
    { Public declarations }
  end;

var
  frmCapturar: TfrmCapturar;

implementation

{$R *.dfm}

uses DPFPGlobal;

procedure TfrmCapturar.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCapturar.DPFPEnrollmentControl1Enroll(ASender: TObject;
  lFingerMask: Integer; const pTemplate, pStatus: IDispatch);
var
  oDPFPTemplate: DPFPTemplate;
  oVariant: Variant;

  i, iVariantType: Integer;

  rawDataSize: integer;
  aryLow : integer;
  aryHigh : integer;
  vtByteBuf : PByteArray;
begin
  //ShowMessage('enroll');

  oDPFPTemplate := pTemplate as DPFPTemplate;

  //Before saving data to database you will need to get the raw data (variant)
  try
    oVariant := oDPFPTemplate.Serialize;
    //iVariantType := VarType(oVariant);

    //Now that you have the variant, try to get raw byte array
    //We are assuming here that you cannot save a variant directly to database field
    //That you need a byte array
    aryLow := VarArrayLowBound(oVariant,1);
    aryHigh := varArrayHighBound(oVariant,1);
    aryHigh := aryHigh - aryLow;

    vtByteBuf := VarArrayLock(oVariant);  //lock down the array

    for i := 0 to Pred(aryHigh) do
      fpData[i] := vtByteBuf[i];

    VarArrayUnlock(oVariant);
    //Save fpData to database here
    //Database logic is not provided here.  Plenty examples on web on
    //How to save a byte array to database.

  except
    on E: Exception do
      ShowMessage('Trouble saving data');
  end;

  //This section would be in a different form or part of your application.
  //So just pretend that the user is at a login screen

  //Before verification or user login you will need to read the user's fingerprint template from database

  //Database logic not included

  //Once you get the raw data (here we are just reusing the fpData as opposed
  //To actually loading it from a database) you will need to create a variant array.

  rawDataSize := High(fpData) - Low(fpData); //Obviously this would be set to actual data length
  oVariant := VarArrayCreate([0,rawDataSize],varByte);
  vtByteBuf := VarArrayLock(oVariant);

  for i := 0 to rawDataSize - 1 do
    vtByteBuf[i] := fpData[i];

  VarArrayUnlock(oVariant);

  //Then recreate a DPFPTemplate object by just calling Deserialize(yourvariant)
  //oDPFPTemplateDeserialization.Deserialize(oVariant);

end;

end.
