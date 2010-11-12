// JCL_DEBUG_EXPERT_INSERTJDBG ON
program SASPlanet;

uses
  Forms,
  iniFiles,
  sysutils,
  windows,
  MidasLib,
  ijl in 'src\ijl.pas',
  KAZip in 'src\KAZip.pas',
  ECWReader in 'src\ECWReader.pas',
  ECWwriter in 'src\ECWwriter.pas',
  SwinHttp in 'src\SwinHttp.pas',
  gnugettext in 'src\gnugettext.pas',
  Langs in 'src\Langs.pas',
  u_WideStrings in 'src\u_WideStrings.pas',
  cUnicode in 'src\cUnicode.pas',
  cUnicodeChar in 'src\cUnicodeChar.pas',
  CPDrv in 'src\CPDrv.pas',
  BMSearch in 'src\BMSearch.pas',
  i_IGUIDList in 'src\i_IGUIDList.pas',
  u_GUIDList in 'src\u_GUIDList.pas',
  u_GUIDInterfaceList in 'src\u_GUIDInterfaceList.pas',
  u_GUIDObjectList in 'src\u_GUIDObjectList.pas',
  i_JclNotify in 'src\i_JclNotify.pas',
  u_JclNotify in 'src\u_JclNotify.pas',
  u_UseNewFonts in 'src\u_UseNewFonts.pas',
  i_IFileNameIterator in 'src\i_IFileNameIterator.pas',
  u_FileNameIteratorInFolderByMaskList in 'src\u_FileNameIteratorInFolderByMaskList.pas',
  u_FileNameIteratorFolderWithSubfolders in 'src\u_FileNameIteratorFolderWithSubfolders.pas',
  u_FileNameIteratorInFolderByMask in 'src\u_FileNameIteratorInFolderByMask.pas',
  u_FoldersIteratorRecursiveByLevels in 'src\u_FoldersIteratorRecursiveByLevels.pas',
  u_FoldersIteratorRecursiveByLevelsWithIgnoredFolders in 'src\u_FoldersIteratorRecursiveByLevelsWithIgnoredFolders.pas',
  u_ZmpFileNamesIteratorFactory in 'u_ZmpFileNamesIteratorFactory.pas',
  c_SasVersion in 'c_SasVersion.pas',
  c_CoordConverter in 'c_CoordConverter.pas',
  t_GeoTypes in 't_GeoTypes.pas',
  t_CommonTypes in 't_CommonTypes.pas',
  t_LoadEvent in 't_LoadEvent.pas',
  UTimeZones in 'UTimeZones.pas',
  UResStrings in 'UResStrings.pas',
  u_CommonFormAndFrameParents in 'u_CommonFormAndFrameParents.pas',
  i_IConfigDataProvider in 'i_IConfigDataProvider.pas',
  i_IConfigDataWriteProvider in 'i_IConfigDataWriteProvider.pas',
  u_ConfigDataProviderByKaZip in 'u_ConfigDataProviderByKaZip.pas',
  u_ConfigDataProviderByIniFile in 'u_ConfigDataProviderByIniFile.pas',
  u_ConfigDataProviderByIniFileSection in 'u_ConfigDataProviderByIniFileSection.pas',
  u_ConfigDataProviderByFolder in 'u_ConfigDataProviderByFolder.pas',
  u_ConfigDataWriteProviderByIniFileSection in 'u_ConfigDataWriteProviderByIniFileSection.pas',
  u_ConfigDataWriteProviderByIniFile in 'u_ConfigDataWriteProviderByIniFile.pas',
  u_SaveLoadTBConfigByConfigProvider in 'u_SaveLoadTBConfigByConfigProvider.pas',
  i_ILogSimple in 'i_ILogSimple.pas',
  i_ILogForTaskThread in 'i_ILogForTaskThread.pas',
  i_ITileDownlodSession in 'i_ITileDownlodSession.pas',
  i_ISimpleFactory in 'i_ISimpleFactory.pas',
  i_IListOfObjectsWithTTL in 'i_IListOfObjectsWithTTL.pas',
  i_IObjectWithTTL in 'i_IObjectWithTTL.pas',
  i_IPoolElement in 'i_IPoolElement.pas',
  i_IMemObjCache in 'i_IMemObjCache.pas',
  i_ITileObjCache in 'i_ITileObjCache.pas',
  u_TileCacheSimpleGlobal in 'u_TileCacheSimpleGlobal.pas',
  u_ThreadDownloadTiles in 'RegionProcess\u_ThreadDownloadTiles.pas',
  u_ThreadMapCombineBase in 'RegionProcess\u_ThreadMapCombineBase.pas',
  u_ThreadMapCombineBMP in 'RegionProcess\u_ThreadMapCombineBMP.pas',
  u_ThreadMapCombineECW in 'RegionProcess\u_ThreadMapCombineECW.pas',
  u_ThreadMapCombineJPG in 'RegionProcess\u_ThreadMapCombineJPG.pas',
  u_ThreadMapCombineKMZ in 'RegionProcess\u_ThreadMapCombineKMZ.pas',
  u_ThreadRegionProcessAbstract in 'RegionProcess\u_ThreadRegionProcessAbstract.pas',
  u_ThreadExportAbstract in 'RegionProcess\u_ThreadExportAbstract.pas',
  u_ThreadExportToZip in 'RegionProcess\u_ThreadExportToZip.pas',
  u_ThreadExportToFileSystem in 'RegionProcess\u_ThreadExportToFileSystem.pas',
  u_ThreadExportIPhone in 'RegionProcess\u_ThreadExportIPhone.pas',
  u_ThreadExportKML in 'RegionProcess\u_ThreadExportKML.pas',
  u_ThreadExportYaMaps in 'RegionProcess\u_ThreadExportYaMaps.pas',
  u_ThreadExportToAUX in 'RegionProcess\u_ThreadExportToAUX.pas',
  u_ThreadDeleteTiles in 'RegionProcess\u_ThreadDeleteTiles.pas',
  u_ThreadGenPrevZoom in 'RegionProcess\u_ThreadGenPrevZoom.pas',
  u_TileDownloaderBase in 'u_TileDownloaderBase.pas',
  u_TileDownloaderUI in 'u_TileDownloaderUI.pas',
  u_TileDownloaderUIOneTile in 'u_TileDownloaderUIOneTile.pas',
  u_TileDownloaderThreadBase in 'u_TileDownloaderThreadBase.pas',
  u_LogForTaskThread in 'u_LogForTaskThread.pas',
  u_NotifyEventListener in 'u_NotifyEventListener.pas',
  u_MapLayerWiki in 'MapLayers\u_MapLayerWiki.pas',
  UPLT in 'UPLT.pas',
  Ugeofun in 'Ugeofun.pas',
  u_GlobalCahceConfig in 'u_GlobalCahceConfig.pas',
  u_GlobalState in 'u_GlobalState.pas',
  u_GPSState in 'u_GPSState.pas',
  u_LastSelectionInfo in 'u_LastSelectionInfo.pas',
  u_GeoToStr in 'u_GeoToStr.pas',
  u_KmlInfoSimple in 'u_KmlInfoSimple.pas',
  i_IKmlInfoSimpleLoader in 'i_IKmlInfoSimpleLoader.pas',
  u_KmlInfoSimpleParser in 'u_KmlInfoSimpleParser.pas',
  u_KmzInfoSimpleParser in 'u_KmzInfoSimpleParser.pas',
  UECWWrite in 'UECWWrite.pas',
  bmpUtil in 'bmpUtil.pas',
  Uimgfun in 'Uimgfun.pas',
  i_BitmapTileSaveLoad in 'i_BitmapTileSaveLoad.pas',
  u_BitmapTileJpegLoader in 'BitmapTileSaveLoad\u_BitmapTileJpegLoader.pas',
  u_BitmapTileJpegSaverIJL in 'BitmapTileSaveLoad\u_BitmapTileJpegSaverIJL.pas',
  u_BitmapTileVampyreLoader in 'BitmapTileSaveLoad\u_BitmapTileVampyreLoader.pas',
  u_BitmapTileVampyreSaver in 'BitmapTileSaveLoad\u_BitmapTileVampyreSaver.pas',
  i_IBitmapTypeExtManager in 'i_IBitmapTypeExtManager.pas',
  u_BitmapTypeExtManagerSimple in 'u_BitmapTypeExtManagerSimple.pas',
  u_MapTypeCacheConfig in 'u_MapTypeCacheConfig.pas',
  UMapType in 'UMapType.pas',
  i_MapTypeIconsList in 'i_MapTypeIconsList.pas',
  u_MapTypeIconsList in 'u_MapTypeIconsList.pas',
  u_MemFileCache in 'u_MemFileCache.pas',
  UYaMobile in 'UYaMobile.pas',
  UGSM in 'UGSM.pas',
  u_UrlGenerator in 'u_UrlGenerator.pas',
  i_ICoordConverter in 'i_ICoordConverter.pas',
  u_CoordConverterAbstract in 'u_CoordConverterAbstract.pas',
  u_CoordConverterBasic in 'u_CoordConverterBasic.pas',
  u_CoordConverterMercatorOnEllipsoid in 'u_CoordConverterMercatorOnEllipsoid.pas',
  u_CoordConverterMercatorOnSphere in 'u_CoordConverterMercatorOnSphere.pas',
  u_CoordConverterSimpleLonLat in 'u_CoordConverterSimpleLonLat.pas',
  i_ICoordConverterFactory in 'i_ICoordConverterFactory.pas',
  u_CoordConverterFactorySimple in 'u_CoordConverterFactorySimple.pas',
  i_ContentTypeInfo in 'i_ContentTypeInfo.pas',
  i_IContentTypeManager in 'i_IContentTypeManager.pas',
  i_IContentConverter in 'i_IContentConverter.pas',
  u_ContentTypeInfo in 'u_ContentTypeInfo.pas',
  u_ContentConverterBase in 'u_ContentConverterBase.pas',
  u_ContentConverterBitmap in 'u_ContentConverterBitmap.pas',
  u_ContentConverterKmz2Kml in 'u_ContentConverterKmz2Kml.pas',
  u_ContentConverterKml2Kmz in 'u_ContentConverterKml2Kmz.pas',
  u_ContentTypeListByKey in 'u_ContentTypeListByKey.pas',
  u_ContentTypeManagerSimple in 'u_ContentTypeManagerSimple.pas',
  u_ContentConvertersListByKey in 'u_ContentConvertersListByKey.pas',
  u_ContentConverterMatrix in 'u_ContentConverterMatrix.pas',
  i_ITileInfoBasic in 'i_ITileInfoBasic.pas',
  u_TileInfoBasic in 'u_TileInfoBasic.pas',
  i_ITileIterator in 'i_ITileIterator.pas',
  u_TileIteratorAbstract in 'u_TileIteratorAbstract.pas',
  u_TileIteratorStuped in 'u_TileIteratorStuped.pas',
  u_TileIteratorSpiralByRect in 'u_TileIteratorSpiralByRect.pas',
  u_TileIteratorByRect in 'u_TileIteratorByRect.pas',
  u_GECache in 'u_GECache.pas',
  u_GECrypt in 'u_GECrypt.pas',
  u_GETexture in 'u_GETexture.pas',
  u_GEIndexFile in 'u_GEIndexFile.pas',
  i_GeoCoder in 'i_GeoCoder.pas',
  u_GeoCodePalcemark in 'u_GeoCodePalcemark.pas',
  u_EnumUnknown in 'u_EnumUnknown.pas',
  u_GeoCodeResult in 'u_GeoCodeResult.pas',
  i_IProxySettings in 'i_IProxySettings.pas',
  u_GeoCoderBasic in 'u_GeoCoderBasic.pas',
  u_GeoCoderByYandex in 'u_GeoCoderByYandex.pas',
  u_GeoCoderByGoogle in 'u_GeoCoderByGoogle.pas',
  u_ProxySettingsFromTInetConnect in 'u_ProxySettingsFromTInetConnect.pas',
  i_IMapViewGoto in 'i_IMapViewGoto.pas',
  u_MapViewGotoOnFMain in 'u_MapViewGotoOnFMain.pas',
  i_ISearchResultPresenter in 'i_ISearchResultPresenter.pas',
  u_SearchResultPresenterStuped in 'u_SearchResultPresenterStuped.pas',
  u_MarksSimple in 'u_MarksSimple.pas',
  u_MarksReadWriteSimple in 'u_MarksReadWriteSimple.pas',
  i_IBitmapLayerProvider in 'i_IBitmapLayerProvider.pas',
  u_MapMarksBitmapLayerProviderStuped in 'u_MapMarksBitmapLayerProviderStuped.pas',
  u_WindowLayerBasic in 'MapLayers\u_WindowLayerBasic.pas',
  u_WindowLayerBasicList in 'u_WindowLayerBasicList.pas',
  u_MiniMapLayer in 'MapLayers\u_MiniMapLayer.pas',
  u_CenterScale in 'MapLayers\u_CenterScale.pas',
  u_LayerStatBar in 'MapLayers\u_LayerStatBar.pas',
  u_MapLayerBasic in 'MapLayers\u_MapLayerBasic.pas',
  u_MapLayerBase in 'MapLayers\u_MapLayerBase.pas',
  u_MapLayerFixedBase in 'MapLayers\u_MapLayerFixedBase.pas',
  u_MapLayerScaledBase in 'MapLayers\u_MapLayerScaledBase.pas',
  u_MapTileLayerBasic in 'MapLayers\u_MapTileLayerBasic.pas',
  u_MapMainLayer in 'MapLayers\u_MapMainLayer.pas',
  u_MapMarksLayer in 'MapLayers\u_MapMarksLayer.pas',
  u_MapLayerNavToMark in 'MapLayers\u_MapLayerNavToMark.pas',
  u_MapFillingLayer in 'MapLayers\u_MapFillingLayer.pas',
  u_SelectionLayer in 'MapLayers\u_SelectionLayer.pas',
  u_LayerScaleLine in 'MapLayers\u_LayerScaleLine.pas',
  u_MapGPSLayer in 'MapLayers\u_MapGPSLayer.pas',
  u_MapLayerShowError in 'MapLayers\u_MapLayerShowError.pas',
  u_MapNalLayer in 'MapLayers\u_MapNalLayer.pas',
  u_MapLayerGoto in 'MapLayers\u_MapLayerGoto.pas',
  i_Marks in 'i_Marks.pas',
  u_MarkBasic in 'u_MarkBasic.pas',
  u_MarkCategory in 'u_MarkCategory.pas',
  dm_MarksDb in 'dm_MarksDb.pas' {DMMarksDb: TDataModule},
  u_EnumUnknownEmpty in 'u_EnumUnknownEmpty.pas',
  i_ITileFileNameGenerator in 'i_ITileFileNameGenerator.pas',
  u_TileFileNameSAS in 'u_TileFileNameSAS.pas',
  u_TileFileNameGMV in 'u_TileFileNameGMV.pas',
  u_TileFileNameES in 'u_TileFileNameES.pas',
  u_TileFileNameGM1 in 'u_TileFileNameGM1.pas',
  u_TileFileNameGM2 in 'u_TileFileNameGM2.pas',
  i_ITileFileNameGeneratorsList in 'i_ITileFileNameGeneratorsList.pas',
  u_TileStorageAbstract in 'u_TileStorageAbstract.pas',
  u_TileStorageGEStuped in 'u_TileStorageGEStuped.pas',
  u_TileStorageGE in 'u_TileStorageGE.pas',
  u_TileStorageFileSystem in 'u_TileStorageFileSystem.pas',
  i_MemCache in 'i_MemCache.pas',
  u_TileFileNameGeneratorsSimpleList in 'u_TileFileNameGeneratorsSimpleList.pas',
  u_TileDownloaderBaseFactory in 'u_TileDownloaderBaseFactory.pas',
  u_GarbageCollectorThread in 'u_GarbageCollectorThread.pas',
  u_ListOfObjectsWithTTL in 'u_ListOfObjectsWithTTL.pas',
  u_PoolElement in 'u_PoolElement.pas',
  u_PoolOfObjectsSimple in 'u_PoolOfObjectsSimple.pas',
  i_IMapCalibration in 'i_IMapCalibration.pas',
  u_MapCalibrationOzi in 'u_MapCalibrationOzi.pas',
  u_MapCalibrationDat in 'u_MapCalibrationDat.pas',
  u_MapCalibrationKml in 'u_MapCalibrationKml.pas',
  u_MapCalibrationTab in 'u_MapCalibrationTab.pas',
  u_MapCalibrationWorldFiles in 'u_MapCalibrationWorldFiles.pas',
  u_MapCalibrationListBasic in 'u_MapCalibrationListBasic.pas',
  i_IAntiBan in 'i_IAntiBan.pas',
  u_AntiBanStuped in 'u_AntiBanStuped.pas',
  i_MapTypes in 'i_MapTypes.pas',
  u_MapTypeBasic in 'u_MapTypeBasic.pas',
  u_MapTypeList in 'u_MapTypeList.pas',
  u_MapTypeListGeneratorFromFullListBasic in 'u_MapTypeListGeneratorFromFullListBasic.pas',
  u_MapTypeListGeneratorFromFullListForMiniMap in 'u_MapTypeListGeneratorFromFullListForMiniMap.pas',
  i_IMapTypeMenuItem in 'i_IMapTypeMenuItem.pas',
  i_IMapTypeMenuItmesList in 'i_IMapTypeMenuItmesList.pas',
  u_MapTypeMenuItemBasic in 'u_MapTypeMenuItemBasic.pas',
  u_MapTypeMenuItmesList in 'u_MapTypeMenuItmesList.pas',
  u_MapTypeMenuItemsGeneratorBasic in 'u_MapTypeMenuItemsGeneratorBasic.pas',
  u_MiniMapMenuItemsFactory in 'u_MiniMapMenuItemsFactory.pas',
  i_IPosChangeMessage in 'i_IPosChangeMessage.pas',
  u_PosChangeMessage in 'u_PosChangeMessage.pas',
  u_MapChangeMessage in 'u_MapChangeMessage.pas',
  i_IMapChangeMessage in 'i_IMapChangeMessage.pas',
  u_HybrChangeMessage in 'u_HybrChangeMessage.pas',
  i_IHybrChangeMessage in 'i_IHybrChangeMessage.pas',
  u_ActiveMapConfig in 'u_ActiveMapConfig.pas',
  u_ActiveMapWithHybrConfig in 'u_ActiveMapWithHybrConfig.pas',
  i_IActiveMapsConfig in 'i_IActiveMapsConfig.pas',
  i_ActiveMapsConfigSaveLoad in 'i_ActiveMapsConfigSaveLoad.pas',
  u_MapsConfigByConfigDataProvider in 'u_MapsConfigByConfigDataProvider.pas',
  u_MapViewPortState in 'u_MapViewPortState.pas',
  u_ShortcutManager in 'u_ShortcutManager.pas',
  i_ILanguageManager in 'i_ILanguageManager.pas',
  u_LanguageManager in 'u_LanguageManager.pas',
  u_LanguagesEx in 'u_LanguagesEx.pas',
  i_IGPSRecorder in 'i_IGPSRecorder.pas',
  u_GPSRecorderStuped in 'u_GPSRecorderStuped.pas',
  i_GPS in 'i_GPS.pas',
  i_IGPSModule in 'i_IGPSModule.pas',
  i_IGPSModuleByCOMPortSettings in 'i_IGPSModuleByCOMPortSettings.pas',
  u_GPSModuleByCOMPortSettings in 'u_GPSModuleByCOMPortSettings.pas',
  u_GPSSatelliteInfo in 'u_GPSSatelliteInfo.pas',
  u_GPSSatellitesInView in 'u_GPSSatellitesInView.pas',
  u_GPSPositionStatic in 'u_GPSPositionStatic.pas',
  u_GPSModuleAbstract in 'u_GPSModuleAbstract.pas',
  u_GPSModuleByZylGPS in 'u_GPSModuleByZylGPS.pas',
  u_GPSLogWriterToPlt in 'u_GPSLogWriterToPlt.pas',
  u_ExportProviderAbstract in 'RegionProcess\u_ExportProviderAbstract.pas',
  fr_ExportYaMaps in 'RegionProcess\fr_ExportYaMaps.pas' {frExportYaMaps: TFrame},
  u_ExportProviderYaMaps in 'RegionProcess\u_ExportProviderYaMaps.pas',
  fr_ExportGEKml in 'RegionProcess\fr_ExportGEKml.pas' {frExportGEKml: TFrame},
  u_ExportProviderGEKml in 'RegionProcess\u_ExportProviderGEKml.pas',
  fr_ExportIPhone in 'RegionProcess\fr_ExportIPhone.pas' {frExportIPhone: TFrame},
  u_ExportProviderIPhone in 'RegionProcess\u_ExportProviderIPhone.pas',
  fr_ExportAUX in 'RegionProcess\fr_ExportAUX.pas' {frExportAUX: TFrame},
  u_ExportProviderAUX in 'RegionProcess\u_ExportProviderAUX.pas',
  fr_ExportToFileCont in 'RegionProcess\fr_ExportToFileCont.pas' {frExportToFileCont: TFrame},
  u_ExportProviderZip in 'RegionProcess\u_ExportProviderZip.pas',
  fr_TilesDelete in 'RegionProcess\fr_TilesDelete.pas' {frTilesDelete: TFrame},
  u_ProviderTilesDelete in 'RegionProcess\u_ProviderTilesDelete.pas',
  fr_TilesGenPrev in 'RegionProcess\fr_TilesGenPrev.pas' {frTilesGenPrev: TFrame},
  u_ProviderTilesGenPrev in 'RegionProcess\u_ProviderTilesGenPrev.pas',
  fr_TilesCopy in 'RegionProcess\fr_TilesCopy.pas' {frTilesCopy: TFrame},
  u_ProviderTilesCopy in 'RegionProcess\u_ProviderTilesCopy.pas',
  fr_MapCombine in 'RegionProcess\fr_MapCombine.pas' {frMapCombine: TFrame},
  u_ProviderMapCombine in 'RegionProcess\u_ProviderMapCombine.pas',
  fr_TilesDownload in 'RegionProcess\fr_TilesDownload.pas' {frTilesDownload: TFrame},
  u_ProviderTilesDownload in 'RegionProcess\u_ProviderTilesDownload.pas',
  fr_ShortCutList in 'fr_ShortCutList.pas' {frShortCutList: TFrame},
  fr_MarkDescription in 'fr_MarkDescription.pas' {frMarkDescription: TFrame},
  fr_LonLat in 'fr_LonLat.pas' {frLonLat: TFrame},
  Unit1 in 'Unit1.pas' {Fmain},
  frm_GoTo in 'frm_GoTo.pas' {frmGoTo},
  UAbout in 'UAbout.pas' {Fabout},
  Usettings in 'Usettings.pas' {FSettings},
  USaveas in 'USaveas.pas' {Fsaveas},
  UProgress in 'UProgress.pas' {FProgress},
  frm_SearchResults in 'frm_SearchResults.pas' {frmSearchResults},
  UaddPoint in 'UaddPoint.pas' {FaddPoint},
  Unit4 in 'Unit4.pas' {Fprogress2},
  ULogo in 'ULogo.pas' {FLogo},
  USelLonLat in 'USelLonLat.pas' {FSelLonLat},
  Ubrowser in 'Ubrowser.pas' {Fbrowser},
  UaddLine in 'UaddLine.pas' {FaddLine},
  UaddPoly in 'UaddPoly.pas' {FAddPoly},
  UEditMap in 'UEditMap.pas' {FEditMap},
  UMarksExplorer in 'UMarksExplorer.pas' {FMarksExplorer},
  UImport in 'UImport.pas' {FImport},
  UAddCategory in 'UAddCategory.pas' {FAddCategory},
  UFDGAvailablePic in 'UFDGAvailablePic.pas' {FDGAvailablePic},
  UShortcutEditor in 'UShortcutEditor.pas' {FShortcutChange};

{$R *.res} {$R *Pics.res}
begin

  GState := TGlobalState.Create;
  try
    Application.Initialize;
    Application.Title := 'SAS.�������';
    //logo
    if GState.Show_logo then begin
      FLogo:=TFLogo.Create(application);
      FLogo.Label1.Caption:='v '+SASVersion;
      FLogo.Show;
      Application.ProcessMessages;
    end;
    try
      GState.LoadConfig;
    except
      on E: Exception do begin
        Application.ShowException(E);
        Exit;
      end;
    end;
    //xLogo
    Application.HelpFile := '';
    Application.CreateForm(TFmain, Fmain);
  Application.CreateForm(TfrmGoTo, frmGoTo);
  Application.CreateForm(TFabout, Fabout);
  Application.CreateForm(TFSettings, FSettings);
  Application.CreateForm(TFsaveas, Fsaveas);
  Application.CreateForm(TFMarksExplorer, FMarksExplorer);
  Application.CreateForm(TFImport, FImport);
  Application.CreateForm(TFAddCategory, FAddCategory);
  Application.CreateForm(TFDGAvailablePic, FDGAvailablePic);
  Application.CreateForm(TFaddPoint, FaddPoint);
  Application.CreateForm(TFprogress2, Fprogress2);
  Application.CreateForm(TFbrowser, Fbrowser);
  Application.CreateForm(TFaddLine, FaddLine);
  Application.CreateForm(TFAddPoly, FAddPoly);
  Application.CreateForm(TFEditMap, FEditMap);
  Application.CreateForm(TFShortcutChange, FShortcutChange);
  Fmain.WebBrowser1.Navigate('about:blank');
    Fbrowser.EmbeddedWB1.Navigate('about:blank');
    Application.Run;
  finally
    GState.Free;
  end;
end.
