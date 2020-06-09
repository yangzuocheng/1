object frmMarkEditPathCoordinates: TfrmMarkEditPathCoordinates
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Add New Path'
  ClientHeight = 373
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblCount: TLabel
    Left = 8
    Top = 8
    Width = 63
    Height = 13
    Caption = 'Points count:'
  end
  object lblCoordinates: TLabel
    Left = 8
    Top = 51
    Width = 226
    Height = 13
    Caption = 'Points coordinates (lat1, lon1; lat2, lon2; etc.):'
  end
  object mmoCoordinates: TMemo
    Left = 8
    Top = 67
    Width = 328
    Height = 270
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object edtPointsCount: TEdit
    Left = 8
    Top = 24
    Width = 328
    Height = 21
    TabOrder = 1
  end
  object btnNext: TButton
    Left = 180
    Top = 343
    Width = 75
    Height = 25
    Caption = 'Next'
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 261
    Top = 343
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
