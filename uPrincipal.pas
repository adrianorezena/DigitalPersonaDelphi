unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btCapture: TButton;
    procedure btCaptureClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCapturar;

procedure TfrmPrincipal.btCaptureClick(Sender: TObject);
begin
  if (frmCapturar = nil) then
    frmCapturar := TfrmCapturar.Create(self);

  frmCapturar.ShowModal;
end;

end.
