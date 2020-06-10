unit frm_MarkEditPointNew;

interface

uses
  Windows,
  SysUtils,
  Classes,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  Buttons,
  Spin,
  t_GeoTypes,
  u_CommonFormAndFrameParents,
  i_LanguageManager,
  i_PathConfig,
  i_ProjectionSetChangeable,
  i_LocalCoordConverterChangeable,
  i_CoordFromStringParser,
  i_CoordToStringConverter,
  i_CoordRepresentationConfig,
  i_MarkPicture,
  i_GeometryLonLatFactory,
  i_VectorDataItemSimple,
  i_Appearance,
  i_AppearanceOfMarkFactory,
  i_MarkFactory,
  i_MarkCategoryDB,
  fr_MarkDescription,
  fr_PictureSelectFromList,
  fr_SelectedPicture,
  fr_MarkCategorySelectOrAdd;

type
  TfrmMarkEditPointNew = class(TFormWitghLanguageManager)
    edtName: TEdit;
    lblName: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    Bevel1: TBevel;
    chkVisible: TCheckBox;
    clrbxTextColor: TColorBox;
    lblTextColor: TLabel;
    lblShadowColor: TLabel;
    seFontSize: TSpinEdit;
    lblFontSize: TLabel;
    clrbxShadowColor: TColorBox;
    lblIconSize: TLabel;
    seIconSize: TSpinEdit;
    seTransp: TSpinEdit;
    lblTransp: TLabel;
    btnTextColor: TSpeedButton;
    btnShadowColor: TSpeedButton;
    ColorDialog1: TColorDialog;
    pnlBottomButtons: TPanel;
    flwpnlTrahsparent: TFlowPanel;
    flwpnlTextColor: TFlowPanel;
    flwpnlShadowColor: TFlowPanel;
    flwpnlFontSize: TFlowPanel;
    flwpnlIconSize: TFlowPanel;
    grdpnlStyleRows: TGridPanel;
    grdpnlLine1: TGridPanel;
    grdpnlLine2: TGridPanel;
    pnlDescription: TPanel;
    pnlLonLat: TPanel;
    pnlTop: TPanel;
    pnlImage: TPanel;
    pnlTopMain: TPanel;
    pnlCategory: TPanel;
    pnlName: TPanel;
    btnSetAsTemplate: TButton;
    lblReadOnly: TLabel;
    grdpnlLonLat: TGridPanel;
    lblLon: TLabel;
    edtLat: TEdit;
    edtLon: TEdit;
    lblLat: TLabel;
    procedure btnTextColorClick(Sender: TObject);
    procedure btnShadowColorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSetAsTemplateClick(Sender: TObject);
    procedure imgIconMouseDown(Sender: TObject);
  private
    FGeometryFactory: IGeometryLonLatFactory;
    FSourceMark: IVectorDataItem;
    FCategoryDB: IMarkCategoryDB;
    FAppearanceOfMarkFactory: IAppearanceOfMarkFactory;
    FPictureList: IMarkPictureList;
    FMarkFactory: IMarkFactory;
    frMarkDescription: TfrMarkDescription;
    frMarkCategory: TfrMarkCategorySelectOrAdd;
    frSelectPicture: TfrPictureSelectFromList;
    frSelectedPicture: TfrSelectedPicture;
    procedure SelectImageFromList(Sender: TObject);
    function MakeAppearance: IAppearance;

    procedure SetLonLat(const APoint: TDoublePoint);
  public
    constructor Create(
      const ALanguageManager: ILanguageManager;
      const AMediaPath: IPathConfig;
      const AProjectionSetChangeable: IProjectionSetChangeable;
      const AGeometryFactory: IGeometryLonLatFactory;
      const AAppearanceOfMarkFactory: IAppearanceOfMarkFactory;
      const AMarkFactory: IMarkFactory;
      const ACategoryDB: IMarkCategoryDB;
      const APictureList: IMarkPictureList;
      const AViewPortState: ILocalCoordConverterChangeable;
      const ACoordRepresentationConfig: ICoordRepresentationConfig;
      const ACoordFromStringParser: ICoordFromStringParser;
      const ACoordToStringConverter: ICoordToStringConverterChangeable
    ); reintroduce;
    destructor Destroy; override;

    function AddMark(
      const AMark: IVectorDataItem;
      var AVisible: Boolean
    ): IVectorDataItem;
  end;

implementation

uses
  GR32,
  i_MarkTemplate,
  i_AppearanceOfVectorItem,
  i_GeometryLonLat,
  i_Category,
  i_MarkFactoryConfig,
  u_MarkEditCoordinatesHelper,
  u_ResStrings;

{$R *.dfm}

constructor TfrmMarkEditPointNew.Create(
  const ALanguageManager: ILanguageManager;
  const AMediaPath: IPathConfig;
  const AProjectionSetChangeable: IProjectionSetChangeable;
  const AGeometryFactory: IGeometryLonLatFactory;
  const AAppearanceOfMarkFactory: IAppearanceOfMarkFactory;
  const AMarkFactory: IMarkFactory;
  const ACategoryDB: IMarkCategoryDB;
  const APictureList: IMarkPictureList;
  const AViewPortState: ILocalCoordConverterChangeable;
  const ACoordRepresentationConfig: ICoordRepresentationConfig;
  const ACoordFromStringParser: ICoordFromStringParser;
  const ACoordToStringConverter: ICoordToStringConverterChangeable
);
begin
  inherited Create(ALanguageManager);

  FCategoryDB := ACategoryDB;
  FGeometryFactory := AGeometryFactory;
  FAppearanceOfMarkFactory := AAppearanceOfMarkFactory;
  FMarkFactory := AMarkFactory;
  FPictureList := APictureList;

  frMarkDescription := TfrMarkDescription.Create(ALanguageManager, AMediaPath);

  frMarkCategory :=
    TfrMarkCategorySelectOrAdd.Create(
      ALanguageManager,
      FCategoryDB
    );
  frSelectPicture :=
    TfrPictureSelectFromList.Create(
      ALanguageManager,
      APictureList,
      Self.SelectImageFromList
    );
  frSelectedPicture := TfrSelectedPicture.Create(ALanguageManager, Self.imgIconMouseDown);
end;

destructor TfrmMarkEditPointNew.Destroy;
begin
  FreeAndNil(frMarkDescription);
  FreeAndNil(frMarkCategory);
  FreeAndNil(frSelectPicture);
  FreeAndNil(frSelectedPicture);
  inherited;
end;

function TfrmMarkEditPointNew.AddMark(
  const AMark: IVectorDataItem;
  var AVisible: Boolean
): IVectorDataItem;
var
  VAppearanceCaption: IAppearancePointCaption;
  VAppearanceIcon: IAppearancePointIcon;
  VPicIndex: Integer;
  VPic: IMarkPicture;
  VCategory: ICategory;
  VMarkWithCategory: IVectorDataItemWithCategory;
begin
  Result := nil;

  lblReadOnly.Visible := False;

  FSourceMark := AMark;
  frMarkDescription.Description := '';
  frSelectPicture.Visible := False;
  frSelectPicture.Parent := Self;

  frSelectedPicture.Parent := pnlImage;

  if Supports(AMark.Appearance, IAppearancePointIcon, VAppearanceIcon) then begin
    if Assigned(VAppearanceIcon.Pic) then begin
      VPic := VAppearanceIcon.Pic;
    end else begin
      if VAppearanceIcon.PicName = '' then begin
        VPic := FPictureList.GetDefaultPicture;
      end else begin
        VPicIndex := FPictureList.GetIndexByName(VAppearanceIcon.PicName);
        if VPicIndex >= 0 then begin
          VPic := FPictureList.Get(VPicIndex);
        end else begin
          VPic := nil;
        end;
      end;
    end;
    frSelectedPicture.Picture := VPic;
    frSelectPicture.Picture := VPic;
    seIconSize.Value := VAppearanceIcon.MarkerSize;
  end else begin
    frSelectedPicture.Picture := nil;
    seIconSize.Value := 0;
  end;

  edtName.Text := AMark.Name;
  frMarkDescription.Description := AMark.Desc;

  if Supports(AMark.Appearance, IAppearancePointCaption, VAppearanceCaption) then begin
    seFontSize.Value := VAppearanceCaption.FontSize;
    seTransp.Value := 100 - round(AlphaComponent(VAppearanceCaption.TextColor) / 255 * 100);
    clrbxTextColor.Selected := WinColor(VAppearanceCaption.TextColor);
    clrbxShadowColor.Selected := WinColor(VAppearanceCaption.TextBgColor);
  end else begin
    seFontSize.Value := 0;
    seTransp.Value := 0;
    clrbxTextColor.Selected := WinColor(clBlack32);
    clrbxShadowColor.Selected := WinColor(clWhite32);
  end;
  chkVisible.Checked := True;
  VCategory := nil;
  if Supports(AMark.MainInfo, IVectorDataItemWithCategory, VMarkWithCategory) then begin
    VCategory := VMarkWithCategory.Category;
  end;
  frMarkCategory.Init(VCategory);
  try
    Caption := SAS_STR_AddNewMark;
    SetLonLat( (AMark.Geometry as IGeometryLonLatPoint).Point );
    Self.PopupParent := Application.MainForm;
    if ShowModal = mrOk then begin
      Result :=
        FMarkFactory.CreateMark(
          AMark.Geometry,
          edtName.Text,
          frMarkDescription.Description,
          frMarkCategory.GetCategory,
          MakeAppearance
        );
      AVisible := chkVisible.Checked;
    end;
  finally
    FSourceMark := nil;
    frMarkCategory.Clear;
  end;
end;

procedure TfrmMarkEditPointNew.FormShow(Sender: TObject);
begin
  frMarkCategory.Parent := pnlCategory;
  frMarkDescription.Parent := pnlDescription;
  edtName.SetFocus;
  flwpnlTextColor.Realign;
  flwpnlShadowColor.Realign;
end;

procedure TfrmMarkEditPointNew.btnTextColorClick(Sender: TObject);
begin
  if ColorDialog1.Execute then begin
    clrbxTextColor.Selected := ColorDialog1.Color;
  end;
end;

procedure TfrmMarkEditPointNew.btnSetAsTemplateClick(Sender: TObject);
var
  VConfig: IMarkPointTemplateConfig;
  VTemplate: IMarkTemplatePoint;
begin
  if MessageBox(handle, pchar(SAS_MSG_SetAsDefaultForNewMarks), pchar(SAS_MSG_coution), 36) = IDYES then begin
    VConfig := FMarkFactory.Config.PointTemplateConfig;
    VTemplate :=
      VConfig.CreateTemplate(
        MakeAppearance,
        frMarkCategory.GetCategory
      );
    VConfig.DefaultTemplate := VTemplate;
  end;
end;

procedure TfrmMarkEditPointNew.btnShadowColorClick(Sender: TObject);
begin
  if ColorDialog1.Execute then begin
    clrbxShadowColor.Selected := ColorDialog1.Color;
  end;
end;

procedure TfrmMarkEditPointNew.imgIconMouseDown(Sender: TObject);
begin
  if frSelectPicture.Visible then begin
    frSelectPicture.Visible := False;
  end else begin
    frSelectPicture.Left := 5;
    frSelectPicture.Width := Self.ClientWidth - frSelectPicture.Left - 5;
    frSelectPicture.Top := pnlImage.Top + pnlImage.Height;
    frSelectPicture.Height := Self.ClientHeight - frSelectPicture.Top - 5;
    frSelectPicture.Visible := True;
    frSelectPicture.SetFocus;
  end;
end;

function TfrmMarkEditPointNew.MakeAppearance: IAppearance;
var
  VPic: IMarkPicture;
  VPicName: string;
  VAppearanceIcon: IAppearancePointIcon;
begin
  VPic := frSelectedPicture.Picture;
  VPicName := '';
  if Assigned(VPic) then begin
    VPicName := VPic.GetName;
  end else begin
    if Assigned(FSourceMark) then begin
      if Supports(FSourceMark.Appearance, IAppearancePointIcon, VAppearanceIcon) then begin
        VPicName := VAppearanceIcon.PicName;
      end;
    end;
  end;

  Result :=
    FAppearanceOfMarkFactory.CreatePointAppearance(
      SetAlpha(Color32(clrbxTextColor.Selected), round(((100 - seTransp.Value) / 100) * 256)),
      SetAlpha(Color32(clrbxShadowColor.Selected), round(((100 - seTransp.Value) / 100) * 256)),
      seFontSize.Value,
      VPicName,
      frSelectPicture.Picture,
      seIconSize.Value
    );
end;

procedure TfrmMarkEditPointNew.SelectImageFromList(Sender: TObject);
begin
  frSelectPicture.Visible := False;
  frSelectedPicture.Picture := frSelectPicture.Picture;
end;

procedure TfrmMarkEditPointNew.SetLonLat(const APoint: TDoublePoint);
var
  VLat, VLon: string;
begin
  TMarkEditCoordinatesHelper.CoordinatesToStr(APoint, VLat, VLon);
  
  edtLat.Text := VLat;
  edtLon.Text := VLon;
end;

end.
