unit frm_MarkEditSector;

interface

uses
  Windows,
  SysUtils,
  Classes,
  Controls,
  Forms,
  Dialogs,
  Spin,
  StdCtrls,
  ExtCtrls,
  Buttons,
  i_Appearance,
  i_AppearanceOfMarkFactory,
  i_PathConfig,
  i_LanguageManager,
  i_VectorDataItemSimple,
  i_MarkFactory,
  i_MarkCategoryDB,
  i_MarkPicture,
  u_Dialogs,
  u_CommonFormAndFrameParents,
  fr_MarkDescription,
  fr_PictureSelectFromList,
  fr_SelectedPicture,
  fr_MarkCategorySelectOrAdd;

type
  TfrmMarkEditSector = class(TFormWitghLanguageManager)
    btnOk: TButton;
    btnCancel: TButton;
    chkVisible: TCheckBox;
    lblLineColor: TLabel;
    lblLineWidth: TLabel;
    clrbxLineColor: TColorBox;
    seLineWidth: TSpinEdit;
    seLineTransp: TSpinEdit;
    lblLineTransp: TLabel;
    btnLineColor: TSpeedButton;
    lblFillColor: TLabel;
    clrbxFillColor: TColorBox;
    seFillTransp: TSpinEdit;
    lblFillTransp: TLabel;
    btnFillColor: TSpeedButton;
    lblLine: TLabel;
    lblFill: TLabel;
    ColorDialog1: TColorDialog;
    pnlBottomButtons: TPanel;
    flwpnlFill: TFlowPanel;
    pnlFill: TPanel;
    pnlLine: TPanel;
    flwpnlLine: TFlowPanel;
    pnlDescription: TPanel;
    btnSetAsTemplate: TButton;
    lblReadOnly: TLabel;
    grdpnlStyleRows: TGridPanel;
    grdpnlLine1: TGridPanel;
    flwpnlTextColor: TFlowPanel;
    lblTextColor: TLabel;
    clrbxTextColor: TColorBox;
    btnTextColor: TSpeedButton;
    flwpnlFontSize: TFlowPanel;
    lblFontSize: TLabel;
    seFontSize: TSpinEdit;
    grdpnlLine2: TGridPanel;
    flwpnlShadowColor: TFlowPanel;
    lblShadowColor: TLabel;
    clrbxShadowColor: TColorBox;
    btnShadowColor: TSpeedButton;
    flwpnlIconSize: TFlowPanel;
    lblIconSize: TLabel;
    seIconSize: TSpinEdit;
    flwpnlTrahsparent: TFlowPanel;
    lblTransp: TLabel;
    seTransp: TSpinEdit;
    pnlTop: TPanel;
    pnlImage: TPanel;
    pnlTopMain: TPanel;
    pnlCategory: TPanel;
    pnlName: TPanel;
    lblName: TLabel;
    edtName: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSetAsTemplateClick(Sender: TObject);
    procedure btnLineColorClick(Sender: TObject);
    procedure btnFillColorClick(Sender: TObject);
    procedure btnTextColorClick(Sender: TObject);
    procedure btnShadowColorClick(Sender: TObject);
  private
    FMarkFactory: IMarkFactory;
    FCategoryDB: IMarkCategoryDB;
    FAppearanceOfMarkFactory: IAppearanceOfMarkFactory;
    FPictureList: IMarkPictureList;
    frMarkDescription: TfrMarkDescription;
    frMarkCategory: TfrMarkCategorySelectOrAdd;
    frSelectPicture: TfrPictureSelectFromList;
    frSelectedPicture: TfrSelectedPicture;
    procedure SelectImageFromList(Sender: TObject);
    procedure OnImageIconMouseDown(Sender: TObject);
    function MakePolyAppearance: IAppearance;
    function MakePointAppearance(const ASourceAppearance: IAppearance = nil): IAppearance;
  public
    constructor Create(
      const ALanguageManager: ILanguageManager;
      const AMediaPath: IPathConfig;
      const AAppearanceOfMarkFactory: IAppearanceOfMarkFactory;
      const AMarkFactory: IMarkFactory;
      const ACategoryDB: IMarkCategoryDB;
      const APictureList: IMarkPictureList
    ); reintroduce;
    destructor Destroy; override;

    function AddSector(
      var ASectorPoint: IVectorDataItem;
      var ASectorPoly: IVectorDataItem;
      var AVisible: Boolean
    ): Boolean;
  end;

implementation

uses
  GR32,
  gnugettext,
  i_AppearanceOfVectorItem,
  i_Category,
  i_MarkTemplate,
  i_MarkFactoryConfig,
  u_ResStrings;

{$R *.dfm}

constructor TfrmMarkEditSector.Create(
  const ALanguageManager: ILanguageManager;
  const AMediaPath: IPathConfig;
  const AAppearanceOfMarkFactory: IAppearanceOfMarkFactory;
  const AMarkFactory: IMarkFactory;
  const ACategoryDB: IMarkCategoryDB;
  const APictureList: IMarkPictureList
);
begin
  inherited Create(ALanguageManager);
  FCategoryDB := ACategoryDB;
  FAppearanceOfMarkFactory := AAppearanceOfMarkFactory;
  FMarkFactory := AMarkFactory;
  FPictureList := APictureList;
  
  frMarkDescription :=
    TfrMarkDescription.Create(
      ALanguageManager,
      AMediaPath
    );

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

  frSelectedPicture :=
    TfrSelectedPicture.Create(
      ALanguageManager,
      Self.OnImageIconMouseDown
    );
end;

destructor TfrmMarkEditSector.Destroy;
begin
  FreeAndNil(frMarkDescription);
  FreeAndNil(frMarkCategory);
  FreeAndNil(frSelectPicture);
  FreeAndNil(frSelectedPicture);
  inherited;
end;

function TfrmMarkEditSector.AddSector(
  var ASectorPoint: IVectorDataItem;
  var ASectorPoly: IVectorDataItem;
  var AVisible: Boolean
): Boolean;
var
  VPic: IMarkPicture;
  VPicIndex: Integer;
  VAppearanceCaption: IAppearancePointCaption;
  VAppearanceIcon: IAppearancePointIcon;
  VAppearanceBorder: IAppearancePolygonBorder;
  VAppearanceFill: IAppearancePolygonFill;
  VCategory: ICategory;
  VMarkWithCategory: IVectorDataItemWithCategory;
begin
  Assert(ASectorPoint <> nil);
  Assert(ASectorPoly <> nil);

  Result := False;

  lblReadOnly.Visible := False;

  chkVisible.Checked := AVisible;
  Self.PopupParent := Application.MainForm;

  VCategory := nil;
  if Supports(ASectorPoint.MainInfo, IVectorDataItemWithCategory, VMarkWithCategory) then begin
    VCategory := VMarkWithCategory.Category;
  end;

  frMarkCategory.Init(VCategory); // Init Category (same for Point and Poly)
  try
    // Setup Name and Desc (same for Point and Poly)
    edtName.Text :=
      _('Sector') + ' ' +
      IntToStr(FMarkFactory.Config.PointTemplateConfig.GetNameGenerator.Counter);

    frMarkDescription.Description := ASectorPoint.Desc;

    // Setup Point Icon
    frSelectPicture.Visible := False;
    frSelectPicture.Parent := Self;
    frSelectedPicture.Parent := pnlImage;

    if Supports(ASectorPoint.Appearance, IAppearancePointIcon, VAppearanceIcon) then begin
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

    // Setup Point Appearance
    if Supports(ASectorPoint.Appearance, IAppearancePointCaption, VAppearanceCaption) then begin
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

    // Setup Polygon Appearance
    if Supports(ASectorPoly.Appearance, IAppearancePolygonBorder, VAppearanceBorder) then begin
      seLineTransp.Value := 100 - round(AlphaComponent(VAppearanceBorder.LineColor) / 255 * 100);
      seLineWidth.Value := VAppearanceBorder.LineWidth;
      clrbxLineColor.Selected := WinColor(VAppearanceBorder.LineColor);
    end else begin
      seLineTransp.Value := 0;
      seLineWidth.Value := 0;
      clrbxLineColor.Selected := WinColor(clBlack32);
    end;
    if Supports(ASectorPoly.Appearance, IAppearancePolygonFill, VAppearanceFill) then begin
      seFillTransp.Value := 100 - round(AlphaComponent(VAppearanceFill.FillColor) / 255 * 100);
      clrbxFillColor.Selected := WinColor(VAppearanceFill.FillColor);
    end else begin
      seFillTransp.Value := 0;
      clrbxFillColor.Selected := 0;
    end;

    // Show Editor window
    if ShowModal = mrOk then begin
      // Make new Point
      ASectorPoint :=
        FMarkFactory.CreateMark(
          ASectorPoint.Geometry,
          edtName.Text,
          frMarkDescription.Description,
          frMarkCategory.GetCategory,
          MakePointAppearance(ASectorPoint.Appearance)
        );
      // Make new Poly
      ASectorPoly :=
        FMarkFactory.CreateMark(
          ASectorPoly.Geometry,
          edtName.Text,
          frMarkDescription.Description,
          frMarkCategory.GetCategory,
          MakePolyAppearance
        );
      AVisible := chkVisible.Checked;
      Result := (ASectorPoint <> nil) and (ASectorPoly <> nil);
    end;
  finally
    frMarkCategory.Clear;
  end;
end;

procedure TfrmMarkEditSector.FormShow(Sender: TObject);
begin
  frMarkCategory.Parent := pnlCategory;
  frMarkDescription.Parent := pnlDescription;
  edtName.SetFocus;
  flwpnlTextColor.Realign;
  flwpnlShadowColor.Realign;
end;

function TfrmMarkEditSector.MakePointAppearance(const ASourceAppearance: IAppearance): IAppearance;
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
    if Assigned(ASourceAppearance) then begin
      if Supports(ASourceAppearance, IAppearancePointIcon, VAppearanceIcon) then begin
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

function TfrmMarkEditSector.MakePolyAppearance: IAppearance;
begin
  Result :=
    FAppearanceOfMarkFactory.CreatePolygonAppearance(
      SetAlpha(Color32(clrbxLineColor.Selected), round(((100 - seLineTransp.Value) / 100) * 256)),
      seLineWidth.Value,
      SetAlpha(Color32(clrbxFillColor.Selected), round(((100 - seFillTransp.Value) / 100) * 256))
    );
end;

procedure TfrmMarkEditSector.btnSetAsTemplateClick(Sender: TObject);
var
  VPointConfig: IMarkPointTemplateConfig;
  VPointTemplate: IMarkTemplatePoint;
  VPolyConfig: IMarkPolyTemplateConfig;
  VPolyTemplate: IMarkTemplatePoly;
begin
  if _MessageDlg(SAS_MSG_SetAsDefaultForNewMarks, mtConfirmation, mbYesNo) = mrYes then begin
    VPointConfig := FMarkFactory.Config.PointTemplateConfig;
    VPointTemplate :=
      VPointConfig.CreateTemplate(
        MakePointAppearance,
        frMarkCategory.GetCategory
      );
    VPointConfig.DefaultTemplate := VPointTemplate;

    VPolyConfig := FMarkFactory.Config.PolyTemplateConfig;
    VPolyTemplate :=
      VPolyConfig.CreateTemplate(
        MakePolyAppearance,
        frMarkCategory.GetCategory
      );
    VPolyConfig.DefaultTemplate := VPolyTemplate;
  end;
end;

procedure TfrmMarkEditSector.btnShadowColorClick(Sender: TObject);
begin
  if ColorDialog1.Execute then begin
    clrbxShadowColor.Selected := ColorDialog1.Color;
  end;
end;

procedure TfrmMarkEditSector.btnTextColorClick(Sender: TObject);
begin
  if ColorDialog1.Execute then begin
    clrbxTextColor.Selected := ColorDialog1.Color;
  end;
end;

procedure TfrmMarkEditSector.btnLineColorClick(Sender: TObject);
begin
  if ColorDialog1.Execute then begin
    clrbxLineColor.Selected := ColorDialog1.Color;
  end;
end;

procedure TfrmMarkEditSector.btnFillColorClick(Sender: TObject);
begin
  if ColorDialog1.Execute then begin
    clrbxFillColor.Selected := ColorDialog1.Color;
  end;
end;

procedure TfrmMarkEditSector.SelectImageFromList(Sender: TObject);
begin
  frSelectPicture.Visible := False;
  frSelectedPicture.Picture := frSelectPicture.Picture;
end;

procedure TfrmMarkEditSector.OnImageIconMouseDown(Sender: TObject);
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

end.
