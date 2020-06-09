unit frm_MarkEditPointCoordinates;

interface

uses
  SysUtils,
  Classes,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  UITypes,
  t_GeoTypes,
  i_LanguageManager,
  i_GeometryLonLat,
  i_GeometryLonLatFactory,  
  u_CommonFormAndFrameParents;

type
  TfrmMarkEditPointCoordinates = class(TFormWitghLanguageManager)
    lblCoords: TLabel;
    edtCoords: TEdit;
    btnNext: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
  private
    FFormatSettings: TFormatSettings;
    FGeometryLonLatFactory: IGeometryLonLatFactory;
  public
    constructor Create(
      const ALanguageManager: ILanguageManager;
      const AGeometryLonLatFactory: IGeometryLonLatFactory
    ); reintroduce;

    function GetLonLatPoint: IGeometryLonLatPoint;
  end;

implementation

resourcestring
  rsParsingCoordinatesError = 'Parsing coordinates error!';
  rsInvalidLatFmt = 'Invalid Latitude "%s"';
  rsInvalidLonFmt = 'Invalid Longitude "%s"';

{$R *.dfm}

{ TfrmMarkEditPointCoordinates }

constructor TfrmMarkEditPointCoordinates.Create(
  const ALanguageManager: ILanguageManager;
  const AGeometryLonLatFactory: IGeometryLonLatFactory
);
begin
  inherited Create(ALanguageManager);
  FGeometryLonLatFactory := AGeometryLonLatFactory;
  FFormatSettings.DecimalSeparator := '.';
end;

procedure TfrmMarkEditPointCoordinates.FormShow(Sender: TObject);
begin
  edtCoords.SetFocus;
end;

function TfrmMarkEditPointCoordinates.GetLonLatPoint: IGeometryLonLatPoint;
var
  I: Integer;
  VStr: string;
  VLat, VLon: string;
  VPoint: TDoublePoint;
begin
  Result := nil;

  if ShowModal <> mrOk then begin
    Exit;
  end;

  VStr := Trim(edtCoords.Text);
  if VStr = '' then begin
    Exit;
  end;

  VLat := '';
  VLon := '';

  I := Pos(',', VStr);
  if I > 0 then begin
    VLat := Trim( Copy(VStr, 1, I-1) );
    VLon := Trim( Copy(VStr, I+1) );
  end;

  if (VLat = '') or (VLon = '') then begin
    MessageDlg(rsParsingCoordinatesError, mtError, [mbOK], 0);
    Exit;
  end;

  if not TryStrToFloat(VLat, VPoint.Y, FFormatSettings) then begin
    MessageDlg(Format(rsInvalidLatFmt, [VLat]), mtError, [mbOK], 0);
    Exit;
  end;

  if not TryStrToFloat(VLon, VPoint.X, FFormatSettings) then begin
    MessageDlg(Format(rsInvalidLonFmt, [VLon]), mtError, [mbOK], 0);
    Exit;
  end;

  Result := FGeometryLonLatFactory.CreateLonLatPoint(VPoint);
end;

end.
