object frmMain: TfrmMain
  Left = 488
  Top = 165
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'SAS.Planet'
  ClientHeight = 639
  ClientWidth = 842
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseWheel = FormMouseWheel
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object map: TImage32
    Left = 413
    Top = 59
    Width = 265
    Height = 571
    Align = alClient
    Bitmap.CombineMode = cmMerge
    Bitmap.ResamplerClassName = 'TLinearResampler'
    BitmapAlign = baTopLeft
    Color = clSilver
    ParentColor = False
    RepaintMode = rmOptimizer
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 2
    OnDblClick = mapDblClick
    OnMouseLeave = mapMouseLeave
  end
  object TBDock: TTBXDock
    Left = 0
    Top = 0
    Width = 842
    Height = 59
    PopupMenu = TBXPopupPanels
    object TBMainToolBar: TTBXToolbar
      Left = 0
      Top = 25
      DockPos = -6
      DockRow = 1
      Images = PanelsImageList
      Stretch = True
      TabOrder = 3
      Caption = 'Main'
      object TBmove: TTBXItem
        Action = actMoveMap
        Images = PanelsImageList
        Options = [tboDefault]
      end
      object TBRectSave: TTBXSubmenuItem
        Action = actSelectByRect
        DropdownCombo = True
        Images = PanelsImageList
        LinkSubitems = NRectSave
        Options = [tboShowHint]
      end
      object TBCalcRas: TTBXItem
        Action = actDistanceCalculation
        Images = PanelsImageList
      end
      object TBCircleCalc: TTBXItem
        Action = actCircleCalculation
        Images = PanelsImageList
      end
      object TBXSeparatorItem4: TTBXSeparatorItem
      end
      object TBMapZap: TTBXSubmenuItem
        DisplayMode = nbdmImageAndText
        Hint = 'Cached tiles map'
        ImageIndex = 7
        Images = PanelsImageList
        LinkSubitems = NFillMap
        Options = [tboDropdownArrow, tboShowHint]
      end
      object TBGoTo: TTBXSubmenuItem
        Action = actShowGoTo
        DropdownCombo = True
        Images = PanelsImageList
        Options = [tboShowHint]
      end
      object TBXSeparatorItem5: TTBXSeparatorItem
      end
      object TBFullSize: TTBXItem
        Action = actViewFullScreen
        Images = PanelsImageList
      end
    end
    object SrcToolbar: TTBXToolbar
      Left = 269
      Top = 25
      DockPos = 224
      DockRow = 1
      Stretch = True
      TabOrder = 4
      Caption = 'Sources'
      object TBSrc: TTBXSubmenuItem
        Hint = 'Select data source'
        ImageIndex = 0
        Images = PanelsImageList
        LinkSubitems = NSources
        Options = [tboDropdownArrow]
      end
      object TBSMB: TTBXSubmenuItem
        DisplayMode = nbdmImageAndText
        Hint = 'Selected basemap'
        ImageIndex = 3
        Images = PanelsImageList
        Options = [tboDropdownArrow]
      end
      object TBLayerSel: TTBXSubmenuItem
        Hint = 'Select overlay layers'
        ImageIndex = 3
        Images = PanelsImageList
        Options = [tboDropdownArrow]
        object btnHideAll: TTBXItem
          Action = actMapsAllLayersHide
        end
        object HideSeparator: TTBSeparatorItem
        end
        object tbiLayersList: TTBGroupItem
        end
      end
    end
    object TBMarksToolbar: TTBXToolbar
      Left = 445
      Top = 25
      DockPos = 363
      DockRow = 1
      Images = PanelsImageList
      LinkSubitems = NMarksGroup
      Stretch = True
      TabOrder = 6
      Caption = 'Placemarks'
    end
    object GPSToolbar: TTBXToolbar
      Left = 661
      Top = 25
      DockPos = 504
      DockRow = 1
      Images = PanelsImageList
      Stretch = True
      TabOrder = 7
      Caption = 'GPS'
      object TBGPSconn: TTBXItem
        Action = actGpsConnect
        Images = PanelsImageList
      end
      object TBGPSPath: TTBXSubmenuItem
        Action = actConfigGpsShowTrack
        DropdownCombo = True
        Images = PanelsImageList
        object tbitmSaveCurrentPositionToolbar: TTBXItem
          Action = actGpsMarkPointAdd
          Images = MenusImageList
        end
        object TBXSeparatorItem16: TTBXSeparatorItem
        end
        object tbitmGPSTrackSaveToMarks: TTBXItem
          Action = actGpsTrackSaveToDb
          Images = MenusImageList
        end
        object TBXSeparatorItem17: TTBXSeparatorItem
        end
        object TBItemDelTrack: TTBXItem
          Action = actGpsTrackClear
          Images = MenusImageList
        end
      end
      object TBGPSToPoint: TTBXSubmenuItem
        Action = actConfigGpsFollowPosition
        DropdownCombo = True
        Images = PanelsImageList
        object TBGPSToPointCenter: TTBXItem
          Action = actConfigGpsFollowPositionAtCenter
        end
      end
    end
    object TBExit: TTBXToolbar
      Left = 807
      Top = 25
      DockPos = 807
      DockRow = 1
      TabOrder = 8
      Visible = False
      object TBXExit: TTBXItem
        Action = actQuit
        Images = MenusImageList
      end
    end
    object TBXMainMenu: TTBXToolbar
      Left = 0
      Top = 0
      CloseButton = False
      DockPos = -6
      MenuBar = True
      ProcessShortCuts = True
      ShrinkMode = tbsmWrap
      Stretch = True
      TabOrder = 0
      Caption = 'Main Menu'
      object NOperations: TTBXSubmenuItem
        Caption = '&Operations'
        Hint = ''
        object tbitmCreateShortcut: TTBXItem
          Action = actMakeLinkOnDesktop
          Images = MenusImageList
        end
        object tbitmOpenFile: TTBXItem
          Action = actFileOpen
          Images = MenusImageList
        end
        object TBXSeparatorItem6: TTBXSeparatorItem
        end
        object NZoomIn: TTBXItem
          Action = actZoomIn
          Images = MenusImageList
        end
        object NZoomOut: TTBXItem
          Action = actZoomOut
          Images = MenusImageList
        end
        object TBXSeparatorItem7: TTBXSeparatorItem
        end
        object tbitmGoToModal: TTBXItem
          Action = actShowGoTo
          Images = MenusImageList
        end
        object NCalcRast: TTBXItem
          Action = actDistanceCalculation
          Images = MenusImageList
        end
        object NCircleCalc: TTBXItem
          Action = actCircleCalculation
          ImageIndex = 65
          Images = MenusImageList
        end
        object TBXSeparatorItem8: TTBXSeparatorItem
        end
        object NRectSave: TTBXSubmenuItem
          Images = MenusImageList
          Caption = 'Selection Manager'
          Hint = ''
          object TBRECT: TTBXItem
            Action = actSelectByRect
            Images = PanelsImageList
            Options = [tboShowHint]
          end
          object TBREGION: TTBXItem
            Action = actSelectByPolygon
            Images = PanelsImageList
          end
          object TBPolylineSelect: TTBXItem
            Action = actSelectByLine
            Images = PanelsImageList
          end
          object TBCOORD: TTBXItem
            Action = actSelectByCoordinates
            Images = PanelsImageList
          end
          object TBScreenSelect: TTBXItem
            Action = actSelectByVisibleArea
            Images = PanelsImageList
          end
          object TBXSeparatorItem13: TTBXSeparatorItem
          end
          object TBPrevious: TTBXItem
            Action = actSelectByLastSelection
            Images = MenusImageList
          end
          object tbitmEditLastSelection: TTBXItem
            Action = actSelectByLastSelectionEdit
            Images = MenusImageList
          end
          object TBLoadSelFromFile: TTBXItem
            Action = actSelectBySelectionFromFile
            Images = MenusImageList
          end
        end
        object TBXSeparatorItem9: TTBXSeparatorItem
        end
        object tbitmCacheManager: TTBXItem
          Action = actShowCacheManager
          Images = MenusImageList
        end
        object TBXSeparatorCacheManager: TTBXSeparatorItem
        end
        object tbitmQuit: TTBXItem
          Action = actQuit
          Images = MenusImageList
        end
      end
      object NView: TTBXSubmenuItem
        Caption = '&View'
        Hint = ''
        object NPanels: TTBXSubmenuItem
          Images = MenusImageList
          Caption = 'Toolbars'
          Hint = ''
          object NMainToolBarShow: TTBXVisibilityToggleItem
            Control = TBMainToolBar
            Images = MenusImageList
            Caption = 'Main'
            Hint = ''
          end
          object NZoomToolBarShow: TTBXVisibilityToggleItem
            Control = ZoomToolBar
            Images = MenusImageList
            Caption = 'Zoom'
            Hint = ''
          end
          object NsrcToolBarShow: TTBXVisibilityToggleItem
            Control = SrcToolbar
            Images = MenusImageList
            Caption = 'Sources'
            Hint = ''
          end
          object NFavoriteToolbarShow: TTBXVisibilityToggleItem
            Control = TBXFavoriteToolbar
            Images = MenusImageList
            Caption = 'Favorites'
            Hint = ''
          end
          object NGPSToolBarShow: TTBXVisibilityToggleItem
            Control = GPSToolbar
            Images = MenusImageList
            Caption = 'GPS'
            Hint = ''
          end
          object TBXVisibilityToggleItem1: TTBXVisibilityToggleItem
            Control = TBMarksToolbar
            Images = MenusImageList
            Caption = 'Placemarks'
            Hint = ''
          end
          object TBXVisibilityToggleItem4: TTBXVisibilityToggleItem
            Caption = 'Placemarks New'
            Control = TBMarksToolbarNew
            Images = MenusImageList
          end
          object TBXVisibilityToggleItem2: TTBXVisibilityToggleItem
            Control = TBXToolBarSearch
            Images = MenusImageList
            Caption = 'Search'
            Hint = ''
          end
          object NSearchResults: TTBXVisibilityToggleItem
            Control = TBSearchWindow
            Images = MenusImageList
            Caption = 'Search Results'
            Hint = ''
          end
          object tbxMergePolygonsShow: TTBXVisibilityToggleItem
            Control = tbMergePolygons
            Images = MenusImageList
            Caption = 'Merge Polygons'
            Hint = ''
          end
          object TBXVisibilityToggleItem3: TTBXVisibilityToggleItem
            Control = FillDates
            Images = MenusImageList
            Caption = 'Time Interval'
            Hint = ''
          end
          object NSensors: TTBXSubmenuItem
            AutoCheck = True
            DropdownCombo = True
            Images = MenusImageList
            OnClick = NSensorsClick
            Caption = 'Sensors'
            Hint = ''
          end
          object TBXSeparatorItem18: TTBXSeparatorItem
          end
          object NBlock_toolbars: TTBXItem
            Action = actViewToolbarsLock
            Images = MenusImageList
          end
        end
        object tbsbmInterface: TTBXSubmenuItem
          Images = MenusImageList
          Caption = 'Interface'
          Hint = ''
          object Showstatus: TTBXItem
            Action = actConfigStatusBarVisible
            Images = MenusImageList
          end
          object ShowMiniMap: TTBXItem
            Action = actConfigMiniMapVisible
            Images = MenusImageList
          end
          object ShowLine: TTBXItem
            Action = actConfigScaleLineVisible
            Images = MenusImageList
          end
        end
        object NFillMap: TTBXSubmenuItem
          ImageIndex = 7
          Images = MenusImageList
          Caption = 'Cached Tiles Map'
          Hint = ''
          object TBFillingTypeMap: TTBXSubmenuItem
            Images = MenusImageList
            Options = [tboDropdownArrow]
            Caption = 'Show for...'
            Hint = ''
            object tbitmFillingMapAsMain: TTBXItem
              Action = actViewFillingMapMainMapUse
              OnAdjustFont = AdjustFont
            end
            object tbiFillingMapMaps: TTBGroupItem
            end
          end
          object TBXSeparatorItem11: TTBXSeparatorItem
          end
          object tbtpltCachedTilesMap: TTBXToolPalette
            ColCount = 5
            Images = ScalesImageList
            PaletteOptions = []
            RowCount = 7
            OnCellClick = tbtpltCachedTilesMapCellClick
          end
          object TBXSeparatorItem20: TTBXSeparatorItem
          end
          object NFillMode1: TTBXItem
            Action = actViewFillingMapMarkUnexisting
            Images = MenusImageList
          end
          object NFillMode2: TTBXItem
            Action = actViewFillingMapMarkExisting
            Images = MenusImageList
          end
          object NFillMode3: TTBXItem
            Action = actViewFillingMapMarkGradient
            Images = MenusImageList
          end
          object TBXSeparatorItem21: TTBXSeparatorItem
          end
          object NShowFillDates: TTBXItem
            Action = actViewFillingMapFilterMode
            Images = MenusImageList
          end
        end
        object NShowGran: TTBXSubmenuItem
          ImageIndex = 3
          Images = MenusImageList
          Caption = 'Tile Boundaries'
          Hint = ''
          object tbtpltViewGridTile: TTBXToolPalette
            ColCount = 5
            Images = ScalesImageList
            PaletteOptions = [tpoNoAutoSelect]
            RowCount = 7
            OnCellClick = tbtpltViewGridTileCellClick
            OnGetCellVisible = tbtpltViewGridTileGetCellVisible
          end
        end
        object tbsbmGenShtabScale: TTBXSubmenuItem
          Images = MenusImageList
          Caption = 'GenShtab Maps Boundaries'
          Hint = ''
          object NGShScale0: TTBXItem
            Action = actViewGridGenShtabNo
            Images = MenusImageList
          end
          object NGShScale1000000: TTBXItem
            Action = actViewGridGenShtab_1_000_000
            Images = MenusImageList
          end
          object NGShScale500000: TTBXItem
            Action = actViewGridGenShtab_500_000
            Images = MenusImageList
          end
          object NGShScale200000: TTBXItem
            Action = actViewGridGenShtab_200_000
            Images = MenusImageList
          end
          object NGShScale100000: TTBXItem
            Action = actViewGridGenShtab_100_000
            Images = MenusImageList
          end
          object NGShScale50000: TTBXItem
            Action = actViewGridGenShtab_50_000
            Images = MenusImageList
          end
          object NGShScale25000: TTBXItem
            Action = actViewGridGenShtab_25_000
            Images = MenusImageList
          end
          object NGShScale10000: TTBXItem
            Action = actViewGridGenShtab_10_000
            Images = MenusImageList
          end
          object NGShScale5000: TTBXItem
            Action = actViewGridGenShtab_5_000
            Images = MenusImageList
          end
          object NGShScale2500: TTBXItem
            Action = actViewGridGenShtab_2_500
            Images = MenusImageList
          end
          object TBSeparatorItem3: TTBSeparatorItem
          end
          object NGShauto: TTBXItem
            Action = actViewGridGenShtabAuto
            Images = MenusImageList
          end
        end
        object DegreedLinesSubMenu: TTBXSubmenuItem
          Images = MenusImageList
          Caption = 'Lat/Lon Grid'
          Hint = ''
          object NDegScale0: TTBXItem
            Action = actViewGridLonLatNo
            Images = MenusImageList
          end
          object NDegScale1000000: TTBXItem
            Action = actViewGridLonLat_10_000
            Images = MenusImageList
          end
          object NDegScale500000: TTBXItem
            Action = actViewGridLonLat_05_000
            Images = MenusImageList
          end
          object NDegScale200000: TTBXItem
            Action = actViewGridLonLat_02_000
            Images = MenusImageList
          end
          object NDegScale100000: TTBXItem
            Action = actViewGridLonLat_01_000
            Images = MenusImageList
          end
          object NDegScale50000: TTBXItem
            Action = actViewGridLonLat_00_500
            Images = MenusImageList
          end
          object NDegScale25000: TTBXItem
            Action = actViewGridLonLat_00_250
            Images = MenusImageList
          end
          object NDegScale10000: TTBXItem
            Action = actViewGridLonLat_00_125
            Images = MenusImageList
          end
          object TBXSeparatorItem22: TTBXSeparatorItem
          end
          object NDegScaleUser: TTBXItem
            Action = actViewGridLonLat_User
            Images = MenusImageList
          end
          object NDegValue: TTBXEditItem
            OnAcceptText = NDegValueAcceptText
          end
          object TBSeparatorItem2: TTBSeparatorItem
          end
          object NDegScaleAuto: TTBXItem
            Action = actViewGridLonLatAuto
            Images = MenusImageList
          end
        end
        object tbxsbmProjection: TTBXSubmenuItem
          Images = MenusImageList
          Caption = 'Projection'
          Hint = ''
          object tbiProjections: TTBGroupItem
          end
          object tbiProjectionOfMap: TTBXItem
            Action = actConfigProjectionOfMapUse
          end
        end
        object TBXSubmenuMap: TTBXSubmenuItem
          Images = MenusImageList
          Caption = 'Maps'
          Hint = ''
          object tbxnxtmap: TTBXItem
            Action = actViewSelectNextMapWithTile
          end
          object tbxprevmap: TTBXItem
            Action = actViewSelectPrevMapWithTile
          end
        end
        object TBXSubmnMapVer: TTBXSubmenuItem
          Images = MenusImageList
          Caption = 'Versions'
          Hint = ''
          object TBXNextVer: TTBXItem
            Action = actViewSelectNextMapVersion
          end
          object TBXPrevVer: TTBXItem
            Action = actViewSelectPrevMapVersion
          end
        end
        object TBXSeparatorItem10: TTBXSeparatorItem
        end
        object NFoolSize: TTBXItem
          Action = actViewFullScreen
          Images = MenusImageList
        end
        object NGoToCur: TTBXItem
          Action = actConfigZoomToCursor
          Images = MenusImageList
        end
        object Nbackload: TTBXItem
          Action = actConfigUsePrevForMap
          Images = MenusImageList
        end
        object NbackloadLayer: TTBXItem
          Action = actConfigUsePrevForLayers
          Images = MenusImageList
        end
        object tbiConfigUsePrevForVectorLayer: TTBXItem
          Action = actConfigUsePrevForVectorLayers
          Images = MenusImageList
        end
        object Nanimate: TTBXItem
          Action = actConfigUseZoomAnimation
          Images = MenusImageList
        end
        object NAnimateMove: TTBXItem
          Action = actConfigUseInertialMovement
          Images = MenusImageList
        end
        object tbitmGauge: TTBXItem
          Action = actConfigAzimuthCircle
          Images = MenusImageList
        end
        object Ninvertcolor: TTBXItem
          Action = actConfigColorInversion
          Images = MenusImageList
        end
        object NShowSelection: TTBXItem
          Action = actConfigPreviousSelectionVisible
          Images = MenusImageList
        end
        object tbitmNavigationArrow: TTBXItem
          Action = actViewNavigation
          Images = MenusImageList
        end
        object tbxSunCalc: TTBXItem
          Action = actViewSunCalc
          Images = MenusImageList
        end
        object tbxMoonCalc: TTBXItem
          Action = actViewMoonCalc
          Images = MenusImageList
        end
        object tbitmShowDebugInfo: TTBXItem
          Action = actShowDebugInfo
          Images = MenusImageList
        end
      end
      object NSources: TTBXSubmenuItem
        Caption = '&Source'
        Hint = ''
        object NSRCesh: TTBXItem
          Action = actConfigDownloadModeCache
          Images = PanelsImageList
          OnAdjustFont = AdjustFont
        end
        object NSRCinet: TTBXItem
          Action = actConfigDownloadModeInternet
          Images = PanelsImageList
          OnAdjustFont = AdjustFont
        end
        object NSRCic: TTBXItem
          Action = actConfigDownloadModeCacheInternet
          Images = PanelsImageList
          OnAdjustFont = AdjustFont
        end
      end
      object NSMB: TTBXSubmenuItem
        LinkSubitems = TBSMB
        Caption = '&Maps'
        Hint = ''
      end
      object NLayerSel: TTBXSubmenuItem
        LinkSubitems = TBLayerSel
        Caption = 'Layers'
        Hint = ''
      end
      object tbxFavorite: TTBXSubmenuItem
        LinkSubitems = TBFavorite
        Caption = 'Favorites'
        Hint = ''
      end
      object NMarks: TTBXSubmenuItem
        Caption = 'Placemarks'
        object NMarksGroupNew: TTBGroupItem
          object TBAdd_PointNew: TTBXItem
            Tag = 1
            Caption = 'Add Placemark'
            GroupIndex = 200605
            ImageIndex = 0
            Images = MarksNewImageList
            Options = [tboShowHint]
            Stretch = True
            OnClick = TBAddGeometryClick
          end
          object TBAdd_LineNew: TTBXItem
            Tag = 2
            Caption = 'Add Path'
            GroupIndex = 200605
            ImageIndex = 1
            Images = MarksNewImageList
            Options = [tboShowHint]
            Stretch = True
            OnClick = TBAddGeometryClick
          end
          object TBAdd_PolyNew: TTBXItem
            Tag = 3
            Caption = 'Add Polygon'
            GroupIndex = 200605
            ImageIndex = 2
            Images = MarksNewImageList
            Options = [tboShowHint]
            Stretch = True
            OnClick = TBAddGeometryClick
          end
          object TBAdd_Sector: TTBXItem
            Tag = 4
            Caption = 'Add Sector'
            GroupIndex = 200605
            ImageIndex = 3
            Images = MarksNewImageList
            Options = [tboShowHint]
            Stretch = True
            OnClick = TBAddGeometryClick
          end
        end
        object TBXSeparatorItem24: TTBXSeparatorItem
        end
        object NMarksGroup: TTBGroupItem
          object TBAdd_Point: TTBXItem
            Action = actMarksAddPoint
            Images = PanelsImageList
            Options = [tboShowHint]
            Stretch = True
          end
          object TBAdd_Line: TTBXItem
            Action = actMarksAddLine
            Images = PanelsImageList
            MaskOptions = [tboShowHint]
          end
          object TBAdd_Poly: TTBXItem
            Action = actMarksAddPolygon
            Images = PanelsImageList
            Options = [tboShowHint]
          end
          object TBXSeparatorItem12: TTBXSeparatorItem
          end
          object tbitmPlacemarkManager: TTBXItem
            Action = actShowPlacemarkManager
            Images = PanelsImageList
            Options = [tboShowHint]
          end
          object TBHideMarks: TTBXItem
            Action = actConfigMarksHide
            Images = PanelsImageList
          end
          object TBXSeparatorItem23: TTBXSeparatorItem
          end
          object tbxMarksDbList: TTBXSubmenuItem
            ImageIndex = 25
            Images = PanelsImageList
            Options = [tboDropdownArrow]
            Caption = 'Marks Database'
            Hint = 'Marks database'
          end
        end
        object tbitmShowMarkCaption: TTBXItem
          Action = actConfigMarksNamesVisible
          Images = PanelsImageList
        end
        object tbitmPointProject: TTBXItem
          Action = actShowPointProject
          Images = PanelsImageList
        end
        object tbxMergePolygonsShow1: TTBXVisibilityToggleItem
          Control = tbMergePolygons
          ImageIndex = 23
          Images = PanelsImageList
          Caption = 'Merge Polygons'
          Hint = ''
        end
        object TBSeparatorItem4: TTBSeparatorItem
        end
        object tbxIconsSettings: TTBXItem
          Action = actIconsSettings
          Images = PanelsImageList
        end
      end
      object tbsbmGPS: TTBXSubmenuItem
        Caption = 'GPS'
        object tbitmGPSConnect: TTBXItem
          Action = actGpsConnect
          Images = MenusImageList
        end
        object tbitmGPSTrackShow: TTBXItem
          Action = actConfigGpsShowTrack
          Images = MenusImageList
        end
        object tbitmGPSCenterMap: TTBXItem
          Action = actConfigGpsFollowPosition
          Images = MenusImageList
        end
        object tbitmGPSToPointCenter: TTBXItem
          Action = actConfigGpsFollowPositionAtCenter
          Images = MenusImageList
        end
        object tbsprtGPS1: TTBXSeparatorItem
        end
        object tbitmSaveCurrentPosition: TTBXItem
          Action = actGpsMarkPointAdd
          Images = MenusImageList
        end
        object tbitmGPSTrackSaveToDb: TTBXItem
          Action = actGpsTrackSaveToDb
          Images = MenusImageList
        end
        object tbitmGPSTrackClear: TTBXItem
          Action = actGpsTrackClear
          Images = MenusImageList
        end
        object tbsprtGPS2: TTBXSeparatorItem
        end
        object TBXSeparatorItem19: TTBXSeparatorItem
        end
        object tbitmGPSOptions: TTBXItem
          Action = actConfigGpsOptionsShow
          Images = MenusImageList
        end
      end
      object NParams: TTBXSubmenuItem
        OnPopup = NParamsPopup
        Caption = 'Settings'
        Hint = ''
        object NMapParams: TTBXItem
          Action = actMapsEditMapParams
          Images = MenusImageList
        end
        object NLayerParams: TTBXSubmenuItem
          Images = MenusImageList
          Caption = 'Layer Settings'
          Hint = ''
        end
        object TBXSeparatorItem14: TTBXSeparatorItem
        end
        object tbitmOptions: TTBXItem
          Action = actConfigOptionsShow
          Images = MenusImageList
        end
        object tbitmInterfaceOptions: TTBXItem
          Action = actConfigInterfaceOptionsShow
          Images = MenusImageList
        end
        object TBLang: TTBXSubmenuItem
          Images = MenusImageList
          Caption = 'Language'
          Hint = ''
        end
      end
      object tbsbmHelp: TTBXSubmenuItem
        Caption = '&Help'
        Hint = ''
        object tbitmOnlineHelp: TTBXItem
          Action = actHelpOpenOnline
          Images = MenusImageList
        end
        object tbitmOnlineHome: TTBXItem
          Action = actHelpOpenWebSite
          Images = MenusImageList
        end
        object tbitmOnlineForum: TTBXItem
          Action = actHelpOpenCommunity
          ImageIndex = 71
          Images = MenusImageList
        end
        object tbxSep4: TTBXSeparatorItem
        end
        object tbtmHelpBugTrack: TTBXItem
          Action = actHelpOpenIssueTracker
          ImageIndex = 70
          Images = MenusImageList
        end
        object tbxSep1: TTBXSeparatorItem
        end
        object tbxtmPascalScriptIDE: TTBXItem
          Action = actShowPascalScriptIde
          Images = MenusImageList
        end
        object tbxSep2: TTBXSeparatorItem
        end
        object tbitmCheckUpdate: TTBXItem
          Action = actShowUpddateChecker
          ImageIndex = 73
          Images = MenusImageList
        end
        object tbxSep3: TTBXSeparatorItem
        end
        object tbitmAbout: TTBXItem
          Action = actHelpShowAbout
          ImageIndex = 72
          Images = MenusImageList
        end
      end
    end
    object TBXToolBarSearch: TTBXToolbar
      Left = 452
      Top = 0
      DockPos = 413
      Options = [tboNoRotation]
      Stretch = True
      TabOrder = 1
      Caption = 'Search'
      object TBXSelectSrchType: TTBXSubmenuItem
        Options = [tboDropdownArrow, tboNoRotation]
        Caption = 'Google'
        Hint = ''
      end
      object tbiSearch: TTBXComboBoxItem
        EditCaption = 'Search'
        EditWidth = 200
        Options = [tboNoRotation]
        AutoComplete = False
        MaxVisibleItems = 20
        MinListWidth = 200
        Caption = ''
        Hint = ''
        EditCaption = 'Search'
      end
      object tbxDoSearch: TTBXItem
        ImageIndex = 74
        Images = MenusImageList
        Caption = ''
        Hint = ''
      end
    end
    object FillDates: TTBXToolbar
      Left = 624
      Top = 0
      DefaultDock = TBDock
      DockPos = 643
      TabOrder = 2
      Visible = False
      Caption = 'FillDates'
      object TBControlItem7: TTBControlItem
        Control = Label1
      end
      object TBControlItem6: TTBControlItem
        Control = DateTimePicker1
      end
      object TBControlItem8: TTBControlItem
        Control = Label2
      end
      object TBControlItem9: TTBControlItem
        Control = DateTimePicker2
      end
      object Label1: TLabel
        Left = 0
        Top = 4
        Width = 42
        Height = 13
        Caption = 'Fill From '
      end
      object Label2: TLabel
        Left = 123
        Top = 4
        Width = 18
        Height = 13
        Caption = ' To '
      end
      object DateTimePicker1: TDateTimePicker
        Left = 42
        Top = 0
        Width = 81
        Height = 21
        Date = 40830.496065717590000000
        Time = 40830.496065717590000000
        TabOrder = 0
        OnChange = DateTimePicker1Change
      end
      object DateTimePicker2: TDateTimePicker
        Left = 208
        Top = 21
        Width = 81
        Height = 21
        Date = 40830.496065717590000000
        Time = 40830.496065717590000000
        TabOrder = 1
        OnChange = DateTimePicker2Change
      end
    end
    object TBXFavoriteToolbar: TTBXToolbar
      Left = 396
      Top = 25
      DockPos = 224
      DockRow = 1
      Stretch = True
      TabOrder = 5
      Caption = 'Sources'
      object TBFavorite: TTBXSubmenuItem
        ImageIndex = 22
        Images = PanelsImageList
        Options = [tboDropdownArrow]
        Caption = ''
        Hint = 'Favorite maps/layers'
        object tbxAddToFavorite: TTBXItem
          Action = actFavoriteAdd
        end
        object tbxManageFavorite: TTBXItem
          Action = actFavoriteManage
        end
        object TBXSeparatorItem15: TTBXSeparatorItem
        end
        object tbiFavoriteItems: TTBGroupItem
        end
      end
    end
    object TBMarksToolbarNew: TTBXToolbar
      Left = 548
      Top = 25
      Caption = 'Placemarks New'
      DockPos = 433
      DockRow = 1
      Images = MarksNewImageList
      LinkSubitems = NMarksGroupNew
      Stretch = True
      TabOrder = 9
    end
  end
  object TBDockBottom: TTBXDock
    Left = 0
    Top = 630
    Width = 842
    Height = 9
    PopupMenu = TBXPopupPanels
    Position = dpBottom
  end
  object TBDockLeft: TTBXDock
    Left = 0
    Top = 59
    Width = 413
    Height = 571
    PopupMenu = TBXPopupPanels
    Position = dpLeft
    object ZoomToolBar: TTBXToolbar
      Left = 0
      Top = 0
      DockPos = -6
      Stretch = True
      TabOrder = 0
      OnDockChanging = ZoomToolBarDockChanging
      Caption = 'Zoom'
      object TBZoomIn: TTBXItem
        Action = actZoomIn
        Images = MenusImageList
        MinHeight = 29
        MinWidth = 29
      end
      object TBXSeparatorItem1: TTBXSeparatorItem
        Blank = True
        Size = 3
      end
      object TBControlItem1: TTBControlItem
        Control = ZSlider
      end
      object TBXSeparatorItem3: TTBXSeparatorItem
        Blank = True
        Size = 3
      end
      object TBZoom_out: TTBXItem
        Action = actZoomOut
        Images = MenusImageList
        MinHeight = 29
        MinWidth = 29
      end
      object TBXSeparatorItem2: TTBXSeparatorItem
        Blank = True
        Size = 4
      end
      object TBControlItem2: TTBControlItem
        Control = labZoom
      end
      object labZoom: TLabel
        Left = 24
        Top = 221
        Width = 14
        Height = 13
        Hint = 'Current Zoom'
        Alignment = taCenter
        Caption = 'z1'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = True
      end
      object ZSlider: TImage32
        Left = 18
        Top = 32
        Width = 25
        Height = 153
        AutoSize = True
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 0
        OnMouseMove = ZSliderMouseMove
        OnMouseUp = ZSliderMouseUp
      end
    end
    object TBSearchWindow: TTBXDockablePanel
      Left = 65
      Top = 0
      DockedWidth = 170
      DockPos = -6
      DockRow = 2
      TabOrder = 1
      Visible = False
      OnClose = TBSearchWindowClose
      Caption = 'Search Results'
      object PanelSearch: TPanel
        Left = 0
        Top = 0
        Width = 170
        Height = 551
        Align = alClient
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object TBXDockForSearch: TTBXDock
          Left = 0
          Top = 0
          Width = 170
          Height = 9
        end
        object ScrollBoxSearchWindow: TScrollBox
          Left = 0
          Top = 9
          Width = 170
          Height = 542
          HorzScrollBar.Visible = False
          VertScrollBar.Smooth = True
          VertScrollBar.Tracking = True
          Align = alClient
          Color = clWhite
          ParentColor = False
          TabOrder = 1
        end
      end
    end
    object TBEditPath: TTBXToolbar
      Left = 0
      Top = 244
      DockPos = 240
      TabOrder = 3
      OnClose = TBEditPathClose
      object TBEditPathDel: TTBXItem
        ImageIndex = 36
        Images = MenusImageList
        ShortCut = 8
        OnClick = TBEditPathDelClick
        Caption = ''
        Hint = 'Delete Point'
      end
      object TBEditPathSplit: TTBXItem
        ImageIndex = 63
        Images = MenusImageList
        OnClick = TBEditPathSplitClick
        Caption = ''
        Hint = 'Split Line'
      end
      object TBEditPathLabelVisible: TTBSubmenuItem
        AutoCheck = True
        Checked = True
        DropdownCombo = True
        ImageIndex = 37
        Images = MenusImageList
        OnClick = TBEditPathLabelClick
        Caption = ''
        Hint = 'Show/Hide Captions'
        object tbxShowDistIncrement: TTBXItem
          AutoCheck = True
          Checked = True
          OnClick = tbxShowDistIncrementClick
          Caption = 'Show the distance increment'
          Hint = 'Show the distance increment'
        end
        object tbxShowIntermediateDist: TTBXItem
          AutoCheck = True
          Checked = True
          OnClick = tbxShowIntermediateDistClick
          Caption = 'Show intermediate distances'
          Hint = 'Show intermediate distances'
        end
        object tbxShowAzimuth: TTBXItem
          AutoCheck = True
          Checked = True
          OnClick = tbxShowAzimuthClick
          Caption = 'Show azimuth'
          Hint = 'Show azimuth'
        end
      end
      object TBEditMagnetDraw: TTBXItem
        AutoCheck = True
        ImageIndex = 41
        Images = MenusImageList
        OnClick = TBEditMagnetDrawClick
        Caption = ''
        Hint = 'Snap to Existing Markers'
      end
      object tbitmFitEditToScreen: TTBXItem
        ImageIndex = 43
        Images = MenusImageList
        OnClick = tbitmFitEditToScreenClick
        Caption = ''
        Hint = 'Fit to screen'
      end
      object TBEditSelectPolylineRadiusCap1: TTBXLabelItem
        Margin = 2
        Caption = 'Radius'
      end
      object TBControlItem4: TTBControlItem
        Control = TBEditSelectPolylineRadius
      end
      object TBEditSelectPolylineRadiusCap2: TTBXLabelItem
        Margin = 2
        Caption = 'm'
      end
      object TBEditPathMarsh: TTBXSubmenuItem
        ImageIndex = 39
        Images = MenusImageList
        Options = [tboDropdownArrow]
        Caption = ''
        Hint = 'Route Calculation'
      end
      object TBEditPathOk: TTBXItem
        FontSettings.Bold = tsTrue
        FontSettings.Color = clNavy
        FontSettings.Name = 'Arial'
        ImageIndex = 38
        Images = MenusImageList
        Options = [tboImageAboveCaption, tboNoRotation, tboSameWidth]
        OnClick = TBEditPathOkClick
        Caption = ''
        Hint = 'Manage Selection'
      end
      object tbitmSaveMark: TTBXSubmenuItem
        DropdownCombo = True
        ImageIndex = 25
        Images = MenusImageList
        OnClick = TBEditPathSaveClick
        Caption = ''
        Hint = 'Save'
        object tbitmSaveMarkAsNew: TTBXItem
          ImageIndex = 25
          OnClick = tbitmSaveMarkAsNewClick
          Caption = 'Save as...'
          Hint = 'Save as...'
        end
      end
      object tbxtmSaveMarkAsSeparateSegment: TTBXItem
        ImageIndex = 64
        Images = MenusImageList
        OnClick = tbitmSaveMarkLineAsSeparateSegmentsClick
        Caption = 'Save as separate placemarks...'
        Hint = 'Save as separate placemarks...'
      end
      object TBEditSelectPolylineRadius: TSpinEdit
        Left = 0
        Top = 160
        Width = 61
        Height = 22
        MaxValue = 100000
        MinValue = 1
        TabOrder = 0
        Value = 100000
        OnChange = TBEditSelectPolylineRadiusChange
      end
    end
    object tbMergePolygons: TTBXDockablePanel
      Left = 239
      Top = 0
      DockedWidth = 170
      DockPos = 6
      DockRow = 2
      FloatingWidth = 128
      FloatingHeight = 128
      TabOrder = 2
      Visible = False
      OnClose = tbMergePolygonsClose
      Caption = 'Merge Polygons'
      object mmoMergePolyHint: TMemo
        Left = 0
        Top = 0
        Width = 170
        Height = 551
        Align = alClient
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object TBDockRight: TTBXDock
    Left = 678
    Top = 59
    Width = 164
    Height = 571
    PopupMenu = TBXPopupPanels
    Position = dpRight
    object TBXSensorsBar: TTBXToolWindow
      Left = 0
      Top = 0
      ClientAreaHeight = 561
      ClientAreaWidth = 160
      DockPos = -6
      PopupMenu = TBXPopupMenuSensors
      Stretch = True
      TabOrder = 0
      Visible = False
      OnVisibleChanged = TBXSensorsBarVisibleChanged
      Caption = 'Sensors'
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 160
        Height = 561
        Align = alClient
        AutoScroll = False
        AutoSize = True
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object TBXDock1: TTBXDock
          Left = 0
          Top = 0
          Width = 160
          Height = 9
        end
      end
    end
  end
  object dlgOpenHlgLoad: TOpenDialog
    DefaultExt = '*.hlg'
    Filter = 'Selections|*.hlg'
    Left = 161
    Top = 84
  end
  object SaveLink: TSaveDialog
    DefaultExt = 'lnk'
    Filter = 'Shortcut|*.lnk'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 113
    Top = 212
  end
  object TBXPopupMenuSensors: TTBXPopupMenu
    LinkSubitems = NSensors
    Left = 778
    Top = 297
  end
  object PanelsImageList: TTBXImageList
    Height = 24
    Width = 24
    Left = 48
    Top = 176
    PngDIB = {
      1A00000089504E470D0A1A0A0000000D49484452000000180000027008060000
      00934FA1E600006021494441547801EC7D07745545D4EE3EE7F69BDB526E7AEF
      2194D021F42ABD0948538A5451401044B0A020A0A2888A8A8882A2A2A0200414
      114541E91D9426BD0502E9E5D6F3BE7D5248484200F9D75BEFFDDE35DF997266
      F69ED953CFB42BD05DFC9A4E5AA386B770220A00585DC1E3ECB6377BD8A1DF51
      09777A0BC2B1783F13E80B54A4BE81E30B6074027A854AACD0158E4D26AC7A0D
      DA71A06FA8D540633A57A379231AD3C4EE71D4A25610F998B47845CCF83822C2
      91607B3954C80001BE1614CA29213E3A9A31B0264DEE9B446D93FC492BE592A7
      878A1A2504D2F0CEB5E89541B528CCAA67A2CF731836DC8E720C9A4D5C3D079E
      FA36ADE647CFF46B4875A37DC9E4A1A78C02B8EAAD64F0845D2B9055E7242DD9
      69C1C806D4A6A62F5E525F30299792320CE021561284A9D101269A33AC11D50A
      D6D3F56BA95450904B1E2623193DB4242A14A4510A941062A6C649B1E4ED69A6
      273A4452988F2C324E09E71B3394A1949FB71E720C5E19DC804872D13FE7AF50
      9E60248BC98B5C4E78120482223F8B8EF69FBC02666914EA6B240FB582C67608
      A529CBE5BC661A8FC0B7AC4A5280D8ABE1D2373AC048215E6A3A7AEA22A59385
      7CFCAC70164992889C2E89EC0E37D9ED760A0FF627BBA4A48DFBAFD03F57B228
      C0A4A4604F15FCCAA2625A6CA6D2290827FC6A849968F9AFA7C8623693AF9F1E
      E271934214C8E17253769E9D0C081A1BCC4C09B13751EBA460DA7EE0045DBD91
      474126375D4C0711A270229293539A41001C2932D0426EF0BD5920922B2D8BF2
      3D3464D022A1480233080DD2B137A44882B80472BB1CE402F32B6939A413B824
      C8A9605AE518C801FFB99A473590B916E499975949272E6752AA42496AF0C829
      70908F0791D5A491894B6E376564E690BF5945572EE5D1FE7F32881485A99389
      E12100B2421EC4C2703C21D48BAC5E069AD02596AC160F3A7B3593361EBA41F9
      0E8944A4CDE97291BFCE41793627F54C8EA082FC1CCACDCEA203474FD0A22DE9
      64D778810CC515D7EED2223A4BF85DBA9E4D0156934C1C560AF737531F14CF5F
      0E5DA68367B2C8E596E8D8B97CCAC8B5515CA007059B24CACECAA06F7E3F4B2E
      651007619CA5A25F490AD88E547C0DBD6F42B80F3DDD398A5877BA88944A257D
      FBCB01FAF1480EA95107F26D0EBA869AD7B38E891A84AAE87A5A1ACD5F738232
      74E184DF37887D4931BD9D812C260F8D92FCBCB4F442CF68F2819844C949B3BE
      394417B25424A07EE4DB9D949665A3FEF5F4543748A05F769FA04D17BCC9A1D0
      82FE2DF1B0A50C0376402AB8A23C6FD4A96860230BB5AFE1459F6D3E493F1E77
      9356A3223B9264B73B282B3B9F1A8610754A20FA68878BD2DD660E3E0BB17F81
      0DC528C7805F80C9D7D0FBFA1995D435C14D4B7E4F239B682295E020B7D3496E
      7B0139F2F3C81B254A61F1A71C9706DEA98C68D88181C2C75A5920162CC359A9
      D94E5ABCDD4EC13A2DBDD13B9E9E6C1C441DFD25F2B79D46A3E749F9C6B062E2
      1C730E5396106C1532803B810927350ECDF6370A9D85E2E323282EAE210505D5
      245B819DEC6E39F1DFC02F1749F60B6379A528EF443462C488294949492D2CB9
      7F556B9790D4AF7DA318A55BA5509EBC984BE7AE5EA74675AB49493E1AE795DD
      CBF7D2A5AD01E1E1E1F5CF9C39B31FB4B84984764B559882FAF5EBBF3A7AF4E8
      57C78E1DFB6A5494CE37222C44E3A5F7A63A317EF468F786F4508BC682B717A9
      9E7B6EE2D059F8B56FDF7E0611B5A40A7EA52B5AC9EBF5EBD7D38E1D3B64BB5A
      6DA6BCBC5052A0B9901DF0100481B66DDB4E191967897FA74F9F66CDC08FBB82
      9797D73C93C9B4DA6834AE79FCF1A957A64F5F963D7DFA27D9CF3DB7247BEAD4
      C5D9CF3EBB28FBC9275FCAB6583C37A954AA95C09720DC0EB86BA5824F8E1123
      1AE63640BB0A50076E2600059654D0FF53F72E01C5ED41BEFBEE3B75DFBE7D63
      1F79E49166BD7AF5EAD9A74F9F9103070E7CEED1471F9DD5A953A72EB56BD7CE
      BB72E5CAA9B4B434D7ED612BB22B7EFDF5D71620F4387E63468D1AF5A2C16078
      DDC7C7679CD56A7DC4CFCFAF8DC562A9A5D7EB833CF0F3F6F60E837BAFEAD5AB
      F7A951A38664369B8F9D3871C25E11E16237C5F8F1E3B7D4AA55AB3388D50061
      5F3050A9D56A147541703A9D028F20D8331C640DEF4430B1FAFAFA76040657AB
      56CD10121272ECE8D1A3B9ECE176882EFC10398546A321AD564B6EF4B30C1027
      060760E2C5603BBB33A3888888A0060D1ACC68DCB8F131D4FA777AF7EECD455A
      6EA4D81F43BC7AF56A2A0C8284510313D6E974845410EBDC932930921345115E
      48766737F6C7FE9911DE0941414196E6CD9B3F09464720E62FBA77EF5E0F01E4
      400AC87F006A6204522114141410CC74EDDA35CACACA2287C3017F858A09DA6C
      36B9FBE494E6E4E4C8EF21007984C18C905FCAE8E8E8EAD01F474B10F0D75F7F
      6D1611E83262EB3C7EFCB83CD6C9C8C820E4874C88C55248BEF0C94C98F08D1B
      370804E414B11F0618C8612011E1E2C58B626E6E6E0B848A52B46CD9320D6DCE
      63C830058A9F1C2833339390E1727E14673213679170AA189C424E31524E376F
      DEA47FFEF98776EDDA45172E5CA0ECEC6C0152388FDF77CA71E3C6FDF1D24B2F
      4D1F3060C06BC1C1C122DA75427124C4849054E2CCBF7EFDBACC8C19701EB088
      F8FDA54B97885B527667704A1888B98494E643BFA9C4C3FDF2CB2FBF0342E128
      054F04040408E7CE9D23B4A83213CE703046D39C41A9A9A932C1B3673106C200
      8C89B2688A8812C40D72850AA9F807A66C66009DECAFBDF6DA5494985094802E
      CC04C92354246279B3874D9B36C9C5B698289724766711B21BC2CAFE217B42EC
      2588EF06DEBB8B1910E49EF3C5175F0C474A36A087AA035108680E08F9230FD7
      4BC7944B0EC79689720AD98C18CB2900618CC80B2444EC0A1894EB42A95DBB76
      31EFBFFFFE99949414F7B66DDBA4AFBFFE5AFAE38F3FA437DF7C537AE59557A4
      D9B3674BAFBEFAAA3473E64C69D2A449D2934F3E290D1F3E5C425BE546917737
      6FDEFC0C6AF66A106F0F94A974B017AAAE5DBB36FEE8A38FD2502ADCBFFDF69B
      B461C30669C18205D23BEFBC233399366D9A3471E24409B5571A32640813CEA9
      57AFDE5E148E77416130100FA8814A95D0AD5BB7873FFDF4D35C66F0D34F3F49
      6FBCF1863463C60C69EAD4A9D2840913DCC3860D7375EEDCF99FB8B8B81454CE
      6741A9156005CAB5D070AB50291E7EF8E1091F7FFCB183C5C4C4116B269CDDB4
      69D33D68F01620D420200ED001F7A5545DBA7479FEA9A79E3A893EE22F34D1DF
      23B69341A92511F900771D5BF8AD5469F0A616D01A8806B4C07FEAC149A05C26
      A1D3D72243EBA0D3EF898A3306E689A844D3070F1E3C139DFE4094770D1AB983
      A8E5CEBB8946459DFE6B68AA47A1187642BF9084F6281CADA717FA0C2D1A402B
      2A533B74FABD51A2FEEBF4757217C82D26B7A42C6F6E39D1CACA9D4F710F8777
      FF75FA8523C3629138309461FCD7E90BFF75FAA837ED010128AFFEBFEEF4258C
      262474FA7BD1DA3ED84E1F832CC7DCB973244C9248688FA640B056A05C7F02B7
      324A2C632B6F716084F78646536B49B76E439561614DA857AF89D4B3E7B046F0
      9A0FB8803BAAAA1870605B4040D4CDD2F345F9F90E9E78BDABD14585492C9E2F
      AA59B366B3C71F9FBBAA4E9DC81E56AB41999929D0E5CBA9D4AC59DDC0F6ED1F
      795AA17044868606550FFFB7F3452121415A9B4D87E1B99ADAB74F22CC278916
      8BA4FE6FBE88E78A183C5C6C83DC6E5701FE1F9A2F7A75F66CE5175F7ED560C3
      0F1B872CFDECF3066FCC7BD3E7D967A72A90AA3BAA2A3D4C7FFE7961C890A111
      8989D59F890B0999ED9B9DD5DF3320B0B73524B4ABAF9F7FBD0E1D3B793FD4A1
      83909C9C6C432DB76FDFBE5D2ACDF18E0CDE7FFF034FCCC40CAA592BE9ADA0E0
      E09E625696D97DE890489E5E7AAD9F5F80D160AC6DF1F2EC62365B7A7B797B77
      F6B5FA253DD4A993679B366D25302CA8DFA0BEA3C29AFCC6BC799A155F7FDDAE
      7172F29775EBD65B80E1620D224121F9F892BBFD4324868490E4746179C585F6
      5E50AA351A6B80DDDEB04666C698B890B04FAAD7ACF5636C7CC27CA3D1540D1E
      6E25085F9162704848426464E4D8B0A0E03E7AA7D35B341A053BE64CB3730BB0
      EAE1C0272DD66CD26F92D7EF3F530666E1D3929B921D1FE502266DD437D32447
      74ACDD46EE0D69D752675EBC70FE90B298FC7BEF2DF40F090D793422226224A6
      1022C573E745C76F5B282F38941C8D9B52565E01E5E4D9C004F3D699799499E7
      A01C1229279F178A24923CCC9253A54BCF3A77F1ADBCDC8C0F5E7E71FA4DA6AD
      983973A611D3699D1312AABDCD0C743ABD8F2088A253A9A24C958672BDAD944B
      02E5632AC78D4912677E01158822650684528E7F2015081ACA768974AE4043C7
      9561F957C5D08CEB62AC477CC301393E1E8D6EF26C8B19328ED768B401589FD1
      A3AD373ADDA4C8C12A87CD68E659282CD0B9C8852547FFF5AB49B16B07A547C6
      90134C780096E756D1D16C159DD1450A827FA45EE7175043A3D74638D2D2B7E6
      5C483D579207C39F58A00F890AEB5DAD66D01C72E505AA44894C4623E9B41A79
      8AC09E9B4FAEFD7B291F72CFAB9644F9583BBB743D838EDA3D29C3B706A9CC3E
      84993E977833FD37FB8953930B4E9DD9FFF3F2FE92CCE089A9ABFD126B058FF2
      F5538F169592BF4EEF21280437156467526E563A89A2A20858E8129490BB8D8E
      61F9EB648181B2551692ACB1E422758178FDC60A3A75F2A55FE6B73ACFF26728
      9F9CBE3EB9561DFFF1FE81FA6E6A4457A1D208F9793964F0F020C1612395D287
      D2726C942369E8E2997F48A5F5A04B3772E8629E404AAC73669C3F2BD9537333
      1439AEB73D0AA405DBDE6F9BC9848BA1A859BF6F0E91EA2F49D09E55EB8C4ABD
      C96CD479786833D2AE1256FA0451E341BC4E938F15A69B36A26B6E3D32DF936E
      5CBF4A6957AF925D6171E5A6657D6B4B4DFFF8C8D1DD37054B43A774FDCF62FA
      A4FCF8AD1EE9B0ED650C19BFFAC3E0086B82D9DBD8D6C74FF3A8D15317E71695
      425A761EDD2820CA16D474E9EADF94E1409DF031514EEE0514DD2D8A7C4BC7DE
      F946EFA61AFFC6C714B905BB851A9FED72A6671ECEBF70F152493D00035ABAA0
      6776DCF00D47036252638DA6BFC42B57B791F68A3F45F834238DD99F6EB8B594
      E9E94905128AE9B5DD58BF5C4681413D841CBB458FA9C74851A58E501B3D3A88
      79862B52C6E55715997B97315D191EEDBE14AA8DDD98F0F027479674FCF9D52C
      FFAF13DDAA77CD52ADC5DDA4A92923A4615F7595DA2E1C2DD59AFFB614346D94
      A479DC2A894F1AA480577B4BE6691B24E5D3EB25FDC41FDDC631AB2FEA5B3D3B
      45E313E387AF53140990F7E9FB9D2138D6FA7054A2DF64ABD59420D023A213A5
      E38CF7CFD4C06B38A9353632282F518C693765FFBD90326F5C23A7C6490A931A
      85C14279E94E926C6EB733EBC6DFCE63BFBF261C5FB7D6969D2A67B6C2A7FF9A
      DAA149FE2F04C5FB4CD1685441925B1245CCB459D50114EBAD412972527AB685
      72D2E3C95B1D497EBA33446216A5BB502FCC447A550DCABE12EE745CB9BC4D38
      FCC374F1E4DA1F6DB9375170107328C1ABEBA268EF105D0B73807F6754E97A46
      93C15FAB562AB5AA2C2157F7195DB15DA6F4EBE914A3E9447AA92EB508FE9B6E
      667E4E3FA3665FB23791B2CFB52AB87AF8F25AE1D80FAF2952771EB11560D119
      848B95506410F5315D8D9698DAD19E6131CDCD0101ED4D9EA624BD07F99875A2
      22539122EC4E5F41D1CA31D4C23B9E5A44ACA69F2E28A555BF24679EDDFBD752
      3A96F2AE22F3D8594C08BA8BE855AE690C568531B18F5748979793AB8D5C3AAD
      C98B29BF76F9E893EB8DBF1AE56AB4E073A9F68C9FA4B9EB3E770F7A7FC60553
      B309CFA8BDA2E5CCAC9CE21DDE68F466A5B17A7F6B64F7575BD61AF3C9CC8091
      2BFE340C5D75C367D0A7873C1B0D1EA031781BEF10FCDE5EA94D412A55C2C000
      55F2F36D9589831A6A74A6BB1A9BDE1B9742DF9C6F8C425B154F615DCA9A4789
      84F7D0B69BAAF07B4FAF31799885ED254FA2A910DEEBD2B9DB03255E141353CA
      FAB5EF298B63DE6AEEAD16B0C84389E6A972D29251F5C8D3A097DD32D0F9F47B
      6F0FDDB4553EEAD9F56232AF90989002390CA5E715EAB73FF56A81DE1B51AB84
      38BFB778E8E88B27EA50B7770F536EC19D8BBEC801EE842F86C752A037DA84DB
      3C791B3DE8EB11F1B7B996B756C9E0C79D27CA872A72F971D771326AEF5CA02A
      65209044F19E0EBA9C5E403FED3E5E44F296B6F5F0698C956C94E45D409E8559
      73EB652953850C4441A26ADE0E8AF17253B0978E726D0E3A7539AD24D8B58C1C
      4CAB49109D89A2BC9554CBCB4656BD54F2BEB4A10C03CED06F47C7D2909A1245
      5B081B9974E4EF65A0002F2389024670D8D7C281F5D8C011E463A620EC810944
      D719E98D4D1E491AFA7142F572222B61C0C4578FAD4E51813E34EEE1A6D420CE
      4F26EE0BE27E9E06F2F704136C646206069D468E7DA0B78982C0A05E5C100DE9
      500FFE4D94323EA90C931206DF3F5583FC408409303A374AA084303F99903F08
      E9B56A762E01DB03918AF8505F4AAE1E51E26E46115E3FA17689BDA41E58CD86
      12C762434CD156AB62FBEDBA4EAD22C6EDEE26BDB6C4A92405252E0FD8509202
      9BC3491A5589556693936F231D32548181AEEC70DB83F776E514D888C552FA55
      9ECD4E7A4DA1484B28767A7327FDF04C4342772CFBDD7BE2A2BC392C00F26728
      156513EBC017CE951B59C4E095C00609A1723826FED09B7B69EBB4C6B25DF86E
      F52AA9678F8729E9C53FC91B65F9FB71F568DDF6BF2823BB8002D06131B8B404
      20438B99D8915A267CE566361800695964D06BA873A378EAB1F01065174874E0
      95645ABDE65B2AC340668987BF878B6A783B291CC396620671A156F2341656D9
      CC9C7CFAEB5C2A5D49CBA6CB48C5991B763A724345A979B75259CCA04444A05B
      A2AEE62AB0B68C8A25D9A0633F112A5B3171F66436E8E48A77312D934EDF70D0
      E19B6ABA81D136BFBB1DB758DEF6866373E0865ACEE4D2E5BCD85BC36A61C85C
      2D1DBCA1A99438FBAD9401BFE458F56E51838D15A24BE3044AE779AF0ADF163A
      5628A2C25785CF5EEFEDA39F2637C6F69FB271C92BB0CB195AE8ABF267950C38
      159DDEF8937E78B6892C7726C545B4F73B3BC9E654A058B34BE5C047A512BD3F
      9938D72BF756F68D4AA9A00D539A9575ACC006E2D9C2D2659F8CF5F4F49C8B45
      E8F28D510581EED6094B2FB9A9A9575EACD2BFEF7CA9299058A5C74A3C94CDB9
      8A3DF198690198F404EE7959F76E189C04DF186029117D08267580CA0744F054
      5ADD0D83CB0870121439258360FE0E6803DC95AA92C1B5A7855C50DAEDC24053
      818F27980381F2032538226502B432AA4A0645BE7740B701ACEC78A401048222
      2013F5794B8A855B0FD823A19728B1C454CA004FD140E90CFD0BAFAF03ACB871
      C8C1FB78580602A3610EC578A019CC638091B0FB439755850CF0261998058F7E
      D009A395CBD04F00ACEC7834011E072601F380F9C060A02DD00FE012A7828E29
      2B7E96C751380D0096804935C42E0FE6752E22AEF530527F3C9E5010D504B893
      E80C3B5E533AF4106024100754CAE01FBC3C09740426230509D09DC0D7C02520
      BC88B02C7F9835704B004E01ECC64D706B982B6600829978F90AB08588E29082
      8ED07B006A6037A0026E57BE450E17A0DB0113503183B4898284E2F9333C3C02
      BC05F8004D81AE0067AE167A19A5C077181C0CC050A017B00CC06C1F3FAB00F2
      A10DBCAC0458DE17A0730C13148544612D542EA28B30B542E44E419795527E56
      FD3804B1AD81A8EAC06B1CB003380982D5A18780910AE63C983703D781122594
      982A3020E62CEB08BCAA0D1880E78130E024187E0DBD3598726A44983F01D620
      F659D04B14BF902DD87AF312C0B193ED209E08C353403CB085883E0316010580
      15840D802FCC8D012360062C0827422F51A52D3388E858292636D82F023F2256
      A98003668EF55AE8679082B344C4F5450311710ADF847D03300D4CBCA0CB4A29
      3FCB3E9849BCF0B4701CCEA780D28A3339140ECB818F812D4414E822AA0F262C
      CE4498A7C06D0B116D032A2EA678C14C4AC4057BB1CA82C1179808F144235587
      607E023800C21274564A3C7480AC4A8B487628F528C70462C9C5FB74C01FA80F
      1098EC853E063852C484696A6197155B6443258F324C10EB4CF8FB14C8059A41
      D61C5B66B213F631C0DF00D3D44197155B64C31D1EFD8ADF21B688242D817D0E
      1007700D8726AB3FF164719D845EC24080E59E1562CE049E84C87E47B3B2B398
      00DC995E4B22D220323F42BF7F15F6D137BE611FAEA8713B05B82B00AE94B7BF
      2A6F478CFED598882956950726785A00463D011DCCF7ACAA62C0191603AA4BE9
      3EC64408536945E3778CCB78DCF7980861EFCC002581CBFB6ED77D8E89AA64C0
      1E801D800D60C54D731A1B9027158E89D058CA958FFD30B8DCB25E02048C86E5
      12629F0F9D07579C079BD1988520254CBC13DCB381FA8001585FCB7979B04310
      47253BCF794CB06DB55871B40FEEBF0229156572325EDCD598089BB5DF6CE03C
      FF878E1CAFFC2DFA056D54C55936A812C85928F956A0F366450C8EE2C5006009
      5253F99848926A610E49775011188C8F5E52636DEC8260969ED5763A986C185B
      0FE1EB0063053CCA2810B5C0612DD004F80CCDC11B68E45AC15C0B4802C2202E
      6EB2612C546E49BA86B3846709FD02E0062642C4EF402F4C0B1B8A0182DC62BE
      02FB16AA604CA4931C5CF9F0EA9602716B91ED02743B50E24784A58C42E355E9
      9828C675BD2B3C6B81324A51387CE10C1F8A17BD806580AC04F979870744D606
      AF572A259739C49D2942D6745CF42105E6F0E05EA250C22EC252664C043B0EFF
      F1F3CE38D4C4713A3543D47BFEC384C9B50B4B5A5740B03A828528B0CA07731E
      CC9B81EB4019A52C632B6541CC556AC919392D7FE362B3648B9FAF6D4E050472
      82D2827CDA08AF3EC8FCF3AEC2AF9E4F602F3726825BF94C6647104FD44A8E89
      6FE6AFFBB6B7E370B3BE8E83A4905C6F22E65CF9EE7A4CC4B42ACC83CF5E5D3B
      D048B64F3B3BFE56A9C87D111EEBF9995FD2439F03C42005CB10FB563077479A
      B0128BBA55780E7305DCDE4711BD095D564AB41D4FC074023803D4018693635F
      7BE8AC52F07844983123CF77FE4B89308702CB81BB1A13C19F9CC90BD950017A
      82F09A52EE5930FB023C26DA8C581E822839728B910F49488980774AA04CC7C4
      F5601C1C1703BB814F819644A4BD8D387FA7E5C23D1DF007EA033C5CD90B7D0C
      50E19808EE77F77DC01E115B449246C13C1BE0940D472A9C30738BDB04FA4700
      B7BC83E0FE0DCCB2E214C886AA1E080449DCDB988869DE3503F60C2636E8EF00
      DFA12485419715DC25187E079E0452817FA730EEA9704CC454F1EEEEC7451CE0
      DF8233AE421ADBB76FB73EFFFCF37DA64F9F3E0B07195E1F3468D0ABFDFAF57B
      F9B1C71E9BF1C4D8B1D39F993265D2B8F1E307757FA46F4272C78E19010FB5BB
      B66F2D7FAB9725C7E5B68CCB679F7DA64C4C4C6C69B55A9FBB72E54AF2C68D1B
      3538AA41972E5D120AB0FD046D3FA9743A953528D05CB77E7D53CBE42609B141
      81BD540AC527DEEF2F7C6FEE1363CBE481589AFAFAF5EBD5616161C330D9BDF4
      8B2FBE68F5C4134F68972E5D2A607FAF1011114175EAD4A1BAF5EA51745C1C39
      3023BF66DB3661EAA20FC555DBB60560527D7288D9F2F6D8850BC34AD32C61B0
      62C50A34F1C2A3389132FB830F3E085CB46811E1C41661E324458D1E4DE6DEBD
      49DDA91379809135369612C0AC71E346640A0CA0D5470E0BDF1CD8AFCE73397B
      052A95B3867CB4886BBCCCA784018835C9CBCB7BF1DB6FBFF5DAB46993101313
      2324242460CB498997C2009AC2E3DB36B59A9C58328F888EA648F8DB6DB709BB
      3233554A8DBA57B4200E1E366BA62C7E3934CE7858706067F2D1A34783415C3E
      48E51718484EA592446C419129173D5C202C190CA431994889CB016C7A3DF904
      879021288876489270531475068D665880C9CCB59A7B10A2FEFDFB77C47AFC84
      B56BD76A70704AF0F7F727358ED17B3011AD9614E7CF93077645E972B24905A6
      6E8D9A0A544AD98FDB60A4740536D7E01CDB0D851207A4B106A7D35B10F34B17
      1A37DC2EE0BC8D01C701DEC769AC81903D22EC417C422B283616D71798480441
      23C4E2400962C22E6C09C2A647393D0EB389F6B56C2D9BF991B3772FA9727369
      B44E2BE9ED8E5FD69C3B3B50C481C2444C01D7C5012BF9FC1F8E2A611F979D34
      CD9A91B3562DB22726624F919D5C387187A3C4841DF7E4B8ADC367E20C1D529B
      83D4F0B8C7A0D745061245E16E05457D4C03FBA1CC232C9288C0BC639F0314C3
      E172C9EF428202C900B1491045F1BBD23AE7AA0BE1F31019BD466B322B9421A0
      2D862005BAFCFCFC921203C7D2E1C88D774A04F454A9C947A3A300C0C3D307B7
      3F58A8CEEEFD5473FF110ADF739082F39C1481FD5E7AEC8BD2AAD50AD1E1D00B
      5F7DF5D53C9CA61BF3EEBBEFEA0E1E3C28A006CBCB2AC817AC1928C884CC4667
      4F1A94162D4A4F0156A3B84975421412323AD36E270709946DC7720CB66565E1
      C8DF88D6ADA53A91513756FFF4D3139CC99371B6F2B9CF3FFFDCF2C3C68D4248
      9F3E25B1F7387E1CF75178920A496631892A15B944919C488D1ECCAE63D79A03
      EFD27120DD21B9B1D7288F1468C75F193D46F23199FEF978C557FD8559B366B5
      6FD5AAD5C2DDBB7747BDB76489E0D7A1430903AFD3A78950EE0DEC02A27C44C0
      0D5DC090221F8B719CF1B905F9949691494A30BF72FD3AD546A1983575AAFBCC
      99D31BDFFCE8C347059C7DF51B366CD887284DDD66CC9D2BDAAB576772320C48
      01729770C04F3E4EA94091C53A835CCA24F8409B45372112971BB147F12C80B8
      268C1D2BF5E8DAD5F1EDEAD5D35E797DEEDB02088B73E6CC198254BCBB362545
      F7D9CA958207926F4091CBC5D94B2D62E6817AC019EF8699C59369B5827CA152
      9C38416E9CE7C45149B9DDC20146F7F56BD78E7DF4F1E23E5F7FB5E22F1E6A10
      DAF960E0736470739CA613B66EDD2A7065E343251C63160D175D052A99332F8F
      2488A1903C51C191239481D38DD1515134E1E90952644464FEAA55AB5E5EBE7C
      F9FCB367CF3A640638D023A2B9E8D6B163C785689302BEFCF24B4287030908F2
      99403484323D09CD018B4344732D3BE071E3CF3F292E3494D02149681C5D88DC
      9A6FBEF9661C0EB15FC1EB5B2A2E2E4EF71CF639AF5BB72E0D6D927BCA9429EE
      860D1B4A38DF27E1ECAB141E1E2E4544464A21111152604888140CBD2EDEA3B7
      9340D0FDCB2FBFD8E7CD9BB7B165CB96D5217639E24CBDA4CBC42944270E731E
      816326F63E568B8D8D35A367A3E0E060818FA972138280E4EBE343F14841D3E4
      646ADFB62DEF85E71D203948F16A6C637F1E31FF0B52E0320052841A226BB71E
      38EFA46DD2A449731CAA1A09E2CD7106CACBED768B7CF6123AF6718A28584A6C
      041325744E7CDAFAE8A1438796EFDCB973154EA572775942FC16D5F22611C47D
      71A8B0338EEBBD8E93A71B5F7FFDF5833878780C07448FC0FEFBB871E316E3CC
      E010883646A5421B529EC65DB9B02C51A03CC2D047D4457E34090A0A6A880DAF
      DC995840A144C430FF6F54384927211F6A23ED2AE0BE9458552894AA7D1D3A74
      E8077FF7C5A44A0693274F2634219FDD2F932A19E0EC1FFD1B2655328068E8DF
      30B92B06FF86C95D33B85F26F7C4E07E98DC33837B65725F0C6E6702BB1F50A6
      9EE00C0FB763154F86C073A56ACD9A3584CF2819685D657FA8F1176028C3044D
      B8DC6CF3680FEFEEAC0E1F3E4C4C0CFD3585A27B64DF1847F5869E0B38003BE0
      01A801B6432B54558AA898380EF81FC12755E16754DDBA8458AF02896BC0F122
      7067C38C60BDA5AA64C031C787C96C1C2B7E82839D3C7992EFD6612337215E30
      E400D7800CA04CEC61AF3A0F4E9D3A3565DFBE7D3FC2F319A4623A0E4410F7CD
      384A4F689F36C1DD132893C1B0DFB5B2C0671C100C3011154423E1330B432589
      6F179070B3C014BC637FD0CAABAA44C4997811C158BE0EE88EF4F4F44EF89686
      110B0A1F7E48F8EC7D0D964A5351150326CA4C58071D220C4D7E66032E089045
      C566C017E05204ADAC922B4359A7AA6DB8E92406A38913C53E5164DBC27C18E0
      CC86F6EF15E74730C83404DA0075804AF301EFEE4B311326CAE2619DEDF745E8
      FF6EA049DDA3958BC7D68EAE2C165595A2CAC295B8B7695BBB73C741DDFEF876
      46EB16258EA50CF7CDA0431D3FF1FBF90F77AFD7A0DA675E5AC1B779C7A66B7E
      79AFD7E0456392CAE4C57D310071C584C75B0E6FD3BEFE9ACCD46BA6DD7F1E22
      312FDB52A34EC2D2B8EAB1934A33B9670645C41F6FDAB2F622D1968FEF05133E
      750D948FEFB982D4CB14111D312722266A40B194EE9901625E42DC89AF4A86D5
      CB83D2B1A9F2E6CD2CBA7EFA38F98746BDFDE984468D98C93D315830BE798D26
      2DEA2C126C79E4C2717A2766605C761C822BE0234D0ACACCB653FACD4C3AF3F7
      61DBA73F9D2C9317CCAC52402C7286DED8FF5ADAEE6503A5ACED53A59BBF4D94
      52378E91CE7F37583AF2E9C3D2AFAFB7957E9AD95C5AF97CD3ABDD1A070D0231
      2D50FE138A1D4B03C439438BC4924787F61F9767B142833CC98EC36F69691974
      FCE465DC16AAA34B59F6F30B56FDF5CCBED399EB40A300B8738703E2E22D99E7
      11CB3B2ADC8F0270DD657646362E2BCCA59CAC3C32EBD57431B384F806109689
      43BFB34A59D0BB7BCED1B952DEBE17A5AC1D4562F971B47461F51069E7C22ED2
      B6F90F49DF3F9F2C7D39ADE9B93A91E63EA05661930DF7F26AC1B8E41A37F6CD
      4C2B4DFCDA4F4FC8C4FF5AD647DABDB0B394F252539679EA9D8897EB0F209612
      995F3F7F81B07519F79B6AC9692B90657EFE7C2AE42AE19EA94C7228D5E75F59
      BA7FF8A17359BF228A4EA09C2A534C4B13175114BDCC1EA4568A7225E20CCDCE
      CA2511F343972EDF9489CFFEFCC03320BE15542B240E77790D877502F17219CA
      99AAC47597D938F3710315092702E9DAF54C2CC0E8CE337194967F97A1D750CE
      394359E69CA1EB21F3552FB5B8A70C5576ACEBAF1C3DA849E7A62D923EFBE730
      4FA17960A7B21232B7913D0FB35928E7F938B69A95914B792E4A9DB91C323F9B
      C562B9BBA208F9187EFB6CD84FB9288A27568F90F62EED27A51615C5A3A8A19B
      66B7927E98D1542A157325C2DCB5923DB778EC9317767D392C202AC0585DAF94
      E8E8D1B314E063A434C85DC07459BA9DCECF5B71806B28CBBCD20CBD13578FE4
      44DF2E7FAF1A769D657E60714F69E5738DA45F66B7BCBF4A540927AF56B5FCFA
      EFFDB4EFF5DDEF7546C3D542FA7C72C33B56A24AE8DCD1D9AB51BC7797D52FB7
      3ABCFAA5E6655AC53B86BAC797DC9E344C0836764238B9C985FEC0950E1419D0
      FE9D126811EA7E318D5142B9B6A9F8D53DE9A5689665504CA59851B1C77BB517
      D3815EA6B12326C4C00B59C1EC6716947E2BC803D0C35C8815A4677B45FE6537
      3970E1432C7100B142A70A9F06B8D6029A014D81188019572CD2625AD0CBA600
      A12A506EB8A9806A000FD7EB438F0028B51F8E7CB1E10E2864004EC57EF035A9
      C45A5AF017AB96272F5DF1C92373E9936726ABE63C575FD9AC73A0145ADDC369
      0C2487C0459953A081A858178AC397E8453445DC4C59FDFBEFBF1FB869D3A667
      B166F91EE6B1578487872F0C88F07BCE1C651CA40D5536577A0AA139CA4C9556
      A3D387EBA2C31A51CBCE8D2FB7EFA9CDF48807C1408019422BAF44DC7235A1FB
      D56ECB719142537C16E19B2E4C83F30838A7EFA0D305C76967F6EF74B060B71C
      D2ACB0A0875393DBEC349AC30D3D1AA89B4FAB7DA959DFE053B156D943E94751
      09E49B2959C6F2E58438B08C836C6E191E7C53B7E04D76094DA9E30CE94503E9
      15E84271F03FCF954B57E8020EC385E8DB85746ED1D7386C0E26C947E24EC280
      D23CD8CC375366D886D853F0E12B13C65CB57CF562802188120C3528521B4B2A
      9C0DD7887C56594D2A6C9F51838956D051B8104BC18A70DC911DE581EFE52EB8
      9972216EA67C06F71246A3748ACC806FA66C8EB9673FCC1F97BB99527062225C
      5452A62B9D72DD39B8710027A9717EDFA034522845519C5493942E1516A9045E
      221330E5ACC0CD9461D0DB61C6DE0B37531EE49B296F26FC1EDFB5B29B297D95
      01D4D0A339052883911215A9DD384DE70EA5669E6DC9DBE02313C74A0633E059
      79BEAA51BE997265DB6F162205FE22164737C2C0131B741E8BA2EC19B74ACAD7
      5FF2128B9A34E48F7BACAD4A7F0A548492AF18485E9295E8266E7AC8C2850158
      EFC1358B84D8F247BA7C3B25EE7F2C2EB6928869FABF5FBA3CA317D607DC98D2
      E7A575395658AC20CE742C56908E3C285219879BEB75E4A70AA404734D0CC804
      E285A11F7FFC91F6ECD953128E2388084B491FD47E1D7A36F7C912D603D66185
      C317A5A073400537538607879331C340972F5CA0822B763A70FA30067C2EF922
      495E9D2A222A5FDA00A2B2C23D8F5761C867068426DBF1DA148B0E2B4D569480
      06CC84C5853A527233E5CF9B36E3E2770D299DD8F426E25A6A0C064080B09C22
      334258AC029B09533EF2CD94FF4C39F5164AD2C24206F0899B290BB051E05DA4
      64066EA68CC202EABFBA99122459B9F85106EDDAB50BC0DCDCC79855598BA663
      1D96E3D7E166CA75B899721DEE1459879B29D7E166CA753367CE5C3769D2A475
      B89972DDF0E1C3D7611E696DAF5EBDD6A23E7C8C959269205A1BA858E192AA78
      AC947FB16BD7AEB5B838721D6EA65C879B29D7E1664A99096EA65C873B1ED7A1
      F6AE1B3264C8DA5EBD7AADC4A2D27C148851A0D81A08064AA4C37920C1A18CC2
      CD94C9B899722533C0CD94EB3077B76EC68C19EB7033E53A4CA7ADC5FAE7F758
      BC588CF6EB4554D48711B806600244E0369A450D93FCE2D643C42A53374C3CAD
      61313171C49A097F83BD16F3B1A630025E5B125110C0D399D04AA9129A6C2846
      A9F74546056EA67C044B5D8B7079E1FB98E67F1EB1ED8577D5815BB185A58C2A
      A6075D40112D271E14AFC29A080F72C05142047413FC1E844E15BC1764F762FF
      B2A5F0512A23E050D40BC154A8EED75E8A5121E7427277F56CFCF9B1241FB5F8
      A8AF56D1DAA8168D82249C744AF4B55312D67CD0252CE376228ADB1D2AB3575B
      72D414D7E7A991757D342F350FD2B7ABEBAB0F8CF3D25A42CDEA506FADA2A942
      A09A8D063C7DF9F7CFE75F284D4351DA529939E8FD7DBEA17AF1EDFE31E6891D
      23CD81119E5AC1DB43E5F2D2ABDC7E06B51864D218028DAA1A289F0FD57B647C
      5AF3C7261DD9F2D95B72DE96CD830A38C4BFFD87D6A275CF1C5ECD6B501D7F93
      03753FB7C0E17669D0CAB9211F1BC26894A2C26A50B98C1A45905621CC3F9556
      9005E7EF01AA320FACAFFFD2637CBD902F7AC6FB2BED4E77BECD293914D889A4
      14053117F70A61D3882428483469952A4F9D529D99EFD21EB894B3FB7A4E7EAF
      49AD232EDE31054153D7A8E37CF48F3609B6E8B0AF370BB1772895825BAD1014
      0E97E4C62734F680A06BC0382133DF69D7E020B341A370F89B344969E9795D91
      820FEE9807D98DFB04B68FF59DDA32CCC780FD180588B51B5B2A4889656BC29E
      68F44CB8C1051FFE9083E4262C620B82562588B83D487333CF9E3764E2B41F90
      2FE05399D288DE5E5A9545A9101C2ADCD6A3529080D80BD87D22A94551500924
      405C12EF7B811F41056A9CB242BF62E8BEAD47FCEE98026AD2C7AF69A8CF6375
      03CD0AFC17880312007150458C4591900EF465282B22F244AB1495B8FF085708
      406412A92FDFCC4FCBBD99B5FECE0C6A7753C604981F490EF5F6847CED60C29B
      894115BBED21234E38122280A5E8800C6D4EB74BAB5428721D6ECDD96B397FBB
      33B356DD91418B5EC30B2EB9DC0D9283BD927C0D1AE401B939E64800149820F6
      4E8CD8F82F549C6EC98D84881A95427B3EB340BC7839FDC715F3267E0FA9713C
      2AC66F533B398E5FCF59FED33F3C0322E990C90220017CD217291104480ABA9C
      C1FCA72FAA6CBB4B73E65ACE55776EEECF470E6CCBBD633165B6F959996797EE
      3A7623D4A28DEC5D2D9037E714A0B822EE50F2E701FE800442F250899A7CA7A4
      DF7B31CB967E2DFD7BBDD3FE3B87BFA38868D482487776DAC2ECCC9B75F6A4E1
      EE2B954E1D62D6A9354A14279451441DF559E0B1A3FE4A8E43BFED6C4641EAA5
      1B29FA82FCD7A70E6D768119C8B26443393CFE462465DF58846997B6A4379360
      F4921223A22ED40D0F70C6FB998282F03F1E1A94D13C64C2D52C5BC18D8CBCF3
      AAEC9CB566B7E393A9439A1C2FA65731833E5323293F7B11D972DA928719ED80
      8F543D32F664B7B0A0370A5CC2C1CB92D8081BC91254225A088C208D6ED7298B
      E4DC89EB45F63F3BA409AFAB15D3AF40EFF77C04B51BB289927B48D476B024F6
      7EC65D63FAD2E3D33EDDF6F8EBCBFE2CF9384FF962AB76E967BF1B172DFB5D3F
      6FE91F8A0A28C94E6553D07D1CC4727311655E6B4B3ADC4F61B64AD5136B9FEA
      1C5FED352F85E28BC98393EF7A124AA68EC7AD5234F0C508BA761EC4AFB725B5
      8E44BD49AA1E5FE36497F86AAF5B14CA2F270F6E7CCFC441BF48F59E12435DC6
      FE4CC93D256ADA5B121F1AEAAE39E9BD13D33EF97D589336BDB445BEEE4B13E9
      B15989F8727897ECB96DB0B99104B30F55AF5EEF54E76A355FB328555FFDB1F9
      BB7F1173DEDA6FF2E9828FB3C65C1415165FA956629D635DAAD598F3E7CA0FBE
      9CF258E3FCFB8A76A9400ACF76839C68C46AAA7406DF9A11317F778C8A46CC95
      2B3E9EF7F4BF8A79310FB9140D7A7F731794E9C1A11AF5160F51F874CAE0E4BC
      620FFF562F3BB2BB7DA075BFD4CB0CBC4A594AE815332A7E77AFF612429CC9A5
      2CF298B39818BBC3ECF7DF7C114B42168D6C20FA6FBEA8481025DF684A6CF774
      B323BE8F69D8B0615DD85C1E026EF28F2DE39C2BDB3CC8401E7D0DE4F74644EF
      9AB20B3FB01D54AEC06C56E06BB2D9D287C3D3315741D8A5198BCDDD291D3B76
      3CD1B265CB13351A269E906A169C3816BFE784A2B6E384AA9EFB84BB66DE89BC
      EA374E508D82132D6BB739D1B05AA31335126B9CC0BEE1E39819F80BF31709D8
      37FFC5F179FD273003115BD26DF8AB0D5C80282744DEA9BC6CD9B2D823478E18
      AE9FBB61B8B1353B365A134FE27643ACFD8ACBE04E2383718F6F6C942281FCA4
      20DABFFB40ECDEBD7B63376DDA948CF93815136DD1A2C53C6CF51D03B3BACC7C
      111CE4BFE368DBB6ED656CCE6889ED0C2DEBD5AC7F99E78B7CE22D9715A77481
      8A144B4BDF689FCBC5F345D89A128B6B794FE01F50BC31FDC024781646AC70BE
      88DF622842984362A30C25FECB88E78B2C0A6FA2E3EA58EF2E1E5B02BC03738A
      E78BD813CF17B18EE907D6F8FF428AF340E27F32F9FBA5976E60BE68C010C20F
      473168FFFEFD8143870EDDC21352D82E1DD8C8AFD109D7099C2EECE6B3C5C7CF
      2727415793BE7CE7AB2E1005FFFFC40DECB2ED82D8DFE0C881042B79BEE800AE
      82146193E78B3019BB0166C2540E61DEE104B67DE6E0A33B07332F2778BEE8D1
      DE8F9E08B006E6B8AE101DF8F930610A2105194A818181DB81144C856EC70657
      2621A378BEA830296835CD982FC24CCBBFEEC1983A76D6AEFDEEA16FBBA185D0
      700AD88DFFC9A400FF2F64C13CC4DB3C6D3366CC9814CCA4A4601A2105132029
      D8A69B823D2D29F8D3A314EC4E4E89888848C10C630A8A640AB665710A52B0EF
      280563C914944C1EB8325D0C63592B05A4E2BFF9A242B1235F6F09A68CA5C4F9
      BFF9225914B706BF6C4527CF5A09EED75E4AE48515AD84622943294FA83015FB
      BB0B3F6553508A7E192313E2D4B0CE2F4A9BD97E071416A9D21E164971A5AD6C
      C6D8C8E0C76B6766E1D63A9A595E28E2D7B75041D8B20C0A3D1C9343702C0110
      E7541AE0567E1DCD8CCF64F82925C26398382C13C15B0C6E118F07B1D28ABB3A
      EEA9AAC1B121501F88002A5A47E3B0E598B0DF12DC3E2EFA74C52793E77D3B67
      619755CDBEABFD55E8D791CB8DEFF97D2E0C84C8BC000D50F13A5A1145114992
      8A81C9F007B38EC685A108B744048EE844D06F3FA07534D0635586012FA9A0B3
      C017959B1ED83ADABAC09437985366BFAC1426FE40D6D136F488619A5CBAE471
      D1DFCD8FAD63E27C648C974A70A2455E5A51D85414A98E25795C847D5176871D
      3B5D5C64517B52F1B84881BFD7E5CE1EE104C857853EBC390603F3FAFCDC772C
      98941D17616E491E1761C1145FB68587DF4AAFA3ADBEBCB9CBEA4BBF7409FC9F
      5A47438C64F53FB68E3635647CCAACF01752EE7D1D2D70C6779A6FE78C7E90EB
      6807C6EC9F824C7EB1B0A221E1D3BC9FFB70F5EAD5BB70A9ADC4832F2C17CAEB
      939CE13C94FC79E366A2435847BB848912519EA9432892D7D110461E3463742D
      E7DD17CD97F3AC2F7F23147043267BE4C7835A47635AC528C3001BE23371C2F7
      751C0F9B89C1942F966D051EABF21A2717630CA8E4187285841FB9C4F17091DD
      A14BBC0A883FA4BA564CBC52FDC1AFA3312B6EAE0B1B28B93DC7974FF23DAFA3
      4DDE5AB7A8E1946930D9B2286652E87AEFE3A252112C2451D19399B07BA167B9
      29C700B8E275B4527E3808625F2EE682FCA2A207072EED3E4AA80502076527EE
      26CBBFAF905699E65A0E5CD18309A216A0E20832D84FA11B9BFE1D7047C2BFBA
      C3E86E526042141780514F4007F33DA9BB61701214B903594A3872002675804A
      677AE1A78CBA1B069711E2BEEF30AA92016E72C80583FBBEC3A84A0620CE6A07
      1E3680951D8F34802FC2A8F00E237E578C0A1940C6D140E90CFD0B01AE03ACF2
      F1F8DF7AAF23EE70E1320F09D03F7870F1EC08FD5FDDEB58D2E180787310FB0D
      3A962528136B96AFC0FE1C507CAF6307982F01BB8168E076E50B8773C005C00A
      C89115612010D540FF0D1825CC989175A73B8CE0271ED002659482E4A563031C
      8702BD806580ECC80C46C1F20C88C7402FA750A2DAC07125A0072E005C54EFE9
      5EC72710682EC0CC6A43DF076602F46275DFF73A2A8B28D484BE0B60F5321E6F
      025C9154D02380DAC8933FA0B702344020D646B742AFF20E23390FE091958B1F
      4023E067882511FA53403CB085883E03160105C05DDF6124C233ABD378304168
      B4038FB6800DB8083C907B1D3F06A1F1C04AE065604F6AE6CB47A0AF00F8767D
      CE5418498F4728B01CE0305BE82EEF75FC101E9BA0B87640E6EE85B913F00190
      0F64C2DD049D55161E5CDEF90EA368B4B487607F02B8F3BD8E209A0E4F8F023F
      805813D87F0074B0333133CC5930DFD71D46C5794020C2C91E0D42DBC0642110
      033333CE85594E815A7D34076E9F02B9403314042574BE286927F431C0DF00D3
      D44197155B64033FC06411F438C01F3801380027208BE9F293D5ED302F01E600
      71800F50ACFE8481C575127AC50CF0825372028C1E8659058400D14089982077
      1BECEF00FFEA0E234E99002295AAB08F2ABED7B1D20055BCE0D478604ED4C480
      5F0F80DDA0DD59714CEFE48353E1A351AB5B5A7D7C9E8E8C8C7C9D810D6493B0
      A0D10601ADC01D69DCE9A588EFDF087CD24EECD6BDFBDBB89563E2E28F3E1AB4
      78F1E241AFCD9DFB748FEEDDE7E3DD64F889BA13934A1920EAFEF8567BF2C9B1
      6387CC9D332776C0C081E6264D9BEA31C5ACEFD7BFBF090CA3C73DF5D4A34181
      81E3C024084C1004CFDB54650CB47A0F8FF68865CFC183075BC3232214986210
      301B2F83CD61E1E18AC7F08EF7E261B76D07D0D500E554850C3823F15DD61E81
      AD4806F6CCA0B12EECB18A0960E38C28404422FE41D807DF73ED11C65CFCB2B4
      5E110301F30EC6F0B0B088A8E8685C0DA528EDBF8C19FB64282A325215111E1E
      CA61F0B29C982A6400992A30558F82A281B15C18D02952D87282BF8FE333B26A
      78E49894F3CC8E45BE6F69F06CC205185D70FE38109FB2D874034AB75E979878
      F2049FAD2EAC9B9D3F73F6ECB7F8D44D2F79596428C791DDC1C01B227AEDED05
      0B1E79E8A187F4480AFB63F0EB6248769B4DDABC7973DE53E3C67D87A5B24960
      9856FCB258BF3D50B1BB1A1FDB5D7AF6E8316BC6CB2FE3CE9728881B5BF58ADF
      42476CA533A74F3BB15FF8F4CA55AB5EC4C7F81A38736308ED96AA8C01FBC0FE
      54EF9143870C19357EFC78AC19052904512E4D7CFD90840B95DCEFBEF3CEE58F
      972C590C317D8000E5620F37BA1303484A080A0C0878FA99679E198C754E4FA3
      C924FBC79481B4FCF3E599B3E7CCFE122B51AF433417404C02CA29394039D75B
      0E7C0554F5DA49496FCC9F3FBF59A3C68DB5E04A870E1EB42355BBB7EFD83111
      6BA0FBE0DD0554A8AA62C08174F83BB901D834FFCAB4E9D3FD519BE9BDF7DEBB
      897B5C5EC3F2E287F09003FC2BC5152FA67EBD7A3FEFDDB3A7E0D8B16376AC75
      EEC6CA1F8F002BAA47F7C58CEFFA7A79D1871F66AC5AB9323B3424E44388CAEB
      BE2855120837CCE93A8F78FCF17353264FBE8A35CEA1F05761E306F7FB52B89F
      4A55BD75AB567B3A75ECF81726A39A808A0278608AF32128363A7A7D5C4CCCAF
      68D8A24059001EA8B26A359A15C06A50F5071EB8B28022D7D84FA17B030F5C69
      41F11160105032B082F9812A66724FC4ABAA285C7AB4E873BDD02F04E37EB500
      C09FCD70F341AD668677A451E94B542401C55181BE40A7D36A7D2C6673184619
      D10C2CAF87A339F7E67760526987C4B2AB90011347401513C14D7135DAB66B57
      173BF7635F9E312314ED7FE8A4891363DAC30DEF6A6184E1CD7E390C13BC1D15
      32400011B13361D4903068E0C0F009E3C71BBAF7E8A14C6ED24481FF835574ED
      D64D8933081E383511E6EFE79708BF66B44D8ADB89B3BD1C030C3FB852E1FA3A
      7D70DB366D8230AAD3607421A0F7E1934204F9139B23A3A284EEDDBAA9D1A506
      6280108248A9392C132D8D720C504B05C446035907A2D5D4604B837CAF1A6229
      CF5BE39D7C300B994C01818142EB366DD4E8EE02E0AEE5B0A589B359C98FD280
      2CB9E4683024D487868509C80799306257E20D7E6437D46A4A53867867C50F8E
      CC4E8C4F96B49E11D8CB7C0E1E1917A16F2C9702747FF25E58649E02A5485E43
      80C772EAD0A57C63BF65A99D67FE2E0CBCA24BEC20A93C1AC09319A80E740646
      01EDCA650C92CAE34F1D86E8C118E8EA58DEB7339AB5E16AE28B6BAFF4B891E3
      F4C4FE24D266FCB5253FEDDC4752EEF585640CFA09847701C7804D402935728F
      4EAC374A69341A2DD82FD41EBB7386A1531F814E7E2456394682D8C8219F9EFE
      3C7AFAA14351D30E1E1AB3F4EF0F962D5F31A27AF5EA1D380C32BA9C444A512F
      3442BE2C772D6A6CE2C0810307FCF9E79FC3AF5FBF3E12E39E918F7C746A854C
      1C0C3EDF7AFE45DCFC367CF0638F0DC0C749758854CB1F148554AA7822260AF4
      5A96F0F0F0E467264D7AF4E0810323FA2F3ABE9C8933B6FD9D3AE9F0E1C323A6
      3EFBEC639111114D117B4F0E5305D932AF05144B159A045FEC6369DDF099B51F
      853FBBEF5024C4B2E5C8B5C967CF9E1DF1CE82778642346DBD3C3DF9FF32F97B
      4D2843A12A0B8A255FE4A951F6F96AA466E84F7B029FDE71F0BBED67A762756A
      E42F9B370F4705EB8DA62202F541CB7EABA257F1FBE13B87D0E3DB7F1087FCB2
      B5DBB8B7A660DFD7080C5B4660F7CE90F0F0F0C658D632552D9A917B5434724F
      2720A884CBC83DC1B0CF07D6D1885DEB35ED67376DDEAC59AFF52929C37177E0
      F04E9D3AF545210843C6F2774115A22924BE4E263672CFEDFA521ABC39049968
      C270BE193E06877DF0FEFBC3B0B0DD0EB1BFCB8C2D4C412F30F8002866B00CE6
      4E9C22B9D8E2DF9B51E112060E18F0E8E851A306A312D646ECF5F72E7B543410
      2E575970EDAB0AE3D3E026C9C97D3136EA8F221C09D9AB11812AC4031F77A994
      682E7C22C3C3BB454544F484D91F2953DE65D8BBF2C695D482D6B303D019C479
      5C5A2EA57745A9124F2C0A03DEB502DA0226E08133D080683C500DD00202F040
      15C79899307136DF15F1BBF1C8FD83124D8206FDB106154C07986136C14D8FD2
      A404A74A5353290364248F8B54289216B3C9148926B90ECE5B36445F5D0F152F
      11FD6F00FC681C3DBE08A4E13B9AA1788F04E6019380FE402B00A745C0FE7685
      801C6B795C844A55AD59F3E6713874E8875184A555AB56E61AD5AB7BE5690222
      4F470CEFE33404752151591D732501E86BB96EF0C0389C88E086750818CA2924
      FB8EE3A26B7E6D13CE860F1EE4E9175C4BE5CCF2147253778FEE9A243CD1BD2E
      15A388E880727D32AA3FC75E0BD14474EED429BAFF80015A5C9CCA779CF27DB4
      F4C286F47ABF9CB225414454375875B269AD28FFC4A8C040855A671344052EF4
      2ECC8EDDC7AFC83CCAE50102563A2E1AB7F24AE31D67F2E351EBA86FCB44AA5E
      A3469CC96810C965D7BB5D0E25A60064A2A51FE51840FE2244546E5C3469D5E5
      FAFBCFE74771E0DE2D12206E6C9CC7F607341B84A362F8830717EE8C7117469F
      3D15A11C838AC645D3BFBF92B4FD746E1C87E9DD229EB522081867E1003A6205
      8772C4E1862D37FC2C85DBC7454B0F8A893F9FC8AB055254963861B25CE2FB65
      293B3BC7452A7D8EA8543B31612231B9E23C50B0A53410191EFC72E5B11ED2B5
      6AB1F79A2A09190FE2856261BF7C8506A7D485CB9BF3709374766E4181526FCE
      11152ADC465D98906206025706046A021CA38FEAA53203EAFE4998A8B33C6DD2
      6BAAFBFBFA28073D94C44C51D40B03736632718C95A46B69379C9F7CFBCB4687
      253A9794BA4864CE65D062B424FC1454776433E8038056307705BA90DEDA4252
      68F5AE82CCBCDE2DE28C1AB506B32E22C2163270E37C386F665AB9F6A7B33F1F
      BD213A3D028DA4D4FA224378F8525CD14092BE6406D3D8045C050C00ABCCD1DD
      EBA96BC684286CF9B94A4172A9341AEEDF458E3C39F18FAB4BD6EE725FC874AA
      9C2A53061CBF05F7EF4954AC44E03F8143C069E00F963574E21AE82F1B0A1F26
      EC5597946A9D5D729B32B37232D4F84ED378E088CB8573678E6D399611979195
      ED907252BFD61C9AF7ADFDCCD67CA4CA5D1894F2A0A702B2E214746553FDF840
      D64A80BC8019221104C9E9748892D3A63D73E6FCE97D171DB199995912FDB5EA
      7DC5CEF91BEC69A7F331282E268E306555490ACA3A17DAB8C871C9506A0C79AB
      567D71D6145EA72E4A94147971F967C78EAFDB8333FA0598F1AA943853A93405
      FCB2188B576FDB56A030266B14A4ED1FF8CF777B7EFAEA1F5CF87F065B7E0AEE
      147B0E5FAE26B363697CF0FD9E2D92C694EC12540589191B56DD3CB93D033BA6
      D2107B1B88CB95AAB4FFDBCD7714D1FBDFEFDD8292D192DC4EB7F2DCAFF3739D
      DB434E68340AECC7CB84689CC8D8FB6700E2E7109B96C43F5BD66BC28EB732AE
      04065A91F90AC43E0F0C58F65532E09ADC0234060015A97438CE470DBF0EC226
      2CB534825D61B3DBB7A3A9C880999940AB5C310316536B78E1E6C21F3AAB4C3C
      D683F06FD05909787800F5016EBF7641E7E9CC2A19C05F2935728F066D13132B
      E5281BD94D03533C500DD002EC06EDC12911A49809136733AC55ABAA62C1FD33
      7F90A39353A9263F333113DF6E949B8FDBF60581941AF07270CB5009231C1E67
      F957F81699CAC479546DC080D78A418055A5D6D2D8279F228C67E463B72E8454
      487854A216BEB3E0D65D6AA5FD1411071DAD978F8F4F2C4E4E042563629CEF54
      632657AFA10145ECEC6855993E060AF22E5BD6D12312FA0979C2844FB754284B
      C8A3C27191CBE9249C0FC7558B16C048017E160A054270435F882FFE7ADDC740
      56935676F331EAE4389713111A33EEBDCACC176127AC804F261C7A8650106555
      71B44AE52033962972218641251696E0720C90CC0AC7454815A94484C6D53693
      A74CA33163C652604830BDFCFCB3E86F0A3B7F2E00689F0834087F7B803E48A8
      7054C1AB7EA66A0909519846D3E1639BE72EE440BF6FDBDA1517F05087871E22
      1DFE301E9D28B56ED5825AB46841B8DE43D65BB76E4D6DDAB421B7424D7F6EDB
      5A3E93D1043067160917CF32F34538684E0AA59A9E7F7E1AFF77887C6BF12B33
      E7E03F1870A7911BD70D009C0294389A3E7D3A044515A6808B6785F345DBB6EF
      ECDABC6953C2520B190D26CC7A29A87DABE694DCA83EB568964C6D919A36B0D7
      AF9B84C53B2D6DFBE3CFF28B4428662232D4846F8106F83781600CD7159814E1
      6F057AEBADB716E15F05E4D835C2D5992C0ADCE1225F7383C281C1805336737E
      CD9D3B9770C74BF914148988476C5C007CF055AFC25D449C2AC2DE78390F701D
      14611686B89CE32218C254A72CFF66CD9AC9F2C7DF1A20057AC27F21944F010B
      0E31E0195F232A59B5DE0F3F1C85F9512D17D585EFBFBF68DAB4693463C60CAA
      857F3961C2B8308683C8401F211706D6DF78E38D8A53C03ED1537146E3CF1ADC
      F95890D3E1BF408C11E1E122EE28EA8AB3525417B745436C722C5954FC473C9C
      1206DB31D727FF9F4BA52960269029E705AFDDF8554F4CAC8BBBDFBD0E1E3AF4
      31E7C1D4E7A657590F66CF794D4E41A9BAC864CB82331CB3BA7AE441DC237DFB
      267A7A792D2B2E7EDCDE88B85F4AC01F8B71D1E4F955160DE72122271767CEE4
      3B32607608A8C2E7AA35B15AB5463D7AF6FC168B73F27F8280B95C6A9818FBAB
      086AFC494945EE65DC4048C467EBBF982F2A43AEBC859B6EF407DA07335F549E
      BEECF2DF7C912C862A1E5CDA0CF0D30A680BFC375F04214085180CAA59E1E15E
      EFF8F824BDE7E9D9F36D1F9FA1737C7C86BC6834F69CACD5D619AE54E29F5988
      3FFCE0BB6255DC7D97791B171626FEF8C61B5EDF8C1BD7B0439B3623EA75EDFA
      6CDD61C39E6A386EDCB0A64F3D35ACE9F0E1E31B74EB36A5619D3A239EB65A1B
      BDA0567B872A71934E192A8596720CE28282544B5E7925AE61E3C623629A369D
      1ADCB3E78098C71EAB9FF0C823A135BA75B32675ED6A6DD0A74F70D3A143EBB5
      1A3DBA7FC7A143A7766CD366E4FCDAB513633D3DD585646F3DCB30883699544B
      FAF6AD9564368F56D9EDDD307A8AD67A7A1A0D9E9EA4F3F070A06D29C010BE40
      A7D73B2C70F3090E3604D7AD1B15D7BD7BD7165DBB8EF969FAF47A7BDF7E9BC7
      AF251C94C5A650954A313B22222E5AAB7D14D7BAD577E4E498D14FAA44A53217
      B7425F2A70BBAF2AB4DA1C7414126ECF3578B8DD7E98D6F113888C684E2C1AA3
      B1B687D5AAC0C0C61EEFEF7FE0D8D5AB4EA68DF7AC11BD6DB5FAB56EDA744468
      CB96ED9456AB294F140D0A954ACACFC8388E3F4ADBA9898E4E57A9D5F2680A5F
      38A2D26E57E79E3DEB8FFF67AA265CBA146CB2D9242C6AE6B995CADFF71F38F0
      418B6FBEB9C094651105E1FF6CF05740F53CA3A31BE1D355EFC0048764B7E3BA
      205185C352C1593B76844A19192A83D1E86278797B3B3C7C7D7315919167533D
      3DB79EBA7CE5A03D372FD79199A9715CBC58479F9DDD381C13EACC4016D108F4
      28A14141CDD06A7AE27FB8708F932DD5AEC5BD875AADC960B59AED972FD7BBB4
      76AD44DDBAFDED151555325EC7362D973A24247D43EAD5DD41265396974A5517
      E14D1E2E5793F11E1EDB9EB6D92E2B2D4AA5222A20201893A0D16ECCCA38886E
      9CBD79F3BBEB7A7D52B2C1900CA6164F1F1F8B949A5AFF464A0AA97AF4F8DB18
      162633E19E0CDFCAD2E18C8CB4DD6969975B070585A317F2532A959181DEDE61
      96CCCC6BB83C4950983D3C82152E97C5999323397273CFEF3E7E7CFBCFF9F919
      81A1A1AA280F8F060A22B3A7C96429C8CBABEFDAB94BC8D36AFFC29596982ACA
      974EFFF38FFBE2A54B993B6DB67F1A190CA7B067CB4770B98C98DB0847E6EF27
      244BBBA17EFDA1C7BB75FBEDF48001DB8EF4E933FDF1A8288C587C129F183468
      C4316CACBBFEDE7BFB6F2E5870FAE63BEF9CCE5CBA745FEEAE5D1F5D3D7B7642
      E975345F9DCE734BB3664F9DEAD061EBB156ADB66EA8516382A752A9273C74EB
      6BD51A73B875EBAD7F75EEBC7573EBD64F46E874F8F72C83BC8EF6D2F8F1A34F
      2C5AB4F8EADCB9FBAFCE9C793A75F6ECD3694B96ECBBF0FDF78B663EFDF498E2
      753403886DAC5367F091E6CD7F3BD4B8F1B6F50909CF82B607792A14DA35B1B1
      C377D7AFFFFBBE66CDB6FD5ABFFEE4A7341AFC519EA6641D6DC12BAF3C710A4C
      CE4D9BB6FFEC534F9D3E3D7AF4E9C32347ED59DCACD9AC8E9E9EB13C30F05328
      746B121246EFA957EFF7DD4949DBD644454D046D3D594451F3756868CFDF1212
      36FF9194B47D53AD5A6FBF89C5378C16E47534C82AB4658B163D53BEF8E2A993
      EFBCB3F8D8B061FB0F3DFCF0E93FDBB73FF94BC3863F2CF3F51D385114BD6669
      B5DE1B6262666FAB5EFD8FDFE3E2B680E663A0AD6506CA657E7EF57F080B5BB3
      292666C7A66AD5D67C1A1EDE344CA34161508A28C1066CEAAB8B75FCC7F66EDE
      3C7EDF4B2F2DDED2B6EDDE2D0D1B1EDD56AFDE9E757171DF7E6036F75BE4E9D9
      322532F29B9FA3A377FC1816B6E1337FFF96602057037AC3D333E03B3FBFB7D7
      0605FDB9213272DBAFB56BCFF8AE76EDC0184F4FFEF85061441158BC8EB671C5
      8A71F31B355AB03E31F1C7CD8989BB36C6C5ED5C1916B6EEF38080A56B4343B7
      AD0B0EDEBEDADF7FD1226FEF70338A1157360A423E7CE8E9F9C8D73E3E1BBF0D
      08D8F55352D28F27860D1BBEE3A597FCAC26132FFF961917358989E9F94978F8
      F0B5E1E16BD68587EF5C1D12B273156E1C58E5EFBFFB6BABF5E72FBCBD87BD6A
      36EB65E2C50F38842DB358DEF8DCD373DB5701013B7FEDDC79FDC5850B271C99
      3BB7DA330D1AF8F87879D5E8DFAFDFE091C3870FF5F5F6AE3FC1DB3B1AF29FF4
      959FDFAF5F5AADBB417437C2FEB1D46C7E77A6D1181358B4A3AD983E052A14CA
      F99E9EC98B4DA64F161B8D7F22F0AE75C9C95BF6F4EBB7E4CFE6CD9F7CC1DBBB
      4FFFE8E8C9FD50FC06AAD5FDE6EA7463169ACDCB96582C7F2E319B777F6C346E
      FFC8C363F91B0643EB00512CD72FC88C5EB65A751FFAF8B45D68302C59A8D36D
      FBC060D8B5C46ADD8142F03B64FACB5C4FCF9DB32C969DF38CC65FDE31187E7B
      DFC363C7FB3ADD6EF6FB9E4EF7F9BB06439769FC812653ABE4F1A29F9F6E8EC5
      D2688187C79CB7359A1F803FE66B34BBDED468F6CDD6688ECF02E6A9D5FBDE52
      AB77C37DFB3C8D66D3EB5AED5B6F190CCD9F351A79CAA712CAA59CFD21AE2946
      63F00CBDBEFB6B5AEDDCB92AD5AAD92AD52F2FAA54075F005E419B3F43A95CFF
      AC4AB578944A35EA71AD366182C954A6272B45AE72A32F6439D6C3C33A5EA3A9
      355AA5EAF6B04231A98742F15C1F517CAC9D28764810C59A1881F961CEA56299
      574EBAEC1BA45B01225A8C4FCC8037A819002D5A59AE4825BD62D95085B6FFEE
      2FBA75848F25320AD3600C3697C1ED0708CBBCBC4F4B114D7954719F24EE2A58
      B912306BD1B76BDC6EA93B7F8EE252BFF244302155C61152E146134DCFF7CF8F
      7AB8479977B0A0A4E1594A35EFD8FBAB31433B50C3A4086A543B8A1A329222A9
      415214D5AF1555A81799EB42AF03B7A49AD1B467FFC9F82D1B56A680D415A044
      15A680E55594392FBCF3A5347AF04354EBC53364362849AF53931A255EABC2DC
      3EA0C63423EED2240DA6CC3424C8FFE8F07C170F5AB66233CD1C37A01E28EF05
      F86CB2C46738CBE5810411D8EC0E32EA556431ABC9622A84D9A8C63F4FAAC864
      D4E0CF505564F050935EAF248D564936BB535E539309DFF6286450147B7E87B5
      1BB21538B162C531574357619E54754B0741A50657F6A801A44C01BDC086712E
      66BB387C098A6816322871E56C9528CFE6C0ACAE8238B00C34124A0D9830D4D0
      415481E5100596A315F8EE6006381B558ACA2D632103CE8322379ECAC92F0003
      1011554A30424C992813477E6800AD4E493AB869D90DF962733830F3280FBC8B
      A8402BA259C800F612854CC803038512C4C14005E463EEF0BA4B49A7F315B42B
      83E8D7AB12FD78DE416B4EE6D3EA6379E4401E80430989D286420645F2E2176E
      DC239A6F7361155D41B92E814EE70874215FA0EBB8FA3B53A1212CD911FEC315
      D389F8EB6344028BD4C4FE391C872F4111CDC2628A2078819C227AE6B58FA55A
      F5EAD09727D5649330B10A311032155F3B24203584CB4B253B8EE23870FF38F2
      CA6173D3F06A363AB0673FCD7B76F8AD620A82ACB83DE732EBE032CB0E12CA76
      2E027D35349C2437A692093F880D4F2A1403E224F0888475AC9FE2A369C5CFC7
      301B0FBBECA9E8C1798054288BAC255A7E4ED66FC70EEC6BF1C2DE3DA0878C43
      BD909B0DD6653220C40A4D04E282F96C91444C5CDBF3737F2B2152CA20943217
      1BA360B000B21A30767AFFD0F89AFD4F5CBC11D8A34D1D5AB3791FC5067B5F3E
      7FECD0575F2E7CF52BD9D3AD472A8C17811255118392976C183FFB23A9DB43CD
      C8C368906B2BBE2C29373B87D66EDC4A0BA68DAC327CA187227931C1DBF1D8C4
      99CB8C16EFFEC80674C79013E402E938B2336E7CF5D95B2F0CBEDD7F897D1142
      549407251E8A0C20321DC605406164608092806B4095EA7F41A75F5C3F645940
      A6F764472025F0E01547A4886A615B5464F99FD0AA4C012EDF518031468EA8C6
      682C6066259728FC8B86FCC5CF0E95E1D6FF801035ADCC13DC79C6B116F46600
      FB8B817EC75B7FF05E56C5220A866D1B6E7380564EA14192E7E5AAE14D438097
      7C23A057747F113B9741318334B8F605026FBFBFE8BEFF0704C45815FE0F88FF
      DADEB3FC0F347EC2EFEC27565FBFAFC31FF4FF80602DA6DFC8C6C1B1EFA7863F
      74C51863C5F2C9BFFF1F108E3E50F23F205AAD463ADE23F7A7BE3BACCD7EBEA6
      F5D2612ACE22783F98FF01C174013A1789FCB52EFBE9AE377EC811F4EA1DD971
      BE46657DDD7DFF0F083A3B248084952B57CEC4EEE35A38412760F64A5E36BC70
      F98AB0EBBA681C7122BE397BEA13F0CA161BED2B5008D94EBE475B2BEAC8DF19
      420DA596A474FC9FF6AE3CBCA92A8B9F973469932E49BA17BAA47B81EE6945A0
      6C55A0B20E42591546C57101059C515C1881D1D1CF194650AC0E8838681DA1C8
      808EC38022E88C882262C7E2870222459145A12D6D93364993F99D9BBC9034D0
      06903FE6FB26DF3DEF9CBB9C73EEFE6EEEBB8B8A8378000361677D7DBD03B772
      BF03D9ABC5B98E980F95BCEF01E9191FE72CD1B79DFBA870EF9617B36ADF3748
      43439BDA27C4CAE717E96CB9EA32FDF55257F780B835767D0F883E3CD451106A
      6BA98CB19C2AD31D3A7553FC929D15912F7C7CDC32307AC28189A3F69E518563
      E99592BF08E21B9BCF3D20F854590125AE7B40700AE51A7CA2EAF21E901C755A
      47A2EA6C6B59C40F3FCD48683FB1DCB07DC7430D83073FB3A7316E5BDD71EDF1
      E3C709D92380056375F301E0CBBB07A4EEC8174ECC389A17D8B7BF7D5211A55D
      9BF950F9C86FAA76459FDCD300A1C2C8E73ACA2DD98E0BC8D75ECEF945112DDF
      996FADFBF5D62DE9B307D86373B498C5222CAEC1BCAE55034D38C20A4F365772
      0F88AABDDD3EE1CB253B0F8718F589E62FDBF195B0836502640CD26DAEE45C47
      7496CEC2F1776E40013F0C7145800B9BCB3DBF8815D0A4E5F7412AF7CE5DBF6B
      2EEBFCA2DBD767D30BF6C9501090B99CF38B42442A563A8303D28040977E0F08
      0BE7519D1B240809C41889085343F40570F78685BB43755D10EE404047E9327F
      9218FB07C8FC8F6586B956ABBD71FC82E6B501B290DC92BB0DBF6ABE9437FCA6
      654BCB27FEF699AA391257C36E793840C00AFA98AE59A88ACA0FD2250DD665F6
      CA9ACFCC8140400A56CE5314E6F79F3A922CF544F633543470CACD55B3034B45
      4085DCBBB0E481F07863189931BA9154146334C56464A7CF430A7E03E8D2749B
      823FCF5316E65F336234594E23F616225B0B6EB168A6A26BC7DDB4E26EA94797
      D2E1D96D0A7AF5EA3D5F178B3556E65308CEEF5F0C556D568A4DCE8ECB484BE6
      543C008F8B1A4F0A101BCDAA7952CA2B0F69076E7C2C66E6CEE732FFF459F5B5
      FF2CED5F3E895A4F20E66600626F6DC521768C9BA9FFA0F1777CFA52C95BDB97
      A53DB5619161DADAFBD50356DE2B254216A6555D3AA5CD8F45DDD527B7605658
      982E2E4C17198143123441213C67839862E507B535226BF0CF1E579861FE005C
      9C68F839016A3D911A0D1CFFFE09FFFEAD96667B7B7383B9A5E9645373C38993
      FF39B077799056ADEE9B9192528CE913C4B019C210BB66070401F04791240844
      C112B5C10D42C58A2160BE2485953B24B80330EDA0764858978739ABF8948838
      5550D257076B8BA56577527E9F9E86E503FBF61B1A12A91305080E1830E11447
      E2E904A79DC8C1E0560A61C429602532E60923785390815A4EFF483BBFD8FDE6
      E126F323D2B3734887798DDE7D1274BF1B54D2F77A0D2BB19E8422E4350B75E2
      ADC7296160210243BFC08804A780952842905D3DA8F96C8BF3BDBA8F371D3967
      7942ADA4C3A22F7AEE1E4987299FDEBDE2C2170D2DC81C1182793AB236408AA7
      0EB8FEDB08A17016187F95596107302EC52129042BA6148E770F7DB3F1DB736D
      42F89C15CE16A1002CE456D22B2746FBE875F9A915582729896C614F06C8C100
      D6A58805B39DB100A256DC78BCEDD0F10D479BDB9EE298B37066F328600B2BC1
      7C6076417CF893C3F27A94BBA4C18763CC0205E00183890B940B081887CD416F
      1F3CB5F96093E551CC137E2B0B072786B2CCCC941B9EBE5BD264466A9E195390
      783B5648C215F9CCFFFF2088914805C79AED8CB960914D6F7C7DE20FDF99AD0B
      E757396D60F218D4410F2D88FB9E775A763FAE4F2630112E7C423485BB4B3848
      8E90B770B73D2A58953CF18F980243106FE3A760D9DD52E468637406D9507B58
      0987760B615228E298B31BC79E316660F44A65CAD3B325F57D554EAB08E77EF8
      29502B2841AF52469315DC3CD9CA02B0D743FC9FE0160B674C7321614806D71E
      20C27B0B0A7A28880C90CB9D1690CBF829C07D4FC63049114AA8B7A440E716A4
      A10E8B9D8E353436D53635FD0BA79EAA0B22F4037AEAF4614AC486AC68F9762B
      1924452C8E824883D8AE158429159968329834451FD31142C74EFCD45C7BE6C7
      5D47AD6D1B30CBB91F0294F59653C5690DE72AF3F531A589FA482D29CD14460D
      21D83D9005FFDD008FF14B41944259C409387DA6DDBCEFC7FA4F0FB79937D824
      FA0833C83F203DA2F5A1A738F295CDF2F1D1D3C7066737FE5859A48B298E0C0A
      51879394ED91EC267CDAC1B3F7486A834279479C2A78D4118B79BB59A20F54B8
      6F1015F50CEAB64FE1A1CD6890FD51362725853B69985115DCFFFB0E5B753339
      D6DFBBE27C55F551002615CA3012B5332C4822B382A80182B91B75C7C71F8127
      143C3AF068C0D3029E9FC0832AE80A2B3552A38BBA4A4F28BC4A92DD62AFBA02
      BF5AE4564CAB371E4119CA36179E35210DE5EDA23BFB7BFBB942B89E7E0A64C6
      4983FD6A1C947EED51DAD97FF546975F67453E59C4C2999181EF7E72C5C1F779
      F375BD8583B73FD3CCC3C0324400F743F9203D2848F6E000FC098BAFC6E22E08
      F7E4E0AD8C097F644CCD075FD384B22CF4810EEA9D1C45EB3EF88A8AD263B154
      1D9E90803D69C47C39F07BB5EFE1C5C535862570C6B7133C65E1207D8C8D3B3B
      B8AC7FDF251CA4C7B0B2EA1D0768F2906CAC28F7C908E2887296717679CA4085
      6F00CCCD1D2663A54482D162F5B4196AC6EB8EFD18C23174626C470B53A931DA
      416B63BB2C87690669E9C67DCEB1FD3298260B5E7DF88E29684E3213DB3E3D42
      E307643249B8FF0C57BBBACA19FA85DBB6BD476844699AC71DDF3449E35E7DFF
      D6EEC3E8C845B0ABF70862D16DEE7C69C75B4C8E995281D11B7B02F82B131052
      783EBB34183AB01B0357083B76D7091A412459081C44165D576424FE0945AE1C
      A0607732777C7E948614A6B037D990DF82C043859E0D88DEAFADA772F0B7237B
      D98EB727E1BE3A41BE075EDFE217CE3FEF43F4A65C4DFBE7260BC9B8294F60AE
      D3FCF10D171AD2AEFDC7A85F6E9270F77EECDEFF1DF5EB938857B4029FD79CC2
      8BDB0E131F81C7A79A2AC4057CA86E9CA108C1350677026218E4800DEF78771E
      0B8BD783B3BBDD8E2F87EE8C57B08397BFC822D6F461DD775ECEBE647FC4F293
      03C77D1CD9CEEE3E8E6E0BCB62996C150A986007F6C0BB174D1E0365B434ACF1
      13C3204E3C67050BE5B08C0715A410FB33704A653E96C1B2381C8328032664E0
      F2609A0532F686DD5F7EEFB176F697FDBC8573E0207E78831C405674213F76EB
      EC2FF3B19F37F829903D2FC610A8BF1CCE5306B2C3CF8DFFF715FCDC397265F2
      D2F28A17315C8A944B2A83F4BCE2C50C574DC1A50896C3069482A4B41CF5B439
      F73F9E5F584C0C4CB39B2CA42B1C9082A9F7CC7B243923FB614C44FC3548AD7A
      8D6976EB4AB0EC77D1962C0760AC90826602BFF1D4BC59D381E9C1E5ABD56EB7
      456CEF0A024A815B80EBC5000BA6429D8C00DD9A8014448487EE84A4490B96AF
      7E6DC1F217ABF129A5521FAEFD37DCBA35DD2AC82D280ACF31260DED191BCD97
      D28EC02B743868CA32260FCB2D2CD277A7A15B059367DC5289B5142949F131FB
      FEBE6645C293736F8B4D8A8FFE106EF1536EBE75DA1529C82B280ACE2B32DDCB
      42EA6AF72DABABADB5315DBBAF7629E3DCA2E2D97D0A8A344C5F0CBA4CC1E45B
      6E1B0EC602C0A19AB56B3697558C5DC4B0B17ACD36B8F14C7CEF69BF9C351AF4
      458DD2DBE764F26D35774515CF7E3B514A31C4250C993865DA7C6C538A3E74F8
      C8371F7DF271CC0D936E5A8C3630A4F6B34FEDA999D90951919129110643C1E7
      75FBA30CB10943F6848D5CB430BC78DCD2A6CFD7CB727D52000BB70BA1B4B46F
      BF5E9A90901C54C9D32FAF7A7E8BCC20E3352BAB7660CBDD0F58DD9F55DAF7DA
      3EEC0E7EE66560AB804EA318E1261E9B767CF8268E90186B979C4F4C1C5AF608
      3B72F630FE70EB5B4B183FFEF48A87730B8B7F0FFA9D5F940F1801EC67A0D4CF
      8D26CFB83517C299A16DD35F5EAA9243B06006D9BEEE959757836E01944F9979
      6B09B09FB9A0020CD2785A2618A15F7D6DEDCB3F005FD0ECAFDD771A03A797E0
      89AC959807640066C2F419259B77ECEA9834F396ACEE824F9E798B11616D13A6
      CDE8D75D588FBFE9BA51B3A7CF7DF04D8F4337C48CF90FAF335D3FEAA16E829D
      F71E366D56355E8DA5E75DBAA6D2738B0BC1B3A9EB50FFF7BD480EF84C485D24
      CC1539A3FEFAF21F3C78300E973AE6F9BA06661B3D7A745D5656D629EFD07E0A
      B03D781C0ECD4EC3B60C8377403BFEEADAF037D7F5471D4B7131978A8D28D82E
      ACC04201052EDF39DB00DE749C5ABCD29B4FB978F162F2FEBDFEFAEB265CA659
      595E5E3E262323C38493A04DA9A9A9A61E3D924C919109A6E8E82453CF9EE9A6
      F4F45EA69C9C3C537E7E89A9B0B0D484A3CF42F7ECD9F5F9942953F67ACB0BF2
      B678D3EDEDED64369B11B346B12DDB62B1D2D9060B3ED53848A50EC6E47B0761
      6A1D2B435562ADA3D39BD98BBE605FE4E5DF897412E64C856027F6EBC386AE88
      071B2EAA536061BD4405CC230B038612FEC6E0C4AC1263F6ED0C97A64002BB84
      CC00B050A8408A1C22156C87AF9FF12B039C02BA1DF763124E265ED98E72C01B
      4D9401D65DE01B4D8BA0797106F63F11B6DB13EF29C12E6CAAAEAE7E79E1C285
      EF76D6E097026E03386BFCFA929212E20DE57C74016F2A1F3868080D282BA7BE
      D70EA192BE83A8B87400159AFA515E6129F5CA2BA68A516386E2EED2FCCE0AFC
      52C00D0D9BFFD3B0951E9B1BDB7D6B51532B59B0AA1C03605C1EABA530FC590F
      5660F25DADA2F4CC4CE3FBEFBD1BD759815F0A3A07F0B523D7DDF9CF559450C8
      3821C15D06281BDFC0C216B80251C0CC8342750B66E12475B814603935FB7686
      C015084E3905C0A89A5C735809E38B5553BFDE74C18205E370F4EB742C8DAB6C
      6D6D250607A6375BB8559F6BA1367C4B5662397A689816A70968F165348242B5
      5AACBBFE6CD3A9E327AAB18CE86F222EEE875F21738F886ABA1D3BE92ABBAAA6
      D8D9482D1A0DB58685619B8096DED9B27527AA290F27DDA25DC8AFB39B3B776E
      25DAC2AFCACACA7AA4A7A793D168248153332831258D12525228293D9592B3D2
      28393395520049E929644C35C6573DF35CE3D4A9537D3A3BBF2CC2DDC9B3E6CC
      997327FA75132F0E6B6C7477766DED74F65C3335DBCDA4C484A116A79A848562
      4F61848EC2B4A174EC9BFA7D2F3DB76AD5D6AD5B7DBA6BBF42C6C94A0A2C2873
      A5CFFB29A1185145F144F7E02A6407ECDCE9395093ECF8D485755DDE1C82BE90
      022514409CF0F77FB050AE41C098C94315E5FA8F534FEC360991F319F832B350
      80557D4AACEAD300740D0D0D1A1CF7CA076288C2D3EBF584C595E27C5F83DE80
      3D2106D285EBB04704851BA2256C88168733586D56057843580640C332590166
      159D843798069644401E043E82832D56A23F5A77E38D3732AC075E3F66ECD89A
      8A1B46D60C1B3162C3B08A1135C34755D4DC306664CDE8F163D68F9B386EFD80
      C165AB981732F201892C933B4A514DD1A9E1F5441678E0AF97B40D07BB64B027
      03DC8441DF24114703364972E5A08CE144293D439D3DE37A1C064F13EC16B74C
      F428EE7952385E15F35FA97E6756681F7A5D0000000049454E4400000000}
  end
  object TBXPopupPanels: TTBXPopupMenu
    LinkSubitems = NPanels
    Left = 208
    Top = 136
  end
  object MenusImageList: TTBXImageList
    Height = 18
    Width = 18
    Left = 48
    Top = 144
    PngDIB = {
      4C00000089504E470D0A1A0A0000000D49484452000000120000055808060000
      00AA3588FA0000B56A494441547801ECBD757C1457FB3E7CCFCCBAEFC636EE1E
      088104777768A1B8BB94529C9602C1A5A5A548B1BA60C5A1688B6B7177082440
      DC75B3BBF35E67216952E479BEDFDFEF9FF7FDBCF99C6BCE9923D7DCC7EE3D36
      138EDEF0577FC20E05BCA38108C00D108054E02170E9E492CED9B02B19BED21D
      6EEA7DBCC55514C5DE3C475F9B8DCAEFAB07392F88F4D1CF356AE46B059ED620
      CA283CC81B76255389A8FEF8ED26E2F9CFB44AC9E296D53D6AF56F1E42FD1AFB
      51A75A5ED4BAA61FB58DF30E321B14D3C030076441B0CB4D391148241C47E302
      DDF54306B78E30756F1840A13E4EA4D468C9643252355F1D35AFE242E33A85AB
      A27C743D20F14C90B930A6D3A74F4358E662E0B858BD5A3E6050CB5065EB1837
      B25B4B89974849A95293422E27A35A2057A39AC27D4DD4ADAE87DCCD20FB00C9
      DA002493C9E40E89C0CCC1A3B3AFABDA35CA5B4B89E985444A1D88E464B78B24
      2290E778F817D0E507A9E4A693528859298554DD9096CFCECE16596D904FDD1E
      3AC4ED5B3DC0185D4A025978152915ACE2442A2C2925B594233F370DB91935A4
      554A29392583D2B272B984744B91D5CEFD1EED5C50C22421B0BA83686DB706FE
      EDBDDDF42457A88813242497F06429B552A85941BE2E2A426D524E6E2E5DBEF9
      908E5C7E42A79FD26D8B5D683FA44AF6D332221323AA11ECD2A5511533D50C75
      A3C48C22BA955448A5361B99541C99353C7939AB48CE95D0A3C74FE997238FE8
      76A6E2BAC84B5AA15DBD908080991C5C929FA4E4D96C51EE82AB1E85AB91112F
      DAE9D88D647AF4AC84B2F38AA856A0966AF948E94E42322566DA4491B84CA44B
      07C8211173207B2D2402F773CD1017739F46BE14E8AEA5BB8999F4EBB1A79459
      60A5ECFC128A749750D3409E0E5F49A2934F652536897222A459C1D2572452C2
      63954A26F46D53CDC4B7AA62A45DE75FD0B98412B2586D9457504281463BD5F3
      B5D31FB74AC5348BFA04717C3F103D41BA7F246237902A04F65267B5D028DA5D
      545D7D5244BC20A382FC7CCAC9CB23A58C279D515F9A69919F15899F8EB82740
      64875D99887980CC07B5334846F6EEED225DC26A04B8D399BFAFD3E1DBF7A848
      EFFF9C93C87723DED720B80DBBDC381A64D9DDC89123B5550A0F540FB39C7DD0
      C053911D1EE06E95A84DA431798AB52382EDA1B2F407FAE4C397E457964B91A6
      52DA4A375E5E5E9E515151AB5B358C5D1AE52DA9EEE5E42AA86572AA13134A0D
      6342B9A6D1AEB15D9BC7CCF1F4F41C0D2267E0CDA67EFDFA818D1A35BADABC79
      8B07A3464DCB59B5EA44C9AA55274BBEF9E644C9BC79EB4BBA74E99DD2A04183
      BBFEFEFEDF80C103F8C7ECDEB343BA63E736E5B6ED5B5455AA543185840437F7
      F70FE8D8B163DF8F7AF61CBBA07BF7310BBB751BBDB04B97C10BAB558B9BE0EE
      6E7ECFDBC7BB4EB56AD14E2C0D4BCB38FE61FC3F701D397284AB5446FF5B2E15
      FE1CBD7FEFDEBDDCB061C338E447D9AD5B37FF2E5DBA5487DDAC4F9F3EEF75EE
      DCB956CD9A35F36D365BDAE3C78F994679ED7923468CD009274F9EECAC542A87
      2A148A917ABD7E829393D36093C9D44DA3D1B4855F23AD565B1FFEAD020202C2
      4158885ACDF3F3F32BBE79F36639211EA6E09168727878F858D444273737B76A
      9032401004779EE70D52A9540EEDA7361A8D21201A1E1212B235303070457070
      70D74183067974EDDA95636CB9B9B976BEA8A8A8100978894442B01DE0388ECA
      C0FC40CA741107290D66B3B99B9F9FDFD7205DEEE2E2D2F3BDF7DE33E5E7E75B
      04B0768614A160E6D035280F7DAAB8B89825841741D5DA1DA476BB9DE0CFC1E6
      E472B906D90D85A48D4B4B4B6B9E3A75EAAAC462B1DCCCC9C9E98027F3884028
      17B25AAD545252E22043213BDCCC8F498D6C13B2C2414F0BC9C9C94E2F5EBC88
      7DFAF4698824212161874EA76BEDEAEA5A1DD27088CC9E889F379E0A0A0A1CA4
      4C343C995253531DC8CACAA2CCCC4C42B130520B1E9ACF0D1E3C58121616D6B2
      56AD5AF30C064395C2C24281950F938C65F5F9F3E7F4ECD93307014BC8C891D0
      2125722342A2ABF7EEDD1B2AF9EEBBEFACC8EFFEB163C72A1B376EFCB95AADF6
      43E171884419191974F7EE5D626E944FB9744C4256012CBB7870367292CFFC1C
      78FFFDF7555F7CF1C5845DBB76651F3C78D0BE7FFF7EFBEFBFFF2E2E58B0409C
      3B77AE3873E64C71F2E4C9F68F3EFAC88E5CD8D0602DCD9A354B4073F812E566
      7690945DFAF7EF6F5AB468D1BC3D7BF664FEF9E79FB65F7FFD55FCFCF3CFC599
      3367DA274D9A64470B2EEEDEBD7B1A08FE46DB5BEEECECDC038DD91FE91D3D04
      F63FA67DFBF6AEF3E6CD5BBE75EBD6826FBFFD56FCECB3CFECA3468D2A40B7B9
      0F35B3D5C7C7672CB2551329D84F1807FBEDA64D9B3641C8C6AF4002082EC4C5
      C57DE3EDEDDD03AD3C0CA934C0BB0910C1619090439FF2029AB9BBBBD704810B
      0264C07F478088FFF78DEB57E2FFE8E902AAD9BD57AF5E21C3870F8F40AD351C
      3060406FFC4DE8EC74FF33DCCF422D8D402D79D6A953270759CD3E77EE5CE99B
      C4E6518523F0EBB104EAE43B602DF4D104A89396B043A08B4CB0FD50531FFAFA
      FA2E41810F9C32654A18C8CBC60CE59C3C227746A4861E1E1EBE68E1285719CF
      7A38BA077A0AC7FA1C87D6AE84FAA8079D350F2AE41BA8900903070E0C84E628
      57D53C7A721E681D89C042E8B40EB5010F87CDFCD072999B75662D246C1C1A1A
      FA594C4CCC0E28BBD920ACDEBA756B9904EA20272D2D4D442775142EEB98AC5F
      31223CC0D139211D313234440E60AA46831C44E22111E8979D804142CF9E3DC3
      140A457DA80946C4412FB1F48E0ECA08983E62E4ACE33237B2ED5021503FDC93
      274F9866B0262626FE2540CC17501FBED0760150113C23644F6784AC77330206
      3C959080A03288A916E482981F74532AB4C426C98C19331E7CF6D96733F1241D
      6AAF0102254C1248E950B3D0378E844C91E1210E65C61EE0101B17E8A634A892
      743889476DF1206B833675F7CC9933F643870ED94F9C38216ED9B24584361067
      CF9E2D7EFAE9A74C8D88E3C68D13D189EDF815B17FF0C1073674A7BDEE1EFE81
      8CC801744E397A7DEF0D1B363C662A64DFBE7DF6F5EBD73BF4D19C397344482E
      4E983081A9123B7E388BA12592A1558FA02F7EA837988D0E92B24B870E1D94D3
      A74F1FBE7DFBF6677FFDF597FDA79F7E7248346DDA343B34A81D2D3D1B557DB3
      468D1AEBA1E387205D554003BC6EDAB56B67C0D3E743B2BC55AB56D9A74E9DCA
      34625E8B162DCE60B4B204ADBE139A00CB8A0AA9594DC37A8B69D5AA95FBA851
      6317CE9C39F7D9AC59F3ECCD9BB779E0E313D00D8D952933C9BF9339F7DCF176
      C229537E0A3C70E0DAC103076E8BB366FD92D2B66DEF7E2028EF1270971BA7AE
      1BA442F91D1C1843BAD6AC59B365BD7A4D62222262078487FBD554289CF48585
      36C16C76F2C26FBEC1D3D305DDCE6C4783CC4412875106B6142B3D01ED28B26A
      D5AAABEBD4895D6134F27D89D45EC80EC5C444C82323236AD7AF5F6326D4F04A
      14F46030680187C9DC3DBCF27007CABD0E7EDBAEB76AD5E6D1B8710BF3D9F891
      818D2167CDFAA1A463C72ECFEBD6AD7B1B6A6511182A57393CCA0DBA8A0E6AA5
      9EB39B779BD66DFA8C7EFFFD51333A771E31A353A76133DAB5EB33C3D3D37730
      246C8E5A8B4422364486F50E131F1F5F59D40A71DF1656A98C2AC4A7A3478FBE
      95EC4D616F25AA48FADFB8FFAF11395AE4DBF2FDDF48C2E2203DE720623715F3
      0D37C5D34CE6FD1AE26916356EDC98FEFD2729F3406039299E2096F9BFCDAE18
      9FC5E1D9E5FF06FE3F4CE428E0FFA670DF558E48FFF6EA47ADBC312D6B1A6F0A
      7B67F5238143E28A8C78BAA369FC3BECFF25B506F15FCB5259F6DE155616E7FF
      C8E60E1EDAFF9552A96A8941041BFEB2A9159386C34041C030865506BB773C84
      E739BB449058304812317E72143AFC4A8B8B8BF6488C06E328A34FA4ECD2931C
      47E4B20B472205B92828CADB483C5AC9BDE45CBA9A984FB67F0D76C3DCD5A4CC
      B8EF2661925C799A478BF72650C53F7F27194D6BEF8721DF4B5F09CFD1D13B19
      F4F7E37C48FDD28F5D7BD771A786CE7629139DB0B0872530E6FD122C2F3DE39C
      29CAC74402FFB28504B869695803777A90F298D2F2AD2F23E22A3A3248F43216
      3CFE3122A924764A78968655ACA272EF82620B3D7E9E42465909610DAFDCBFCC
      E190A8EC46863BA560A360831D4F10E8C1B30C52CAA52493482835338F50F814
      855989DD6EA5E44209155418BA974BE46392D2F4B65EF4419492A23DE4E4EFA6
      23B5424A761B96E4F024AD5A41016613857BEAA97DA486E675F6A55AFE9AF232
      741005B92A685A077F6A5BDD8B7A3789A4DAE19E14E061222F17031636A5181A
      F3E4A45591BFBB89AA0599A9631DAC27457AD0A7ED0329D64F8BC7BC2AA3AA5E
      3A8AF57F59B0469D8AAA60392CC0C389742A4579610B024F7A8D92FCCC4E64D2
      A9210947DE4E2AAA1FC2864C442815B0A16A1DB4AF2E3289E0888846F7CAE7A5
      C5DA130AEFE5CDAB6B591C07D1FD6436491629D8AC75ACCD66E616905625279D
      5AE9688C2C8D1DF55C585442997985A457AB1026A7949C627A9A59EC58F17310
      5D7F5640BB2FBDA08F5BF8D0D317A98EDAF1331B50262FB3C762E6171653525A
      0E3D7A9E4525A5A8591F37FAED7C3A569215D4C099883B77EE8CF884F3A3F9BB
      1F92935A42AE0A0B8523200CB5532DC81D65824577749167E93974EDE10BBA9D
      9845D7526C945A2CA78C421BF5A8E54E8D5CD2F21C1211FE5825A717D828BB88
      A7423CD1DD584A4E287829CA0BC16444415BD105AE80E45EA640A5761BF32E87
      A3FACBEFE0C0FA343DCB17C8DFD34C465439BC1C4683320BF53113564541C239
      FC2A5ECA25AAE8596A275A7F3E8D42BD0CE46962C369A25414EC2FE7528949FD
      3A0DAA1FD5570A55201DDCD0B32297A3961351236544E9F916F27356D2C0062F
      89CB224763699FCB4DB7727BF7FDB1D1C9646A84EAFDCF63C2B2D4156C08624B
      4F4FFB93B018A9ABE0EF7062AACE03D58108C0A1391D01EFB8F0369BDDF88670
      560C81F05F08F400992BEC771A36A37EADE652C771AC6E9F2165143007980AB2
      CA4B3BF0AC685E23A9109804F74380D54223D806C0619CBF1405972F452DC8CB
      B35D8908010250562D59487503792C85CD54A51D61814030FC02E1D707A8877B
      296C472D33BB0C4CB9B4436055F4D152E03602D8BA80047613602AF0057ACC68
      6018DC238050C4E72A49044F0B1002CC036A01B745A29BB059B6C622724F8EA8
      35EEDB01CCAF29EC0F002D8F4B4553849BB30093AC1FEC2AC03DE019087C0035
      12C8607BC1AF18108038C0087F58AF0C6A0B02D019DC4E83E8D781A670370014
      08100018A80C2219FC98FB6BD8BF02D9125C2A19901522CF8CEC1ECA88ED29D5
      05214BF802295D10B9AC3298445B717F0F692CAF1121A0CC70487819D9A8098F
      48909EC33DEB055E204E83DFAFC0134602FBA5CE16E3E32370A3052EBBE967B2
      A7C7C06D832ABF087B1F100C48010B003EBA0DFB3C60051C86775C899AC2DE04
      74AA657DC21214C17D1B7800EC064E013780CB904603FB7D60253002C5A08120
      BC0437CCC871F105BEDA55F0E358D8BBB8F878D610091199AD841F23FE0B3693
      7810B21C231295E07E1B80DD385C2B184FB897003C9EB2136416944D21EEB590
      A439EC7DC0324009926EB0A50023B6F170FCDBF8C28391D581CD4C262E3B0067
      C0034820A205C04680D51C232AC06F1EAB1C3A07CFF915F003DCA500A58DE78A
      21CD2F70EF86744ED0FF1C6A2A818816013B013B2417E9B7F53F9B70F31F8D79
      D933B3C7F2EBE17ECB8E4AD68D8EE150769CDBD799CEE6AF5374B4E65FC3B857
      6C9CCBE2A248A7592F6A6B7B7C6B12DC2254F057BE820CF69B8A83FD8622E85F
      064FAB0BAF29C0618089FF14D9B1C3FD56F34676C47E0EB802D380794028F04E
      F3362256534CA939217523C00C380CB423FF4A3B2A1C1EAF2EC22B9B353C4EDD
      3A5E0D58E1C7B2E18946D714EE1CE077F8F380A7B33D5F0BF46A52FAA0F91F0D
      0262BF685C2F2CBE7163BE9C08916448C0129A51CDC9706334452D60DB80448C
      89DB4844DB800031B30586A3EFE3F7AC45983DB5999798530F0F0CAE48847BAA
      8144930026C513B49F60B85959554160138EE3426CC40562D8CF3FE29DB8E392
      80C372D1363D844F65C580A8AF0C6A2B0ACE45908865EF0F104543126F9EC406
      1CC71B10865B910D0D9E6048A7C57D1230E22BD7F5B724705434F770C3B4635D
      D8B148D5D8642F2C2AE4A44A0B49911672711C4BA346F84FC003E039565299FA
      85B38281541C6EB56A7BC900CC47E6AA458BDC467C7106AF46CE38D63839D4C4
      0BC419041C032C5FBAFC66E0E078CDB45C9CE81A614B1EFB42D08D3D2FF8488A
      38C9792B49F2103108D92D84BD0B588D46FA1C362D5BB64C5389286A49AE5221
      96C60E2839DFA3B1F561E7E392C0E7F314CD9C2D9C900A959F8444D540741DF6
      2AE00C900732B6EC2AE1A077987A2886A7FC94E05B054F9F186E4BADEA26E66F
      99236FFEE36A799D9118164A11FE10242C3B6E703F0398544B40848760A0058F
      798005D0D7B33D6900BB00980FFCBC5A5157015B89A9DB23D83F125129309127
      0AB5137583FB77A09C280F3731403EB01438055C838EB1387F399358DE214953
      F86D067E02342019099BB541396C8791E01A4F44ECC908A77C46807B87E1888A
      E0D80DB08461B07702DF0036E07DA09C08EE771B340725D00B1DB53F3AAC82C5
      C6BD11F808A8C7EE5F628D68808633014CBA977EFFBA9A9725E9DD97DDAAEAB9
      E28CB22C08247AED8A0237C59A6417A47DBD1D61859DC70E83110B972E58CF57
      A6A7A70B688964301AEDD8B52D4978919C7E3F2539736CF71EA565A4CCAE2405
      B673D4581DAD85C43D1F3C78D018BB9DEE205310E6E47A93A9D4C3C73BCD6834
      9D71D56A772CFEE5E77D93FBF6CB62240CE5445851D76173A0CF8D1B3786C01D
      7EF7DE3DB9D56E278954CAD9516DA53C2F170C7ACF90B0B0CE514141714A41E2
      3B6EE5CA555F8D1E9DCD887876C1EE9E023B367D21D127EBD6ADAB7AFBF66D39
      36FE39F37BEF716E6DDA90577434F9444592CEC383BB9C9E26D97AF3864F625E
      EE68A3543A68D2DA357AC621DC58B14292A254D6C7FAF44C6C64FA97582C828F
      9F1F27737121CEC3034763049260F397944AE2F4382EE3EACABD9049B92CAC51
      0728953E6AA27BB5716281CF532A3D90A5AE57AE5CF1C74609A731184850AB49
      82DD6379420229D3D258F68853A948301A4874762695A7273DD368F864411220
      972B3AC8950A3D9FAA568763FFA8C1C3870FE5A82912E572B221110A98643939
      C4E5E690C87398200B64C7039E55AF414535E2C8E6EA464F2512992093D52BC1
      E493B74AA5B1D885F1C2760F0705C571EEEE640F0D258B9313B1C256E12013B6
      B108EA954D7EC9AA501076AC482A9773D982C0F172998754B447B04DA8414F9F
      3EAD76E7CE1D549094537B79910224D8C8262976DA3DCC66E2513E2495112793
      93B4B8841499D990368FB4A516AAA252D92DB9B97F4BD0D8402EE7200E713A1D
      153D7F4E126C3D6B90C512547BD293042AC1112B0B669225020E39A1EC0A1940
      E86CD093A64E5D6B9AD59ACF6DDBB66D0176CD477FBF699346A8568DE3B17CA1
      494C241D1249F12B60E77962106117582C98AA1652016A31BFA8889AD7A92376
      6CDC24E1F28D6B0339EC0F75C526D4A2EF7FFFDDEFB95E8F1F0B9E532525110E
      0290140D9249CA4E1A95C26D83243928FC82A26292C864E2D811236CDE1E1EFB
      4E9F3B3B92C346B85F7474F4A2CBD7AF77FEFD8F3FA45848E158D54B912DB6B8
      822361548202B6A00D8990C8FAF02115E2785593264DEC7D7AF77EF1F8D1A339
      C74F9EF891EBD1A38704C7603AA1A32EC6AEBADFF1E3C73946866D41B4009E38
      14B45D83C514B41D1BB25372EB164504068AD8922D42FBDB70FAF4E939CB972F
      7F02DD453478F060436C6CEC789C441879F5EA55230279B6A387A6CF1A10D950
      6E02DA9693D128560349CDD8D85254D2D1F3E7CF7F76E1C285CB67CF9EB53175
      49972F5F2EC6D6E13DA552598ACD1333B676B4388121A0ECC8802CF9A0AB540D
      0EC6A99F186B5060602A34C241102CBA7FFFFE456CE8316D89675630CD9B37D7
      8F1A35AA350E0BAC82B81756AE5C9908A402CF717F73E1C2859BC78C1933A865
      CB96BEFEFEFE8E0E5F21796527F68F0494992BB6A16B0D1C38F0830183870EEE
      3774E4C05EC3C776EA326242D58E13179BFAAE3B5AAE7ECA52739B366F30A060
      55D8C074945759C08913270D5959D91E58372A75717649AA592B8EFD10940557
      B4459C6129ACE851EEC68E96124D6230F6187FC766E5CFB86F521EF816C7DBF2
      E98E828EC3BEA3884D4B2524AE0332F95B381CDE6F2352A3D6B46DDBB675C1BE
      632E76AF8C886D00D96B65037F87791B1141A5F08004246CE3D71BB1FB02AD40
      E60768000EF7E5E66D443616E35505886857129C13A985F300BD90CD495080A3
      101E0532473B84BBF2741D011C030B00D813D167053B0A3C19ED8B6595860E1D
      AAC33E6D2D847F000494C52F97081EEC57B406026B03CE00232248C3D7AB57CF
      8E96AF40BB92F7EBD7CF057BB916C4AF8AD3417D11CF097829113CA5B869AE56
      AB07A1B606A06CBA633D5B0F3F1E44C190800D525538F6E08DACA91A376EACC6
      76B4157DD38C382EC04B223858A2EAD8A3367CF3CD37EA860D1B62735D512495
      4AAD286C35887588C3A4C72DAFC4C39CB0AB8E67594BE09F07941315E3260D3F
      8C12FC646BB09F4D1F7EF86136D8D8500741E5866597A1183DBE105BFAC90849
      031CE32842D658A00FC4EE131111118C822D825A098024ACFD304958DC328818
      1B244E9C38310FBF853BAF5EBDBA8D053002669791614ECF75C1C67704F6F715
      E8BC8108FC778BB660B7E611A486A2CCFDFADAB56B3711E7A544CC510648C76A
      EC3D9C2BAABF74E95223F49313C264007BA808AD980B95F2005BF82FE0B71C44
      19B05F27629E207343360757AB562D047BFD323F3FBF00F8B3EE2142A9658C19
      33E6E1F5EBD7FF86DF4610B1027F331122B0AC46806C3C4E40C9B0358D9F174E
      80BF9892925282834DB9382BB109F78740F4EF0A81770503A9DC811FB1DBBE0D
      65F56B19D0383742C56C475873802F4BC261FCE7F9EA268B8673E50A0A9158B9
      04224C05FCDB58E1F1F476BF7D05A55A0F17B8455AB376252B44B8DF6D7CD76E
      E6BE5B3E48BA6355DFC0533FF68DD91ADF9495D9CB446B44677EF8B0D1E2CBBB
      775F9F0CEB26FAC88A7DA243CC73FC02BC967B077835DBB3A88DF4552A2CE4BF
      72BDCBDAB1E47DFEF0BA3E55C2C27C168A25C59D8B73B26B7BB83B7DEEE2E2DC
      69C7ECD68C2CABBCB0DE46B47F65774E6F50478784F92C36A8659D54325E692F
      2E122C3959915A8D7A86C1D9A5D10FB7EBD8FEC9E75B9870A2D71C12EA3D4BAF
      92B6B6E2279B17310DC42C27333D972F2ACE0CCD299675BA9F66BBF8D682DE8E
      ECE8F4AA605F5F8F099CB5A88F49A3509616634893934719E9D9949D55509A92
      5574E9C2C39C59B5BB7E7AE68D441BE777E0DCDC8C3121A15E73D532BEE9B3C7
      493205C6FF02D9E8C50B9C164FCD2E4DCBB7FC7DE852F2DC1B4F728FACFA650F
      6B2AAFE769DFCAEE81CF4E7CBA3BFFD24C31FBD4643165FF48F1FE865EE2C5D5
      1DC5FD731B97AE1B1B77BA6723EFB62E3A9982A5DEBE7DBB9AD9E560D9D9F1E5
      FB5E094726AFCE39FF5951F6A94962EAA10FC5842DFDC4CBEB3A8B87E637B1FC
      38BED6E95E4D7CDB7839E17CFAAB94BFFDF69BF29593E8B7B9EDB923DFF58B79
      76F2D33DC9C7271625ED1F6D4F39304A7CBCB59F7876793BF1C0DC46961F27D6
      3AD9BBA96FE3003715ABF2F2B4D0AAFFD4FEBE953D221CD9B93843CC3A39517C
      BE77B8780FD961921C9CDBD8F2DDB89AA7FB36F36BE761C428B59CA28263FDBC
      0EDC916FFB063F3D367533B253F2323BA3C5C75BFA39CA8465E7A789B54FF469
      8AEC98E46FEA772FD97E9DDFC9FDFEC1F13F3EDA37A630E18F1162EAC1518E32
      39FF4D07F14F94C9CF136A9D01491348F2E69A79494334E7A3A6FE87BFEFB7F9
      E9BED1457736F5136FFFDA43BCB4A6A3A34C7E40C1F66BE6D73ED0AC7A37C92B
      32D9B0F7AAD63DFD7DCF43F736F62E39B6A4152329FD7142ED533D1BFBB4F1AE
      503BAFE2BFDDD2ABA58A816D429BEC5DDCE6D05F0B9BE5FF34A1E6F95E8DBDDB
      38EB3067787BB27F42D688FF48AC5349E5DD1BF9D6593C3466F1F076811DAA05
      1AE4FFC4FC0FAE35A21B41430A15A2C9E4BD9606A8FB7C1D485F65B25F930A41
      70AE119D10DF13D0E1EE1F03C5C654ED25F83075B910F609A8DB6B88580D6E1B
      DCD75FBA6D365F71CBAD447A2FDACE61A376387713FE3144620BC4FB88887BC2
      5AA43B6EBC803A00238045D5898A63DC3612D44C712D2C89542F36F4E0EC9CBD
      0602AB02CCC482200E603ADFCC8896C0F757602C24F81936C1FEDE4DAFDC0437
      DEFA505E82FB3ADCCEB0BF43D806B8599C75B0C7005B81C53C2E4780838890B1
      75EB567EC396F5EA1F37FEE0F21EF5F5F1E742E254A2A6356F17EA939D5C108F
      C587F5CA0CE792E13A041CE3F7FB1E78BED77BDF2D4C665AE01057373777D741
      6A57D587B186BAE3AA2A62BBBA091ED19E9C4F6460514415B72C6F2FB7F5A445
      96FF211CCEAD811077F833F6A08FF60B35E7F9FAFA0EC6E0A1875AAF6E91ABC8
      ACFE48B8E39DC9A729D552B5DC49E16A366B3DDA052BC387D74C6FD2BCFAA346
      CE18BDBDACED35E260147C28AF94886EAE06B52B064F6A4C6A04B554C369781D
      65D93229DF9E471A890EBBE912BE4092A7F3D2FA443431B6EEDE58D1F6233CB4
      E9800103DC056B911C59E3F87ACAE4E4E101F94998A31146682411A5E42DF5A5
      00790869049060B550C6CBC8C09BC84F08E13D95BE6A7F2FFFAA38803A1C63A9
      31A3EF4E7DD27A7B9B67FCCF092A5A74C9EA89250DC7396CCCC348629751A83C
      8AC2E455482E2A4923EA285A1E47BEF200C2BA0404200EA33919066291E7DCDA
      7D7A3C70703541D2EC43AD59AFAC5E55955B525A5ACA86C30EC9A490CC6EC301
      785B31193827F2B505119F2F751CEF4CC29C17C3448ED90F052F3D363AFF1206
      C4981263B4050538C0E76FB158A438C1EA385DAF5440128986720AB349922327
      3E5D4A2F9292292121C171F814C73B1D0754B9FBC76E592F6CD92F99E73D3BCC
      9099E9B4ECD2BE139877348154729C5AE53036A2BCEC02121F4AA934D742C9F9
      2984306265C9F286D1BFE3A8ECE3AA83AB2736A862609DB63AADB6F71A3D7AB4
      DBCF3FFFFCC9912347B61D387060D7E1C387776FDEBC7937668DBB7166743746
      6EBB715E7B37CE8CEEC639E55D9818EEC4CC69A3FB985FF7D0C2C448465E8EF1
      E3C707AC59B3663E16A2B6E320EAAE5F7FFD75F7E2C58BCB8930EDDA3568D0A0
      1D38EFBE1EA3B82F30981F8C66130D020993A8061A545FDC10CE8CF2185F57C1
      40F32B48B5F3871F7ED88D83A7BB707E7D07DEDEF81D04AB31829BEAEFEFDF09
      E3F150A4D1D38AA251B4DA16CE882682E817C0090184573DF8214386D4F9FAEB
      AF572E58B06033087EC60316610437105388DA2A95CA154D846944A682CC48B7
      8556148C85483401046680051CDC359CFB5933FF76D5FD59E9D6E8F30B779F0E
      1BD13ADBC9A540DC5D7B0B2D2FE84932953FFAD606100C459A96401712A4F559
      E77B819B24E00C7005A00253D8B96786985F0E3DB46DCFF269F8A5E8576B1BFC
      F340721EF63580990BB8FC0D24112779C4A450E109E5835004380CAA9F736DD2
      4D1AD0E5435F1FA3B6AD9B5ADEDCA0903A61E9E956894DDC83F5FAE3F35BFA64
      3A22E3C2246280B3B271597A96F7E939B96A1D7FD759ED429C3E691B6C6CD6CC
      5F57BD818FA6474D0FF5970106D9E4F98793986675246424450E57858BF717C7
      381F852DBA81877256731F5DFB50A352EDAC94966AA542895129A10093DC3DCA
      5539CC5B2799B4E448A2274B2A41B66CCC51110A89A80DD3CBFAD6F7D4367452
      48AC36BB6815B1C266C1A29BD54EA24CC20B0685A0F435C8BBD9ACF6FB4B0E3E
      5A2BA94850E6362B0573B051D9D44323276C3D94B2D33D18DAD9B1F8674716B8
      E252BB5521E12D7AA5C4A49109ED0A65C2F6975AAE8CE195EDDF6160784D4FC3
      8000939A07890D83680E233F0E64100CD4882745A90B3C27C92B2AE53232728F
      BC91C8B75D7FEF2A66DD074138482211A0FAB12F08222C4CA129723CC7484491
      38ECFE09189316A5A5E6EC7F2391679BBE0A4FBDB24DB88BC649291120111306
      F2C040240E6A8A18302D923DCB2C7CF2EC69D2C63712F18D7A94A20C02FD0CCA
      EAEE5A851DD943660807BD0088818318D0E3BC3425CF624F4CCDFD233F3B77E7
      1B0B3B29F189E460666A81A5B890FBA87EB82AD049830D4D8E15B4237BBCC849
      53F32DFCDD67D967F2B2F37FD7CA14B910D6F1B07F2E833F575251EE200CEE3F
      91199D3D3AC6C5E475AAEA6B336B95723976D10A71D405AAB538292DFF5C6166
      EE5265A9E5E82703EA955426EAFCB19E4A2D3DF0C6E9144EA3F77136FBA6D4F4
      0FF8C5C7DD2549A5904728048913F4708EBDA4F4365F5C72586DB7DE0609DB53
      A93015ED38464F053903A9A4E0634EA5F374F30D4EAA1118FA6394B3CBDA2C51
      C8D00A9C0227EA646847562CF216E1854FCBB481F550F6FF6486A8F70C2535EF
      378A6A7548A2FA5DECAEBD3E49EC347FF327D3BE3FC1D44BC598EF707F30D540
      1D3E1C418DBA3FE41A76B7BAF498F8BC6DFCCFD387CCFAC1ED1DA95E0BE249A1
      EE01DF49BC5AEF83EC24C68545AF8930BBAFFB76E6C014F8FFD78697EA5CFC25
      7A27AD9B775052CDB0AAAB235D5CD67C31A2051BAEFCD7242C221FE617B9B96E
      58D40F8D422357557533FFF8F9E8D6954858A7606091DF05A621D35F45F81EF6
      1EA895E3D0C755E1D6C37D026EF673A385FB24DCD5E0AF79E5C61892EAE37E26
      908FDA2427381802618700CC78119584614025C586560010F1CAED8BC0208019
      1F5CC20096D6C4C33113D8098CC693BE85CDC6877BDDF48A1F89C8D34DAF4A06
      98C27783FD07E2FC48EC6F38C7D24C817305B08811FD09C77E44486663C88D5B
      36687EDAF4835B0F1A1610C1C5D4D491A195C42E6D8831A419F1587C58AFCC70
      2E1FAE43C0517E9FCFFE677F78EDBD78F4E8D1561843F6327B9A8768CDDAD131
      A6B8B15594D5BBB808EE553D78EFF0E0E2A86A3EE9C1FE6EBF7206645340E297
      6638B70B8EF3FC117BD8CC5FECF5BEC41AE3700C9CFA969414B74BCE7F56E776
      CEF5E0B4DC1493BA40AB752A76F772B37B76F4B5074D8C79D8B06795E30DC2F0
      AA900FE0860AE806A256BC516A33FA9B143ABC6812BD7BF7EE2A27FF3A1DFAF8
      645268DAD99CD0E2F314AABB620E555D710AB55F9755533E30B6F44B0B9B184C
      515BF0DBBF1FCDE2574969812D509A532CCC1ADEAD41BB603561D9DDBD69D3A6
      8FF1464A56685848729E262B2FC3F379AADDD5922D7A5AD2A4CE42769588AA49
      AE120FAB5AA9B66360968945298F2625E78E37E2EF5E94AC7AA4E5852C3ED01B
      AB0C580F14B1FCEE82C52573749D2A77234CD1963BB7EE98C44C5E17161BFC30
      5016CA9D797CCE0BA3DF428CEEA0C639DD797D838FAEE518E582BCE9288D8B5A
      1E664CB9684061E762454F89619DDCDBDD3B47ABD659521FA7B938051B9EBB70
      66D19641D2C4A789AE18B57178071203BB224DB2E09C995C2CFCCDB74BDFFA47
      838CBD4B21663693C8DFDF3F152FEA5C71377B14061882ECA131C14F9DB52E39
      3909F992C78F1E33299EE32DC33C944F0E0A995CEFEEBCEDB177E26D363E6AAA
      5991390BAFFE2CC7225C02964E9330BC4BC23AA303C33E1C96346068FF24ACD1
      26F5EDDB3709ABA749D81349C21B63CFF0C0A488B1DF9D12163EE92E50877837
      0BAF50BA5F5CBB0CA3B1BCB8B83815960CD3030202525C5C5C52ECA5F6149D5A
      978201568A52A94CC1F83A05D2A4207B29D84A7B9C24F5C8CDD2875C60D29503
      AFC2B8AD58B1E2B383070F6E3F8001E9A64D9B76634B880DFF76E305273610DD
      85CD989D18026EC04BCC5FE275AC61680631D470A4D6913534AAC98C0D433CF6
      A66F00962866A25D6D6783D1B973E7EEC268968D2137A301AEC186C2545F5FDF
      0E58960EC30A30C690C57D90BE1923FA128E83400023C31892C31BBBC18B162D
      5A8831E426368684DF22BC96D70FADBF965C2E67634809E232156442BA9F80CF
      395C447832C33ADF2174DECF259F3FEB61B4A4B6883B35EDE0D9B0112DB395EE
      C5F67971533182ED4C528533E27C85747D90A80DD00B709C197D0007337FE2B2
      1720ABCEE36C5A89EE26CAE9A1BDD697D748EF26C32278612E89A7118EB10EAE
      44CC5D0A574DA08049E483273CC5CD4BB3461C03C74CE02E3008D00250709406
      7B35C0B4E41748B310EE9706C786585E05C71D6E606B000500AD67F78496645A
      106EC779001991CC8B4860F72A648DC52D00A1C8C023D10B78B29FEE48B83F04
      36008D24FCB50FA0111F024F80DBC003817FD09D8501DF01C3811A48CB38B054
      3F9C2B86871268A220EBFE0D4E1BB37FD2FF786FB476557E2857B59696F4AD04
      BB84CDB25D9DB561B7F0F4E3C013C4DF033400585A10AD1127E2E6B3D16E8FF3
      0F459C8D72F7701BA231AB47471B633F8A52567BCF453057F5E47CC3838BA2A2
      3D33FD7DDD7E23BD43430EE7581932ED380D527DCAC41A09A24FCC4E86A1D045
      5D30CB6E9A27CFAA769FBFE995C6252B5512B5D4A4707675D1B9B50ED4848DAE
      97D5AA7D9D47ADCC83070F969228FA11D127C018DE53C84F7657DA0B429C6436
      F423C72CDB80F22CB417509E3DC731CB96F252AE50C853BB69DC031B9A9ABFD7
      40DD623C1EDACEB9E8A99AB7953C04D1457EB2F3D5A3F111D9579BB91667B359
      21869EE4267852A03C149BBED869E7049262966D149CC9970FE2DC65DE721F0F
      DFE0A0A0A07ED3687BA35A594777B9A5FC3D83BF9949C51753AC5ABCE4ED9865
      A3FF60CA2EA1607904452962E86AD6A7619733E7465695C752A02284249C94ED
      6EB1F7B7D93B024124DA6BE7E6E47A088AFAFDA56693BE460D1D36982DECED04
      9E30A1011912E020FCCD02573D3E7C213696156470B91262D37A36BBBE73E70E
      C75EB07C2A3A29D20BED273897AF13439B1AB2264F8B2139DE42D09562CACEB2
      C8C8F2ADB9742EF514E567E49326CB48F959050455EC981443CFB2C9B278535B
      5D7D47193E4B92A6F05AB6BDC8B5269DBFB6755234C75EA4502392E39DD1DCBC
      5C2ABD8721318608A9F9692CA163968D7D37C7DA40A236DC703368506C89443D
      9F7591200B2733ECC9F73BDDFCF20E15346353E86EEC895BB8FCBC7C2A65AF2B
      9472A89897063FA2ECAD7A11FB4694C5F35422D3291112C8F4D16034A8F1B4DA
      1A8C3D104F28B578BCE2E9D090D879DF8D17BC1DB36CA6213FFEF86336CBDEF9
      DE7BEFADC7B6C617DE2DFA4FC0547D1A7D631901329835A21A6413252BF21BE0
      6DF0E0B56BD7CE8386DC81D93653B365B3ECCD50B1AB6263632743A7B7930EDF
      D88396A4CEA7E957F460806124B040E40B4CE05659C22267FF356BD0EA3F0FCD
      9F3F7F13B60A7FC40EDF02ACCCF4910DFC7E1C37F9E468AC0856A355B6B15878
      08614919581771658E571D71B5C84B3BDC746B3AE3577B9DDAEB7223B3B7E8DE
      13F6C5CC96DDEA7F28DF52B3DF476260BD15A432BE8FB9C43A4CB8EE3BD2E2C2
      149B174892E07E69D68843E09802DCA1E43B1F91D2A02095E3304F0E49644B89
      E399625B81345F234EB9614406DC31C9721168859B9DFB631AB136DC85C08DD4
      71F8100B1CAF99974BAB1AF8DBFFA957DC95199C2D92C0DD1BE809FC0EEC0659
      2AECB71A26C99B026DF07C0A04037380E9207787FD56C3BF29044F17E1FF1478
      0CB802D1801A70181CB192E1A89513C8E50E0F5C5819695036F97097958D0CEE
      42400FCC43DE078944C7E0FE089002AC87F0B05B61827A09F6493CB89479943F
      099E2C7177D8B198FC5A801B70E701AC1B74863D1758018289C030B847039190
      8C6344C5B8219CB0E325A2AD086E3F2262096AC3BE0B69AEC376054621721BA0
      3EDC0D0196AD26B0BB001A1ED9CA0189013783EEE62E6681C7E16659E80EBB3A
      F01848E6885C003920053CE05704F040154023ECEFD3471664320DC58DA78C6C
      C7BE50344E20A2CB101DC320C751CF58DCB35A3483400060889D1E7F06FFCF81
      43C03D497D1F1F3F228A0256032E2939B3E438A37D19EE04945120ECEA20654F
      4E1489581635F0632617973F804414B65DA290483C716301528021C003E03EA0
      46C2EB78FC13B883417ACA4EC4B288610D25C1EF3B208591C026FE8ACCB1AB89
      386C359DFC2EF11E4F11D014306351E518A4D90E770920E1B0360F5B013C0718
      9994D518DCC43F15F4057048013590EC26E6556F5F7A2BC7C59E7F1B4F4B84DF
      01E034701638016215ECAEC05A6024E0C8AA2487975FC14D4B2012D8E329E68D
      FCAEF0F750B8AF507CFC3A3738608CC00BE008A003FA43BA1091A819DC1B803C
      DC43DEF8F87AB81906AC079201139001DC70D5CDF025E27E81244F703F1E5000
      1F03FD806BC06048FE8887839933B8FC007403DE07BC8128A08A8932D3606F04
      4C0013F029ECC5C0AF40092003FE598940A3E4E0E10B3426222F4002FC099C42
      736059EB899ABB2E129D4C1FCFB137350210D616D80F891EC07ECDB003A91210
      CB8E0F1ECCCF9D33CB73F682CF83DA2FDE55BBED975B5A7658F24BF0FC797302
      472CF82578D882DFAA0D5DB02162FEBC793ED4F09B6B7CFF55879593BE3D21AF
      4889DF2FB556A309C031A21A387615834FCDF8615CA0A818E73FBA315570C587
      4986F4EDD367FDEC59B34EE27DFFE3987BFCECE7E7D71564DA3711F0FFF69408
      82BE5A7474FF8FC68C99848F04741E317264CD51A346D5FEE4934FBA0C193C78
      4A604040278C0D34FF4E578988C3F93AA3C914D7BE4387EEEF77E9E28FAFC728
      B0622CC13C4E8291BFB25BF7EE512D5BB5EA83F94724E2B2CA29E7AB4404B165
      F8F046749DDAB57D305DC0B2A5C0E23B8032E3BC3C3DA5988B84224E28E2B25A
      7D331152483059D1E90D0619DCE591CA1C8244C2998C46254E926940544908A1
      2C12B391989D64A98A233175F05425A47078B30B20E2188C78F9D2A58C23478F
      1EC4218BEB184FD9E1EF3095F2091FC1C5D9B9D9F8091316E1373F0AD2E1C54C
      E800042091886F67947CB964C9C98D9B36CDC080EB2CBCD13E7185F93711A146
      8CF8DAC9A85123478E68DDBAB559A7D73BA4C69CD7B6FEB7DFEE61D8F3F98387
      0FB7610C958BF4EF36D859F06BDFAEDDCAFDFBF6A563F466C5A0CABA7DDBF634
      CC1AA76348C8BACBBB09CA42515682BBD9DC64C2F8F1C730E02CB97BF76EF187
      A347FF856650AD2CCE7F6D6367CB54B366CD78CCD9D2F18D9F6464770AA47963
      ABFE4FA4020ABBC5ACF8F81BD33EFDF4ACD9CDAD2924AD54E5FF89A03C1C12F8
      77EAD8717FC70E1D36607A11501EF03F75A01D19424342D68504052D60EEFF69
      FA8AF15532A97401301E9E4AE07F6D981AED8FD4EF0195FA16EE2B1B8C5C5F6B
      942CC61766B3305FAF5761A2EF172D93790F512894A3A55247E364E1AF638DC8
      26BA0CE54F4479B0AFE7A89D9D9CBC31A60EC7CA4304D649FC70CE4D8F96CF97
      93AC11790CA959DAD7B38D9A62242AE8A20868C5569F4C9DDA65FA679F75EDD7
      B76FDB986AD56A40BDB08398AFE5E21FF6578FC19285D2DFDF3F10C76423C77C
      F8A1D7C041838CFD070C306047D01DEEB0A8C8C87034050D7BE0AB240EAB1291
      52A9E4D1CF9CB09B17806D415D54952A3CD409876FD471E111117C9BD6AD952D
      5AB6F4414335A3E5572AAFF27261B4281BC1D5C5450FB5AAC19C1587A0958EED
      56160645462627673204D4702E8D16EB17E8E2E248E98C03DC8E8DF107952442
      17605F3893621D04E7B765C412C30FE7B489BB9458AC9DB12FB3C6EA1BA68E59
      C6D8B624D53626516C8D87F4051AFD5368C32E70EAAD9DA5213E2EC1D8A38EC6
      5A113B6DC873BC409BCE677A7C7B32A3764EA145292D4E4D48BA7E626F6AA9FA
      84CDA791155FA3348188FDACC36266D8055EEE1224E0C7D00B3B9F1DFFFEFBEF
      4198BF0E5B7F36754683C5B70ED49E7FFDCFCFD65F9D3F79DAEC5E28B7202C95
      552A16465109F8948A1253AAC8E9F1737B2CDA767D56FD85370F345C7473DF2F
      87EF4E5EB5E6DB7E8D1A36AC8DAC57AEB561172A15BC8310D5CFE95D3C359E1D
      E2BBF98D3D72B0D6DCAB07B79E4E98B26DEBB6011D3B746C0A85E78CEAAF54B6
      34EC02EB4A8EF4952E5CF7EDC15CBF3FBF721EBA77CF8C9F4F4DBF78F9EAD029
      932777C5D67C302466A3BB4AF1418471C3B00B8170340602005FA0230DF97B19
      0D3AF9A54FDB299DBEF87269BF8D1B370EC03A6E437C1F4A8FB2F9A782CAE886
      5D70107540E26F802DC076E05B1A7AFE63EAB3DF07A70CBC060E18D069F2A449
      3DD1E7C2D0D75E978691BD22D2207114D00A680DD400D42C1CC31A43C3060D9A
      E1EB399D51C0EEE81695CB864562701031C75B809EAEF2F1F6AEEDEFE7D7422A
      95EAD1405FCF164BFBB6C26661AF20C330A71A501FF7AFAB0A783A0C1AB3C37E
      C785B58F008447026F2E1F04FCB74681882AE0CDD942003302341C477B6631F7
      4BAC11255C6C37A5CCC94BE59C715D8B9AC35B30262D0A5A65AB3F42616D3E5B
      478D3E75A12A03BDA8C630032007FEB5E3072A24604739341884FA4657ADEA05
      25A7C6061D773FE145C9E1DC2045BAA1A633C9B546CCFF9DB08050822439C011
      1E974A06CD5F8565AFA0DEBD7A457E38668C67FF01038D355AF7F129AC3AA4A3
      D63FAEB7939AEAC605190D5D1A856ABA360A738AF0750E00019B59C27A65A021
      058C0F5D70D0D4AF5DFBF65A2838FE69A9C9B4E186105720750E691813C8776D
      10E212E5A3F772D62A3917AC75B14F402039A6A2B8961987867475D5E3D88706
      DB15DCCD14BBEE8733D9D119459C7B6C880717ECE7A5D769D4325EB4C945BB8D
      2F4BC76C1EADB8BC5A5983436B966AB53AFE5AB24DBFE258464C4ABEE8111BE6
      CE3BE9F1720E472460031B6FDA3112DC318A97A874A3D168A4E8E1E14D7B8D6F
      90A0A8563BB354EE1317EAC119B578FD45C41299CD2AE6E4E6D932F34BB20495
      53962095D92EDC7D41E7EFBEC8E520116BB106F0A6F10FF6A2C6E4F55DBD827B
      BAF90404D58F0E90B818D408621F9C14D9229D3DE9454ADED5C79937AD722701
      EFCE1424A5E74993330B648CA81562B2F99A85EC364ECEDB0CF88287B945753F
      D7201F378C1FD8EC9C23BC6C229EBF7A37FB724276415A91F43149F0F9060EEF
      0D721C536A570434A6FE26ADD2E067D66B9DF52A5D74B087101BE1C3E3BB0BD8
      E6B7C9A41229E5E417149DBA9620FC7D3B3129B7A0E4882851EEC14FCC21E285
      8B10E20E709D90B5B9D51625AE19F587E8C0C83DF635237695AE19BC29F39711
      EB13F78FFAEDE9AEFAF32EED310FDEFEA3A6F59C66B25A23589741DACA86957E
      251FF63BC661A58393288AEE3C4E4E3C72F9A13D373335CB90B477B3F4E6FA0B
      FCD51F596BAE94E6E5CDB00B952462920DDF6D5BD568D9F3595CDF83CBBC876C
      F9B1E798D943F01314F2560DE9607A0351ABB51933A5232ECEA13E076647B5FF
      68203E19D649AFD79BD10F5FCB8183C3711976E1D3B0398FD7F4D858E840BD65
      C95FC9465D5E4843FF1EC7B55B19E2E3EBDFD0DFD7B72934A48E3558479A375E
      865D884581CF065602AB8079400FFC003821BE1CDA3116A803376B6FB0DE6C38
      2462EDC08F5E2EA0C0A20C5C1ED1DAD812D8EC67D9FF95FD007629F0BF364C92
      FFA821B937D1E3671B6F93C914502BDA71E33EDE181C121287510726AA9851DA
      7128E25F89B09D98C0236B956A023583979F945A5F3FBF60BC3E545DADD13937
      6EDA42DDB8594B55BD86CD94751BB752D76DD24A5DAF696B75FD666D1CB6CE68
      523212267AF93398860C0F0F0FC6E0331CE7B53C940A85947DBC442197924A21
      25A6C854CC0D2865124228BAA88D586132320711B2C234A41B5EE0F26BDBAE1D
      D3DBDCBD7B77B1409EEBF88E3666DCF4F0FE3DB2DAAC50D72F4BC5C3C39D9061
      079183845DF0CB2AC12CC8000DA9C2DC0C2A851DCCE07082AE948AF1AA99C552
      8AEFD9E662B9FE25115B902C717626022793887138C01A1C1BB6006CBB021D9C
      2776F0A8081FC24D4F4F252D3EAD9298F48C6C561BCEA740D32195938B19570E
      87096B0C93D3C5B516DCB16D0C5E833D707CD6D205CB1712D41E77F3F69DBA21
      C1214ED89D20BD4E4F1CCEB06BB56A321AF4B8D7929B9B0B3D79FA348B35482D
      1A5F1E2362658491BD37F66163F1C1443DA60E024E834FC05C3684BD86862133
      E11D5264CDC6A263508BAF360505D1C913271E33222988CA5B2CB2A58E8C8C0C
      EBD5B367287E9254274E9C98846968C8FDFBF709AF7E105E374399591D248C0D
      EFDBD0B5AB571FF31549580036BB8B1EE16FF79E3D4FCF9C3E8D6F95DB44484A
      5E5EDEA43718C9D3D3833CF13E9B9FAF2FF9F8C04FCF96DCF0EBC21257047684
      4528372B08ED689C267CB1B4595818FBB60E915E6FA0ACAC74C22F12D60704F6
      D3444E980D24243CC946C555A4F9C78DF9863A243838AA63A74E8B506E4120C7
      6B90820536DEF87C998CD51BEE09AF8826BDF4F9277DB90B834E01DF2FF4E9D2
      A54B1C7E81B93D7FFC7159A9543EC1E744AD2C71794438D0FE18275C6F30F81D
      E240E4D4AC69D3762D5AB4680B0DE90AE556DE0BDE90E4ED5E48A8F1F3F1690C
      34825BFBF698FF398469C85AD0903511F58D3F43F0FFAF0CEB426188190A940F
      36E0FE1F1B56194CCD300DF9CEC43CB6E35F8E125E45DBFFF9E7C2B68103DDF6
      B66BD76867CB96C3B6B46FFFC92F6DDA4C5EDBA8D190251111B5261A0CC671D2
      D7A7EDAC16D8531D34EB172C50864546C6C4B6683138AC53A7F1517DFA0C891D
      38F0FD3A030776A9D3ABD7D0BA5DBA8C6BDDB265EF66356B46C68787B31F0D47
      3A76615F836536FDD2B9B3B68E46D3D248F4A1DAC5A58B292222D42D2A4AE11A
      1252EA1E1262F5AB5A55155CB366D5F066CD7AD768D366CCC0BE7DEBDD5AB346
      EE488C0B938866393949C224923A3ABBBD97BDA0205A2C2E56D98A8A128B39EE
      64B142718001EF1A9F84A67BC426BB72A532C6A4D1F4D6E7E757DDD0AE1DAB10
      921417167241987F1ADDDC5AE0ED5E1F106033C2C6152427E7E3DC7092292020
      1D3B9B642F2DE57378FE49E6FDFB41BA8C8C40BDDD1ECCE7E7B730592CCF20D0
      7389F4C50B99BFA76775854A155E9A9F5F58505A5AA87576F65048244139376E
      5873A5D28B4ED5AB67E1BD6C9BD46CCE782893E5A9718CA58A545AD39A9B5B5D
      53547471B18B4BAAC4989EAED3299591F8A2AD3A2F39F9E299BCBC47713131AD
      DD349A10BD2044165FB9C2156934E7E54141ECA48B3DB1B030E7E1FDFB0F03DD
      DD9D51C061128E8B2495EA2CAD6DD5AACAE5B66D973EEAD3E7D0959E3D87B489
      8AAAFAC39429939EAD5E7D2863E5CABBE9CB975FCFDEB1637DF6A347532E9E3F
      3F04EB931D63BCBD832F346F3EF141EBD6C7CFD6A9B37881BFBF99D6366C58E3
      5CFDFAABAFB76EBDEFAF264D3AFBA077B66ED4A8EED659B3A6257CF5D5DEE479
      F36EA72C5972FDD94F3FFDFEFDB4691FE223AD550D6AB5EE485CDCC0EBF5EA1D
      3B1113B362B6B7B717ADAC5327FA4854D4F2B37171070E56ABD66BA45AADC44F
      9253A7366D9AEDFAFCF3A90FE2E3F7DE1F36ECEEB53E7D6FEE68DC78D91467E7
      B02E12897A5F78F898B3D1D1C70E85862E996D36BBD392FAF583FEF0F38BFF2B
      2CECF0DEF0F04F977A7A3A436F4BA19F033E1E3DBACBB955AB665F1C30E0CF93
      4D9BDE3C5CA3C65F1BBCBD3F5CA1D355DF1310F0E55FC1C14777FBFA4E5DE0EC
      6CA4C55DBB3A6D7475EDB9D3D373DFDEA0A04D076BD468FD478B162A68456DDD
      3A75EAFCBC6EDDE04DE3C6CDD858ADDACF0723228EED0A08D8BFDEC363DD364F
      CF033B3D3C766E7675EDBCC209DFEE8B7176E6BED4EB437E3599BED9E2E979FC
      70FDFAEB6E4C9EDC64F5800126348B60ACB4F7183D6448F70FBDBDDB6EF6F2FA
      1A714E6D72733BBBD1D9F904D2CC5B6B34FAA31DBD3413B55AC51ABDBEDBF77A
      FDAEF5BEBE27FE6AD7EEFBB3DDBA0D5C101CDCA2578D1A433EC0D2FD28A5B2ED
      2A8361F18F46E3C91FF4FA73DF69B51B976934CD3E56ABCBBB89836DA9C9E4BC
      52A71BF08D5ABD69ADC974EC270F8F436B9C9C76CC35180ECCD2E9F67DA152ED
      58AE541E59A1541E07D62F57A9DE8F57AB5F5BFB7790C51B0CFAC56A75F32FE4
      F2855FC8643B17CB6427E6C864D7664BA557164AA527E74BA5BB66C964F3E72A
      954D676B3495D48F83A0E265AC46239BAC50042041FBCFA4D2B11F4A24CB470A
      C2F2D18230ADBF20F4EC2C08E15DE472A6EC2A267BB3BB2E3EE9D0552693B611
      045D1CC779C7709C6F0D8E73092252E317C0A131DE9CF295EF945D22C79C2E53
      8A058FE9E224D327E23876EF40C3A5EF24A814B8A82327B6C5467DB059DE70E9
      FB347D681DFA989AAD0B6544EDFB8CDDD26E8D78563349ACC5EE3B7F2B564A5B
      E9267A91A8DA3B82B35B6CA4C227FEB4BD6B904FB7DE83B6F6FE593C32A436BD
      D7AB06D52A7C7C740623DA31047335E6780561E95151D27E50BCE8DA3C3EBE43
      24ADF46C155FB59E3FF5097426B7F402B2477B716E41CEE48771686906361977
      1D387E71EBEF9B8E6CFEF3962F8574CFA667471D3FD7928F1B73561A5DECBD71
      B07C46CB50E29A8550706E31D1C30C12B5721264025959C1A5E793440D753F7E
      64BF8E871F52E3AED3B69AB7FCBEF96308B4BCFD1A9B2050AFCB92A12DBD2CE7
      12A8367B324E4D97DE4F232EC24C9C468EB78F4A4970D5128FC78A0516E2BD8C
      24F3339136D495B8DD89FE4129C3FFDA3074E8B002F63090C2345AD6EAF31963
      F6804030E0732EA9F9C40FDD4862466E4942A350B9764C037246D9894518DB01
      B6EFCE92E4D2893D8F685787D6487D5F42839E767AAFAEF7A07A01D428D69BF8
      943C12FD9D88E61E247BFA3721DF53F6FDAF6BEFB488BF5F91AEEA5885EAB389
      2E120A97FE3E9D497BBB2D80FB3E173918734E9B65E8FBD1D4B17315D2C3D3B1
      9C5A8831AE971E3B8E12D57EF8DD58D849761359B98FFFE7C28E9D8B28371ADE
      B5AE4E3232A327450E0E156F7E27727CD7A3BD27F66DB4061F1564B30332225B
      F841C6F08FF85FCED3835ABEF403EE03740A1A8033FEBC4242226A93C307084B
      B75F23D9CE6FC62FA3CB5F8D7594916468E2229BA0EEE4ED66F05CD195536715
      A12FA086900D2E2DDF31B0779C5F67B596594874E03651AB702210D1D105F5BF
      A2E7A7C64BA8D132C1BACE7B0A450CD81838F2FB831C476A258E1EB11AC253EC
      CC8D4C9204634F64594CCD236EEFE9FBF97B775EBA4185299920F903D947CD8C
      1C2369B642E434ED7EE839B836E79C857FDF83EAE7593994DA8807247925243C
      487364C9C6D65AF8D2EC44DAD7A33B1D1BDB9124CAC38C88739B6693A7CC134A
      F8C14F874FECE8BDFACF7B44971E6451AFBA46AA1FF0F23323DF9F250EB54953
      9BE3933B52B24DD945F6B425C61654927D0C241C8066E6518F39883E3829A5F7
      FFFA9E3AEC7A2A891E3E9562C6C54FDA29DA27EF14ADD4FD6C2EF9B4F88E1F9E
      7E62C06FC868E7033692E9DE03013395FA2BF360609E21CC414D569A43E78956
      FD14240CEFB75F2C2D52C25F43D5272E2543F03464C9D15CE0F70EE3DB9AA3D8
      A93C355DBD806A7E768C64FAAEEF88FD9620A52B93EACD81023BA481A9196B11
      12FC37A537C77AE9DBE76C350751CF53553E1E71AD415AE7636109717F18BEF6
      DEC8FBBC8CF1E6AB2351C5204FEC197DF2A40D6F767571F3F7F274AE1711E7DE
      36BCE5E09AE62AC7CC43144D58DC98EFD9C90FE6FA2F30EA568339F3D2DEB77F
      99D7B3F8CBB4C1B6667B0245A776F2892CA947BFCA1FA9627EE5187AB58E43BA
      21D76A8EF9E84ED3E3236ED64F98F5A293B828B38B35FE698FD2E8CD669B5333
      C50896C0A50DDED0618E37A1EFB918B6524CAD77F9CF9E91D8515C92DE57FC2C
      B1AD7D415A67FBE4075DAC6E3FA8EC866E92296F4ACBFC1C8999E3DAB7C9689D
      4481439CCEE4E5E675552A0467B420BB28E2A54E5EC1F9985C44FF38635D9701
      AA56C2704EA6182DB994B7C6C2923AC039AEAF2EED8F844BC552B2A63D2F6C5B
      A59AEB76B3DEC4E3ED204E8ACD70834A27EA1446FED0956BB475F1A9B30BA74F
      6F3131764EFEABA4E55625C263E74E7A74DB5FE7CEB8FB0D91ADE6D6F8C4F6F6
      E949ED6C75F6F85BA82EFD34B5F734CF5729CB7354EE4000F7F9A2CF9B4E9EFC
      E9748DA05A2ACF74F6B8C21F235F6717FE595E3A5DBA97CEF511C68BED4DED0B
      03A2FCD37CBD7D9F9CFEFB7431D2398C8308EFAB85E25CF691E62D9A4F4A4878
      14F3F7E5B3AA8C5BB97CBA35877BACBFC7E53D3572F1BE5F53F380667C60F540
      1FB956DE45A955F6C58242FE25FC6DDBB64D9030BA8888082FCCF5A3B0045D8A
      D7ED28E95992902E3EE18293AB53DEB960AAA9A94D8281A72C5D263E5FACB215
      17165B535352BDB0E3DE1BE9D76115DEEE289B59B36635C00ACD31A3D168C5D8
      51C01E08FFE0C17DF1DAD5EB64C9B5707A379D1810148857842474E1E205F64F
      70AC5860C14ACEBDC3F81C542B90393A20E13B3472CC9C87633746860302B6FC
      FC7C8E6D1786848690D1CD88C5032FEED1C3471CDE4824CC1E44994C2660BF5F
      C07F64BA8AC3049B4F9F3ECD0978AB909B3A756A064E189EBA7AF56A38D63FBC
      D9A238F6F96D32A90C2F50F1DC86F51B084B1AF87A114F0216B45353538BB1FF
      B60D044B20CD33FC1B1FB6F203E72BD3B97367369C1B8BB9FDA4060D1A18406A
      07B9B87EFD7AB6E5CAFE851CCBD605BCDEB812E7237E47B202A0B2419E1D7D8D
      F9A2F0AAC4C7C76FC34955F1D6AD5B224ED88BFDFBF77F161212B200E1414099
      719471D9CDBFED72C2BA75EBF6C51B99D7EAD5ABB713919A02EF4C88F0CA66F3
      E6CD3C7C1860911C978AC3E0327F78FF07933333C2D150D37A9BA3D306989F9F
      EDE8FC3D4B223E6DF15689DEC8CE4776B6A7CD8E93CAA3FDBF32F56A66F6F250
      775CDEC12396F339246E68667A23D96B44D93F7414B4DDE68BB2829C65AA20EF
      26BC019F4FAB11E6149E5D38FFE9B2704995A65EFF99A86056146F18B8CB96B7
      A0CA287574E408819797DA1333A49C8FB7B5664DFF162BA7DFEE1F35ED9AFD5E
      0797D7C8CA2512BFA9CDA967DEB05BBF8E6EA3F6F05B21C8B4563BFEAF165760
      E5EC79259C362250ECDFD07BD6BC20A957C8EE34871264E5568672E6C4793578
      EF6917ED4FE2C3E22572FD441793592D91C844C727D159328DD2567A3D49F2FB
      8EBFBFED73BB60E8ED79515CF8B41B2CC4C1552E112341A314B8EA31B3ADA1DD
      639EDEB9B78F8AB14C5864B751898DB8420B2F0BF2B2358F0D1B30C643D59A91
      1CACFF4F16CB881C92A1E3DA7C3A6EB06B922E66288CEE2C6B2496222833930A
      8E9CE5D21F3D15F5323B5F4B523C5CDCF1BD50B77D74597A9238E42262227238
      68D124B26ECB3E6754EA4E5117979A84943B76BB4485C19E88FFC868179F44F5
      1712849B85BFFA2A73AA36EB6BACDA7950FAABF42F899886843EDA8263535157
      2F5DA4AB771FD0E302BBD8C8CEF1A1B66451A62E248949CEB9C435123DDAF750
      55E9F7BCFFD5BD5B9B8E1A3664CE376BBF5DC734A443B48A1A322024B454AF55
      D96F156AE9375943F177B70674A6D497AE460E1139BCAB2D29C8C1A1BDB4D2F4
      8C4CEF948C2CA621B15EEBF6760DF9101AF2EAD56B945150CCB97A7889E121C1
      C45B0AE9E2C58B4C95FCF71AD2C3D393C3AB2EE4E16C225FB30BF7E0CE4DEEC8
      D163FF3B0D8925436C23F1DCFA0D1BE9FE8307FFBF862C6B59B0FF571AF2D0E1
      23E80344F367CFE67FF9E1FB114B977DFDC7E2A55F5D99BB68D1D9E99F4C5D37
      67E68C5870137ED21DF198FB4DE05B346D221EDCBBD7D5DDCBEB70B15AB7CCAB
      7AE31AFE75BBE83C6B7775D7D768DECB22551F1DD2AFF7474B962C11BB74E9FA
      5632FE976FD7495FA4A6FD2AF7F6ADD3A879EBC716D333DB99DC1F74C7B2BE93
      DA5D5C1F6BEA764E730DABFE7593DA357A6FDDBA05FFD86DDA1BC978855CD6B5
      40A16E1259B56642B04EEDF424F79681824F39DDB36F34E7A7E5CAD572B77C5D
      F55669C155E3A6B76B58D76DEEDC79AC83BF963BFE69466667B54B60EEC594E3
      EA2FFE5EAE7898734F70D5388B0A99CA7E3563ABE1AFFB8B5C2D3279814B6875
      DFF3972F36610C182370CCAE08A171CB961F69BC6A684E676E5196061ED3FBF8
      4905ABA5847377D672E69014F5F9C4BD6A776BC7020D27C89FDD3C7333392DF3
      047B49A52289C33D67D1A23F971FB8FFA2F7D6692F1A6D0FB736DD1369FDEC49
      7B7BDB3FC36DB57EF3B7067EE16399FEC7A567F16BB715057838CF74247AC385
      9B3665D297CA6A2D47599C5D1F956614CA2EE7AC37C6B5BD63DA7BFCAECDFDD9
      C26751FEFE82B3D95BF274DFF78A65F3670C01C716E035C37385D9DF173FBE62
      259B42A575092D91081ADB816377EC99CF457BA8AFAFE0EE5BD55A9AFC5873EB
      E481D490F0F022FF5A0D1571D5AB3BF458453647A10DEDD7EB637D50CC57F298
      B62F8A7849717E76BA548B7FC2EA6CC2D72B531E6B6D770E6BB03353929B53C8
      5FD9B571D6B77F1E9FF7D5EA9FF97123FAD9CBC8789C79E0D6FDBC7E29979130
      3C7DEF3716D99D13AEE6926CAD3AED9932F9CF9FE57F2E9FFCDCC9682868DAA1
      ABB48AF689F453E7BB9F1EF6A62E8CE4FC8AE0D7242B230E88F0F3185DBB7A95
      655141BE5F2AF042AC87BB77BD798B97661EF8F65331FF58778BB8B3AB983FC8
      AFF8742CDF8D25BAE6F972F8C8DC0EE037AD123BEE1DD94E0CF3E03EEDD868D2
      C5F6AEB9E2A68EA2F5EAC8127177575BC1B0A09253F80F198EC46FB87078D5C5
      41C0C2305C2E771F08A76619DDDCD3C5F5ED45EBB5511671CFFB62EAA830EB37
      B3FA2EFE6E429CFEFF61EF3D00A32AB6FFF173B766D37B2581D07B5B7A4DA8A1
      7704A44897A62008FA44090AA2522C0818AA52A5DAE820448A1443EF1D028450
      124248DD76FF9F339B5D368D80FA7E5FDFFBBF643E53CE9CF9ECCCDCB9E7CE6D
      73ED8A5CB030DC6DE5AE08D9996AD9E6418DF44DBD36FA75AFEB2F570C315C93
      3BA8166E3A9B3973C6E4568595CD277F34A59668FA99F6D51ADCE9E879F7FCE6
      B972EC1FA7E53EBD7A5EC0F135345F81E70966447F206672EF0F1BD477E23B93
      535F79A5E7893265CACCC4A1DE256F39058EBA5E79858E6997466D143D7BF5F2
      85AC29508288F87A00512E0BB974C9EB5F7E3577CBAC2FE79EF8F8B39987FE94
      850C8485CC76F5FACAB75AED5A3EB59AE2FDB166A1EE359BF531685EC24226C0
      423A8785D76FD0B4F1CDEA65C3334AFABA99F00D91A74E8125AEBBD6EDF830E0
      852CA493A67BA6D625B2A4BEDE4D6F7F5F3FBC10EF94EAE265327AF951A6B39B
      2AC3DD27DD4DDFA6680B79F761726729B854AA5B5CAC8B7AC1C71AE7E59FBAF8
      7DFB8957B1559FF9945835DB2760E90C7F59A149F7290F0B79FC58243A970AB2
      90D2CC99B3F629225E096FB36D96AEC295ED3EA4C5964C4D212C500324D1D94B
      66DAF0D51F77A5CC7B9E3F7FFAD68CE317AE4E67B27CF8E4934F777FB4EFCABD
      D8E849F71EB62C698A6F5BDE7823B284E972BD20E385CAEEA65F4A781B3EFEF1
      64C2FB8B3766960A7A8E859C0C0BA9ADD16AA4D22BF89AF428C1D9A2201937CF
      250322C938F5F571D668BC8B9754DCDCBE44F7D5F4E75848CA4C596AB876D294
      29699D537CC3B3D3BCC22C19DEA1E62CEF108B7FF130857B99CAA66C18B7F3FB
      5FC2423A556F73CFA071CD549145A9D3A8955AB54669BC77C9CD7271AF2BEEB4
      BFB8857CB86D8181CEEE0C90E34F79665E3AE47667C76258C87712BCFFAC85AC
      FF3F0BF99F6521F3ED4279056C21DDFC03D8E436465E09B2594844FE594EB255
      276ADA5699E32BC37B735024FADE582374B64F6E2B38542205CF62C6F78D4A56
      27D752D8E5912ECA79592A51D2F5937635C1C6A916EF6F907D4A55A7CF3B97E2
      649118F7E3354ABA7692767F649D32DB899ABDBB5AF6418DBE6E9B5824092B8C
      DE1A286AB467461FC1213CCE8878FB3BD93BBC1A7DF14A354E1689B16B4F51F2
      8D53143B7380E0101E976A327EA9EC135E9516744EE3649118F1A32B25DD384D
      FB660F121CC2E3528DC72D468DAAD0E7BD6B73B2488C5BF3076A7486F67F3E44
      70088F4B357A3306445539FAC248468D0E7C395C70088F4B361CB3004455384A
      690FE24598D70B2E56CC2E4A3528448D0ECE1D213884C7B90D467D2D88D21FDD
      A595EF75605181E83BFD172167D21B174ED3EFF3460B0EFB80C4E566BC866E9D
      ED1A2D161A15739C3292EFD1B277DB898205795CC626B713E1CD763C2E6525CA
      06914D89E336E57C21F46C32512D4ED41B3E47F60CAD40D9698FE9F309AD68DC
      AC9D2C167111C9F16C726EDAB533717438E62DC1213CE8F8D61D367B0CC20F00
      8A7EABF0E644CFD9C22A761C5938DE0F8947762224D8F17B0D1CBE0C92A1FC08
      F87B9CAD46B9D830210D85A005501F0803D8F1E03A84C8EEC58B17DF4698DFA1
      A0201C3264B062F09021FF026E03F7860C1EF4FDF0817D3F66709C6500E7FD8B
      7599C95696E30250701B3C64E8B6A18307DE1F36A87F3F14D60E18369AAF6609
      709C659CC73AACCB654461781218F9AEB013E21BD4E60C9F27BAB036D7BD23B2
      AFFAB61EAA22637F9294159087C9BDF98289D4CB4B3FDAB1A86472ACD623337E
      9B51E99C843CB66C065B93DE53184C43AE06B6AC95E85ED53BD1ADCA6A05512D
      AC0247D92670405BAB24E2FB9216A2B8C0A767FA04A69E4E2E9DB82BCEA2512D
      C65DB2B9AA21438694C01D9961E9811E83E3BDEAA43E7229F3935A966B659928
      BB84A7A4EE5D91246FD477DD0592FFB8271B41582BC1BDCA3283D22932888E0E
      754ACA58823BA92B95356BD6EC81BBBB6597CF5DF02F73E7AF06E1E1F4511946
      29BB9C8FA489ED438AC6C5884A78E016657952C4C64BCADB4FC9E024C9E14F9D
      7CE3FF98DC76430DBDBEB744948C165063A5C5F42B6A4F1A93A9171603C66149
      52618908E9DB3324375E45D2E0AD24F96105AE8ABE24992C920ACFF8CB5AE872
      999CB2114CE42BC9A61B2C9489CAE3AE9384656DA59B29248FDD4E52A350A2CF
      228970475DBAF58464A544127A4D625D2E83B2D71006AAE0E572682FE19E3F69
      91E384BE99588728D015B79CD7121D4EC0AD693568C092AB10125CA347B2A40A
      479C7FEA22B600ABC920C3F27224BF7F8068D876A28377B0E81DBEA50825197D
      2A4B4417B90CCA964298C844FBCD0A557324C8A0527D4F16FE0888CC1F11E4DB
      F152F330F45331F1D50B3CDE8F4BB1B28CEBD21649E8A2504ED958DE6AC9C81E
      53B165A3B38F95A57F4AD3FA36C3080D4713B1FA9EA418599324173467D57992
      D50ADC7D23D29A948A837EE957C6B5D14BCDD419C657A1FB811237A352F4FA1A
      2EDA2799D16695D377E8CB9D4FB501D859A53005122BCF91B4E63C49B8CF8F94
      A442B3E2829E9EE91FF2E4B82530F1FC66DC505A84EEF8EDB9BB8852C62EA2C8
      D9452CE60B66A9F05D04ADB4BAC14386FCA59D56B06037C1462062D300C2BC66
      643AF6FAE94599114120D81C3C1063C7A066103506C2017637E0ED07F62C5EBC
      F80EC25C4E952BF52C2121AA0464C004B0E338CB388FD3F9811A88CC429AF69F
      6921B36C4DFA4B1672F1E225D395E81F5848E9EB4C7FB721E7BDBA5CBEEF56E1
      0715C9F56062F109164975B43F2E6B55275A729A083B60B65AA2B0274E01358D
      4ADD427FD5E9D3AA0CD3877A7DCD8D0A747D4B0CFBC4559F7DB5FBA16B99011A
      D9D230C348D9900B57CA93641F3C262312F0326082D5164B43D6E5325C16E296
      4C54A08544A630FC360B89F52079F3A3562F6921F1C8BD86C9BEC57C822D24C7
      19855948AE11E7DB21A1FB61D4882D240BF908025BCD517EB65FC32605471D58
      1E21B27B4CF45C0B69D74444F31C0BC9BB085BC821D01316526DB23497241C2C
      6449210A7206C0B609D5403FC142CAB2D6D142E2E2454C9116B26D293C41F698
      A8080B39F96FB19018909BFF2E0B9985D65BDDE0FF3A0B696DD7DFE02B99A3D5
      3B87D6D56833E2DDCA2D874DAAD862E8E84A2D86BF51B9F9D0374A371D3A38B8
      6E7F4D48C5CEA76E1FFBDE6672B9483EF0C826375765D9F5FFD2BBCD1D5D83E6
      8DAE890744AB2B678FA8A6FC666C75F756CDCA8D0D0A0BFBBAD1EBBF38E72BED
      2010440A49724ECE9095577067F95A92852E3D30D3C93B4672C50ED7A8BC2735
      6914DACCC5D763A243B97C51418471CF330FD2A9789E289116BBB89346410F52
      32A93C2E010FACE741A1812E7DF395761008224EF35EAF468FA9B0F7AB98086B
      CBEEBD941EBEEE8F47E14BF7DD0FAF5236A0D4A865A7D2472F3999D17F5EDCE5
      C877F67FD070D84F3A2ECB1044A811A63D78C146A1C0A3780A52E3213FAE1556
      E6A6119872F6AA1F44BD81F7BB55729ED4B5A2EED37E55CBA0EFA6A2EFD6A1EF
      300D23B21281C9C2B4824EC67B4468226A6436CBF43843A6E7F45D7BF4DD0C2E
      9A4384057A914259511B6B8D94B01A78C5054D7D5EDFB9E0912614B5D608F331
      ACD16BE2743E14D477D79225DA7F3D9B9E64CAA4E65F4729512349562AB34DF9
      2F1CA0C5A2B158992357DFE9306B77C3CC0B8FC7885A83C75A23A3213B5DAD70
      230F278C1D8D913C9D4CE4E3821A82A9A0BE735263CD363C000B4B4A6CBF9908
      2307073EB39CD07F7A9C9FC1441E98FC66622A873C99DCB0B0C7C0262198DD61
      ABE0F1523E286064101EDCC2D6C0353194C61D1DE812214AB4ED93FAAD452A8F
      D7E5C338A3D962820E5C9E3C4E62C968BC448AAD8184E82384053AF49DAAA0BE
      B329731E1631164C05FF548E6606BE4482BEF3E6BEE3BEC03E89639B35934B2B
      15EE384B301958C2690E0B44E45B077EC35B4F65309A02D177E9B6BE63659E2B
      A369691E2E1ADDA60FEBA06F59FA37A0B01AF981FB2150A4C35673819201FB3B
      823C0EAF48555AB468C9DB0306BCD6BA7FFF7EADF1345414C2A85EBD7A476191
      85A8CE9DBB46B56BD7B155BB769DDA604DBB207777B7130512E1CDC34A1F7F3C
      735E9932E5EA878484D60F0A2E562F28A858BDC0C062F58A170F172851A264FD
      3265CAD6C3835FA9AFBDD67F439EBA608FB04ADAFDFAEBE18C79F3161B860F1F
      9EFDF6848986B7DE1A6F9834E91D03DE2B30B8BB7B18C2C28A671C3972D6306E
      DC3BDF7191026B84CD5CB65FDFC17D9E3E7DACAA58B19CB261A386CA0AE5CB29
      AB55AFAAFCF6DB654ABCEF87DD4F49BD7AF5579F3D7BFAF4E1C3077FC83B2025
      66B728B0EA37CCA4D64927050504C8A16161145A3C0C6FD38552205E0D090D0D
      256F6F6FA16B1D12D885B8A00DD77222F3CC9656BAA531CA2C7E4F11CF42F2AF
      49D8D7F00E01E1FD483CB9E24F783B11DAB06318508858F77E8E304A61D47158
      43ADAE5FF26182E4BE7C9945855A29D56A183C25DDBD7B17EF661BC8D7D78FF0
      DA04F67C41C4454891821DF757ECC8C50179CD1A2779E64C7703DE31D2849790
      1BA8F171C0850B659EE22A60C713EF25D2A0C18370B62E11BE12278878D76126
      D549A2A9BEEEEEE3B60405D1B5C993091D4DC54B97D6186EDE947421C594CA33
      67A4D40F3F249F69D3F1B0B78576EFDC49254B96A494C74FB8BC7DDF533C24F2
      D50605E9FCDAB6D5B9B56CA9736BDD5AE7DEBAB592BF2C48172F4A4E7817D47D
      FF3E4A9B1A4D782A882A54AC48952A56C2EB9E6EA81173C9EC91B4896841396F
      EF21BAD2A52565460629F15EA82A2B4BA1329B25C96090F17D434983FADF0B09
      21C5BA75F47B5C1C61C9073A70F0A0A959B38EAA1F7E58BB72CE9C4FFAA97040
      77767BFA54E574EE1CA941840B2C04238B159CC52695902FDFF0F4A44B234752
      157C1CD0C3CD8DFC0302C8D5D58DAB02F045097434FAE8E061A3D11F1DECA9C4
      9BF7B8F860E94454A58C247980D4722F2C4C79E68D37A858E346F4E04E3CF981
      2408FD89A739F186AB9A975A0199753479A291FEE835B72AB88A7986C8390ECD
      D51355BEA8D3491B7AF420AF66CDCCC5512B776F2F0A0E0EC1673535E6CDBF6C
      5154A9524BBD71E3DA751F7FFCE10070E473A1C775BA53B7B45AB98952B903B9
      E380AE401780C30E085B02AF031F02638072403EA718EEED3DB29BBBFB74E494
      019EE7D085A42E4C015D253ED0AE5EE9E4C4FB131F81D8B63B8275189C2F20B1
      39288CF145E5F1F1B7FCF95768C78EED629E938A4F58625D287BF9EBD7AF8B51
      6C17E489E04956EAD1A3270EA8E4238838DF69546B7242E4263DFB53207A939E
      F33763BD2DD3DD4EC49227C3A6E275E0921C15B883379EFDFDF9382092B9BCD4
      F707E74A2B72A5FE42E26F23CAD5348F8553E89143ADB8CF521DD2CF8BDA8992
      3EDBC48BB5529D3A75ECFA78DE98D83EDB0579220F2E5CB04BEC4476499E48DA
      82A994BDC3BE75ECB9DAD63D88227ADAD345F6119384FE708AC2765C1585C236
      9FA7E025BBF3911749C4A5257CEC56A15253B1757FE05BB52EA40A0866712E88
      A6F108C6F3D8386605C2BA5EB42BE0256FE2BD32BE7569E25AA97CFCC994F480
      EEF4AC2D746EDEBC49B63F512336E6B80D0F1B2C1396BDB2037300A1C7CD51BA
      7BE205804462B2B06D97AD721C3845049EA811C2E73AD968C41300D974A7575D
      6252D3FD847CFA4512695BF5A0DB5DAAD90BC6B7AF28E22C57E0DC4524E00922
      DEEBEFDDBB47782293388E07E2C56A03BCBEB1B90D2EFBB71D205EC5C7BC89B8
      DF504EB887898922644F10F5B09A024EFF598879BD2B4A9720A24A4095974465
      E873B9122A58C80748FC25F7EFB190153E4F47AD94B82A770CA1A3CB9B7E9677
      64B03D9EDB42F68FD253DB32F64C3A759FA85AC0B3B463ACD7DCDC3F2046B6A3
      C29F8DFF6D44621CD96AB17CFB315ABEDD967AB9D04E14370CEF3C626E54E725
      2C24BE9D65FF353B915D9227327AB71B6A99BB63598537CCA8108E5951241137
      D7AA6AF5E3F4B544A4D6F6381AF56CF3D34B75B61C93BF6682159EA8D1F32C24
      7484B391E887C590341CD330485FDA42DA4850D64EC2713C3DC681C00B354D92
      860B655B4D44228F5724116F1D1A1697AB26CCC1F297B290E34B9969C2684D01
      16F2181E8C7FC89C02A2B37BFCCF428ACE70F00A9C4356D857C1AA72D21ABC88
      7FA4FA119B5A6E0B396A5849AA4A2D6C99749A76E74ADB331019BE7021FC67AE
      C871F44CF5F9B1BF8D48E5F83BF3165E4732779589F2A6A15280B313C5E9E35E
      7A0EF95216F25DB7EA64AD69EE6AF086E94F6BECC222FBC846324CAF2779984C
      1C72699B9CE38C228958C95698E38CBC6996893E2ACA42C6A0FF5899618B2FC4
      E77F1D2DA420E23924DE34149DCD73482EC0B87CF9320734FC98D5E0CF0BDB4C
      A3E2DB0B197B2F6D2117E2CD1E2EA8F20BE4806C6991C8F18AEC23DE3AACCB85
      A585929D84E58E16529C8AAE5FBF4E679B43E26D28DCF2B78839242FE3C4E7F8
      7C4D162F5052DE39245EAEA49123476562A25557F4D13FCA4272F3F301D7A95F
      7A7DF17C9D8DE59BB00A4FD9DE78DD73DAB0A143BFC47DDC2FDBB56BF7213675
      7B74AE5BBE5FCD11E422C282497F6A7D71E6CA45C4EB8BB76DD7AED7CBAE2F9E
      8F08A79D7F6A7DF17C44B826E4FE67D6176722257B36E022A5BE71E3C6F5D1B1
      3A6C3916F305140E9FBBBE382BD814398E4B82BEADC68E1BF719AECF5642ED70
      195521F22DBB579162CF332326949F79D1D28C2D5385A24D865DA0C0F5C59F5C
      3B6FF15AF64EAEDADBCA209C03A2F1B98820C4C2641E251A376AF4F6E8D1A35F
      691A11E18945CC68D7CE5D8F7F5BF6E5EACF2BBBBCC13A0EE0C3691710DDCC47
      841D548945829A6071B76834B31E3E0F26CFFDEAAB83EBD6AF1F7F7F70ED4C90
      5C046CEE24486A70221F110B7126E95DA3468D373EFAE8A3D138A334CD9933E7
      F343870E7DCA79F2BBEDCA21B491716D7E44BA50976F7D71474D2603A638CA0A
      8DE325EEFFAD2F5E68EF10CDC25A112FB7BEF873C8FECFB20A1C908EB559BA78
      F904EC8355288F266E5024E2D2C7E4C1430718595F1C8E38521860C39B474436
      8ED23A69EC2A7C6BE3B7D8FD971F3D4CE2416925FAF187CD17EC1A8544980486
      DF9E8B551A4989655F7127CB2EE31A6151B8F262CD47BB141119374E51757272
      D292C96882E499E37B2A26B31977FB64BB50852307EEF7BB525676965DC81156
      B6F50B5F366399A801CA9AF0AE0C6E2A88433BCB19D2FAB59BE4B2654B8B29CD
      139386AE67B9A3DAB819A054887B24B8D3033E7ECC8FC4A5338B05371570016A
      7782CB6426B041D9AD6BF768BE7D939165A08BD99E44C542C825009F02F37023
      A51DAE88BB92C21DEB1779E218E9EE4AE1219A66A58B6B9AF9BA4BCDEE279B6A
      28BB76E91EEDE3E34D499944D7A5005C3D7627151E3152A133D5B83B8CE5AAC5
      7D238E7337F04141896575B0C203697101FE766216253ECC1E20AD5AF1BD5CA6
      6C19DA97A0266578387979B892C980FACB1634110F7E62FC707F21C02D1F1920
      DC33C1FA3CB8199E86953E4F5D48894D7E62EA23AD58BE46F62D5E9E7E7BE241
      5EE1C5B086289EA63518D11F46DCE1B0DEEFB0F50387781A0037C835A451CB74
      333E39E3E6ADB4B15E2EEAC5D2A2A5ABE46CFF6A744D1B446EDE9E9481269AF0
      3A03FF2E17CC0B7CFF97B41A15998D9974E674C24F9959E681B1E3CB3F96A67E
      B1427E1C528F9CC28AE1E79D300C408196E525B0A5D16DA47322BA712D21F9C6
      F5E43187DFADB29AF3A4013336C986703D8514F7A56C83840F91B1B86048E828
      6C793262CC9D3B73F750EA93AC5667A6D54E636DA9D1BF767E972C7910DF5763
      01C61B0705023C428E9B5B3C18E75F9851EF8810FC777BA2D971D88DC4A0F933
      6D4587D5C2F666338240227D6C2CFD99BF631111A8066EB312FEB846FA3D7B88
      5E960C24C79A35A367350219B6273D7710B14E5EB04DC991599BC609583C3B51
      D5AA44FDFA11FDF20BD1BE7D9C4BD4A409E10BEF442B56109D3E6D9571196B8C
      143961EE804958D2A103FB56D8E2B63CABD4EEDBB79A7EEB56A2EDDBAD192D5A
      587FDD9ACAED732D77EFB6CAA2A2E858DBB6A28F9E116DDE4CB4658B55C1E6CF
      9F6F8B5943DCABB54672FC76EDE858FBF682489523C21D5A73D19D6D1487307B
      112CEE6B8F3FABD10F3F10FDF8A335A35BB7E7376DE346AB5EE7CE74AC4B97E7
      D4C8D6B1ACFEEAABEC13AD5A650D39EFFBEFADF122B71A6F6256E58EE590618B
      DBF258E680674DC39D735ABFDE21EB05A23D7AD0B19E3D9FD3B417E0102A0E4D
      7BB6D578B877EF2EF25FD8E33239CA76A263B64ECDC9F8FF6170BE539B4B8ECD
      B6A5958EC2A2E25CC882A7460656AA3269D1D8F30D77B9DE5C9E6092757DCB94
      794B8CA3A208ECF93172F16DB183AFCBFC340A84C9D9D9F089FAB6FC8E5E9C28
      46AE8852E700FA754FFF0C77637A8ADA62CCAEDEE6E72190957F31A218590BE5
      3B80EFBEDD7D52E4D4C4077EFC320904EC2AFEB4AD5CC116927373E31B247D77
      EF1990C124881317E6F0216ECAFCD63AF252D14431329F6ABE46F86BD1ECBB10
      04D474C7DE721CDAC8385D74D362E48B28C40507D0706939E205BAE713C5C8FD
      51EA3BE01248CA232CD4290ACD89913D91C72408A8377BCF43E14444EB720A7E
      8BDA9CC889171A144C1423CF468996C023E075A048C71FDF1C092DEED0EB082B
      01A3803600BB4AA8CD798E14051514E601795D32043541720BE10B396EDA1BD0
      5C0A9C0436015C9BE097214199FFB917E801E9057472ABC4C86A08EA005D8162
      C005E0D2CB11C5C84128B416F000723947222D725C011E1298E388455B389FE3
      0AEA333F9C6A765F867C7C213CED0825DDDA441ADD390AAFEB075909CAF9E383
      C034C44700FD80E10087BD100E2595D340EAB3E03C759F7D871A0DDD0819E7F1
      1EC165B82C4456E78C6018C0AE227B4025C07A0C1FB3ED1B1ABAF606BE44F40D
      64ECAAB107F00F3A23B43B17C40600D581190037AF31C2461452F5231AF7EB55
      EAB7289E3C8B317159C81703ECB8053A8ED8C089113989FE3921076D694ED216
      D4E414D51FF019043D800F814500130E44C895406075CE088602FEC02700A7DF
      A336EFBD4BD36F9CA7315BF743561B1804B0CE2C84DE0097615D44AD8E5999DD
      07C97E008966F45D184F1F5DB940AD26B685AC07607325C8FA371C813360774A
      C43E060603DC0F83A9CB27BBA9FFD25BD47AD24F90F5057A025C836108F9C7B8
      2B3E465C09E4723AA4028040FAE04C343E5F7D9E66DCFA9D8A550F812C000804
      FC013F8043069741122758E8C89E88DD24A23B4029A017D00860D70576E93A47
      8A820A0AEF0179DD13085E01C93D842FE49888B75239685700EE006C258F82C4
      88F8FFDC3FA1079AAF6D1E014453CE9F22277CA900041144B4179802082709FF
      25BC88D511110492D651AD69C7F61D14DB275670080F192FE41A2D6F14412069
      D7BE9D784682890EF43F203884874CAABBA46E34E112C291C14762A9803FE447
      10483A77E98C0F3664228A75B45123E80B0EE1B1B4E63735650E81C8E3AF1F8F
      25873FE44510487AF4EC41B6B5D876EED80911D975ED4495BFAA2CBFDAF7555A
      B572955038FBC6D958C21FE4110412CEC333FD88625DA99DBB388CB4E970C24E
      546E7639B9798BE6E289CC6F977D4BF88B04D8ED7D6DE06B74FBF66D8ED3AFBB
      7FE530F2D2F84BB1E4F027D9E2E133C2E566CD9B8964E9D2A56961CC42111F36
      7C98F8EC0E27F6FCBA8783C81BEFDE88A53C7F76A2621F168B2034012B572220
      AA58A9A208CF9F3B2FC2BD7BF7721879E7833BB154C09F9D88F302DE0F882007
      32C485B391DCFFE87E2C15F2978B88757CDEF5892007321B49D28CA4587AD93F
      AF895E11809C8308FADFDF0BF5805952AA3248E1E2A03C06F12A00BB7C1B8D85
      CF850F9176B7CEF983A121C5EE41B13DC00ED7E3397801646A9C82DFB0C86DC6
      A854F3CBD4A8D9FFAA9797EBAE066F87D31B5B43A9ED7BC18A17E0102A4E5EDE
      7DFD3D3DD7FE6132363C15182C6BF0C02E79F98520B30B2994935E98A8C13BBB
      77D45C70F24E6AC7314F2A2B48F274758619983D1D4443F171319E4C205A94E3
      29718C1C8B79C22960FCC4CA55A23A962C25A3584F80DD0B562846FE508A914F
      D3EC474B504A03B063A23EB858AC4402EFD8C17FAE8B91CB237F328097DF9C7B
      E2B398994A7C965022E95F60DA00F919C0AC7881F1F12914D94DC6C4A23122F3
      CDB21C6BC1221688CF0456030300ABF329687CCCCBEE843EE17EF9C9AAC597D3
      A813E24D819A403DA02D10A1E0F1715F52F6BCAC54ED6A54B5DAD432C58B0722
      430702DC28527D8438BB49EC01710093FE86F0387018D80AC42A6CE3E388D9D4
      F8B29F6FBA93BBBB9902FC91473349E2807E42932E8AD8733CC5DE81FDBF99B4
      61FDC0FAD56BAC2FA356EBDC5D5D95546F640794A90F3C066CB542B470A76816
      3E23EAB3AB91E7BD461C1FDB555571D2A6E3A8B14718F7011E6B4D1B8CDA180B
      2FFE2C472975885E4399A99D21EA7BB54CCBAA9756BC1940155B25924770144D
      F0E71DD38CBC229D4A269A413AF772D0AC40868C7BB8E35959DE30E1235A338A
      E79310BF98B37627116FC2F628521DE0BEB98DF000B003F80E7861570B9A9D80
      A640AEF181F4DFE624303110FC0937F5B7A4020B7778C73A1F7A794A5956C871
      235545155416A4801BBBCE1E8D5E69DC6DC4475D1B1D4F7E65C3959AED2B3619
      582FB842F3A0961DFA3FBEB4674D5A366EF4D8CA5EEC4FFC6E9235D9E5A318E9
      EEC553CA524D3BD476F32A365A296B1B580CAA1229A984DBA7064ABEF7805466
      C35317ADF2A2644CFDEEE8CAD756B4EFD4D350AA56B7B6B7EFA75A9F9DB15211
      757C6FBE9B42E31495F438BDAC0759329E64C89E0A97A06A19EA40FDD32C4D88
      39330BAB2318098B5264793999178487FA25A5642A5F373FB9324F8A9C3AB7BB
      6789062D9C5D3C33BC5DE89C2129E15AB510B7DB2323AB3FA4A64D33E8B7DFDC
      431A0C6E2CFB56EFA70B2ED746A1D2E9E40CACDD289B0C6A9556562AD40A1FF9
      D2482978E2B2E94E1E5546A99D3D3D74AE8A6C955699A27356DCC75773EEBAA5
      DF3FB0AE57AD15A8F1ED066336863C7A701F052ABE6121A5B39C914DB2515278
      E934E97EF2D53152B1D1DFCD523A97EF27AB5D7C2D5A5860177C03D2454D2A53
      62E2B57D3BBE1AD5ABD7D7F3BA967DFACA37890A27C5B561271E3B7D9496217B
      2B3233F19D5959E1A15665F91B2E0F527A54EBD94361F1A92EA1E992C96481ED
      2595F1C93DF9E6EFEF5F5B327E7EF78A7E5943677EEFF7C4DD38E99A7BF1F753
      951A2FD2AA24522BF126B152767252642A52AFAD978A0D5DB5444D65BAC916B5
      BBAC82C5D0AA64B5AB9419EC6D99B9767CF52F8324654AA5019F9452787B0D79
      A872A9A474720B51EADC031592061F87D4BA78A9144F82B3AEF790C2066D5CAD
      5414EF64CE7AA8E465E0955A7F27D2AA65670F29CB59276DAB1C2C2FFE7648B5
      6D41817AC5D3C4635827BC8E8FC23F2444E91D12AAF408ACE2E1E5ADF135DDFB
      462A3E68ED563CAB502CF3FED11546A339CCC5BF793F952EC4C3A250939B8F33
      DEEBD72586F9D0293F0FF5299D56BA93FAF8B6F6CEF58BD7574FEEBFC989489D
      851792DFBD21674BC1DD478D362625DCEAB767D3D6393AC9D5A37ADF416E01CD
      BAAB9C43AA289D3C9CFD82BC94A1416AF276331B654B6A42EAC36BBBB2931E2C
      D9F4E9E813B8258D018E6D9AE3409C13CB09DC42AA942956EFF57EE5DA7E3AA3
      7EDFAFBF6A3F3A6666D75133C6D78EEAD1082A9E006EE3CB4A0E5F06EA9751FE
      F7E87A9669A1A83BF1066618E805F11308F11458E3AE8314DEBEFE05DA29A1F6
      6FF19611051F55AA5F07663338FD223F84EA3F5343C1D7BDB16C96AA59E497DA
      7A75DE5438A9DFACEEE37D77A54AF9532BA2E2CF34F3C7EC444C926C36362F15
      19F96AE9CE9DA49062C5E4B0122528D464946BB9BA76EC2549D37A11F96072A1
      56CD373642381B580B4403BDC5585886E660B4BD5EBC71E31EE1A346C9F7A77D
      A4BCBEFF804253A182C2AD562DB3FBEDDB52A08BAE1A3E7E58764FC341638C4E
      6E9D31904AC156F8A26E158046C2A85752AA3B4A756A750E1B31C29038678EFA
      D4B5EB574A2914CB9EDCB9D3CE77CC98861A0F0F93EFBAB5524F574DE7F3EBDE
      A22D8D87AFB96B31AFC6CBD1178D2523D01B645DA6198C65B4952A2995CECE8A
      E473E7A44B0AC5BAEA16CB8CD7D2D3FB1FEDD1E36856BDFA2A75AB28A5A79B07
      0D6FE845F5E87BFAF1F3C8C3C64F23AF6292C19788E68BA60D55285BAB2A56A8
      EF51B62CA56DDEAC5066667AB597A40BDFA4A59DF8FACA95AD3BA67C3E20B47D
      0BE71B1D5BCB596DA32C55FCFDAB6EAA52BA94D6CFF5E09D33579EA222D6BBEB
      E7CCC6D9A69414051E5954EABCBD4CE524AAA253ABBF8E216AE4B1A774C0E8F6
      0B7C97E3D597BB417E92CE6C31BBBABA52B1D4D4B287576F75661286A811E672
      4F7B5CBE1CAA090AAAE915192965C7C69A83B49AC00C83B1EEAED28D5F7B145A
      CDE37440F85B1593F7B92925A9C4A123BFC7190C8AC1FBF71D3CC724F9B0DD49
      37E7D6D4A9F2A3E80F8CB7140AD3357F3FF98BE65D645DF4917856FE68C63BA5
      FFF5C1D898761D5AD6E274979E911287B9B0160F41CD8691FAC1CD754EFC279F
      CA0F268C37FEF1E54C39F6D83E79FA57B3AE0C1CD63B3257813C09852DED0592
      D2380C6B9FA64D4C7C6FF29CEBA181AAB436ADC9D3D943AE5BA54269AD4A3DE6
      E3CFDED3F5ECDD49D5B57B7BC956AEC0701FAE4BCE1DD15FA99E9FF945BBF7BE
      937FDCBC56DEBB7F87FCC9ACE8A363C60EAA8B420AA040A7C2F01E899C8BC0F5
      26E2F53C7934F8A2B685BD4A552FCC59EF6A39537AC1FC45C3EEDCBA7F123A85
      3A1572E6010E0E6719B2E5B14552D698F1F6C45BC8E02D6BEE898F13AE5BF363
      A11353BE093506CAD5819AC0756011B01723361BE1FF7B27E5FD49BC8528E7C8
      3273C24283F8F85BCEB64CEE235B5C84FCA2E98A15CBF94D5F1DBF91C02F1388
      0C78FC0E0DBE85841851EBD651B97E281F515656162BE8A4E1C74401225BC849
      EEF774BA30CE8513B9908F08B93A40B8EFC7E84568F3B65E21C797E2EC7A9C6F
      2772EC1B3CF74F61C89DB81D5E1EC7721A677D45DD31CB4EF427FA86BBC0CE65
      27FA137D5370D3406DCF28AA6FF08434D4733B7E7BD53E6E5EB46FFAF6ED979B
      0529D59FE99B2B572EDB07223884C3DA122F3D6EEC5D2018723CEE6C7BC6F3FA
      26E28B9BBA0A9F6370466DE4A2B6EE207E456F795709CF74B23807795F6DCD11
      8BE0792F56B282E8238EA4CE2A2BAEC7E2D3039C14E07D8BFB50241C3C7E9DF1
      D8420701A24A1717D7E89EB8BC8C2FE44A23478EC483A83E105B1DBF4E8DE78E
      F97BEC34EFB05108998423C1FA0E14B2309AC4DFB18553252C19237FFEF91C71
      D5F81EDECDC67721889FF0E547848F1C398247DB8C1484B533EA2EC1524F31C7
      4439F672BD13B9B096C42FE7D83A2E13CF14EB30C3633D0126B4A5AF44AEC68B
      63B5300979F68AA750628F89387C11F4DF24CB793B9CCBD9B71A4E3B394D3D7B
      75676B391C892E00DB6F4E735B7E403AE6BB2E247DD7458F686E67ABB1384E81
      2404D97B42C3C2068F7AF3DD27D3677E7370FAAC6FF68D7CF3DDA7A1C54B8EC0
      842A3647076A053B7C2C42D46455EBA8F6F787BD39F5F64339E0EC8FC71EFDF4
      D3B147EB33B4C1BF8E9B181DD732AA233EB929AD0119D7B24026AED160BC02E3
      DAA45557E5C25DD7BA1CBAFC686AF530A71ACD2BBAB59DF1FDC5F9BD3F3D32A8
      6D876EF742434B7883610850A063A29E5DBABE72F6F0E5E4FB47CF3FA6B6D53C
      57EAD44A2F3C356CFE6270D9A55CEAE29DB483ED3B753F4F92A217A70B820AC2
      1AC1A12593630F25DD1BD42AE4EBD42CB34AA3948C4A85C5A4554BA6F77A864F
      3A7F27E55EBBAAE1666CFB6AD02FD031111ECEE5879C6565729A31DD84CB791A
      A5D9A0522A0C2A05655D49CCBAE2EEA2E5BE611448C242263A7E37FE7A76985F
      A0FBE2AD378647D6F41BAF248B41A992D233B2E527FB4F25FDF4C1AB1507E18B
      836A6CBD935CA820483D5EE93628B458E81B6F4C9A76AAEF4C5EE892A84E45EF
      41924C19472E247FCF85BE9F5477C99C4F3F68703BFEE6AC75DF6F10FDC67286
      7D1C71C6ED3BB79376FDB25AB77C7CED35A33B95FAD8DF53A30DF0D2E826F52C
      3776F5C43ACB37FFB4AED8EDF85B89ACCB850B026F3596F7DBB97387CFD733DF
      C70773134A74D37B37EF54C3ABA373567CE32F3E9D52EBD79D9BD5F5C2B2E465
      6F9478F8757FA737B9405E701F117E290119CD31E006CD9B3BEB15C46B02EC70
      099066237FE992D1A10F1BB61FE67BFE78EC2773FB3929C6ACC8FA9C156C906C
      FB9A4D505838B79FE6CD90B2F566D469DA451777604BD6ED8B07DE19B33CEB4B
      7B1F155630AF7CCC0AC397772F1F8E3EF2DBA6CC5A8DDA39F98494FFE4ABBE9A
      A1363D5B1FD9D2CF0D41F659C2E5231FEDDBBA24A3799F6827A55235C75640F4
      912DF12221C866CCEDA735AFFBACD71485525AFC2265FE6F7478562B6CF6D70D
      AD15185D5992BE3E8BA7B791E478C84A8B5CDC55A2DF3BE796DB750E4211AEC8
      3EBA9BCE8B2A42B30827CD3C25CB3A4C0DF9D78BD02D30DB56B397DAFC0532FD
      DDC25C1DFB67C8FFC14D731C277FA669B6F2AA171D2785FDC85F2D9F8FF7BF79
      ABFDE3F635A9D84AABED79A7BA7543B015B00D7B8EDBC6C94BD9A34CB395CCD1
      7FD171F2C2C7354772C7F84B1FD71C0B1714FFDB0CDB3F8F48D579E2026EF20C
      7823000FC0E69211E14C1C1AA8B0BCC9D0118E9B36BD76C5F077E6BEDDC763F1
      E4D7C8862FC7F7F6AE592EECBD62FE5E85E6816122201C1FD746B4AA5F89E66F
      88A50B37789A24E4B9BC313357E74A970AF5A796F5AAD0F14BF15CD3CF385381
      71E095916DA66B771E507A7A5AF59494C7C539E393313DE8BD411DE8AD57DB08
      B08CF38092D76E3F48B3EE0FE4CD7286D4E9EDF98FFAB66DE4B3EBC859BA9F94
      C2B222111EE247752A97A6B53B0EC5FF3473A4F86105666CDFED0649A9D020EA
      D9AA01BDDAB6B140CB7A55C9CFCB9DF069306A50BD42AEBCD2D0DD73F41C9F20
      7E4B397F52D3A1D35DDCDCDCDFC619633F34B3648E1C937CF998D96C5A83EF3A
      78ABD46A5CCE9672E5592C96EF9E3E4D5DFADBA2F7D2B90C13291071025C012D
      C0337C0B42BEC696894B93884ACEF0F2E6314116885897FE8B775A34FD1FE6FE
      B6CEE67D8D12F8BDCDE7B7B011B2DF8449FFEA31D1FE44246E631F190C202A1C
      8F211129C27B3378CD9AEE1858E365A2A605E9BE1011469C024BC352F8575F75
      C2087D57266A9E974C342DAF90D350CE79DA831A19F1BEB2E1E9534A3C7182FC
      BA756B1DBF61832BF2B9EC0ED6657082C3C220FA267CD1A2CE49BFFD86CF1FA6
      91874E47AD7AF66CB866DDBAE9285428D154645604F07A3729D00C65E9458B3A
      314916DE0C3BF9EBAF875866C0FD01D46832EBD9206A74F959EFB78BF8FE7B3D
      252490392B8B325252C846B265F5EA3813D18728B01D24B6F2F61072BC1A9C93
      84C2E41DBD7A4D6BB568913E152F4D26DFBF4FFC71A9B33B761C04C934A86D07
      0A742A962E670F00D1768C95A0ECA143473578EB2D7DEAF9F3E4ECE2424F7163
      57C25B9250E12673900F0A962C97241220725B85C7957C0E1CD0FF3A67CE3177
      3F2C02ECEE4E397D2248F0435C241F04518E14B785A428AC69F445D3A64D27AF
      5728961CD8B2E518D68B1004393A850682082616572BA426AB57AF9E58A54A95
      37919E8F662EC0AF4F5EBF7E3D5FD562144AC21936A22A6DDBB6EDDBAF5FBFA9
      102E01B04B0923CB5B886F380D87ECB94E74366AD077FBF6ED5F43F304F0A7DC
      DF6646FED4AFFF5B0BFD6D4D139D5DE9A3E3A4D16A4905A8351AE20BBD4A95AA
      2F9A3016F8020B27ACE4F58F8C060399B2B3C9009C7BBF26B29E3941F42C698F
      F545E1B17DDB05EB576E496032CE58C95E6150E5CB90E5BE2693696CFF0E61FA
      F8F86CEA1D15AC5FB1397E2C2603ACBA92BD82A0CA250409D60F1F3BB04B29FD
      F9F3D85591999A6AA05EAD8BE957FC72FDB96476224C6FFA9A0C86B1837A54D0
      9F3A95028A67EEDCB92798D614D7AFFEE5F258E871C64AF61CA1E20432FBA223
      C70EED5D4D9F88E51A7C7CB458B8348B1E3D4A45C7CB58064341E7CE3DA6D60D
      02F4BFEC8D2F904C10990D86C620A3F9CB8ED877CE46FA407D52D2635C5DF7A4
      7D7FDCCB91F3110DB73A25A9312AB012B03B15C740321C13278EA24FB11684C9
      14976991F071173565E158C29B1BC301D7E325A1834999081D3D4164135860E0
      B3323244325581E6692CE42469C900FBCD4227676752F0B20C9CC8033B91C968
      A4F4274FECD9492A1D25E383104A3516A0C000E40C234217ACEACD8397D38E10
      44C9FB9752FAD354D254E966CF4B06510AD61A51E2CA2F37CD9691B26A0C9912
      CF114D87E9B309110AA2A4FD4B10C51BE70967491BF9AE883F516A294D833BE5
      D0C0B010B2ECBD33C8FCE08288E7F5A0F64CC44A597B3E2665A30938484BE4AC
      869544FF626890F9C02CB23CBCF84C394F4CECFDB0902CD6C20B075C140DC68F
      279F326511B7BAA42B972DBFCF9E8D040E28741D613AB63402311444E8582333
      248F805414429510CBEF5807738AFC19FF3C89E8A3BF52AD9CFEB57E3B2362E9
      FD5C5CC88C81400FD8DC3174EE705B82C3D841011CD8213A9B770DBBC41AD1BF
      D22A586F34CAD8FB255AB72BC12A7D8E2F886011F3A9A4A79B614A4C586E5F25
      DE56C9A7904720889E3C7A44CE987538E66565994064408D64E201E998978165
      D649DCED7E26159D5D62C25ED260BF7271F7B0E5C4B56B12AE7FF8309B7C7DB5
      B475FF8D63C8A805507AEA1358836CBA392B92933CF910A1A811C7F8579FA63C
      26ADCE999358BAD944FCDA8B24A9C5E18785D99919584CC8C4D17CB013710E0E
      4194959E46B8040F33FB88D8426A349E64843DC2D9249F7AB25A81104D2B3E7E
      4F0C36B9E3E6A6FAF54AE813EE3FA5003F573A7AF41637CD4E80A170ECD6EC66
      6238A09C908BF911CCC47EB6821DBAEAF5551A57D0576E545E7F375B49A91A17
      4AC0073FCAD62BAB2F53B7ACBE76B34A7AD6637D51DAC1134DC32FAC44267DBF
      6CCFD866FD5BE80FDF6273ABC497229C88AF6BC07053195F0DC56E8C3D861A7C
      A1D268563A7088A84AF8F0988C3B7CFBA22D63AB0FEEA23FF9F059A796F250D2
      1F2B7E1424981BAC847A3EA76249DA1FABB035CC24F9965D49DE65286EC1DAB1
      61AFF7D55F4E252A8107322E2D5A294828F9CACA8C339BC878EF2CD1D7B94DAD
      38FC30990D0AFFF2A46A3CB1AFBACBE2B8E05DB2CC21A7596ED3E1102DC85D96
      059C01C0B05228C29A805E5173F00445876FE238E4740E4A22740204894359EB
      793F3A90F3D0BBE48A088F480961412E13C2A780C946925316A27F9A1323FBAF
      54CAD634C55F21712C2BC6D11A9C1D71EFA2B7A390390D986CC669956D48AA20
      C89BC7A3A8F7B3134672AC51140A4FEB3169929E4394655204C289BC8E63C716
      94271404110A127E7DDA2B1327EACFE13B23DD70D2C76968305914C79B0F1AA4
      BF7AF52A35EEDB57CF692E837CBBE35A93C59A9CBCFCB3CFA6751A3E5C7FE0C0
      016ADEBFBF7EE7F2E5D338AB6EA74EFAB367CFF2BA88B47B257617A2C92C7784
      CA96409BB79B90D81013332DA25B37FDA99327A96CE3C67A5EA3F5F0EFBF1316
      78A36B478F1E435F4E46A1ED08A1FDCC41F62CC1645CE5DD1B374E0B2D53467F
      35E7BD3E0D66698FE3E305093A7DFBB312CF6282E82ED2FC0B1A842CE0B811A7
      EABCAF402496EBE199037E88FB92CF71F39D9E8ACE16CAF0A0283AB6AC97975E
      6732891D8F773E06CBD0F469AC03D57C8E2B601346E157A73506894DB0FFF163
      61AB6DB2BAC8836C5A4E7EAE26AA58885FE2605A47287284F13348D0C4C91CDF
      F3F8B13DAF0D7490370DF25C44C2AE8441FA0A51D45BF862F0452F2F99434E97
      20584880E32C73CCE33236530215CC11ADC3BC1812656BE1ABA90340569B6820
      D2A58150200408AF43F41AE7B10ED2E580620511B923C30708CA813F426F808F
      E19CE785B81F60CBF745DCDD91E86F332320FE87B9BFAD69B946F65F69E4FF88
      8AEE3D55CE11244622D217ADFE4C43C6C3A4C0709B44D90E31135174BB61C3F4
      81E5CB0733FCCA9409F629552AD8B3448960AFF0701172DCA378F16006CBEEDD
      BCC9466EE14F282F5C19F89F6347BD3760807CB96B57F96CFBF6F2F156ADE423
      9191F2EF4D9AC8071B37960F346A24EF6FD850DED7A081FC5BFDFA22E4325C16
      C585438BA8583FA28FB18B57149217F4EE129D5F41F42FA8DF0184E3BD9BF7F4
      00A4825F10ACCB65B82C8AE04CD2D11408C94B7A7FFB24E2BF781779C9AEFD7F
      A0FEEFB1907CB61DB9EC410CD0B7F1A204AA3FFF16D5FAFC3255FBE40C5588FE
      E3B9ED5239E6E2ED0C4EB21560707C257B2F0295A3125F8CE2F4C0CEC5F5CB7E
      BCF5DCCB85ACE7885C447CC58A331F3F36D1808EC5F58BD75F7E61B202893233
      4D141F9F41FD3A96D62F5D7FAEC0CB85FC838EC845C4A7999C69345AB03A4516
      1D3A944C5D5B16D77FFFCBA522C9726DFE52EFEC679EB8168D4BE9AF5FBF2FA6
      3C2CA85C29987ED975E5D8B54F1AD7E2B4236C7B7FEE1A65660A9D07069952B4
      2E225EB9A4176DFCF984F50C52480AF67213E1FC9ED5EEAB5DE8BE8B86AA0439
      D1D6B57B05895AAB5DC9798541E59861BB4C98A876A500D8DEDFBFFDC14A82B3
      EAEC3BA7A1DA0A28D8E522B26D7E955645176230C397A42FF88438EDF446EB09
      314D289805D25C44D9A73790A27C47BA3577E931F9D1A52F2C177F59C99714A1
      57A4CB45643AFF9393C2B3F479CA4A396D39BEE42C4A9707B272F018613650A0
      CB45040D53CEA543965B38ED0033E285BA5CE3A850ADE764D8C6D17354FEAFB2
      B86A79D0334F5A5CFE2A4C66AB7741C7B55EB6CC970999A8370A4C073844404A
      783C5BB1A539744C23BB009753E557116E06B8198E6155C86C69CEB3A2B206AB
      FEE18CE27B208793C7CB6788AF02388E800A0B394F407EDF43848E1E37AD2604
      D5014782DD48AF014E031C727A00E2583E462D827C1EAA6EAD2E5F8D783ED4AC
      4B6BD09CB5C03AC0A1695CA383600F028A0A63A9A21A6A62D21A83B3E34D4880
      0D3E3BFE957CE8E49CBF9615D0C12B7CB1DCAC6FDCC0FB6FC951177A3FA555BE
      C39843201749071D49E3DD88167B132D02BEF122A9AD1311425AEAADA7EF7CE2
      7ADF1A29BF72E37599E3401341C29E202A87E7DC9920C68B28C6CB0F249B68A1
      770C08F434175BE81B2F3D64711DCEF597DB9E7E55E6387E2C8A96E1C7980410
      5B4A7EC36AE8C92443445D22EB45B6F472F372DDB46B231FBA17E2E1FD61354A
      D5D05FBF799DCEDD3C7B8C245C1B512BB6B3B21DD24890CC71277A862688C7D5
      3BDA46AE71B099CCF1B2BBEBCAE13B6A8A387DEE1E45F33CF10EBFCECE5170A4
      9596E813B7289AE11657F2A85E0E3D54550E3A5851E6B490B7467EC1257349B9
      A9A8229EBD1AE0D49D263BC7F99C2D2D7348039CBA41D30740F589ABC3BA3CE1
      8728BFE39FE3B1511A59D5A9BDB2070D56C58910DFAC85AC0C500CE05EC6E6CC
      75450CE27F925312EF373DD02D3D5C42C6CC7DCB376C44396FFDA4465EA7EB5E
      77A61E2E4F01923666E61FE939FBE5B3C6ACC6B0B7A2C188DBEF44753C3FA00D
      466F1B5AEDDB1020A9BB8B8DA41106EF7A80C330841CE793A01CAEEFB021AC18
      36E4FAF8292D8FF5FCA0FBD5A11F60F80F0548EA6ADFEF36A030933A867622DC
      A914A399592BE3CBC265F08A1ED63570C25AF3F21516D2B3C3A26D53E70D851A
      D17C8C522BB6F73EF3FABD3A7B5ADF8B3AD9FB1EE43B0092DA6347B6F64713D4
      E80780C3E208395E238705C1E7D829AD88EB796A98ACDFD5426E11D743A6CF3D
      E20062A01037A9408021C77D0AB361455C8F13430451B3A3DD64FAD42D0E20A9
      252F1E81576325A901087F0698B029428E37CD614130D919CFF060F37FE812D7
      E9687FB9F486DA72D5AD4D65421A20E9553B51080AFF0230913D04438E9B8091
      3E09BBCEBF9CE31A6C6E237BC59414648434B11CF95298920B1703C91680E3F6
      308705C178A7189AE01447435587EB6D6B2D7B7D5B520EFF012603692147BED4
      40C5851B81641B50028800381E41397F0A096FDDB7EED551DF725897BAA9EA34
      3CEF43E4E4A2A5A603DBD66DDCA5859E0C16BDACE763041D409936C04D228A25
      228EC792FDEF75755F1AAE8EABF44723D96B77493BCA1CAA23B39C902FD5164D
      6B865AEC04380C972489E36C0972A886AB890629FBD240655CE933B565AF3FD0
      B4D3681AD242DE41348B50F057206F189AC392130462B0B654F4A5BE8AB8E297
      ABCB1C12A7599EA382603FC0CE310C63810DA8129520BE5A535F9A40BDA438E2
      90F09D3BA29290B3A163ABD811F12300875510723C821CFE9488633F21DE011D
      1100B9178041466C390B0354FE89EE6F9B1EABB8758A1DE932872F0B4B6B17C9
      56461091D9624BFFE9D04A6432DB99E54EBCA15E904F7ED6102B91D16C97481B
      1E15C82277F7153FF6CE7EEFF95018012C004602C259890C26917811CF629147
      4C68B88E661DECC96479898CE2D798487E2DCFEEC3420780886E64CFC7ED687B
      2344AED8FC8A4537734B91250F0BB7932369776FED7697BBD66E449BFE3840B3
      9B3FC17E6C55134D93B28D76455BC4C6FCE676577B9F7C199536D28C17258DA6
      2CDCD7CDBDA5458D94B32FD8CA936542457B7CF41667413229720D7DBAB7377D
      DD2E43824CEE50AB06FD127782E6B64DB7D7C84A34E38CAD0282C4F2AFAAD288
      9F7482E49DE62BE974CA34DA7AECA2C863AFADBEBC48CFEF986127124D23BC61
      CA0A8E309B2D23DE69B982E21EBD2FC46F37FB4E84EC9D488AC6272172372D87
      C824B102C3F2715D0E283BDDB274FAB65707B5AC112AD2888BD0E619D2E93B5B
      9C436BD3261ECADDB4990D24643ABDB240B9D4D9937A47D408A4D81389B4ACB7
      391C727659F0527055350B6D43148F1709DF6416411E2F6BED08F3A09EF314B4
      E7D8BDDE860C51839B54C89FB569663CD995A360F9AA694E4C0459EB46590621
      3612E05A20F84F71A2B3FF4A656D9DADF82B248E65FF36223E040BE4B0BB23EC
      087C0D6C050EE780E32CE33C77C844195BB3386DAB91844427BC4DBFBA43870E
      9FAD5DBBB6CF071F7CD0BC59B36675191C6719E7B10EEB025C0681D5F1387242
      7444EDDAB57BCC9B37AF22BE96E781C784C5FBFEE9E919C822DAB973A7069F09
      D56CDAB4C9EBC4891381A3468DF28E8B8B2B89CC0580185F78905011D1B265CB
      0E9B376FD657AE5CD9034F68524040000D1932041846587C90DCDD7D69EBD6AD
      62D100D6615D2E83C21194F3C735EA55AF5E3D6F545963C053AA2CFFF8E38F89
      9F889A3B977F90A854A9CA74E7CE793C4A64E06C625D2EF3EBAFBFF682603B20
      AE3A7C874513BCB0AC45392C9CC0CDA4F0F070C2E3EA54BF7E4BD6C1139A5AD4
      2CDC4E84497D16CADC42E67780705CA3DF77EFDE1DD4AB57AFB459B366458687
      87073569D28476EDDA47E5CA35104A972EFD4E2D5B36A1F117A7D091E463C694
      D349779277DF5A8BCCDF01E124F6D1566C49A91EEEE9B78E8A8AAADCB367CFCA
      F1F1F141A74F9F76E3FCAA55AB3EC53722EF0D49793BA067F79E9E8B372DBDA4
      D89C55C1D2412BD3E064562126B2CD8F7CC0E60D529E4F872117A704249A6A1E
      A66B2D9756FA924A32F4E8DDA3E4FA0DEBCF915232E1FCF1280D491E065D41A4
      40840BE8106A002647E0E0BEF2D816D9A37955078988EEDDB4E7388D4AD17322
      7F21963A82CFAA5B69F95A882850B96735FDD975A78E0915898ED1F8D4E1225E
      A4C744B3DCF9149EE823D7B8E01B95640E71EA8E2F07425E24814DC146344E4B
      3446134323D47122E434FF804DEF1F174A433E7E148DCD3E4596E5A94034E1EF
      C4931304196205BB1A1E35A2913F454699C5FFF28D26FC49FDA313E457DB78DD
      5AB5ED71714E3F303E2006145B20ED0FE47395749556D9CA2C8F0E165B9ED764
      99BA78D3DD29588473AA2449B8C2633DC6E1D70277BDDFF46D9359CECECBF4CB
      6FA90928539CCBD8F2A41E93AEE2386EC6F37D4ACA561828DE186FCBEBBFEDBD
      8811594673AA4D600B9DD44AF736D36317784BDECBF7CCAC23C42AF69F289E50
      16655396254B7C04986D12E44AA3D9623218C507EB08D34CC3D32C633ADEBE4B
      737756F3874B950FE921D4AC4E754DBE4EDC246B92449C9FAA876D521A4C16D3
      D32C7346D2D3ECC7A999467E1D4F663D2C46E182C7B0791FE5A480A811622D00
      7F4038ECB8DCD47A1B0FDF76BF9B9C95E5EAA4922A85BAA72113CB4710A6E558
      6BD16CCE4524D59CB813F9D4376FC7263DCDF27773D6B8619358A66FBA70AC6E
      19EF8BACC808F6D2058CFAE6E07EC4E75F59D00D016623A822471406939CE1D8
      B1C969D9EE2A95D259A352283CD127419EBA20560464D4D0150FACAA11B73BA9
      CAB82D9C18B8E5BDC84199D9A6279CE08EBD7827C537F17186D6C74DEBF4FEEA
      E3579E3E7D7A9CF36C40BFDE922469D5BD150384489553A3FC1D4B8AEBFE5EB8
      63E3E9E40F63BF0F5F855D8C0D200AB1C71F4F04114705A4F2A37FE4C8F015E3
      9AB4BF9A98761513720B0B1832BC602FA78091DF1CE2FE88E187517968784BA1
      A495DDC859F2A4236B2A420B5BBBDAA07D94A17D3872DE88868D139233EF0BA9
      83E7D8B1777F9E421977CF52DDDEE731F33763CC29ED440A5D967FB4774A8579
      3BF66456E10ECD834074AC1B77EC9D9F3E1024FC1BD835A2150AA5CC21A71978
      57523765F248FF5BD3E63FA8B4F28F6DAB599817C60797323213CE9585DCC0C0
      D1D756660AD2D1C47FCD86DC8F6E36E481DCF4B51B1F211D9C07BCC90321E3C1
      EA83D013708B1C74772A97E1B248FF439DA409D55389A663A97185287B15313E
      A28129322C20AC6534E5F92BD042D67E65179EC176A362C5421DD56135BD6135
      938B9FCB3CFFAA6306C72BE92AC2425AF39747876077C4386222DEDB317A2930
      90FB563C00162DCB9629510D3D123A34F5B8CB851DF1CB6F4F42B61F7C128CCD
      3F75FDA7A5A3097F928D8877156DB88EB4160DA149942C3F7E010BE9050B5917
      34D8FB859FE365CA9994817FA3C9C89217B090CFCEC8A55A3D77DA3B560E97A2
      097F5C3BECA0437E7A37F2D5651B6E04EEDC9F58BE6675AF43CD9B06FC8E6C0A
      C08E3C32E6F03EC4179FFBB20302F451E58E3FC9B3DF6B756BFCF49DC5B5159C
      5F155278D8399BBDDA24BCC68AA5976BCE7AAF45EA84E9BBDDDF7DBBFA1C1979
      8E3BF2C5AF3B4302A2B2511BA3D12753FA77299330AC57B9BB420ACF662197AE
      BFAC5DF9C35597DAB5038EB46A51EC30B2C8B623CBC934FFEADA6E2CC243F37E
      EA684D80E6FA9057CA8DC830580F3D29A906EFC4A40C177F6F8B6240375C0776
      539C8DA8E47F0B2578B3CA1B37DFAC6CBE22F7423D78D78926FC1568212FDF7C
      5ACACBD335F4C0A9DB29C58B3927E5B5906E0F7DA6CFFBA8E5AD51EFEF2A7E75
      6747093C54A085BCF3382BE3D4B5D4642F2FA7DBC1BE6E068CB15C1652A5D269
      C67E78700AC2A94CC2F85316D2EF69099224ACF4259BE9C2163E9211492F6A21
      9DB3FDE65FD931521837179FEAE40C64249DA47440D4A85E9F8BD86A96298DEA
      EACEB58AD09D63A103E49DB199950F1CC9ACC4BBC3E1D5E5A3A990BF222D6459
      55B3573E1C1BCE16740A38BE25120FB166216418105AAF19B195636B57988564
      39E7470C8CFF10853C01374007A80105F00F7512768FBF5435585251FE6F6BA3
      AAFA84EDC41612CC1E4005D00700CE4086BFD65F46480FB21F4808850CE17DB4
      E202F084CD0DD2C2D96A14E6EFAEED38B153F9FE9B26341CB1FDBD266FBFD552
      FF76882E680583E32CE33CD6615D940E03EC4E859887AF9B2672F680EA1DDC74
      2A6F4C224C97E3330D5B6293AB36ACE1FD18F9C4F112818AF321FE6A45FDB2DE
      E52B87BAFB8F5D765CF1E049D68FC8175321DE69ABF68F2851D759ABF2C0642B
      5BA590D4EBB6DF09F0F3D26678BAABD2A1884515642DCBC6F50F4F631DD6E532
      9FFD70FE3AF2F70324557CE3E75E1B2746F4159D0109A6BE2EBDC6EEABD9BD5D
      B504AD4E9394916DC9CC48CBF4DCBEE77C992913ABAD484937A6EA344A6D10CC
      ED9079BF6F3DFF55C7EF518CA472A37E18B6E5FD96AFA665999259E0A456B8B4
      1FB4A3D988C11107939F1A45B5BDDCD4EEDF2C896DF4C5C70D17C727652410BE
      B45BC2DF2564DCE2C37197E67559C8E5A452C3D7F75F37A97957934536A1604A
      36E6D5EF4CFDA34F8736D52E299D34F759C99C6508F865DBA9721F4DD6AFB89B
      9CF988CF3B43BD757E13971D3E722DA6C772D6918A0F5ED36A7C976ADD8B0778
      28AEDC4B4BC07CC869FBB6079D351A57A732E57CCEB1D2954B49950C86B4ACA8
      36FE3FA6669A32B1A8BBF661CA53CDB25D17B7DF5AD27B27EB48210356F878B9
      6A07BCDD5D1FFE28CD94969E6DCA76216D850D3FA6B76D54DF873B930E1C4A2A
      D9BDB3CBD674CABEE0A255697D5D55AE9FAE8FBBFE24DDB0FCEE77FD9204915B
      B52EA4F22B5BDEAF64D50E5D1A940E2D17E6AB7677D6E88E1CCB0E3D7A5C5387
      95EAD4341CADABD7DE7E9A61C8BC18FFC8F8C3EF576F3FBC7EFA17D3C3CB179F
      9EFA81550494F07D3541556A79349FD8DFA7FBBCB77C5E5934D9A7C782714191
      535E67705CC890C73AACCB65002E8BC0EA140878F8FB220C06F890E387D01370
      CF8117427F80F3588775B90C978518361BFB8C88FC590FFBA7286A6714A9FF2A
      EF1F68213B8D3B4F58D993DF07290F4B3911FD1D098400776592F7C567C4AF4F
      3626F378E1CD9D01395BC8F3D8DAA9F92C24269E5DB3B333F706F95ADAD4ADAC
      32B769E09418E06D526566A67773735274FBA44FD52E792C642710860176A70C
      AF39B4BCD96C5C57BFBA5746C950A70C3596724C4AC9561C3A9EE83DB093F7D5
      CE8D7CE8CB2D174FD42BE7EB87B50D1461BE3A7FCC958AEF3BFFC080FDF2E6FD
      43ABB2994D919AFA646258908602FD9CB2CD66990FBFD2EF7177DC6B9457DDAB
      58DAF991AB4EAD6A5935A0F4C683372FA3009FB266DB2C249A561532E1A4CA1D
      7FBE31B0572DA38FB7331FCB09E7B0DAD93107C3A6BC59E577170FF5F52719C6
      54183BD74F379CB8FB76F71A7E855AC8D2ADD61BDE7FABC52DA399D2989A893E
      9AB3ABFCCCA9F517DD4BCD4C6059713F978031F37FBBFDE5EB4D8A176A214BB6
      D8786368BFBAD95E5ECEE9E959E64CDC6A332F5B79A8CEF081657F2027053707
      934F6DC09C8DC71F8EEF5ECBBB300B89698DCBDE739793A3AA56D13C7C946A7C
      A2552BD461C5FC534F9F7D5ABE665DCF78AED1C9ABF7CD55C37DDC939E1A3270
      1491D8429EB9F9281B6796899CCFC0DA00EE9F9DBF94D9D6DB27D3D5D94D9596
      916D3254A91C743B76FFBD72A5C229312844BAB7EBF8AD07A33AD6F48E4FCE4A
      610BE9AA955CE6EDBB7C1D44714CC250E2DCF4915AE572FD717A602F5C2BF076
      755192B7A7DA24CB1AC59163C6CAFBCEDDB8D3BD59186152AAC5950DEDADC464
      E5C26DA76FDFBF7A7273E6F503770CF72F328F008F5ADF80D2DD5BD5EDFEFBFA
      8841776F450EBE67881C9470B37EEFE3EBFD9BFE6B782E0BD96C627F4D50653D
      4AFA025C1681D52910F0F0E78C60C48380FF594874C2DFEDFEC32C249ABF1F60
      D7189EB09A08F7C27C7C96999979313D3D0D49AB933A8E3D47CECECE5D954AC5
      BC92A13A0A0BD4A47BBBAB3497EF64269DBB91CE638C2A85BB58CA16D3F924A7
      9A0CF1890697EBB73371EDD2320A17A736FDFC4525C124458D3C515EAD56EE8D
      A81B98111CE064C47D6E8BD922CB7B4F3FBADCA4924F19D6DA772EE94A6455DF
      B24A058EAB122912EE67A9638F243A1B8DE6C8EDF36B887DA4400B79EE56EAFD
      92813A7F35763E06C759065289AD285B53B6AA6C5D2113AE400BB9F9C8DDCBCD
      AA05164BCF36E34AA825130B33688F5E7A9452BBAC9F6B66B6254BAD9254582E
      C47FED0F273CCEFEDC319C99A4822CE4DADF6E5E6A563DD81B53C127ACC473C8
      BD27131E47560BF67E9C669D57BA3B2BBD172DDB57E7EACE1E1AD6910AB29047
      2E26A6E9F1EBA919D6B36E14723F76F9615AADB201CEB0E1625399B30DFE1B7F
      38EE7F7D773751A3022DA49F8713E688991667272D4FE8E9614AA68565B8E06B
      B058B0D00F9A76EDE69300B5DA650FD78651A0850CF671F13871F5617A8DD27E
      EEAC743E31351571972719A627E87CD5D31463E0B51BD938F976FF8CF319AA87
      97BFBDE815D468E4B1139EF34B863B790704AAEEE3EAB039D8D3DD2FF6C86357
      56AA50CA5D0B9951619103EEC69B02AEDFC8D2663DBE34F2F1BD0362D3B30E43
      09AF400BD9A0F789758C08584BB69A6C3DEBC28AB235E53200974560753C7A9D
      11F505FE6721D109FF2EF71F6621314FDCCE5D012B1485F0E52DA4AFA74A1377
      3E4DBA71379BC7168587681FD5AAE82A3F4A79490B99926A70DAB13FC1F78D57
      43AEA026F4D5AABB655A370E7EE4E9AEC1C3142F61216D73C892614EC90C9E4F
      B20CA42F6721F3CE21931E65852CF8F64AC7DEDD6B1D7EAE859C3AB1F5CD4C98
      55FCA2988CF21CF2AB190D636E3E4A4F6419CF21DF7CE7E0EBC30735DD6FB390
      DE6E6ACF058B63EB3DD742E69D43E23657D9986597BBF4EF53EFF04B59C8BC73
      C8E3984FB2ECA52DA46D0E59A98274979B76FABCB94C44E3A04B3CBF7C290BE9
      E7AB31942FEBFF68C3CF86564C8478829FAF93E151B2E9CF59C86A516BBF65FC
      CF427277FE83F00FB490CFBB0E899E133B2DC240800FA2B6B3EC17BF0EC967D6
      819E4EF5181CCF7396DD11C46180DDF1B425DF75C8E4F4EC874B7EBD72F9933E
      55A25873FAC6B3FBA7F6AE1AA4C58CB5B0EB900A4C75735D874441059F51F399
      359F613338CE32CEC31964C167D9055D871C317FFF6F9F0CA85B3D39DDF010F6
      E7C5CEB20BBC0E3975EBDEB9AF370D73B490459E6517741DF293B5471FBED5AD
      A65FC2E36C711D32D8ABE8B3EC02AF431EBF7C57E3EBEEA40AF6F74A43BF50C2
      83C7AE8F52B34C35CB86180ABB0EA9C299F2B185DBCE56E6EB90782442FD2035
      2BA341C5108F793F1F4F1ED1C1DB9F899E73967D8CF319AAD4939B9232FCCA6E
      9DBEC668BB0E89EFFC6AB49D1B94F699BEFAD03D561AD4BAB2BFABB346134A14
      C0D721637EB91A8FEB90DB701D3289F36DE079A0AF26B88ADEA3F924C7EB9063
      DD9BBCD183613BCBF616D72127F5675D14F605B82C02ABFBDF1CD2DA0FFF765F
      2AE8170EEDDFBD7AE6E7F37BBF33610CD5691069D7B1C9DF1E37724DFDC62DFA
      3896E52DE698167190B88B48215E41F90512E11753C1B1E5935973896B81B808
      41D01BF12D39F9883E7305123DCB7EF1588144DCFE827E956959CEF91C77049B
      5AC774DEF8166E0E9A471C22730B50A02BB046ACC9BFCABFCE711B38CD725BDA
      312C94C84149D40AE9426B833C3CF6C7FE733063D3A6761D3A74200E9FA3F67C
      A290C3274B71E1F2A543D770684B733C2F0A6D5AFCCC594732DF9E50473773D6
      51EE170E39CDF2BC249CCEB7D50A5364651B6C3A616F4FA86B93E5226285D098
      6FEA3CB97A55E4670A3FB7E78E5AB2C4A3746982BE0C32B12FDA89203CC224B7
      87BFBE981505DE9E3044840E5EEACC59229FF721E80FE17220AB5B601F2163A8
      43D97CD182F20B24C2AF2CCA57DA415050BE689F4D070AA279B63E42338EE2D7
      EB3AE63BF611BAC19E9F8B880B3019870C47124E338ACA679DBF04296ADA5671
      67756538DBACE773F5BD2106386D9FDC365F4B54163C5CE853B23AB996CA7A3E
      0B72BD2C9528E9FA49C4F23BA9C5FB1B649F52D5E9F3CE62B7A2415F6F135A2F
      5B43A9D9BBAB65AED1D76D130541BFC54F89D3CB1C96191519057803AF5C1635
      DC39A5932445BCFD9DEC1D5E8DBE78A59A501DF4C54672ACA11016E28DFBF11A
      255D3B49BB3FEA2E494DC62F957DC2ABD282CE6942BDCFBC0451235B0D85B010
      6FF4D64051A33D33FA6029DC718B51A32AF479EFDA427DD0672BC8B186425888
      3776ED294ABE718A62670E90A4466FC680A8AA5D35E5F60572ACA13DA380C888
      1F5D29E9C669DA377B9024351CB3004455845ADA8378ACB49C811A3DABA1C828
      C41BB7E60FD4E80CEDFF7C085EB71CF5B5204A7F749756BED7815E99BC1A44CF
      6A5808875D9C8C1A1DF872B824D51FF995EC5DA20A6524DFA365EFB6A35705D1
      B31ADA4BE444828B15CB8911A51A14A24607E78E00D1EB5FC85EE15528F3F17D
      FA66521B1A3879156A54856C35B4977288F49DFE8B4831E98D0BA7E9F779A325
      A9DEF039B2676805CA4E7B4C9F4F6845233E40D31C6A382AE6B8BDB6A234BC81
      33B6C0C7378D51BBEBE74FD2A1F96F4862E7AB3B6CB6D871A3DF6A471F7EB19D
      1C6B386EE1717B6D456978AF7F6ADD8DB846D7CF1EA743DF8CB51221CFEEF2D6
      70DCAC9D228F6B2B22F06C3226BA76268E0EC7BC959F087AE458434EE745F41C
      6BD36CF2230BC78B96D9D2FF21619586CDD6308AAAAEAA2805AD932EB0281DCE
      2FF0B8C6195A9D4E6ADB7B50BFC8B61DAB3338CE32CE2B0885120584848555AD
      DB60DAF9638747012339CEB2824858F6BCA679B3C299A3BF6FE7B04A9D869F20
      64D92D84F95CA1445A8D3AC1D559E7D467F4DB624422AE73D2AA13F331E4080A
      6D5A9BF69DDA960F0F75CF4ABEFFDBF533C77721EE16D5BE53C79C722F160485
      1453FDB8E7E0B1EFB7EC8E0B092DEE1C1C5A5CBB66CBEE83FF5F77D70117C5B5
      F5CFCC16761796B27404952E550514450920518A148D606CB1C6124D33518931
      6A1235B1A46B2C296A62498C1A35E625CF345B8CD1608ADDD81BA80808D2D9DD
      F9FE6796DD80E2FBDEF7DEEFFBFD7C6F7FF77FCB39E79E3973676E9B99BD77EB
      F7FB0E7BF9B451B5A6C5665184CAE015A93678B1D0434386A523EC7C60DF9EC5
      7E21E14FB60D099FFCCBBEBD6FE173A188BC21C3B3C1A3E6F29C56B0C778CF3D
      655E4ADB8E732FC6040C7CB04FDA382C146CFA76D79EB6E1315DFB79F9B5EF79
      E2E4C9C0A0C0406783874756694D43D64C75E4C45E2657BF0DD5A7BFE2FC36C0
      1A6F465A76BF049C56DDCB6F2E7E9699DD52339E63707CD294E72681D7009907
      5896C1F456B162FDA68F205C1ADB35DEE94E01949D037837DEFB64D3A777F2EE
      4AAF58B769C39BEFAD7EF52E461301BC1757ACDBF87953B2F540ADD1AA863D31
      6D6B745C7C48EB12F8B37697F880614F4EFB52ADD5AAEF25437A175757D4F4F1
      F7146862B00C643D9A92FF49C1AA545FE1D4E850BBB2A951FAB28228C7EB13C2
      753F66F8DFB35EF2B9D9EE6C4E6CCC692B94BFD2D1E5A1215E11DE7D9C125471
      BA24558C2E5997EC901835D82DA67C7E27DF4BC3425B2D649BA2C2D1C18ADE19
      6EFECA40BB6E0A07650FA5E03254A5099EAC768898A2D2B51FAFD46A7B2BFDED
      129C521DA3CA9E8C945F29F2C1AD90156DCA6F2704C53BB653B8AA3A8B8D7619
      2AA1F3AB2AC7EE6314BAE05E0A6DBB44A553547F3BB79497D4BAA0C7143A4567
      45176D64E96311FC80D3AA47FE471DA5767731285C1461628D90A430053C4682
      5969AE2A2281EB39978C28E0C37651212A0CC92A3B939EE8FC3B52B4A672675A
      FB93293B2E98599B72F5436D45D15DE587FFB8B4A512FB2166759952A8C782D3
      5AF035E8C9A10C2FA14892603CBE6F17445DAC427048945C6E97748CD65FA11D
      54292B4A0875D08876823B959B63A43A932B35DCC02E2CF5F8E34C03B68B8142
      1D948930CBAC455A0B850E242835898250B547F054BA40894591BBBB1A4B5360
      69DA6AA9BD545D4EA4ACC56940890A4A2413E26664466B63AA23C9540F806772
      F0250DFE2EA2136D85AEC45FECB80414643429A9AE068B441871109C167C3464
      FCED1D2CC11EB7A65A921A8D24E18B7B41615608D85514658823B020B6D29992
      E2A952BA28FD847A29986E35864308858C4F30B96C7046F23C5C42611BAD4046
      51B861D6A8BF37DF369D9BFF55712928A4C80D73923CDB6ADC504E1AE9BA11E7
      8EA329A1888F85F2C517DDB008A22611A7C5441C41ABDD27A915074C378DA717
      7C7B4D1EA02B561E2C3515647AAB45ADA81705D191AA8C81B2159CC7A6081133
      086698A8B2BB6976D0ACC15BF65355476BCFBE71B084CB82C0257ABC8B6BADDA
      A0D2898E8A7241125CA84EF2C5C809571D0A041145C562AC447353D2EBDE372B
      C4A3A6EB8DC73C5F3A52065B65C712F4C60F378CD3923CAAC8014FBE1D959704
      7B55B1400A0D09226F7F6214D476D749A7DD074BD641C93153A5F1E8A9039597
      3FF8A30CF786AC0707B384B25FF666272785A72A4854096D71831A50BC3AFEF4
      155258C58E2ACD12159B4A8D674EFD7ABBA8DB07A7716FC8D95AF7764F0A5696
      BFDBD9EDD6CAB8D08A755D622BD677ED52F1515C54F9B218DFABB32275ADE7BA
      1FA98ABC59B3282239391B4806625B414587C4C4B2D01E3D282A3595C0A72077
      25050AD771D71395555B6A810242A84B52AF8F67CF5E9ED1A347761AD0BB7BF7
      6C86874E97FDDB993327500215781D5DC67FEC429C04D736248674E5285D3E7B
      510E31CB960B5F90708799B1B034034BF310BE7693B7B7DA3C67CEB2FECF3F3F
      5196263ADD14CA817BE7EE443B76CB717E54CF11DC7CB8737017AA954A3A76EE
      1CDDC40609C7CE9FA7194B9752B8AFEFD2FD478E6C73F3F4FC0AC23F00678016
      4EC4337FDEAE4114A1045F68A23110E8767535E5F4EC4953C68CA127478DA2C7
      860FA7D50B17E60E4B4D5D81552D1F848660A0855336AD5229EF77860F27095F
      C6A30DC2479EFFC753B529C2B94107EA162BC047489C66C57CAAD643979595D1
      9275EB28352262E93BEBD6CD047D2E203B912D022CA7D6747AF8971B36E3C617
      4BB0D3AA4CAB5251665A1AA5E216C8C9C9A1C00E1D6E01B212F694F8370F87A2
      009F3321801EB3A52581629889F6C88C97E54A66C9E0B2E483CB8926EF2F45C8
      249F0E1878C385F6CC6211B45ACA0DA76C3DCDD61561EF19E4952DE22B674682
      77F7E038C36A913564657C63DE65D1995DBBC82D3ADA0EF92D56C0325C62B41C
      68D01167BA558935E4224091E0CAC85CD953D69697B72BBB72A5D2313A7ABE4C
      81E7E9E3133F343333458022B9E503CDAA8443D6709722C854549F3DFB29422E
      6F0444BE7E7E1212297C6A7CAA772A633A56B714AB4BE50E44CEC3327588714F
      701B2143A1F5F1899B3C7264325B64051730C739E48D81162E5FFEE3C53D7B0E
      230FE7978B02F116AE9D7D60E043A24EE7D1827A47C25C53730367B20DE473C0
      7DE884254916AB70812C11F8E7B561EA0BF6115988BA03EC4ADA571FFBD2BFF6
      0446109C94EBB51C797CB71C58065A9628AD40180B90E1DA0965745A6F8F6EA3
      9FF4E6F4CF2BDF29BEB263D32C722223A78143C078C0E6D0CB5BE2A8F0B17D06
      8E8E3D79F224C50C598E750FB86FD4C8CCA887277A07E73EEA7D63FD040A0909
      A1EF36ADA63B7FC25B89365261EA43C3627FFFFD77C26209C47BD331F872E3E6
      23FCE78F5763202CEF403BB7AE678BE238E7D37BD9C7B00AFB495962F0B96AF8
      FBFB13FE168C14D145D1856A458B554CC0AA0D5458A7A62AADBBE6A67B18EAB3
      09E47D00EA353EA3C6DFA331D23303D0CA47E70C8C46B5038D7F652D8D99F311
      3DF2D22ACA99BA98DC1287D24D9720FDC5F689C1E7FD7AC84AD8135EEDC2818C
      C294DCFEB1582F424EB07784DC69C2BC3554DFD0808399A9AEB191F6FCFC330D
      C9C8A09C82824990F96EFBC2857F22242556D8E1500677046C1127385E65AA96
      5B4A7C32CD24D2A095B436B77DA2A3DF6DDEDC2A9B2F10C34AB8A0F15129D5A3
      9DAAB2D3B450C4DA06E5E6CA96897676B46DFFFECAD34C04D0AFC16F72F8C415
      1B0155A210CDC415D42CA110C1E3F6879B0F4465C796090A055F49854C80D7C2
      22B68215700B081EE16356D922BE05A01D5AB925620E2E373A06ACB86B23281B
      F90A5A7818534116476A4A6269220C4A51776C16A1DDB65AC61AA0C8669178B1
      8A30C4B600A309E282B582C70002B4B245F832969438880A5DBA1A85CEF1EADB
      B75560CB4EB9B9086B467A1279ABE534FF1DDF1281AF6AACA5C1993188FDE560
      209D395F72EDB4C67D251AB8EB560E9BA63D554D8600918676ECD8D687CB882D
      E0B01DD6DB0A771229CC51A03027813A38122050D18153A77EBD70EDC9DAA2A2
      4228922B325B6E40C2A7AB8A9E77112804F1FFD5954BF4E7C1467A0582454019
      701FBAFF8016F2C891231433E2C3565BC8AB1F8DA1A8A828FAE6B3957715AE92
      DB232B3564E2877460CD5ADAB36787BC038C5EAFC732332AAAC250B0121BE179
      3CF00C850C1E445F7FDA9AA23BAAC8906143E93C06A356E5CD43FF8000B91AA1
      FD6B4E96E3C2C26E72C85EE1E49FCCB13C36E2C4BDC037EB9B09A2ADCD9EF6B3
      4552D95C3BD7F63D68FC99E5E282F61A2B7CC7A0D7E0B4154AD491E679AC7461
      8EDC93C9C9C2677F6E8CBD8AB290534D9E07F65E6D8ACA0157DAD7BBA96C16CD
      E41838C2EC4EF02DAE70CAC186D8BD870E115B535E8EA9BB852EFB4CE3D6332E
      3C9C5EEBAAE6EC71CC78E977F6898419919608FCC2A987EA63AF361BF3807697
      6BE3EA4A8B62ED6C8AE61DB588B468214D68B87807210B8B6C96B1354CE3A6D8
      0B65676C76A599CE109E09E14046E173BFD7C4169594C809ABE77C4719E15F0A
      34BF93CE66D11B726784531BE043D4462B672B9C7EB83A761FFA2D4EB1156C41
      87E0604EDA600FC5AF46DBCB8AAED61271C3C84C6E8F28C7536E210B679DA892
      B72562C6BDE0E0E0402F87391C2A6EA0B82FAEFF25C5C3792D08FA7C67F40C68
      8BB538E25FECBB63F89E9FCA6E137D718B78688818D5B2145BF4DFDA4262D2CB
      A7F82F837B1BCE2C28A6A147421F4F664E02028D24818623D6D249F431DA90D5
      C43FEE6651BAC60546798CC024BE6A1C62C34C4B007FC4D6E72E27BFB2794045
      585098C3893327AA9E1FB0D9A9DF7C3F64A5D5C43F3BF65A42C45130D6A502B6
      48AA90BC75A4D3BCF6F9E09A0E811D9CDCDCDC141C729AE9CC6739E429005A68
      12E5BBA08E02C048C53FF773035C03BC3BF877D039DB6323C09A46E290D34C67
      BE2CC7F2F2DDF3972EA5BC66AF895E94EAA5B7A99EDA39A99D0C57CF5DA55B65
      B7A8AEB68EECB007A293B313E9957A03F8A3A42AE9A260273C458ABF94704C41
      8E088CF8A3A099364AB7A4BC6E3DBB8578B5F1127D037CE9CAF92BD435A52BE9
      9DD00928558A63078F1D1794422E7699AE928A249A3D6236BDF4D24B50C02E8E
      48481048E8017417F6A72D4893867C38441AFBF958297E46BC1C729AE902F8B2
      1CE409F95ADE3A711424C40B0B8083D4997E4A9E936CCC5B91278DD830424A98
      9520879C663AF3590E580045412D1575A485D489B2017B8AA4D55DA777ADCA79
      3F471ABC61B0943837510E39CD74E6CB722C8F7C2D1545E1FC3A011C46D2E480
      510157D357A64B799BF2A4A4D793E490D34C87A2C9C4724DF2CD15E1112B9468
      0013D963EE935E7CBEF85ADB84B61E9887280507811AD40D5467AA33329D5494
      8EF9D47BB862D5580B0A999ABB9E4858B09012681CF5A469BE137D2FA47D9E66
      4EF92445E290D34C6FE22F449C18CD2DC2827450140864D0767246E84F7A4AA3
      B7BD9FF23E9BFC59B289434E13D399CF722C0FB45484BC7022A61D6C973BE2FE
      E440B1B82A05D48FF6CBA1037CCB213D20970819AEB61804736D47AA99131057
      01F6800BC0CD28BA05B2C213346E4999AF469CE55B5504DE7DE2EEBF2FC6852F
      26C917409EABA0049D048162505A018001B0B6A046C4CB8073988DFF8A6B8555
      2B88B297E0050332802E3F01E39011A676F49C18923D6B6AF2CC5F5E4C5F7861
      6EC66B575EC978EDF22BE90BCFCF4D9E71E0C590AC17A6B20C84C38016CE3AEF
      6FA331B41FDCEDB14F46DA3B79F891A901D3A51A9B202C556BED1D7D031347F8
      7A45F48EFC79C523DAEAD24B2B207015909DB26911DE5E9103E666D9EB9DFDA8
      B14A66B4EA991BC8DEC9CD2F327766D64F1F8EE559E81AAB9C7578ECEFD6AE53
      286181552BC364AEC2DCB588EA1BAF633E771B13C83A99258A1A52B9BB876258
      ED2F139A3CEB2C5B21991B0592CC9896D75075FD69AA293C448DCB769134AA1B
      69E2DBE362F00DCDB9CC5870B254C0EC5CC1292B84B58F8A1C1F9B3476F9939E
      41019135B527E95A49255DF8FE34A555B5A3DD7F5F43D11B1F671919DCB35E3F
      75FC68E1271FBC33F47DD3FB9C6686E5D424FAE6C0672F47258E99E166A262AF
      A3C725EA3B69297DF0C2304A7DBA1FA9158E2C2BA3F246D1B5C35F6ED98921F2
      3732A1C913568D942DC28C9A629CDAE90BECDBD9F749CE18E1BC74F54D736A52
      A41816EC8DAE0C1D04321CFE76F34FA77EFAE6607D55C51A3CB8FC75E4AABFEE
      23A5AE9D990C41281E89F4D5559586E48C89CE2B17CFBF20140B7FEC3F4ED7F7
      4301BB716F7F39AEF0EB8D4705A2B9674BA874FB1F128DA466BF0DB3B1FCE7C7
      42D2D665C2DF6A8BA64BEFCE127E183F901ECCEC2850DF688132A3447162B2A2
      FBA27CC57A4690075435E56FD1B041519055C9E21784DD03D32917721E801F10
      04F05D1C9DD2411C32335BF137A4A301E6E95A285AFE2C4D97AA4E494B660A3B
      5F988046156FD820C80D981342AE6FEE08B961F346E803709C79AAE68A94135E
      A757FE38D361A3A3332D56DAD15E08FEB7392C564A03060CA0FCFC7CDB659931
      6346F0E6CD9B3DB0E02BF1DAAC8F3CF208F162A6FFF0DCB1DA2B61A15261CC98
      31949696E68CE7FA1BFAF4E9B3372B2B6B7F6E6EEE02A68F1E3D5AE881573F18
      C9B5AEEBA9A79E92BB96C71E7B4CE0A323E357E3C68F5F3EF999296D92537A85
      0E1D3AF47B285EC43CAC8C2A04E19BDA5635151414B015229B0DAB06A7A4A4FC
      E6EDE14C01BECE34243F8BFAA43E4019E969A7F3F2F23B0F1932841E1E385098
      3C79724B5D7DFBF6255E5636F5C107054F2F6F554A52CF2BBD5292BF760DCDE9
      E4D171C4C44E6905E383BAE6078E1C312C3F3B2B7D6787B0701A90972757D0B1
      63C7DA942982318DC256B242437DAD141DD9E1593B471F8342E3DCDE353CED39
      BFF0A82C9596B2BC4392275C550DBAAC2DFDDAD7D7D7AB11CF000E878486882E
      2E0689CB96B521E1A2B0D7D9939BC1D1A7BCAC7CE84DC3530AB17D4E904BF976
      C1E1F2466376A4D2F86C3AD677742A997A5EF7AC5875ABF8E9DAFA06676F1F5F
      096D91ED0A2BAF1615294A4BAE997CFD7C0A3AC5F5AEE835A853A78ADB01D4C5
      2B48BA74A650F1FD9EFDB4F2E00F66079D2F9E760D0A31EB7B1EF277FFF3F193
      477F9E6BEFE8AD82358D0089DE5E5E0D31B1F15DCBCAAABBF41B39716F7A6772
      4C8E54182F57ABC437B79448A25E279D57A58A266D3BF2953EF5D018AF869CBF
      5C3AC3AF6DB03FD6B0E5FE8EF590D0BD7B77EC1BEEB1CBA5F1EC12C5C8236D0C
      E2AF6F74521C33FEF0DD65F5AA953BCC3E1DC384DBF56E42F8808146AD47A0C2
      40C7DF6EDCF0849FC9DED3E1C2B933E9C78F1F9715D1C0BC7E53B3B373BF73EF
      F12629FB9667F45F745A9ABD68739D6FE7A9667DF414B3D67FA8D9C127DFE4D9
      735D7DC1F63AD32FA69AD0856FCDA18C8C8CC27EFDFAF5B76821122541D51B7F
      CBDFA1BFB545F86C9EE3AEC48E6D77FB8725D9B947E64A7A8F9E92835B4F49EB
      97479E0109EA6EED8C9B769DD59EFF6AD3973C2BDA85F9ED30AB222547F06C36
      496FBCB0A8413853FBE3458FF4B040D78FED437BF4B557DCD2A8229C259D3755
      6BED69C3ABFB1AC775A8DE4B1595B745A5469F7AE1C285E739BF8C98981835EA
      D3968706E46DEBD7AB4BCEA48299E919333EEEF7E033AB97A54FFFFAF7BE33B7
      FD963965C9B29C69CB86A48D7D697846AF1E93F2F2F30FA006BC1B1F1F2FEB90
      BDF1E3C7D39C3973C4871F1EF85C7A66D61769A9C9DBB3527B6CE9DBABFBCAAC
      944E4BFB26C5BC9B99D2E3FDBEA9899F64F749FA242B2777557E5EDE60BEABA7
      4F9F2EDFE1B2A2091326D0BC79F328333393626363292A3C827A460550CFB808
      7A20C69F7A44B7A79EB19194181F43C9DDE3E881A424B9B919366C9802CD8CAC
      E3FEF484A495D7EF6559EC88DE1EFAE232F4E7874AF889C3A1D604778FF694C9
      42F4AB87E5087B02FA617B47278E32260EEFEDE373FA72BDB0FF64E955109602
      545D5981418BC4511987A77337872EBDFDD49D32813D3C56C6D4534B3A47474E
      6E1C9ED63EFCF8B96A2A3C5D720C848135782D5D5F574BFC8E1269D95D589422
      87F20D29C79ABC46BCBAA8C263316C1BEF5F595D177EF9DA0DAAABAEA93582CE
      2F609AC4EE0A84E61609A2F826DA98B02629B7F4CCC8D83D7FDEA29A3357B87C
      6E321DBDEB09BC899FCC7186CD226383DC9C308D207448A3D7F6C919D82DBCAA
      51A203378D54AC77A5C8DE5EB1EED84CE797ED078E196BEBD7E260B27C73AFC5
      A9E1486BCB8B4B68FDEA9DCF751DD23BE2A2A4A2724C0A4B15D81FF5B36F8E99
      6E57CFD7E8746BF95546732572BCEB8879C4881FF90A7518B7925C466D22FB41
      6B86398EDF7A34619F24B5FF5E92F4E3B61E651AF3588665390F4356C21EFA30
      62F4EFDF9F7B597A70D044F21BF806A9FABD3FCC6EC486236A80E34C631E7A62
      6259CEC3601D8C16A7C60417530975C332C437152E6B6F5438ED659A87A2E2A2
      9B548ED75D9C6A1DCD15E951D8D910D303E42A9491ABB28CA33230079143787C
      976F6F0A11589CC07F05B244E99169D3A6CD747474C45A97B5D858B206A8C367
      0E26B0054005A8098DE0E9B56B97CF41620D40DBB7B34E22053FFCE677457893
      958CAE7BA82B1EA13AE3A18AB3B30B190C067275752377774C65DD3D49A9B4A3
      76ED025CB76EDDB00BF2074AF0F0B3B8B898F5E1D915828888085E8FF5D96DDB
      B6BDB67FFF7E42CF8B3755F54003A60E10201EF5DB51F9FC8B34FAC0647AFAE9
      5153F07AF17596632E43014F0BCD069C52D7F0F0F040C0393434848282028160
      E22E3D34348818217F76A453A74E5CD8BDFBBB3FD00D9D425E3360046467801F
      89531C845399F7CF8065390FC07911DC8FEEFE9B65DBFA25AE3718D5DAA12E75
      C9CFCF7F187814E0B00BD399CF376F73342F629B2210EDF04E24A373CFB48CD1
      050BFBCF5FBC6AE4AC058B077779202393E9CC07EEE96C750DCD68A7B8A4CC8E
      5D7B6527B93BDA69346A05E0D4362377809BC96C12F77DBB8D6FE103F7D2642B
      6C8CA91F79E2E5A57DB5F67AAF3B8545535DD9FC6963B780BE06B039ECCEC0A3
      12396DB308EF685D1C1CF4EE3C7DF7C00238AE0E6A3B96C0920EC6B22AA58AF9
      9CBE176C1661643166EEBB9FF415ECEC0D616D2CFD9135D3D94B45B7A64D18BA
      046DF5E7561A875C2F41E328D91475ECD831B1FFA011397D068C48F073D569D0
      5772DB8177B382FABD654B7EDCF2D9FA8FD04AECB766E4B7F0FCB582356DBB6A
      B5B5B585CBDE5A7062CB474B7EABABAAA8C0626E76B7CB4B4C8B5F9FFF6B7870
      E0781C36128A9C788D76155E32A05D02E92F672B23906AABAAAA3E7D7BD1BCAB
      C045A45D80D3C005223AB27DFB8EF79E7F7E8A1A0BFA6C44FA06D0D2A179E5FE
      4C26F291F888CD012BD0A0290DE0CDDCBFFFB014171737392121A18D9F9F9F2D
      1F676E6E11A1D5635A6B28C30BBA0F9392E2347FFC71EE8DE1C3FB2B51468B5A
      0836B348008315A34B941F4EBB21ED03B427A260201C059B8A535BE0E9E9391A
      697FCE8B50768235012156C410C151B402A65BC172B5C85B8E7C10C5B0060939
      F2AF7A5645FF6AFEFFBF7C42DAD359FF96F61D6F7D29E7E7C29323FFAED74291
      78CA64D75CE1ED83C5818AE345FF94C92D142526B45DEF5FA74976BE54D6255E
      5DB527EB41A77D2ECE6AD7E6CAEF15E71BD0C6DBFED5E1B1BE5EA64EFD335D3F
      EF93ECE23B7BE1A505377DDC3EB209FC83480B8B1CE35DCB62A2F573BAC73AF8
      9EBD505BFBFDDE9BCB39AFE355B31787FF082D140947AE768F89D275F1F65453
      6D8D091FF728794C43D191DE0B031BB40FFFD38ADCDD75DD1EE8E6A8E20C51E1
      3A978438FB011CFFB1FCFAF0B3EADA0D1C67E0920B1C36470B8BB07A2ED68794
      64BEBD4E41FDB30C13D427AE47C88426AFF240A9A14FEFB8CF9A92B6A085A2F3
      974C5B7F2EAC2AB572337B19429F9EE0F3F77063E50AB7E292E7A28DB7DF787C
      94F39E2ED1F66556196BD8E2AA197A785EFB764FC5F66E71FA914AD4FF636744
      B2D3197C5F9DEE30CE9A61C7EE5B45BFFD5EFB3A45E9AD24396CA18829EB3635
      4CD46AAEF83CF1A84F1F2F83440DF21B704B91ECDC5759BCED9BD219A6288F3F
      59B605B8AEDD094A4E564E189530EDDD457DBE5DB322E3F8AAA56985330B7AAD
      49CF8989BE4BB649DB7D5E699BACFC2F09FE07CCDB6C210BBF13090000000049
      454E4400000000}
  end
  object ScalesImageList: TTBXImageList
    Left = 48
    Top = 240
    PngDIB = {
      2300000089504E470D0A1A0A0000000D49484452000000100000023002030000
      00F2AE03ED0000000C504C5445000000000000FF0000808080E6239CB1000000
      0174524E530040E6D8660000026F494441547801AD966B6EE3300C848780F45F
      01E2FB30400EE002D621774FD19B75BF911B24C56E1772525519EB418F872269
      57FAAE45EF52FCFEF5FE09BDBF4B1F1F800EB562EBB314DB9551294033241032
      6C00AB937DC32E42AA2BA0664808424D2A4A36DE10AEE9B6D832137D4A18AA04
      538A096B4A601B269A6C162458623B714731B40BA3EC5029C483001626FB92B2
      226E4BA1AF034DF9BCBE45B4CC2F7C4CF19435908D6182D54C8F6E2B02505740
      8D28288150A2D65057469A6E8B2D132D1BA0E269F3280148BDE1355B4DFD86B1
      EFDDF918A9F94C5350298163F1F543436461250BFB09089A8AA119D2D087896D
      677EA30EAACEEA275D0565818F6C26BB4969EFC2E7E39D21C3663C7CD747C6C1
      0705DDD542EE708AEAB1070EE389FE17DFD9FA28B9803E7FC0DF2B7C51D087AA
      B4D2697F439D9257727494155236A8F48AB47B68A54F3E4EF0E9D0E211AF8382
      3E026A22EB6BB88AE6DC43C1682208BBC9432820A3DB5F2E4FEBFB572A73A6A4
      1EE2F09F54B1C9FEF449ACC921B69363038480A28B831290522AEACB8AC9249D
      6A92FCAD511F6AD4875A1175E17CD9AF9CEEB26232CFC7C3777DC34FE0C6477D
      3044DF91AFC883BF50E1E7D9BAB88EFAF8017FAFF05DEC2FD9944547FCAD29BE
      1FBC919BDFCD86E8B711AF6B36385E4C663B55E68283737CDA9806C5CA9491B3
      1A1E8FB8CCF5C5669952F2474FD5CD04E978FA4B22757635DBEEFE0ADF5AA438
      338FC6D49E1FF31749122C245DE26549F89A47CBCA74ECEEA0B956B94DF66D48
      F1A7E8357D777F1B02763E533BD2CFC4771CF608C00094D6F10F5A9A7E803CE2
      5973FD411FF735A6AFE51F049CBBA96E5E46F799F24AF53A1BFF8BEF1FBADD59
      9D6BF277E30000000049454E4400000000}
  end
  object MainPopupMenu: TTBXPopupMenu
    Images = MenusImageList
    OnPopup = MainPopupMenuPopup
    Left = 208
    Top = 168
    object tbitmProperties: TTBXItem
      ImageIndex = 31
      OnClick = tbitmPropertiesClick
      Caption = 'Properties'
      Hint = ''
    end
    object NMarkEdit: TTBXItem
      ImageIndex = 31
      OnClick = NMarkEditClick
      Caption = 'Edit'
      Hint = ''
    end
    object NMarkDel: TTBXItem
      ImageIndex = 30
      OnClick = NMarkDelClick
      Caption = 'Delete'
      Hint = ''
    end
    object NMarkOper: TTBXItem
      ImageIndex = 10
      OnClick = NMarkOperClick
      Caption = 'Selection Manager'
      Hint = ''
    end
    object NMarkNav: TTBXItem
      ImageIndex = 33
      OnClick = NMarkNavClick
      Caption = 'Navigate to Placemark'
      Hint = ''
    end
    object NMarkExport: TTBXItem
      ImageIndex = 25
      OnClick = NMarkExportClick
      Caption = 'Placemark Export'
      Hint = ''
    end
    object NMarkPlay: TTBXItem
      OnClick = NMarkPlayClick
      Caption = 'Play'
      Hint = ''
    end
    object tbitmMarkInfo: TTBXItem
      ImageIndex = 27
      OnClick = tbitmMarkInfoClick
      Caption = 'Placemark Info'
      Hint = ''
    end
    object tbitmFitMarkToScreen: TTBXItem
      ImageIndex = 43
      OnClick = tbitmFitMarkToScreenClick
      Caption = 'Fit to Screen'
      Hint = ''
    end
    object tbxtmAddToMergePolygons: TTBXItem
      ImageIndex = 62
      OnClick = tbxtmAddToMergePolygonsClick
      Caption = 'Add to Merge Polygons (Ctrl+MLeft)'
      Hint = ''
    end
    object tbxFillingMap: TTBXSubmenuItem
      ImageIndex = 7
      Images = MenusImageList
      LinkSubitems = NFillMap
      OnClick = tbxFillingMapClick
      Caption = 'Cached Tiles Map'
      Hint = ''
    end
    object tbitmHideThisMark: TTBXItem
      ImageIndex = 19
      OnClick = tbitmHideThisMarkClick
      Caption = 'Hide'
      Hint = ''
    end
    object tbsprtMainPopUp0: TTBXSeparatorItem
    end
    object NaddPoint: TTBXItem
      ImageIndex = 15
      OnClick = NaddPointClick
      Caption = 'Add Placemark'
      Hint = ''
    end
    object tbsprtMainPopUp1: TTBXSeparatorItem
    end
    object tbitmCenterWithZoom: TTBXSubmenuItem
      Caption = 'Center With &Zoom'
      Hint = ''
      object tbtpltCenterWithZoom: TTBXToolPalette
        ColCount = 5
        Images = ScalesImageList
        PaletteOptions = []
        RowCount = 5
        OnCellClick = tbtpltCenterWithZoomCellClick
      end
    end
    object tbsprtMainPopUp2: TTBXSeparatorItem
    end
    object tbitmCopyToClipboard: TTBXSubmenuItem
      ImageIndex = 28
      Images = MenusImageList
      Caption = '&Copy to Clipboard'
      Hint = ''
      object Google1: TTBXItem
        OnClick = Google1Click
        Caption = 'URL to Google Maps'
        Hint = ''
      end
      object YaLink: TTBXItem
        OnClick = YaLinkClick
        Caption = 'URL to Yandex.Maps'
        Hint = ''
      end
      object kosmosnimkiru1: TTBXItem
        OnClick = kosmosnimkiru1Click
        Caption = 'URL to kosmosnimki.ru'
        Hint = ''
      end
      object livecom1: TTBXItem
        OnClick = livecom1Click
        Caption = 'URL to Bing Maps'
        Hint = ''
      end
      object osmorg1: TTBXItem
        OnClick = osmorg1Click
        Caption = 'URL to osm.org'
        Hint = ''
      end
      object nokiamapcreator1: TTBXItem
        OnClick = nokiamapcreator1Click
        Caption = 'URL to Nokia Map Creator'
        Hint = ''
      end
      object terraserver1: TTBXItem
        OnClick = terraserver1Click
        Caption = 'URL to Terraserver'
        Hint = ''
      end
      object Rosreestr: TTBXItem
        OnClick = RosreestrClick
        Caption = 'URL to Rosreestr'
        Hint = ''
      end
      object tbsprtCopyToClipboard0: TTBXSeparatorItem
      end
      object tbitmCopyToClipboardMainMapUrl: TTBXItem
        ImageIndex = 45
        OnClick = tbitmCopyToClipboardMainMapUrlClick
        Caption = 'URL to Primary Map Tile'
        Hint = ''
      end
      object TBCopyLinkLayer: TTBXSubmenuItem
        ImageIndex = 45
        Images = MenusImageList
        Caption = 'URL to Layer Tile'
        Hint = ''
      end
      object tbitmCopyToClipboardCoordinates: TTBXItem
        OnClick = tbitmCopyToClipboardCoordinatesClick
        Caption = '&Coordinates'
        Hint = ''
      end
      object tbitmCopyToClipboardMainMapTile: TTBXItem
        OnClick = tbitmCopyToClipboardMainMapTileClick
        Caption = 'Primary Map Tile'
        Hint = ''
      end
      object tbitmCopyToClipboardMainMapTileFileName: TTBXItem
        OnClick = tbitmCopyToClipboardMainMapTileFileNameClick
        Caption = 'Pathname to Tile in Cache'
        Hint = ''
      end
      object tbitmCopyToClipboardGenshtabName: TTBXItem
        OnClick = tbitmCopyToClipboardGenshtabNameClick
        Caption = 'Genshtab boundary name'
        Hint = ''
      end
    end
    object Nopendir: TTBXItem
      OnClick = NopendirClick
      Caption = 'Show Primary Map Tile'
      Hint = ''
    end
    object tbitmOpenFolderMainMapTile: TTBXItem
      ImageIndex = 34
      OnClick = tbitmOpenFolderMainMapTileClick
      Caption = 'Open Primary Map Tile Folder'
      Hint = ''
    end
    object TBOpenDirLayer: TTBXSubmenuItem
      ImageIndex = 34
      Caption = 'Open Overlay Layer Tile Folder'
      Hint = ''
    end
    object tbsprtMainPopUp3: TTBXSeparatorItem
    end
    object tbitmAdditionalOperations: TTBXSubmenuItem
      Caption = 'Additional Operations'
      Hint = ''
      object NGTOPO30: TTBXItem
        OnClick = NGTOPO30Click
        Caption = 'Current Altitude by GTOPO30 (~1 km accuracy)'
        Hint = ''
      end
      object NSRTM3: TTBXItem
        OnClick = NSRTM3Click
        Caption = 'Current Altitude by SRTM3 (~90 m accuracy)'
        Hint = ''
      end
      object tbsprtAdditionalOperations1: TTBXSeparatorItem
      end
      object DigitalGlobe1: TTBXItem
        ImageIndex = 11
        Images = MenusImageList
        OnClick = DigitalGlobe1Click
        Caption = 'Images available (F6+MLeft)'
        Hint = ''
      end
      object TBXMakeRosreestrPolygon: TTBXItem
        OnClick = TBXMakeRosreestrPolygonClick
        Caption = 'Make Polygon by RosReestr (F8+MLeft)'
        Hint = ''
      end
      object tbsprtAdditionalOperations0: TTBXSeparatorItem
      end
      object tbxWeatherUnderground: TTBXItem
        OnClick = tbxWeatherUndergroundClick
        Caption = 'Current and Forecast Meteorology (Weather Underground)'
        Hint = ''
      end
      object tbxYandexWeather: TTBXItem
        OnClick = tbxYandexWeatherClick
        Caption = 'Current and Forecast Meteorology (Yandex Weather)'
        Hint = ''
      end
    end
    object tbpmiVersions: TTBXSubmenuItem
      OnPopup = tbpmiVersionsPopup
      Caption = 'Version'
      Hint = ''
      object tbitmSelectVersionByMark: TTBXItem
        OnClick = tbitmSelectVersionByMarkClick
        Caption = 'Select by Placemark'
        Hint = ''
      end
      object tbitmMakeVersionByMark: TTBXItem
        OnClick = tbitmMakeVersionByMarkClick
        Caption = 'Make by Placemark'
        Hint = ''
      end
      object tbpmiShowOtherVersions: TTBXItem
        AutoCheck = True
        OnClick = tbpmiShowOtherVersionsClick
        Caption = 'Show other Versions'
        Hint = ''
      end
      object tbpmiClearVersion: TTBXItem
        OnClick = tbpmiClearVersionClick
        Caption = 'Reset'
        Hint = ''
      end
    end
    object tbsprtMainPopUp4: TTBXSeparatorItem
    end
    object tbitmDownloadMainMapTile: TTBXItem
      ImageIndex = 21
      OnClick = tbitmDownloadMainMapTileClick
      Caption = 'Download Primary Map Tile to Cache (Ins+MLeft)'
      Hint = ''
    end
    object NDel: TTBXItem
      ImageIndex = 22
      OnClick = NDelClick
      Caption = 'Delete Primary Map Tile from Cache (Del+MLeft)'
      Hint = ''
    end
    object ldm: TTBXSubmenuItem
      ImageIndex = 21
      Caption = 'Download Overlay Layer Tile to Cache'
      Hint = ''
    end
    object dlm: TTBXSubmenuItem
      ImageIndex = 22
      Caption = 'Delete Overlay Layer Tile from Cache'
      Hint = ''
    end
    object tbsprtMainPopUp5: TTBXSeparatorItem
    end
    object NMapInfo: TTBXItem
      ImageIndex = 27
      OnClick = NMapInfoClick
      Caption = 'Map Info'
      Hint = ''
    end
    object NMapStorageInfo: TTBXItem
      ImageIndex = 27
      OnClick = NMapStorageInfoClick
      Caption = 'Map Storage Info'
      Hint = ''
    end
    object TBLayerInfo: TTBXSubmenuItem
      ImageIndex = 27
      Caption = 'Layer Info'
      Hint = ''
    end
  end
  object TrayIcon: TTrayIcon
    PopupMenu = TrayPopupMenu
    OnClick = actViewNotMinimizedExecute
    OnDblClick = actViewNotMinimizedExecute
    Left = 520
    Top = 112
  end
  object TrayPopupMenu: TTBXPopupMenu
    Left = 520
    Top = 144
    object TrayItemRestore: TTBItem
      Action = actViewNotMinimized
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TrayItemQuit: TTBItem
      Action = actQuit
    end
  end
  object tbxpmnSearchResult: TTBXPopupMenu
    Left = 160
    Top = 264
    object tbitmCopySearchResultCoordinates: TTBXItem
      OnClick = tbitmCopySearchResultCoordinatesClick
      Caption = 'Copy coordinates'
      Hint = ''
    end
    object tbitmCopySearchResultDescription: TTBXItem
      OnClick = tbitmCopySearchResultDescriptionClick
      Caption = 'Copy description'
      Hint = ''
    end
    object tbitmCreatePlaceMarkBySearchResult: TTBXItem
      OnClick = tbitmCreatePlaceMarkBySearchResultClick
      Caption = 'Create placemark'
      Hint = ''
    end
  end
  object actlstMain: TActionList
    Left = 328
    Top = 136
    object actSelectByRect: TAction
      Category = 'Operations\Selection'
      Caption = 'Rectangular Selection'
      Hint = 'Shift - snap to active grids (if enabled)'
      ImageIndex = 10
      ShortCut = 32850
      OnExecute = actSelectByRectExecute
    end
    object actSelectByPolygon: TAction
      Category = 'Operations\Selection'
      Caption = 'Polygonal Selection'
      ImageIndex = 13
      ShortCut = 32848
      OnExecute = actSelectByPolygonExecute
    end
    object actSelectByLine: TAction
      Category = 'Operations\Selection'
      Caption = 'Polyline Selection'
      ImageIndex = 21
      OnExecute = actSelectByLineExecute
    end
    object actSelectByCoordinates: TAction
      Category = 'Operations\Selection'
      Caption = 'By Coordinates'
      ImageIndex = 12
      OnExecute = actSelectByCoordinatesExecute
    end
    object actSelectByVisibleArea: TAction
      Category = 'Operations\Selection'
      Caption = 'Visible Area'
      ImageIndex = 20
      ShortCut = 16449
      OnExecute = actSelectByVisibleAreaExecute
    end
    object actMakeLinkOnDesktop: TAction
      Category = 'Operations'
      Caption = 'Create Shortcut'
      OnExecute = actMakeLinkOnDesktopExecute
    end
    object actFileOpen: TAction
      Category = 'Operations'
      Caption = 'Open...'
      ImageIndex = 34
      OnExecute = actFileOpenExecute
    end
    object actZoomIn: TAction
      Category = 'Operations'
      Caption = 'Zoom In'
      Hint = 'Zoom In'
      ImageIndex = 23
      ShortCut = 33
      OnExecute = actZoomInExecute
    end
    object actZoomOut: TAction
      Category = 'Operations'
      Caption = 'Zoom Out'
      Hint = 'Zoom Out'
      ImageIndex = 24
      ShortCut = 34
      OnExecute = actZoomOutExecute
    end
    object actShowGoTo: TAction
      Category = 'Operations'
      Caption = 'Go to...'
      Hint = 'Go to'
      ImageIndex = 11
      ShortCut = 16455
      OnExecute = actShowGoToExecute
    end
    object actMoveMap: TAction
      Category = 'Operations'
      Caption = 'Move'
      Checked = True
      ImageIndex = 8
      OnExecute = actMoveMapExecute
    end
    object actDistanceCalculation: TAction
      Category = 'Operations'
      Caption = 'Distance Calculation'
      Hint = 'Distance calculation'
      ImageIndex = 9
      ShortCut = 16460
      OnExecute = actDistanceCalculationExecute
    end
    object actSelectByLastSelection: TAction
      Category = 'Operations\Selection'
      Caption = 'Last Selection'
      ImageIndex = 44
      ShortCut = 16450
      OnExecute = actSelectByLastSelectionExecute
    end
    object actSelectByLastSelectionEdit: TAction
      Category = 'Operations\Selection'
      Caption = 'Edit Last Selection'
      ImageIndex = 31
      OnExecute = actSelectByLastSelectionEditExecute
    end
    object actSelectBySelectionFromFile: TAction
      Category = 'Operations\Selection'
      Caption = 'Load from File'
      ImageIndex = 34
      OnExecute = actSelectBySelectionFromFileExecute
    end
    object actCircleCalculation: TAction
      Category = 'Operations'
      Caption = 'Circle Calculation'
      Hint = 'Circle Calculation'
      ImageIndex = 24
      OnExecute = actCircleCalculationExecute
    end
    object actShowCacheManager: TAction
      Category = 'Operations'
      Caption = 'Cache Manager'
      OnExecute = actShowCacheManagerExecute
    end
    object actQuit: TAction
      Category = 'Operations'
      Caption = 'Quit'
      Hint = 'Quit'
      ImageIndex = 29
      OnExecute = actQuitExecute
    end
    object actViewFullScreen: TAction
      Category = 'View'
      Caption = 'Full screen'
      Hint = 'Full screen'
      ImageIndex = 4
      ShortCut = 122
      OnExecute = actViewFullScreenExecute
    end
    object actConfigZoomToCursor: TAction
      Category = 'Config'
      Caption = 'Zoom to Cursor'
      OnExecute = actConfigZoomToCursorExecute
    end
    object actConfigUsePrevForMap: TAction
      Category = 'Config'
      Caption = 'Use Maps from Lower Zooms'
      OnExecute = actConfigUsePrevForMapExecute
    end
    object actConfigUsePrevForLayers: TAction
      Category = 'Config'
      Caption = 'Use Layers from Lower Zooms'
      OnExecute = actConfigUsePrevForLayersExecute
    end
    object actConfigUsePrevForVectorLayers: TAction
      Category = 'Config'
      Caption = 'Use Vector Layers from Lower Zooms'
      OnExecute = actConfigUsePrevForVectorLayersExecute
    end
    object actConfigUseZoomAnimation: TAction
      Category = 'Config'
      Caption = 'Zoom Animation'
      OnExecute = actConfigUseZoomAnimationExecute
    end
    object actConfigUseInertialMovement: TAction
      Category = 'Config'
      Caption = 'Inertial Movement'
      OnExecute = actConfigUseInertialMovementExecute
    end
    object actConfigAzimuthCircle: TAction
      Category = 'Config'
      Caption = 'Azimuth Circle'
      OnExecute = actConfigAzimuthCircleExecute
    end
    object actConfigColorInversion: TAction
      Category = 'Config'
      Caption = 'Night Mode (Color Inversion)'
      ShortCut = 32846
      OnExecute = actConfigColorInversionExecute
    end
    object actConfigPreviousSelectionVisible: TAction
      Category = 'Config'
      Caption = 'Previous Selection'
      OnExecute = actConfigPreviousSelectionVisibleExecute
    end
    object actViewNavigation: TAction
      Category = 'View'
      Caption = 'Navigation Arrow'
      OnExecute = actViewNavigationExecute
    end
    object actShowDebugInfo: TAction
      Category = 'View'
      Caption = 'Debug Info'
      OnExecute = actShowDebugInfoExecute
    end
    object actConfigStatusBarVisible: TAction
      Category = 'Config'
      Caption = 'Status Bar'
      ShortCut = 32851
      OnExecute = actConfigStatusBarVisibleExecute
    end
    object actConfigMiniMapVisible: TAction
      Category = 'Config'
      Caption = 'Overview Map'
      ShortCut = 32845
      OnExecute = actConfigMiniMapVisibleExecute
    end
    object actConfigScaleLineVisible: TAction
      Category = 'Config'
      Caption = 'Scale Legend'
      ShortCut = 32844
      OnExecute = actConfigScaleLineVisibleExecute
    end
    object actConfigScaleLineExtended: TAction
      Category = 'Config'
      Caption = 'Show Vertical Scale Legend'
      OnExecute = actConfigScaleLineExtendedExecute
    end
    object actViewToolbarsLock: TAction
      Category = 'View'
      Caption = 'Lock Toolbars'
      OnExecute = actViewToolbarsLockExecute
    end
    object actViewGridGenShtabNo: TAction
      Category = 'View\GridGenShtab'
      Caption = 'No'
      GroupIndex = 1
      OnExecute = actViewGridGenShtabExecute
    end
    object actViewGridGenShtab_1_000_000: TAction
      Tag = 1000000
      Category = 'View\GridGenShtab'
      Caption = '1:1 000 000 (10 km)'
      GroupIndex = 1
      OnExecute = actViewGridGenShtabExecute
    end
    object actViewGridGenShtab_500_000: TAction
      Tag = 500000
      Category = 'View\GridGenShtab'
      Caption = '1:500 000 (5 km)'
      GroupIndex = 1
      OnExecute = actViewGridGenShtabExecute
    end
    object actViewGridGenShtab_200_000: TAction
      Tag = 200000
      Category = 'View\GridGenShtab'
      Caption = '1:200 000 (2 km)'
      GroupIndex = 1
      OnExecute = actViewGridGenShtabExecute
    end
    object actViewGridGenShtab_100_000: TAction
      Tag = 100000
      Category = 'View\GridGenShtab'
      Caption = '1:100 000 (1 km)'
      GroupIndex = 1
      OnExecute = actViewGridGenShtabExecute
    end
    object actViewGridGenShtab_50_000: TAction
      Tag = 50000
      Category = 'View\GridGenShtab'
      Caption = '1:50 000 (500 m)'
      GroupIndex = 1
      OnExecute = actViewGridGenShtabExecute
    end
    object actViewGridGenShtab_25_000: TAction
      Tag = 25000
      Category = 'View\GridGenShtab'
      Caption = '1:25 000 (250 m)'
      GroupIndex = 1
      OnExecute = actViewGridGenShtabExecute
    end
    object actViewGridGenShtab_10_000: TAction
      Tag = 10000
      Category = 'View\GridGenShtab'
      Caption = '1:10 000 (100 m)'
      GroupIndex = 1
      OnExecute = actViewGridGenShtabExecute
    end
    object actViewGridGenShtab_5_000: TAction
      Tag = 5000
      Category = 'View\GridGenShtab'
      Caption = '1:5 000 (50 m)'
      GroupIndex = 1
      OnExecute = actViewGridGenShtabExecute
    end
    object actViewGridGenShtab_2_500: TAction
      Tag = 2500
      Category = 'View\GridGenShtab'
      Caption = '1:2 500 (25 m)'
      GroupIndex = 1
      OnExecute = actViewGridGenShtabExecute
    end
    object actViewGridGenShtabAuto: TAction
      Tag = -1
      Category = 'View\GridGenShtab'
      Caption = 'Auto'
      GroupIndex = 1
      OnExecute = actViewGridGenShtabExecute
    end
    object actViewGridLonLatNo: TAction
      Category = 'View\GridLonLat'
      Caption = 'No'
      GroupIndex = 2
      OnExecute = actViewGridLonLatExecute
    end
    object actViewGridLonLat_10_000: TAction
      Tag = 1000000000
      Category = 'View\GridLonLat'
      Caption = '10'#176
      GroupIndex = 2
      OnExecute = actViewGridLonLatExecute
    end
    object actViewGridLonLat_05_000: TAction
      Tag = 500000000
      Category = 'View\GridLonLat'
      Caption = '5'#176
      GroupIndex = 2
      OnExecute = actViewGridLonLatExecute
    end
    object actViewGridLonLat_02_000: TAction
      Tag = 200000000
      Category = 'View\GridLonLat'
      Caption = '2'#176
      GroupIndex = 2
      OnExecute = actViewGridLonLatExecute
    end
    object actViewGridLonLat_01_000: TAction
      Tag = 100000000
      Category = 'View\GridLonLat'
      Caption = '1'#176
      GroupIndex = 2
      OnExecute = actViewGridLonLatExecute
    end
    object actViewGridLonLat_00_500: TAction
      Tag = 50000000
      Category = 'View\GridLonLat'
      Caption = '0.5'#176
      GroupIndex = 2
      OnExecute = actViewGridLonLatExecute
    end
    object actViewGridLonLat_00_250: TAction
      Tag = 25000000
      Category = 'View\GridLonLat'
      Caption = '0.25'#176
      GroupIndex = 2
      OnExecute = actViewGridLonLatExecute
    end
    object actViewGridLonLat_00_125: TAction
      Tag = 12500000
      Category = 'View\GridLonLat'
      Caption = '0.125'#176
      GroupIndex = 2
      OnExecute = actViewGridLonLatExecute
    end
    object actViewGridLonLat_User: TAction
      Tag = 1000000
      Category = 'View\GridLonLat'
      Caption = 'User defined'
      GroupIndex = 2
      OnExecute = actViewGridLonLatExecute
    end
    object actViewGridLonLatAuto: TAction
      Tag = -1
      Category = 'View\GridLonLat'
      Caption = 'Auto'
      GroupIndex = 2
      OnExecute = actViewGridLonLatExecute
    end
    object actHelpOpenOnline: TBrowseURL
      Category = 'Help'
      Caption = 'Open User Manual'
      ImageIndex = 26
      ShortCut = 112
      URL = 'http://sasgis.org/wikisasiya/'
    end
    object actHelpShowAbout: TAction
      Category = 'Help'
      Caption = 'About'
      ImageIndex = 27
      OnExecute = actHelpShowAboutExecute
    end
    object actHelpOpenWebSite: TBrowseURL
      Category = 'Help'
      Caption = 'Open Home Page'
      URL = 'http://sasgis.org/'
    end
    object actHelpOpenIssueTracker: TBrowseURL
      Category = 'Help'
      Caption = 'Report a Bug'
      URL = 'http://sasgis.org/mantis/'
    end
    object actHelpOpenCommunity: TBrowseURL
      Category = 'Help'
      Caption = 'Open Forum Page'
      URL = 'http://sasgis.org/forum/'
    end
    object actShowPascalScriptIde: TAction
      Category = 'Help'
      Caption = 'Pascal Script IDE'
      OnExecute = actShowPascalScriptIdeExecute
    end
    object actShowUpddateChecker: TAction
      Category = 'Help'
      Caption = 'Check for Updates'
      OnExecute = actShowUpddateCheckerExecute
    end
    object actViewFillingMapMarkUnexisting: TAction
      Category = 'View\FillingMap'
      Caption = 'Mark Nonexistent Tiles'
      GroupIndex = 4
      OnExecute = actViewFillingMapMarkUnexistingExecute
    end
    object actViewFillingMapMarkExisting: TAction
      Category = 'View\FillingMap'
      Caption = 'Mark Existing Tiles'
      GroupIndex = 4
      OnExecute = actViewFillingMapMarkExistingExecute
    end
    object actViewFillingMapMarkGradient: TAction
      Category = 'View\FillingMap'
      Caption = 'Use Age Gradient'
      GroupIndex = 4
      OnExecute = actViewFillingMapMarkGradientExecute
    end
    object actViewFillingMapFilterMode: TAction
      Category = 'View\FillingMap'
      Caption = 'Within Time Interval'
      OnExecute = actViewFillingMapFilterModeExecute
    end
    object actViewSelectNextMapWithTile: TAction
      Category = 'View'
      Caption = 'Next map with tile'
      OnExecute = actViewSelectNextMapWithTileExecute
    end
    object actViewSelectPrevMapWithTile: TAction
      Category = 'View'
      Caption = 'Previous map with tile'
      OnExecute = actViewSelectPrevMapWithTileExecute
    end
    object actViewSelectNextMapVersion: TAction
      Category = 'View'
      Caption = 'Next version'
      OnExecute = actViewSelectNextMapVersionExecute
    end
    object actViewSelectPrevMapVersion: TAction
      Category = 'View'
      Caption = 'Previous version'
      OnExecute = actViewSelectPrevMapVersionExecute
    end
    object actConfigScaleLineOptionsShow: TAction
      Category = 'Config'
      Caption = 'Options'
      ImageIndex = 20
      OnExecute = actConfigScaleLineOptionsShowExecute
    end
    object actConfigScaleLineNumberFormatNice: TAction
      Category = 'Config\ScaleLineNumberFormat'
      Caption = 'Nice'
      GroupIndex = 5
      OnExecute = actConfigScaleLineNumberFormatExecute
    end
    object actConfigScaleLineNumberFormatRound: TAction
      Tag = 1
      Category = 'Config\ScaleLineNumberFormat'
      Caption = 'Round'
      GroupIndex = 5
      OnExecute = actConfigScaleLineNumberFormatExecute
    end
    object actConfigScaleLineNumberFormatScience: TAction
      Tag = 2
      Category = 'Config\ScaleLineNumberFormat'
      Caption = 'Science'
      GroupIndex = 5
      OnExecute = actConfigScaleLineNumberFormatExecute
    end
    object actConfigMarksNamesVisible: TAction
      Category = 'Config'
      Caption = 'Placemark Names'
      OnExecute = actConfigMarksNamesVisibleExecute
    end
    object actShowPointProject: TAction
      Category = 'Marks'
      Caption = 'Project New Placemark'
      OnExecute = actShowPointProjectExecute
    end
    object actMarksAddPoint: TAction
      Category = 'Marks'
      Caption = 'Add Placemark'
      Hint = 'Add new placemark'
      ImageIndex = 15
      OnExecute = actMarksAddPointExecute
    end
    object actMarksAddLine: TAction
      Category = 'Marks'
      Caption = 'Add Path'
      Hint = 'Add new path'
      ImageIndex = 16
      OnExecute = actMarksAddLineExecute
    end
    object actMarksAddPolygon: TAction
      Category = 'Marks'
      Caption = 'Add Polygon'
      Hint = 'Add polygon'
      ImageIndex = 17
      OnExecute = actMarksAddPolygonExecute
    end
    object actShowPlacemarkManager: TAction
      Category = 'Marks'
      Caption = 'Placemark Manager'
      Hint = 'Placemark manager'
      ImageIndex = 18
      OnExecute = actShowPlacemarkManagerExecute
    end
    object actConfigMarksHide: TAction
      Category = 'Marks'
      Caption = 'Hide All Placemarks'
      Hint = 'Hide all placemarks'
      ImageIndex = 19
      OnExecute = actConfigMarksHideExecute
    end
    object actConfigDownloadModeCache: TAction
      Tag = 1
      Category = 'Download Mode'
      Caption = 'Cache'
      ImageIndex = 1
      ShortCut = 32835
      OnExecute = actConfigDownloadModeExecute
    end
    object actConfigDownloadModeInternet: TAction
      Category = 'Download Mode'
      Caption = 'Internet'
      ImageIndex = 0
      ShortCut = 32841
      OnExecute = actConfigDownloadModeExecute
    end
    object actConfigDownloadModeCacheInternet: TAction
      Tag = 2
      Category = 'Download Mode'
      Caption = 'Internet && Cache'
      ImageIndex = 2
      ShortCut = 32834
      OnExecute = actConfigDownloadModeExecute
    end
    object actMapsEditMapParams: TAction
      Category = 'Maps'
      Caption = 'Map Settings'
      ShortCut = 49232
      OnExecute = actMapsEditMapParamsExecute
    end
    object actConfigOptionsShow: TAction
      Category = 'Config'
      Caption = 'Options'
      ImageIndex = 20
      OnExecute = actConfigOptionsShowExecute
    end
    object actGpsConnect: TAction
      Category = 'GPS'
      Caption = 'Connect to GPS Receiver'
      Hint = 'Connect to GPS receiver'
      ImageIndex = 14
      ShortCut = 49223
      OnExecute = actGpsConnectExecute
    end
    object actConfigGpsShowTrack: TAction
      Category = 'GPS'
      Caption = 'Show GPS Track'
      Hint = 'Show GPS track'
      ImageIndex = 6
      ShortCut = 49236
      OnExecute = actConfigGpsShowTrackExecute
    end
    object actConfigGpsFollowPosition: TAction
      Category = 'GPS'
      Caption = 'Follow GPS Position'
      Hint = 'Follow GPS Position'
      ImageIndex = 5
      OnExecute = actConfigGpsFollowPositionExecute
    end
    object actConfigGpsFollowPositionAtCenter: TAction
      Category = 'GPS'
      Caption = 'Centered GPS Position'
      OnExecute = actConfigGpsFollowPositionAtCenterExecute
    end
    object actGpsMarkPointAdd: TAction
      Category = 'GPS'
      Caption = 'Add Placemark'
      ImageIndex = 15
      ShortCut = 49235
      OnExecute = actGpsMarkPointAddExecute
    end
    object actGpsTrackSaveToDb: TAction
      Category = 'GPS'
      Caption = 'Add Track to Database'
      ImageIndex = 25
      OnExecute = actGpsTrackSaveToDbExecute
    end
    object actGpsTrackClear: TAction
      Category = 'GPS'
      Caption = 'Delete Track'
      ImageIndex = 35
      OnExecute = actGpsTrackClearExecute
    end
    object actConfigGpsOptionsShow: TAction
      Category = 'GPS'
      Caption = 'Options'
      ImageIndex = 20
      OnExecute = actConfigGpsOptionsShowExecute
    end
    object actConfigProjectionOfMapUse: TAction
      Tag = -1
      Category = 'View'
      Caption = 'Map Original Projection (from zmp)'
      OnExecute = actConfigProjectionUseExecute
    end
    object actViewFillingMapMainMapUse: TAction
      Category = 'View\FillingMap'
      Caption = 'Displayed Main Map'
      OnExecute = actViewFillingMapMapUseExecute
    end
    object actConfigInterfaceOptionsShow: TAction
      Category = 'Config'
      Caption = 'Interface Options'
      OnExecute = actConfigInterfaceOptionsShowExecute
    end
    object actMapsAllLayersHide: TAction
      Category = 'Maps'
      Caption = 'Hide All'
      OnExecute = actMapsAllLayersHideExecute
    end
    object actFavoriteAdd: TAction
      Category = 'Favorite'
      Caption = 'Add'
      OnExecute = actFavoriteAddExecute
    end
    object actFavoriteManage: TAction
      Category = 'Favorite'
      Caption = 'Manage'
      OnExecute = actFavoriteManageExecute
    end
    object actViewNotMinimized: TAction
      Category = 'View'
      Caption = 'Restore'
      OnExecute = actViewNotMinimizedExecute
    end
    object actIconsSettings: TAction
      Category = 'Marks'
      Caption = 'Icons Settings'
      OnExecute = actIconsSettingsExecute
    end
    object actViewSunCalc: TAction
      Category = 'View'
      Caption = 'Sun Calculator'
      ImageIndex = 66
      OnExecute = actViewSunCalcExecute
    end
    object actViewMoonCalc: TAction
      Category = 'View'
      Caption = 'Moon Calculator'
      ImageIndex = 75
      OnExecute = actViewMoonCalcExecute
    end
  end
  object tbxpmnScaleLine: TTBXPopupMenu
    Left = 160
    Top = 312
    object tbiConfigScaleLineExtended: TTBXItem
      Action = actConfigScaleLineExtended
    end
    object tbxsbmScaleLineNumberFormat: TTBXSubmenuItem
      Caption = 'Numbers Format'
      object tbiConfigScaleLineNumberFormatNice: TTBXItem
        Action = actConfigScaleLineNumberFormatNice
      end
      object tbiConfigScaleLineNumberFormatRound: TTBXItem
        Action = actConfigScaleLineNumberFormatRound
      end
      object tbiConfigScaleLineNumberFormatScience: TTBXItem
        Action = actConfigScaleLineNumberFormatScience
      end
    end
    object tbiConfigScaleLineVisible: TTBXItem
      Action = actConfigScaleLineVisible
    end
    object tbiConfigScaleLineOptionsShow: TTBXItem
      Action = actConfigScaleLineOptionsShow
    end
  end
  object MarksNewImageList: TTBXImageList
    Height = 24
    Width = 24
    Left = 48
    Top = 208
    PngDIB = {
      0400000089504E470D0A1A0A0000000D49484452000000180000006008060000
      000706B25400000C544944415478DADD59795453571A7F4B92970408A0AC614B
      028A088EB4625BC10D41A5A8804B69011154089D2EA8A0B547A71D717ADCA667
      A8D6711DBB693B9D237646ADF6D4A9E8B4334A95DA8AD662DB015CA614450BB2
      87246F7E375C3A310D24A0FD637ACFF91D2EF77EEF7EF77EF75B7EEF85619C6B
      52C085E3381501E9D331878D7330CF025E824C36D9DBCB6B994EA7DB44E0EDED
      5D2C084202E6BC1DADD1DF24C7B2ACD6D7D7B7282535F595F5EBD717EDDEB56B
      FEEEDDBBE76FDCB061595A6A6A29E6564026B4BF75B87EB6EEE7EFEFFFCC334F
      3F9DBB61FDFAE1995959EE71E3C72BE3E2E2944F6464A8A030ACF0D967B303D4
      EA422809A0A7755A815CE9E2320DBB9C9D9393E3ADD16A798542C14AA5520B48
      3F44A3E117606EEEDCB9292E2E2E497846705A01B9C8C0C0C06978D81BC7E0F1
      3F6BB343968CC144DCEC3973BC828383A7E17F776715B03CCFBB694242B4A161
      6152F4FBBC2409E642753AA956A30926CFD833935D0568BC52A984A308A4DF8F
      8FB18C4C1018C8CAC833F614F0F69F63557E7E7E33939292D41E1E1E7C5F5A44
      51641A1B1B4D656565576BEBEA0E98CDE61FECF9B93D054361A28DAF6CDEFCF8
      F4E9D3C951583BB2A2A1AB4B3C7EFC78FBB38585EFD5D4D4144361A3530AD064
      72B97CE6ECB4B497D6949484858686C2DCFC5DB2D8AD585B53632C2929A9D95F
      56F6626767E7DF306C7056016943D1F40B73730B962C591280C6B33DDE444C23
      D6D7D79B5FDDB2E5BB3FEDD9B31B66DA8EE1C6BE5241DF57880052FBFB2F5BBE
      7C79CEA2458B3CDD542A8B7C5B5B9BB86FEFBEE675EBD7BD73FDFAF54DD0778D
      E81DA8028B97C134510F4447FFBEB4B474C223E3C6C9C97D579D3F6FC0A9CE9E
      AEA828321A8DE72067EA2F99396A0A571797CC828282B5AB56AFF64324335BB7
      6EBDBD69D3A68D4D4D4D3B30DFCADC632381376C6C4CCC479F5556765657571B
      121313CF4A2492076CE3C83C562B0E5689AB979757C9CE1D3B9ACAF6EF6F090E
      0ADA01530DB15DD8F6EF409A14096E46FEE2C5579E5BB1E27B5757D785B6C98D
      2CDA8BC19C8083EDA3A6C4C757263FFAE825994C16679B05EE5501B98780E161
      6147C2870D3B817EA8B583DC0F1391E62D17847781BFA2EF674FE05E2E99340F
      8044ECEB24CA999FA1C981C781F92436989FA9C907BA38E784F7C8517387A02E
      042216FC013FD2C79817991B346D21990EEEC8A316281472B99787BB7B085846
      1881A7A7A706E97C28998312BEBFB2C7F5B5B8946C0F8BF8F8F88C4A9C3A754C
      5151D1F092356B8291FF838B8B8A864DC318E64623008712D9BE94D85500790E
      BB53813544CCCFCAD22C5DB2C435352D4D121B17C7C7C6C6F2B35252244B972E
      75C9CECE0EF1F3F58D84AC3B7213EF940242471048020A796062424200589D00
      76C1A2F8B0B03D4340FABAD050363525458692AA866C103625A3F4A67F05A434
      6237026CAD46D614D46A358B0B65B04B06E316903E19F3C7DC94840419AA9D3F
      C6E5B665D5426DECD89F788E004AA80C0E0961710F9645B13B6B19CB18A29A69
      94040DBD332247D712392256947B6A41C9AE4084E03AF021678F8A900BC3E5F1
      F0A2BB16B66E55FFE9707BE2CD8619BFFB98CDAA57442689529787304CD85D14
      30032800A6FEE462B033E2410A50F440105D05B1B7ADA2978E7E1FF9E2A1FAB4
      5BAD464F93C9C4C89B2E9DEC68BCB24B6CBBF947C62DE01844CE00D5C0DFEF5E
      5D5FA9E0620A246E6E6E1E23478E9CB677EFDE4528EAF928F2FAEEEE6E3D16D3
      E7BE5EB3376C755555E8AAF355BF7EE3ABED6FEE7B373F2A2A2A893C43BCCF71
      5E4683DDE588D8C8ACACACCC53A74EE5DDBC79530FDEA37F7CD7B7EF5A1607F6
      7E72F5C58A8A8ABC9C050B32F172120593CAB97E79E6DD71C0A36A7968349AD8
      E5C5C5D9E7BFF8223F63E7E57D6471827F7ED5507CE1C285FCE757AE5CA0D36A
      C763F79EE499011518B8A21429C127222262CAC3CB0FEDD2AC3C57A583594E5E
      BCB1A2AEAE2E7FCBE62D0B619AC4219E9EBE38B0D449867257C071F07541F2D8
      9FF5C2C26395EA6515E7DF3B5DF77C434383BEFCF8F13C04D83CA40A2D64E45C
      5FAEE6B0E57D9ACB2C3EFD01975BFE494AE11F9EBB78F1623E684BFEDAB56B73
      61BE71EEEEEE2AC7A6D1574A816420C06A2C1028050E33F9678E08D3D68D9F38
      61C29C23EFBF9F575E5E9E979C9C9C0E2708C1C5CAAC939CFD92D9B3F8E13EF0
      0693733C0897A8029D9F8097C145DBB76D5B141E1E3E15BBFFF162FB2FFA3D27
      98036CB75AF84D8BE25EB7150439022E222B3333FBC982821C04E103D8BDD2DA
      F6CED116041AF0930B934A2452F0D3C0B8D8D87470A30CB8B08E644F5BEA722F
      BC488274E1A5D3685242B5DAD9E8FBE16092FBC98B48907AC05449C00CCA4BB9
      FBC98B88295C817820115039411806AC8090DD11C0484A5F58E63E378E2A910F
      64F7CE0892FA20216903F5584080290077F455185392B9FE4EE3881749495675
      57A97448C90F0605053D8C5A1D83C08B44FDF58788D09DF6B69AC9AB9800F7D6
      032F03C54006100F487847BC08413572C2C489E1E9E9E9BE60111EF1F1F1EEA3
      A2A286B40BFEBA1A6DDE6346D780990C27419964FDF1A08C12630D2D9DCD83E2
      45377C1323EA3439F33D7D03474B8D773CD9B686B34FCE8A669F4A1DC3F482B6
      4CDE1E2F229B8769B4339293C3323233E55A9D8E55E11D19FC8779E1E80F31E5
      DF764593AF306302A5DF8C1F1DEA1719AA56F3324517CBF1626FEE3B7BB97EE0
      BCA8707FFDB88ADA8E11883A267D722413356A54B8CACD95634C06A5D9D42D01
      25717CC97DF1A2E2B2EFC67E7EB583BC3A31F32645902F3916A6411887047B12
      4D264E14CD8E999D3D5EB4FA607DF4E99AB6F09EC547DC157F2CD8222DF6765D
      D5212F7AE33C17F9D1D7EDA3B194CDE2C83DD80CE80CD3D2D26A62A4CA564E22
      33B21C275ADF016FF77317CF93E0F1AE52C44FFAEC86349A9CA2D72C3DA7EC39
      A9C96466DA3B3A9896B6CE4E89D2BD95E3A526DB4B664930E06F9C8589ED8A69
      B094C0D4D7423885C732955288F2F3F192CC9F1ECD5ABEDD5969208B832B8937
      1A6F195F3B50FE61B747581B2351E820F31D240826F79C608C7E02F1574BA61C
      A39F05CC6494DE93445EAE347536B7CF9B14EE26C8048EE739A6777766B39931
      741B98FD878ED57DF4E52DCEE8A2766324721F5C88D42AD0487B87285845FFF9
      9EA664D29A9F4C8D91FD6A5810DFD5D1266145935410487DE72CE6311A4DCC9E
      4367CCD79A8D52A354D584C103D07E90E1F8FD78F614E1C6400DF0AF1FAB12A2
      CFFAE55A259ACDA244A630886655F39DD62619DED30417178EBD76A5B6FA6475
      5378D39D966EB1B5E12F42D5CB070CB59F7498C9B17A5A3BD0F03F2F2266411B
      3B426D7BD93D9EC7B2A2D1D8CD89C62E796DEDD59A73D7BB873737DF11994B65
      DBF84F4B8F1A1A6B3A4CE442FAAAB5FDE669B81CF10C89E0DA5E56F6769D4AF3
      E0187894A8BBBEEFADEACB872B0D0643A7D168345B974CEE6C2D3BA07A00BB8B
      7B0E9F39714B1612D6DEDECECCF5FAEABD9BD5A7AEC1FFEF607113F940685B8B
      ADFF77A860FBC1CA93A2A08A35B1D2CEC8A6A365B7BF39DD74FBF6ED46ECBE0B
      A6B12C44766DCD28AC4FD1AF89B61DFCEC243C633263369A25574E94B6194F07
      7D2D087C474747B391D8068EE0B820EA2B77123C7544BC0B185BD53BC7641F0B
      1B2C2F22913C89069ABD46BE459722C26F92EFD9824CF608F1BC2E83E1344CDF
      44D6B2B5BDED25F7A68A29345DF4C6423370040BFFC38AB6901F86C6D2FC7586
      7ECE340F8C98E82B0580FDBFE245BFDC16497EA01B80BC177DC6296637847AC9
      6F06A0E005E053FAAC43057A40091CA2F5612B1062474E43E788CC41EAC6F9CE
      289807FC1B28272FB2C0D340189D4BA460E818995B4C65498199EB4CBA26F4E4
      04ED27D0E24116201FC45FA3E3A4FF167083CA6C06BEECADC38E4E40086C0BED
      931FDF9AE8CF27C3AD6486D3286EA26F3B0C8D6C993327207C4347FB1780F180
      16386725F3391D234CEF433AA6A36CC2A1829334F99137FF1DF41EC2A87DBBA8
      CC5C9AAFBA819D54F641609F330A8867E4508F5843CD443E2793DFC98E529959
      749ECC198112FA0BF93667FD7A239066F57F36BD87C7A89791FE02ABF9D9F499
      41FD0A45DA07402CE04BCD55456DFFE8FD7809F4A1BE7F1678955E304BC77CEE
      8782747A570934A8488417D2B17487DF209C50D05B4E89DD57022FD38DADA273
      5BEF4501F16D52872FD37CB4897A1831D5FBF4443A9A260665A20C6A6FE23141
      74D7EE343E16D1B90C47DF20FA6B5FD2F01F6675A269C06FAD08C2A5BE6A8123
      1345D302FF314D72F156BCBF9346BC895E3E91FD62A0269A47FF4EA4814672D4
      3AEA9E43A8C267AC52C780DBC3343A67D094D0572B021EFAE5B287FF02299045
      90BE5B0EAA0000000049454E44AE426082}
  end
end
