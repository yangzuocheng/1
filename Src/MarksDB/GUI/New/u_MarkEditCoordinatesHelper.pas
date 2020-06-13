unit u_MarkEditCoordinatesHelper;

interface

uses
  SysUtils,
  Dialogs,
  UITypes,
  u_Dialogs,
  t_GeoTypes;

type
  TMarkEditCoordinatesHelper = record

    class function TryStrToCoordinates(
      const AStr: string;
      out APoint: TDoublePoint
    ): Boolean; static;

    class procedure CoordinatesToStr(
      const APoint: TDoublePoint;
      out ALat, ALon: string
    ); static;
  end;

implementation

resourcestring
  rsParsingCoordinatesError = 'Parsing coordinates error!';
  rsInvalidLatFmt = 'Invalid Latitude "%s"';
  rsInvalidLonFmt = 'Invalid Longitude "%s"';

var
  GFormatSettings: TFormatSettings;

{ TMarkEditCoordinatesHelper }

class function TMarkEditCoordinatesHelper.TryStrToCoordinates(
  const AStr: string;
  out APoint: TDoublePoint
): Boolean;
var
  I: Integer;
  VLat, VLon: string;
begin
  Result := False;

  VLat := '';
  VLon := '';

  I := Pos(',', AStr);
  if I > 0 then begin
    VLat := Trim( Copy(AStr, 1, I-1) );
    VLon := Trim( Copy(AStr, I+1) );
  end;

  if (VLat = '') or (VLon = '') then begin
    _MessageDlg(rsParsingCoordinatesError, mtError, [mbOK], 0);
    Exit;
  end;

  if not TryStrToFloat(VLat, APoint.Y, GFormatSettings) then begin
    _MessageDlg(Format(rsInvalidLatFmt, [VLat]), mtError, [mbOK], 0);
    Exit;
  end;

  if not TryStrToFloat(VLon, APoint.X, GFormatSettings) then begin
    _MessageDlg(Format(rsInvalidLonFmt, [VLon]), mtError, [mbOK], 0);
    Exit;
  end;

  Result := True;
end;

class procedure TMarkEditCoordinatesHelper.CoordinatesToStr(
  const APoint: TDoublePoint;
  out ALat: string;
  out ALon: string
);

  function CoordToText(const ACoord: Double): string;
  var
    I: Integer;
    VLen: Integer;
  begin
    Result := FormatFloat('0.00000000', ACoord, GFormatSettings);

    // 12.3450000 -> 12.345
    // 12.0000000 -> 12.0

    VLen := Length(Result);
    for I := VLen downto 1 do begin
      if Result[I] = '0' then begin
        Dec(VLen);
      end else begin
        Break;
      end;
    end;

    if VLen <> Length(Result) then begin
      if Result[VLen] = '.' then begin
        Inc(VLen);
      end;
      SetLength(Result, VLen);
    end;
  end;

begin
  ALat := CoordToText(APoint.Y);
  ALon := CoordToText(APoint.X);
end;

initialization
  GFormatSettings.DecimalSeparator := '.';

end.
