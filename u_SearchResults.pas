unit u_SearchResults;

interface

uses
  Dialogs,
  Controls,
  u_CommonFormAndFrameParents,
  t_GeoTypes,
  i_Datum,
  i_MapViewGoto,
  i_ViewPortState,
  i_ValueToStringConverter,
  i_LocalCoordConverter,
  i_GeoCoder,
  i_SearchResultPresenter,
  fr_SearchResultsItem;

type
  TSearchResultPresenterOnPanel = class(TInterfacedObject, ISearchResultPresenter)
  private
    FMapGoto: IMapViewGoto;
    FViewPortState: IViewPortState;
    FDrawParent:TWinControl;
    FSearchWindow:TWinControl;
    FValueConverterConfig: IValueToStringConverterConfig;
    FSearchItems:array of TfrSearchResultsItem;
  protected
    procedure ClearSearchResults;
    procedure ShowSearchResults(ASearchResult: IGeoCodeResult; AZoom: Byte);
  public
    constructor Create(
      AMapGoto: IMapViewGoto;
      ADrawParent: TWinControl;
      ASearchWindow: TWinControl;
      AValueConverterConfig: IValueToStringConverterConfig;
      AViewPortState: IViewPortState
    );
    destructor Destroy; override;
  end;

implementation

uses
  ActiveX,
  u_GlobalState,
  u_ResStrings,
  frm_Main;

{ TSearchResultPresenterWithForm }

constructor TSearchResultPresenterOnPanel.Create(
  AMapGoto: IMapViewGoto;
  ADrawParent: TWinControl;
  ASearchWindow: TWinControl;
  AValueConverterConfig: IValueToStringConverterConfig;
  AViewPortState: IViewPortState
);
begin
  FMapGoto := AMapGoto;
  FValueConverterConfig := AValueConverterConfig;
  FViewPortState := AViewPortState;
  FDrawParent := ADrawParent;
  FSearchWindow := ASearchWindow;
end;

destructor TSearchResultPresenterOnPanel.Destroy;
var i:integer;
begin
  FMapGoto := nil;
  ClearSearchResults;
  inherited;
end;

procedure TSearchResultPresenterOnPanel.ClearSearchResults;
var i:integer;
begin
  for i := 0 to length(FSearchItems) - 1 do begin
    FSearchItems[i].Free;
  end;
  SetLength(FSearchItems,0);
end;

procedure TSearchResultPresenterOnPanel.ShowSearchResults(
  ASearchResult: IGeoCodeResult; AZoom: Byte);
var
  VPlacemark: IGeoCodePlacemark;
  VEnum: IEnumUnknown;
  i: Cardinal;
  LengthFSearchItems:integer;
begin
  ClearSearchResults;
  if ASearchResult.GetResultCode in [200, 203] then begin
    if ASearchResult.GetPlacemarksCount <= 0 then begin
      ShowMessage(SAS_STR_notfound);
    end else begin
      if ASearchResult.GetPlacemarksCount = 1 then begin
        VEnum := ASearchResult.GetPlacemarks;
        if VEnum.Next(1, VPlacemark, @i) = S_OK then begin
          LengthFSearchItems:=length(FSearchItems);
          SetLength(FSearchItems,LengthFSearchItems+1);
          FSearchItems[LengthFSearchItems]:=TfrSearchResultsItem.Create(nil, FDrawParent, VPlacemark, FMapGoto);
          FMapGoto.GotoPos(VPlacemark.GetPoint, AZoom);
          if ASearchResult.GetResultCode = 200 then begin
            ShowMessage(SAS_STR_foundplace+' "'+VPlacemark.GetAddress+'"');
          end;
        end;
      end else begin
        VEnum := ASearchResult.GetPlacemarks;
        while VEnum.Next(1, VPlacemark, @i) = S_OK do begin
          LengthFSearchItems:=length(FSearchItems);
          SetLength(FSearchItems,LengthFSearchItems+1);
          FSearchItems[LengthFSearchItems]:=TfrSearchResultsItem.Create(nil, FDrawParent, VPlacemark, FMapGoto);
          if LengthFSearchItems>0 then begin
            FSearchItems[LengthFSearchItems].Top:=FSearchItems[LengthFSearchItems-1].Top+1
          end;
        end;
        FSearchWindow.Show;
        VEnum.Reset;
        if VEnum.Next(1, VPlacemark, @i) = S_OK then begin
          FMapGoto.GotoPos(VPlacemark.GetPoint, AZoom);
        end;
      end;
    end;
  end else begin
    case ASearchResult.GetResultCode of
      503: begin
        ShowMessage(SAS_ERR_Noconnectionstointernet + #13#10 + ASearchResult.GetMessage);
      end;
      407: begin
        ShowMessage(SAS_ERR_Authorization + #13#10 + ASearchResult.GetMessage);
      end;
      416: begin
        ShowMessage('������ ������� ������: '+ #13#10 + ASearchResult.GetMessage);
      end;
      404: begin
        ShowMessage(SAS_STR_notfound);
      end;
      else begin
        ShowMessage('����������� ������: '+ #13#10 + ASearchResult.GetMessage);
      end;
    end
  end;
end;

end.
