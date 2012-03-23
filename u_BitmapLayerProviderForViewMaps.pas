unit u_BitmapLayerProviderForViewMaps;

interface

uses
  Types,
  i_OperationNotifier,
  i_CoordConverter,
  i_Bitmap32Static,
  i_LocalCoordConverter,
  i_MapTypes,
  i_BitmapLayerProvider,
  i_BitmapPostProcessingConfig,
  i_TileError,
  u_MapType;

type
  TBitmapLayerProviderForViewMaps = class(TInterfacedObject, IBitmapLayerProvider)
  private
    FMainMap: IMapType;
    FLayersList: IMapTypeListStatic;
    FUsePrevZoomAtMap: Boolean;
    FUsePrevZoomAtLayer: Boolean;
    FUseCache: Boolean;
    FPostProcessingConfig:IBitmapPostProcessingConfigStatic;
    FErrorLogger: ITileErrorLogger;
    function GetBitmapByMapType(
      AOperationID: Integer;
      ACancelNotifier: IOperationNotifier;
      ATile: TPoint;
      Azoom: byte;
      ACoordConverterTarget: ICoordConverter;
      ASource: IBitmap32Static;
      AUsePrevZoom: Boolean;
      AMapType: IMapType
    ): IBitmap32Static;
  private
    function GetBitmapRect(
      AOperationID: Integer;
      ACancelNotifier: IOperationNotifier;
      ALocalConverter: ILocalCoordConverter
    ): IBitmap32Static;
  public
    constructor Create(
      AMainMap: IMapType;
      ALayersList: IMapTypeListStatic;
      AUsePrevZoomAtMap: Boolean;
      AUsePrevZoomAtLayer: Boolean;
      AUseCache: Boolean;
      APostProcessingConfig:IBitmapPostProcessingConfigStatic;
      AErrorLogger: ITileErrorLogger
    );
  end;

implementation

uses
  SysUtils,
  GR32,
  GR32_Resamplers,
  i_TileObjCache,
  u_Bitmap32Static,
  u_TileErrorInfo;

{ TBitmapLayerProviderForViewMaps }

constructor TBitmapLayerProviderForViewMaps.Create(
  AMainMap: IMapType;
  ALayersList: IMapTypeListStatic;
  AUsePrevZoomAtMap, AUsePrevZoomAtLayer, AUseCache: Boolean;
  APostProcessingConfig: IBitmapPostProcessingConfigStatic;
  AErrorLogger: ITileErrorLogger
);
begin
  FMainMap := AMainMap;
  FLayersList := ALayersList;
  FUsePrevZoomAtMap := AUsePrevZoomAtMap;
  FUsePrevZoomAtLayer := AUsePrevZoomAtLayer;
  FUseCache := AUseCache;
  FPostProcessingConfig := APostProcessingConfig;
  FErrorLogger := AErrorLogger;
end;

function TBitmapLayerProviderForViewMaps.GetBitmapByMapType(
  AOperationID: Integer;
  ACancelNotifier: IOperationNotifier;
  ATile: TPoint;
  Azoom: byte;
  ACoordConverterTarget: ICoordConverter;
  ASource: IBitmap32Static;
  AUsePrevZoom: Boolean;
  AMapType: IMapType
): IBitmap32Static;
var
  VCache: ITileObjCacheBitmap;
  VLayer: IBitmap32Static;
  VResultBmp: TCustomBitmap32;
begin
  Result := ASource;
  VLayer := nil;
  try
    VCache := nil;
    if FUseCache then begin
      VCache := AMapType.MapType.CacheBitmap;
    end;
    VLayer :=
      AMapType.MapType.LoadTileUni(
        ATile,
        AZoom,
        ACoordConverterTarget,
        AUsePrevZoom,
        True,
        False,
        VCache
      );
  except
    on E: Exception do begin
      if FErrorLogger <> nil then begin
        FErrorLogger.LogError(
          TTileErrorInfo.Create(
            AMapType.MapType,
            AZoom,
            ATile,
            E.Message
          )
        );
      end else begin
        raise;
      end;
    end;
  else
      if FErrorLogger <> nil then begin
        FErrorLogger.LogError(
          TTileErrorInfo.Create(
            AMapType.MapType,
            AZoom,
            ATile,
            'Unexpected read tile error'
          )
        );
      end else begin
        raise;
      end;
  end;

  if VLayer <> nil then begin
    if Result = nil then begin
      Result := VLayer;
    end else begin
      VResultBmp := TCustomBitmap32.Create;
      try
        VResultBmp.Assign(Result.Bitmap);
        BlockTransfer(
          VResultBmp,
          0, 0,
          VResultBmp.ClipRect,
          VLayer.Bitmap,
          VLayer.Bitmap.BoundsRect,
          dmBlend
        );
        Result := TBitmap32Static.CreateWithOwn(VResultBmp);
        VResultBmp := nil;
      finally
        VResultBmp.Free;
      end;
    end;
  end;
end;

function TBitmapLayerProviderForViewMaps.GetBitmapRect(
  AOperationID: Integer;
  ACancelNotifier: IOperationNotifier;
  ALocalConverter: ILocalCoordConverter
): IBitmap32Static;
var
  VTile: TPoint;
  Vzoom: byte;
  VCoordConverterTarget: ICoordConverter;
  VPixelRect: TRect;
  i: Integer;
begin
  Vzoom := ALocalConverter.Zoom;
  VCoordConverterTarget := ALocalConverter.GeoConverter;
  VPixelRect := ALocalConverter.GetRectInMapPixel;
  VTile := VCoordConverterTarget.PixelRect2TileRect(VPixelRect, Vzoom).TopLeft;
  Assert(EqualRect(VPixelRect, VCoordConverterTarget.TilePos2PixelRect(VTile, Vzoom)));

  Result :=
    GetBitmapByMapType(
      AOperationID,
      ACancelNotifier,
      VTile,
      Vzoom,
      VCoordConverterTarget,
      Result,
      FUsePrevZoomAtMap,
      FMainMap
    );
  if FLayersList <> nil then begin
    for i := 0 to FLayersList.Count - 1 do begin
      Result :=
        GetBitmapByMapType(
          AOperationID,
          ACancelNotifier,
          VTile,
          Vzoom,
          VCoordConverterTarget,
          Result,
          FUsePrevZoomAtLayer,
          FLayersList.Items[i]
        );
    end;
  end;
  if FPostProcessingConfig <> nil then begin
    Result := FPostProcessingConfig.Process(Result);
  end;
end;

end.
