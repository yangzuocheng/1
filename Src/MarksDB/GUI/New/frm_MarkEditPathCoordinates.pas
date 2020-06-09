unit frm_MarkEditPathCoordinates;

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
  StdCtrls,
  StrUtils,
  UITypes,
  t_GeoTypes,
  i_LanguageManager,
  i_DoublePointsAggregator,
  i_GeometryLonLat,
  i_GeometryLonLatFactory,  
  u_CommonFormAndFrameParents;

type
  TfrmMarkEditPathCoordinates = class(TFormWitghLanguageManager)
    mmoCoordinates: TMemo;
    lblCount: TLabel;
    edtPointsCount: TEdit;
    lblCoordinates: TLabel;
    btnNext: TButton;
    btnCancel: TButton;
  private
    FFormatSettings: TFormatSettings;
    FGeometryLonLatFactory: IGeometryLonLatFactory;

    function GetGeometry(const AMinPointsCount: Integer): IGeometryLonLat;
    function GetPointsCount(const AMinRequired: Integer): Integer;
    function GetPointsCoordinates(const ACapasity: Integer): IDoublePointsAggregator;

    procedure Clear;
  public
    constructor Create(
      const ALanguageManager: ILanguageManager;
      const AGeometryLonLatFactory: IGeometryLonLatFactory
    ); reintroduce;

    function GetLonLatLine: IGeometryLonLatLine;
    function GetLonLatPolygon: IGeometryLonLatPolygon;
  end;

implementation

uses
  gnugettext,
  u_DoublePointsAggregator;

{$R *.dfm}

procedure ShowError(const AMsg: string);
begin
  MessageDlg(AMsg, mtError, [mbOK], 0);
end;

procedure ShowErrorFmt(const AMsg: string; const AArgs: array of const);
begin
  MessageDlg(Format(AMsg, AArgs), mtError, [mbOK], 0);
end;

{ TfrmMarkEditPathCoordinates }

constructor TfrmMarkEditPathCoordinates.Create(
  const ALanguageManager: ILanguageManager;
  const AGeometryLonLatFactory: IGeometryLonLatFactory
);
begin
  inherited Create(ALanguageManager);

  FGeometryLonLatFactory := AGeometryLonLatFactory;
  FFormatSettings.DecimalSeparator := '.';
end;

procedure TfrmMarkEditPathCoordinates.Clear;
begin
  edtPointsCount.Text := '';
  mmoCoordinates.Lines.Clear;
end;

function TfrmMarkEditPathCoordinates.GetLonLatLine: IGeometryLonLatLine;
begin
  Self.Caption := _('Add New Path');
  Result := GetGeometry(2) as IGeometryLonLatLine;
end;

function TfrmMarkEditPathCoordinates.GetLonLatPolygon: IGeometryLonLatPolygon;
begin
  Self.Caption := _('Add New Polygon');
  Result := GetGeometry(3) as IGeometryLonLatPolygon;
end;

function TfrmMarkEditPathCoordinates.GetGeometry(
  const AMinPointsCount: Integer
): IGeometryLonLat;
var
  VCount: Integer;
  VResult: Integer;
  VAggreagator: IDoublePointsAggregator;
begin
  Result := nil;

  if ShowModal <> mrOk then begin
    Exit;
  end;

  VCount := Self.GetPointsCount(AMinPointsCount);
  if VCount < AMinPointsCount then begin
    Exit;
  end;

  VAggreagator := GetPointsCoordinates(VCount);
  if Assigned(VAggreagator) then begin

    if VCount <> VAggreagator.Count then begin

      if VAggreagator.Count >= AMinPointsCount then begin
        VResult :=
          MessageDlg(
            Format(
              _('Expected %d points, but got %d.') + #13#10 +
              _('Do you want to continue anyway?'),
              [VCount, VAggreagator.Count]
            ),
            mtConfirmation, [mbYes, mbNo], 0
          );
      end else begin
        ShowErrorFmt(
          _('Expected %d points, but got %d.'), [VCount, VAggreagator.Count]
        );
        VResult := mrAbort;
      end;

      if VResult <> mrYes then begin
        Exit;
      end;
    end;

    if AMinPointsCount = 2 then begin
      // path
      Result :=
        FGeometryLonLatFactory.CreateLonLatLine(
          VAggreagator.Points,
          VAggreagator.Count
        );
    end else begin
      // polygon
      Result :=
        FGeometryLonLatFactory.CreateLonLatPolygon(
          VAggreagator.Points,
          VAggreagator.Count
        );
    end;

    Self.Clear;
  end;
end;

function TfrmMarkEditPathCoordinates.GetPointsCount(const AMinRequired: Integer): Integer;
var
  VStr: string;
begin
  Result := -1;

  VStr := Trim(edtPointsCount.Text);

  if VStr = '' then begin
    ShowError(_('Enter Points Count first!'));
    Exit;
  end;

  if not TryStrToInt(VStr, Result) then begin
    ShowErrorFmt(_('Points Count: Invalid value "%s"'), [VStr]);
    Exit;
  end;

  if Result < AMinRequired then begin
    ShowErrorFmt(_('Points Count: At least %d points are required!'), [AMinRequired]);
    Result := -1;
    Exit;
  end;
end;

type
  TStringArray = array of string;

function SplitStr(
  const AStr: string;
  const ASep: Char;
  out ADest: TStringArray
): Integer; inline;
var
  I, J: Integer;
begin
  Result := 0;

  J := 1;
  while J < Length(AStr) do begin
    if Result >= Length(ADest) then begin
      SetLength(ADest, Result + 32);
    end;
    I := PosEx(ASep, AStr, J);
    if I = 0 then begin
      ADest[Result] := Trim(Copy(AStr, J));
      Inc(Result);
      Break;
    end;
    ADest[Result] := Trim(Copy(AStr, J, I-J));
    Inc(Result);
    J := I + 1;
  end;
end;

function TfrmMarkEditPathCoordinates.GetPointsCoordinates(
  const ACapasity: Integer
): IDoublePointsAggregator;
var
  I: Integer;
  VStr: string;
  VCount: Integer;
  VPoint: TDoublePoint;
  VPointsStr: TStringArray;
  VLatLonStr: TStringArray;
  VAggregator: IDoublePointsAggregator;
begin
  Result := nil;

  VStr := Trim(mmoCoordinates.Text);
  if VStr = '' then begin
    ShowError(_('Enter Points Coordinates first!'));
    Exit;
  end;

  SetLength(VPointsStr, ACapasity);
  VCount := SplitStr(VStr, ';', VPointsStr);

  if VCount <= 0 then begin
    Exit;
  end;

  VAggregator := TDoublePointsAggregator.Create(VCount);

  SetLength(VLatLonStr, 2);
  for I := 0 to VCount - 1 do begin

    if SplitStr(VPointsStr[I], ',', VLatLonStr) <> 2 then begin
      ShowErrorFmt(_('Invalid coordinates: "%s"'), [VPointsStr[I]]);
      Exit;
    end;

    if not TryStrToFloat(VLatLonStr[0], VPoint.Y, FFormatSettings) then begin
      ShowErrorFmt(_('Invalid Latitude "%s"'), [VLatLonStr[0]]);
      Exit;
    end;

    if not TryStrToFloat(VLatLonStr[1], VPoint.X, FFormatSettings) then begin
      ShowErrorFmt(_('Invalid Longitude "%s"'), [VLatLonStr[1]]);
      Exit;
    end;

    VAggregator.Add(VPoint);
  end;

  Result := VAggregator;
end;

end.
