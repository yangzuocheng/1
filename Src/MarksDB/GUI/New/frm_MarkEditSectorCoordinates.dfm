object frmMarkEditSectorCoordinates: TfrmMarkEditSectorCoordinates
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Add New Sector'
  ClientHeight = 135
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
  object lblCoords: TLabel
    Left = 8
    Top = 8
    Width = 133
    Height = 13
    Caption = 'Point Coordiantes (lat, lon):'
  end
  object lblAzimuth: TLabel
    Left = 8
    Top = 51
    Width = 42
    Height = 13
    Caption = 'Azimuth:'
  end
  object lblAngle: TLabel
    Left = 119
    Top = 51
    Width = 31
    Height = 13
    Caption = 'Angle:'
  end
  object lblLen: TLabel
    Left = 230
    Top = 51
    Width = 77
    Height = 13
    Caption = 'Length, meters:'
  end
  object edtCoords: TEdit
    Left = 8
    Top = 24
    Width = 331
    Height = 21
    Align = alCustom
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object btnNext: TButton
    Left = 180
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Next'
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 261
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object seAzimuth: TSpinEdit
    Left = 8
    Top = 67
    Width = 105
    Height = 22
    MaxValue = 360
    MinValue = 0
    TabOrder = 3
    Value = 0
  end
  object seAngle: TSpinEdit
    Left = 119
    Top = 67
    Width = 105
    Height = 22
    MaxValue = 360
    MinValue = 0
    TabOrder = 4
    Value = 120
  end
  object seLen: TSpinEdit
    Left = 230
    Top = 67
    Width = 106
    Height = 22
    MaxValue = 999999999
    MinValue = 1
    TabOrder = 5
    Value = 100
  end
end
