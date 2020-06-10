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
  u_MarkEditCoordinatesHelper,
  u_CommonFormAndFrameParents;

type
  TfrmMarkEditPointCoordinates = class(TFormWitghLanguageManager)
    lblCoords: TLabel;
    edtCoords: TEdit;
    btnNext: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FGeometryLonLatFactory: IGeometryLonLatFactory;
  public
    constructor Create(
      const ALanguageManager: ILanguageManager;
      const AGeometryLonLatFactory: IGeometryLonLatFactory
    ); reintroduce;

    function GetLonLatPoint: IGeometryLonLatPoint;
  end;

implementation

{$R *.dfm}

{ TfrmMarkEditPointCoordinates }

constructor TfrmMarkEditPointCoordinates.Create(
  const ALanguageManager: ILanguageManager;
  const AGeometryLonLatFactory: IGeometryLonLatFactory
);
begin
  inherited Create(ALanguageManager);
  FGeometryLonLatFactory := AGeometryLonLatFactory;
end;

procedure TfrmMarkEditPointCoordinates.FormShow(Sender: TObject);
begin
  edtCoords.SetFocus;
end;

procedure TfrmMarkEditPointCoordinates.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    CanClose := Trim(edtCoords.Text) <> '';
  end;
end;

function TfrmMarkEditPointCoordinates.GetLonLatPoint: IGeometryLonLatPoint;
var
  VStr: string;
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

  if TMarkEditCoordinatesHelper.TryStrToCoordinates(VStr, VPoint) then begin
    Result := FGeometryLonLatFactory.CreateLonLatPoint(VPoint);
  end;
end;

end.
