program DPFPDelphi;

uses
  Vcl.Forms,
  DPFPGlobal in 'DPFPGlobal.pas',
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uCapturar in 'uCapturar.pas' {frmCapturar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCapturar, frmCapturar);
  Application.Run;
end.
