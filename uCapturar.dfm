object frmCapturar: TfrmCapturar
  Left = 0
  Top = 0
  Caption = 'frmCapturar'
  ClientHeight = 391
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DPFPEnrollmentControl1: TDPFPEnrollmentControl
    Left = 8
    Top = 8
    Width = 495
    Height = 314
    TabOrder = 0
    OnEnroll = DPFPEnrollmentControl1Enroll
    ControlData = {
      00080000293300007420000003000A00000003000000000008004E0000007B00
      300030003000300030003000300030002D0030003000300030002D0030003000
      300030002D0030003000300030002D0030003000300030003000300030003000
      30003000300030007D000000}
  end
  object btClose: TButton
    Left = 428
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = btCloseClick
  end
end
