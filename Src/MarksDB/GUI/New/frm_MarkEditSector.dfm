object frmMarkEditSector: TfrmMarkEditSector
  Left = 360
  Top = 40
  Caption = 'Add New Sector'
  ClientHeight = 484
  ClientWidth = 372
  Color = clBtnFace
  Constraints.MinHeight = 375
  Constraints.MinWidth = 335
  ParentFont = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object chkVisible: TCheckBox
    AlignWithMargins = True
    Left = 3
    Top = 433
    Width = 366
    Height = 17
    Align = alBottom
    Caption = 'Show on map'
    TabOrder = 3
    ExplicitTop = 297
    ExplicitWidth = 321
  end
  object pnlBottomButtons: TPanel
    Left = 0
    Top = 453
    Width = 372
    Height = 31
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitTop = 317
    ExplicitWidth = 327
    object lblReadOnly: TLabel
      Left = 29
      Top = 0
      Width = 185
      Height = 29
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'Read only mode'
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 140
    end
    object btnOk: TButton
      AlignWithMargins = True
      Left = 217
      Top = 3
      Width = 73
      Height = 23
      Align = alRight
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 1
      ExplicitLeft = 172
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 296
      Top = 3
      Width = 73
      Height = 23
      Hint = 'Cancel'
      Align = alRight
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
      ExplicitLeft = 251
    end
    object btnSetAsTemplate: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 23
      Height = 23
      Hint = 'Set as default'
      Align = alLeft
      Caption = '~'
      Default = True
      TabOrder = 0
      OnClick = btnSetAsTemplateClick
    end
  end
  object pnlFill: TPanel
    Left = 0
    Top = 387
    Width = 372
    Height = 43
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 248
    ExplicitWidth = 327
    object lblFill: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 366
      Height = 13
      Margins.Top = 0
      Align = alTop
      Caption = 'Fill:'
      ExplicitWidth = 16
    end
    object flwpnlFill: TFlowPanel
      Left = 0
      Top = 13
      Width = 372
      Height = 30
      Align = alTop
      AutoSize = True
      AutoWrap = False
      BevelEdges = [beBottom]
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 327
      object lblFillColor: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 6
        Width = 25
        Height = 13
        Margins.Top = 6
        Margins.Right = 0
        Caption = 'Color'
      end
      object clrbxFillColor: TColorBox
        AlignWithMargins = True
        Left = 31
        Top = 3
        Width = 38
        Height = 22
        Margins.Right = 0
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
      end
      object btnFillColor: TSpeedButton
        AlignWithMargins = True
        Left = 69
        Top = 3
        Width = 17
        Height = 22
        Margins.Left = 0
        Caption = '...'
        OnClick = btnFillColorClick
      end
      object lblFillTransp: TLabel
        AlignWithMargins = True
        Left = 92
        Top = 6
        Width = 51
        Height = 13
        Margins.Top = 6
        Margins.Right = 0
        Caption = 'Opacity %'
      end
      object seFillTransp: TSpinEdit
        AlignWithMargins = True
        Left = 146
        Top = 3
        Width = 41
        Height = 22
        MaxValue = 100
        MinValue = 0
        TabOrder = 1
        Value = 80
      end
    end
  end
  object pnlLine: TPanel
    Left = 0
    Top = 346
    Width = 372
    Height = 41
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 207
    ExplicitWidth = 327
    object lblLine: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 366
      Height = 13
      Margins.Top = 0
      Align = alTop
      Caption = 'Line:'
      ExplicitWidth = 23
    end
    object flwpnlLine: TFlowPanel
      Left = 0
      Top = 13
      Width = 372
      Height = 28
      Align = alTop
      AutoSize = True
      AutoWrap = False
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 327
      object lblLineColor: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 6
        Width = 25
        Height = 13
        Margins.Top = 6
        Margins.Right = 0
        Caption = 'Color'
      end
      object clrbxLineColor: TColorBox
        AlignWithMargins = True
        Left = 31
        Top = 3
        Width = 38
        Height = 22
        Margins.Right = 0
        Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
      end
      object btnLineColor: TSpeedButton
        AlignWithMargins = True
        Left = 69
        Top = 3
        Width = 17
        Height = 22
        Margins.Left = 0
        Caption = '...'
        OnClick = btnLineColorClick
      end
      object lblLineWidth: TLabel
        AlignWithMargins = True
        Left = 92
        Top = 6
        Width = 28
        Height = 13
        Margins.Top = 6
        Margins.Right = 0
        Caption = 'Width'
      end
      object seLineWidth: TSpinEdit
        AlignWithMargins = True
        Left = 123
        Top = 3
        Width = 41
        Height = 22
        MaxValue = 24
        MinValue = 1
        TabOrder = 1
        Value = 2
      end
      object lblLineTransp: TLabel
        AlignWithMargins = True
        Left = 170
        Top = 6
        Width = 51
        Height = 13
        Margins.Top = 6
        Margins.Right = 0
        Caption = 'Opacity %'
      end
      object seLineTransp: TSpinEdit
        AlignWithMargins = True
        Left = 224
        Top = 3
        Width = 41
        Height = 22
        MaxValue = 100
        MinValue = 0
        TabOrder = 2
        Value = 35
      end
    end
  end
  object pnlDescription: TPanel
    Left = 0
    Top = 59
    Width = 372
    Height = 202
    Align = alClient
    BevelEdges = [beTop, beBottom]
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 52
    ExplicitWidth = 327
    ExplicitHeight = 158
  end
  object grdpnlStyleRows: TGridPanel
    Left = 0
    Top = 261
    Width = 372
    Height = 85
    Align = alBottom
    BevelEdges = [beBottom]
    BevelKind = bkTile
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 100.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = grdpnlLine1
        Row = 0
      end
      item
        Column = 0
        Control = grdpnlLine2
        Row = 1
      end
      item
        Column = 0
        Control = flwpnlTrahsparent
        Row = 2
      end>
    RowCollection = <
      item
        SizeStyle = ssAuto
        Value = 100.000000000000000000
      end
      item
        SizeStyle = ssAuto
        Value = 50.000000000000000000
      end
      item
        SizeStyle = ssAuto
        Value = 100.000000000000000000
      end>
    TabOrder = 5
    ExplicitLeft = 3
    ExplicitTop = 170
    ExplicitWidth = 348
    DesignSize = (
      372
      83)
    object grdpnlLine1: TGridPanel
      Left = 0
      Top = 0
      Width = 372
      Height = 29
      Align = alBottom
      Anchors = []
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = flwpnlTextColor
          Row = 0
        end
        item
          Column = 1
          Control = flwpnlFontSize
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = -3
      ExplicitWidth = 348
      DesignSize = (
        372
        29)
      object flwpnlTextColor: TFlowPanel
        Left = 38
        Top = 3
        Width = 109
        Height = 22
        Anchors = []
        AutoSize = True
        AutoWrap = False
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 24
        object lblTextColor: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Text color'
        end
        object clrbxTextColor: TColorBox
          Left = 54
          Top = 0
          Width = 38
          Height = 22
          Selected = clYellow
          Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 0
        end
        object btnTextColor: TSpeedButton
          Left = 92
          Top = 0
          Width = 17
          Height = 22
          Caption = '...'
          OnClick = btnTextColorClick
        end
      end
      object flwpnlFontSize: TFlowPanel
        Left = 234
        Top = 3
        Width = 90
        Height = 22
        Anchors = []
        AutoSize = True
        AutoWrap = False
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 190
        object lblFontSize: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'Font size'
        end
        object seFontSize: TSpinEdit
          Left = 49
          Top = 0
          Width = 41
          Height = 22
          MaxValue = 24
          MinValue = 0
          TabOrder = 0
          Value = 11
        end
      end
    end
    object grdpnlLine2: TGridPanel
      Left = 0
      Top = 29
      Width = 372
      Height = 29
      Align = alBottom
      Anchors = []
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = flwpnlShadowColor
          Row = 0
        end
        item
          Column = 1
          Control = flwpnlIconSize
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 1
      ExplicitWidth = 314
      DesignSize = (
        372
        29)
      object flwpnlShadowColor: TFlowPanel
        Left = 30
        Top = 3
        Width = 125
        Height = 22
        Anchors = []
        AutoSize = True
        AutoWrap = False
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 16
        object lblShadowColor: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Shadow color'
        end
        object clrbxShadowColor: TColorBox
          Left = 70
          Top = 0
          Width = 38
          Height = 22
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
          ItemHeight = 16
          TabOrder = 0
        end
        object btnShadowColor: TSpeedButton
          Left = 108
          Top = 0
          Width = 17
          Height = 22
          Caption = '...'
          OnClick = btnShadowColorClick
        end
      end
      object flwpnlIconSize: TFlowPanel
        Left = 234
        Top = 3
        Width = 89
        Height = 22
        Anchors = []
        AutoSize = True
        AutoWrap = False
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 191
        object lblIconSize: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Icon size'
        end
        object seIconSize: TSpinEdit
          Left = 48
          Top = 0
          Width = 41
          Height = 22
          MaxValue = 64
          MinValue = 1
          TabOrder = 0
          Value = 32
        end
      end
    end
    object flwpnlTrahsparent: TFlowPanel
      Left = 137
      Top = 58
      Width = 98
      Height = 22
      Anchors = []
      AutoSize = True
      AutoWrap = False
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 108
      object lblTransp: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Opacity %'
      end
      object seTransp: TSpinEdit
        Left = 57
        Top = 0
        Width = 41
        Height = 22
        MaxValue = 100
        MinValue = 0
        TabOrder = 0
        Value = 35
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 372
    Height = 59
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 314
    object pnlImage: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 53
      Height = 53
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 1
    end
    object pnlTopMain: TPanel
      Left = 59
      Top = 0
      Width = 313
      Height = 59
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 255
      object pnlCategory: TPanel
        Left = 0
        Top = 0
        Width = 313
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 255
      end
      object pnlName: TPanel
        Left = 0
        Top = 26
        Width = 313
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 255
        object lblName: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 31
          Height = 24
          Align = alLeft
          Caption = 'Name:'
          Layout = tlCenter
          ExplicitHeight = 13
        end
        object edtName: TEdit
          AlignWithMargins = True
          Left = 40
          Top = 3
          Width = 270
          Height = 21
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 212
        end
      end
    end
  end
  object ColorDialog1: TColorDialog
    Left = 256
    Top = 72
  end
end
