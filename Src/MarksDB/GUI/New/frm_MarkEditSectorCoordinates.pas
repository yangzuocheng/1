unit frm_MarkEditSectorCoordinates;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Spin,
  StdCtrls,
  UITypes,
  t_GeoTypes,
  i_LanguageManager,
  i_GeometryLonLat,
  i_GeometryLonLatFactory,
  i_DistanceCalculator,
  u_CommonFormAndFrameParents;

type
  TfrmMarkEditSectorCoordinates = class(TFormWitghLanguageManager)
    lblCoords: TLabel;
    edtCoords: TEdit;
    btnNext: TButton;
    btnCancel: TButton;
    seAzimuth: TSpinEdit;
    lblAzimuth: TLabel;
    lblAngle: TLabel;
    seAngle: TSpinEdit;
    seLen: TSpinEdit;
    lblLen: TLabel;
  private
    FCalc: IDistanceCalculator;
    FGeometryLonLatFactory: IGeometryLonLatFactory;

    function CreateSectorPolygon(
      const APoint: TDoublePoint;
      const AAzimuth: Integer;
      const AAngle: Integer;
      const ALength: Integer
    ): IGeometryLonLat;

    function CreateDistanceCalculator: IDistanceCalculator;
  public
    constructor Create(
      const ALanguageManager: ILanguageManager;
      const AGeometryLonLatFactory: IGeometryLonLatFactory
    ); reintroduce;

    function GetLonLatSector(
      out ASectorPoint: IGeometryLonLat;
      out ASectorPolygon: IGeometryLonLat
    ): Boolean;
  end;

implementation

uses
  GeographicLib,
  i_DoublePointsAggregator,
  u_DoublePointsAggregator,
  u_DistanceCalculatorByGeographicLib,
  u_DistanceCalculatorByVincentyAlgorithm,
  u_MarkEditCoordinatesHelper;

{$R *.dfm}

{ TfrmMarkEditSectorCoordinates }

constructor TfrmMarkEditSectorCoordinates.Create(
  const ALanguageManager: ILanguageManager;
  const AGeometryLonLatFactory: IGeometryLonLatFactory
);
begin
  inherited Create(ALanguageManager);

  FGeometryLonLatFactory := AGeometryLonLatFactory;
  FCalc := CreateDistanceCalculator;
end;

function TfrmMarkEditSectorCoordinates.CreateDistanceCalculator: IDistanceCalculator;
var
  VRadiusA, VRadiusB: Integer;
begin
  // WGS84 ellipsoid
  VRadiusA := 6378137;
  VRadiusB := 6356752;

  if init_geodesic_dll(geodesic_dll, False) then begin
    Result := TDistanceCalculatorByGeographicLib.Create(VRadiusA, VRadiusB);
  end else begin
    Result := TDistanceCalculatorByVincentyAlgorithm.Create(VRadiusA, VRadiusB);
  end;
end;

function TfrmMarkEditSectorCoordinates.GetLonLatSector(
  out ASectorPoint: IGeometryLonLat;
  out ASectorPolygon: IGeometryLonLat
): Boolean;
var
  VStr: string;
  VPoint: TDoublePoint;
begin
  Result := False;

  if ShowModal <> mrOk then begin
    Exit;
  end;

  VStr := Trim(edtCoords.Text);
  if VStr = '' then begin
    Exit;
  end;

  if not TMarkEditCoordinatesHelper.TryStrToCoordinates(VStr, VPoint) then begin
    Exit;
  end;

  ASectorPoint := FGeometryLonLatFactory.CreateLonLatPoint(VPoint);
  ASectorPolygon := CreateSectorPolygon(VPoint, seAzimuth.Value, seAngle.Value, seLen.Value);

  Result := Assigned(ASectorPoint) and Assigned(ASectorPolygon);
end;

function CheckAzimuth(const AAzimuth: Double): Double; inline;
begin
  Result := AAzimuth;
  if Result < 0 then begin
    Result := Result + 360;
  end else
  if Result > 360 then begin
    Result := Result - 360;
  end;
end;

function TfrmMarkEditSectorCoordinates.CreateSectorPolygon(
  const APoint: TDoublePoint;
  const AAzimuth: Integer;
  const AAngle: Integer;
  const ALength: Integer
): IGeometryLonLat;
const
  CCirclePointsCount = 180;
var
  X1, Y1: Double;
  VStep: Double;
  VAngle: Double;
  VBearing: Double;
  VBearingFinish: Double;
  VPoint: TDoublePoint;
  VAggregator: IDoublePointsAggregator;
begin
  Assert( (AAzimuth >= 0) and (AAzimuth <= 360) );
  Assert( (AAngle >= 0) and (AAngle <= 360) );
  Assert(ALength > 0);

  VAggregator := TDoublePointsAggregator.Create(CCirclePointsCount);

  VAggregator.Add(APoint);

  X1 := APoint.X;
  Y1 := APoint.Y;

  VBearing := CheckAzimuth(AAzimuth - AAngle / 2);
  VBearingFinish := CheckAzimuth(VBearing + AAngle);

  VStep := 360 / CCirclePointsCount;
  VAngle := 0;

  while Round(VAngle) < AAngle do begin
    FCalc.ComputeFinishPosition(Y1, X1, VBearing, ALength, VPoint.Y, VPoint.X);
    VAggregator.Add(VPoint);
    VAngle := VAngle + VStep;
    VBearing := CheckAzimuth(VBearing + VStep);
  end;

  FCalc.ComputeFinishPosition(Y1, X1, VBearingFinish, ALength, VPoint.Y, VPoint.X);
  VAggregator.Add(VPoint);

  VAggregator.Add(APoint);

  Result :=
    FGeometryLonLatFactory.CreateLonLatPolygon(
      VAggregator.Points,
      VAggregator.Count
    );
end;


end.
