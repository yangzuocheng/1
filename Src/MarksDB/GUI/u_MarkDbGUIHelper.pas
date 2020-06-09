{******************************************************************************}
{* SAS.Planet (SAS.�������)                                                   *}
{* Copyright (C) 2007-2018, SAS.Planet development team.                      *}
{* This program is free software: you can redistribute it and/or modify       *}
{* it under the terms of the GNU General Public License as published by       *}
{* the Free Software Foundation, either version 3 of the License, or          *}
{* (at your option) any later version.                                        *}
{*                                                                            *}
{* This program is distributed in the hope that it will be useful,            *}
{* but WITHOUT ANY WARRANTY; without even the implied warranty of             *}
{* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              *}
{* GNU General Public License for more details.                               *}
{*                                                                            *}
{* You should have received a copy of the GNU General Public License          *}
{* along with this program.  If not, see <http://www.gnu.org/licenses/>.      *}
{*                                                                            *}
{* http://sasgis.org                                                          *}
{* info@sasgis.org                                                            *}
{******************************************************************************}

unit u_MarkDbGUIHelper;

interface

uses
  Windows,
  Dialogs,
  Controls,
  Classes,
  Forms,
  UITypes,

  t_GeoTypes,
  i_MapViewGoto,
  frm_MarkEditPointCoordinates,
  frm_MarkEditPathCoordinates,
  frm_MarkEditPointNew,

  i_PathConfig,
  i_LanguageManager,
  i_InterfaceListStatic,
  i_Projection,
  i_GeometryLonLatFactory,
  i_ArchiveReadWriteFactory,
  i_CoordFromStringParser,
  i_CoordToStringConverter,
  i_CoordRepresentationConfig,
  i_ValueToStringConverter,
  i_GeoCalc,
  i_InetConfig,
  i_InternalDomainUrlHandler,
  i_GeometryLonLat,
  i_ProjectionSetChangeable,
  i_LocalCoordConverterChangeable,
  i_StringListStatic,
  i_VectorDataFactory,
  i_VectorDataItemSimple,
  i_VectorItemSubsetBuilder,
  i_MarkTemplate,
  i_MarkId,
  i_Category,
  i_MarkCategory,
  i_MarkCategoryList,
  i_MarkSystem,
  i_ImportConfig,
  i_VectorItemTreeExporterList,
  i_VectorItemTreeImporterList,
  i_AppearanceOfMarkFactory,
  i_MarksGUIConfig,
  i_MarkFactory,
  i_MarkFactoryConfig,
  i_MarkPicture,
  i_MergePolygonsPresenter,
  frm_MarkCategoryEdit,
  frm_MarkEditPoint,
  frm_MarkEditPath,
  frm_MarkEditPoly,
  frm_MarkInfo,
  frm_ImportConfigEdit,
  frm_JpegImportConfigEdit,
  frm_PolygonForOperationConfig,
  frm_MarksMultiEdit;

type
  TMarkDbGUIHelper = class
  private
    FfrmMarkEditPathCoordinates: TfrmMarkEditPathCoordinates;
    FfrmMarkEditPointCoordinates: TfrmMarkEditPointCoordinates;
    FfrmMarkEditPointNew: TfrmMarkEditPointNew;

    FMarkSystem: IMarkSystem;
    FMarkFactoryConfig: IMarkFactoryConfig;
    FMarksGUIConfig: IMarksGUIConfig;
    FVectorDataFactory: IVectorDataFactory;
    FVectorDataItemMainInfoFactory: IVectorDataItemMainInfoFactory;
    FVectorItemSubsetBuilderFactory: IVectorItemSubsetBuilderFactory;
    FVectorGeometryLonLatFactory: IGeometryLonLatFactory;
    FCoordToStringConverter: ICoordToStringConverterChangeable;
    FfrmMarkEditPoint: TfrmMarkEditPoint;
    FfrmMarkEditPath: TfrmMarkEditPath;
    FfrmMarkEditPoly: TfrmMarkEditPoly;
    FfrmMarkCategoryEdit: TfrmMarkCategoryEdit;
    FfrmImportConfigEdit: TfrmImportConfigEdit;
    FfrmJpegImportConfigEdit: TfrmJpegImportConfigEdit;
    FfrmPolygonForOperationConfig: TfrmPolygonForOperationConfig;
    FfrmMarksMultiEdit: TfrmMarksMultiEdit;
    FfrmMarkInfo: TfrmMarkInfo;
    FExportDialog: TSaveDialog;
    FImportDialog: TOpenDialog;
    FExporterList: IVectorItemTreeExporterListChangeable;
    FImporterList: IVectorItemTreeImporterListChangeable;
    procedure PrepareExportDialog(const AExporterList: IVectorItemTreeExporterListStatic);
    function GetActiveExporter(const AExporterList: IVectorItemTreeExporterListStatic): IVectorItemTreeExporterListItem;

    procedure PrepareImportDialog(const AImporterList: IVectorItemTreeImporterListStatic);
    function ImportFilesModalInternal(
      const AFiles: IStringListStatic;
      const AImporterList: IVectorItemTreeImporterListStatic
    ): IInterfaceListStatic;
    function IsMarksDBWritable: Boolean;
  public
    procedure AddGeometryModal(
      const AMarkType: Byte;
      const AMapGoto: IMapViewGoto
    );

    function GetMarkIdCaption(const AMarkId: IMarkId): string;

    function DeleteMarkModal(
      const AMarkId: IMarkId;
      const AHandle: THandle
    ): Boolean;
    function DeleteMarksModal(
      const AMarkIDList: IInterfaceListStatic;
      const AHandle: THandle
    ): Boolean;
    function DeleteCategoryModal(
      const ACategory: IMarkCategory;
      const AHandle: THandle
    ): Boolean;
    function PolygonForOperation(
      const AGeometry: IGeometryLonLat;
      const AProjection: IProjection
    ): IGeometryLonLatPolygon;
    function AddCategory(const Name: string): IMarkCategory;
    procedure ShowMarkInfo(
      const AMark: IVectorDataItem
    );
    function EditMarkModal(
      const AMark: IVectorDataItem;
      const AIsNewMark: Boolean;
      var AVisible: Boolean
    ): IVectorDataItem;
    function EditCategoryModal(
      const ACategory: IMarkCategory;
      const AIsNewCategory: Boolean
    ): IMarkCategory;
    function SaveMarkModal(
      const AMark: IVectorDataItem;
      const AGeometry: IGeometryLonLat;
      AAsNewMark: Boolean = False;
      const ADescription: string = '';
      const ATemplate: IMarkTemplate = nil
    ): Boolean;
    function SaveMarkUngroupModal(
      const AMark: IVectorDataItem;
      const AGeometry: IGeometryLonLat;
      const ADescription: string = '';
      const ATemplate: IMarkTemplate = nil
    ): Boolean;
    function UpdateMark(
      const AMark: IVectorDataItem;
      const AGeometry: IGeometryLonLat
    ): Boolean;
    function EditModalImportConfig: IImportConfig;
    function EditModalJpegImportConfig: IInterface;
    function MarksMultiEditModal(const ACategory: ICategory): IImportConfig;
    procedure ExportMark(const AMark: IVectorDataItem);
    procedure ExportCategory(
      const AMarkCategory: IMarkCategory;
      AIgnoreMarksVisible: Boolean
    );
    procedure ExportCategoryList(
      const ACategoryList: IMarkCategoryList;
      AIgnoreMarksVisible: Boolean
    );
    function ImportFilesModal(
      const AFiles: IStringListStatic
    ): IInterfaceListStatic;
    function ImportFileDialog(ParentWnd: HWND): IStringListStatic;
    function ImportModal(ParentWnd: HWND): IInterfaceListStatic;

    procedure AddMarkIdListToMergePolygons(
      const AMarkIdList: IInterfaceListStatic;
      const AMergePolygonsPresenter: IMergePolygonsPresenter
    );
    procedure AddCategoryToMergePolygons(
      const ACategory: IMarkCategory;
      const AMergePolygonsPresenter: IMergePolygonsPresenter
    );
    function MarkToPlainText(AMark: IVectorDataItem): string;
    function MarkIdListToText(AMarksIdList: IInterfaceListStatic): string;

    property MarksDb: IMarkSystem read FMarkSystem;
    property MarkFactoryConfig: IMarkFactoryConfig read FMarkFactoryConfig;
  public
    constructor Create(
      APopUpParent: TCustomForm;
      const ALanguageManager: ILanguageManager;
      const AProjectionSetChangeable: IProjectionSetChangeable;
      const AMediaPath: IPathConfig;
      const AMarkFactoryConfig: IMarkFactoryConfig;
      const AMarksGUIConfig: IMarksGUIConfig;
      const AMarkPictureList: IMarkPictureList;
      const AAppearanceOfMarkFactory: IAppearanceOfMarkFactory;
      const AMarkSystem: IMarkSystem;
      const AGeoCalc: IGeoCalc;
      const AInetConfig: IInetConfig;
      const AInternalDomainUrlHandler: IInternalDomainUrlHandler;
      const AExporterList: IVectorItemTreeExporterListChangeable;
      const AImporterList: IVectorItemTreeImporterListChangeable;
      const AViewPortState: ILocalCoordConverterChangeable;
      const AVectorDataFactory: IVectorDataFactory;
      const AVectorDataItemMainInfoFactory: IVectorDataItemMainInfoFactory;
      const AVectorGeometryLonLatFactory: IGeometryLonLatFactory;
      const AArchiveReadWriteFactory: IArchiveReadWriteFactory;
      const AVectorItemSubsetBuilderFactory: IVectorItemSubsetBuilderFactory;
      const ACoordRepresentationConfig: ICoordRepresentationConfig;
      const ACoordFromStringParser: ICoordFromStringParser;
      const ACoordToStringConverter: ICoordToStringConverterChangeable;
      const AValueToStringConverter: IValueToStringConverterChangeable
    );
    destructor Destroy; override;
  end;

implementation

uses
  SysUtils,
  gnugettext,
  i_VectorItemTree,
  i_VectorItemSubset,
  i_MarkCategoryTree,
  i_NotifierOperation,
  i_VectorItemTreeImporter,
  u_GeoFunc,
  u_ResStrings,
  u_GeometryFunc,
  u_StringListStatic,
  u_VectorItemTree,
  u_NotifierOperation,
  u_FileSystemFunc,
  u_GeoToStrFunc;

{ TMarksDbGUIHelper }

constructor TMarkDbGUIHelper.Create(
  APopUpParent: TCustomForm;
  const ALanguageManager: ILanguageManager;
  const AProjectionSetChangeable: IProjectionSetChangeable;
  const AMediaPath: IPathConfig;
  const AMarkFactoryConfig: IMarkFactoryConfig;
  const AMarksGUIConfig: IMarksGUIConfig;
  const AMarkPictureList: IMarkPictureList;
  const AAppearanceOfMarkFactory: IAppearanceOfMarkFactory;
  const AMarkSystem: IMarkSystem;
  const AGeoCalc: IGeoCalc;
  const AInetConfig: IInetConfig;
  const AInternalDomainUrlHandler: IInternalDomainUrlHandler;
  const AExporterList: IVectorItemTreeExporterListChangeable;
  const AImporterList: IVectorItemTreeImporterListChangeable;
  const AViewPortState: ILocalCoordConverterChangeable;
  const AVectorDataFactory: IVectorDataFactory;
  const AVectorDataItemMainInfoFactory: IVectorDataItemMainInfoFactory;
  const AVectorGeometryLonLatFactory: IGeometryLonLatFactory;
  const AArchiveReadWriteFactory: IArchiveReadWriteFactory;
  const AVectorItemSubsetBuilderFactory: IVectorItemSubsetBuilderFactory;
  const ACoordRepresentationConfig: ICoordRepresentationConfig;
  const ACoordFromStringParser: ICoordFromStringParser;
  const ACoordToStringConverter: ICoordToStringConverterChangeable;
  const AValueToStringConverter: IValueToStringConverterChangeable
);
begin
  inherited Create;
  FMarkSystem := AMarkSystem;
  FVectorDataFactory := AVectorDataFactory;
  FVectorDataItemMainInfoFactory := AVectorDataItemMainInfoFactory;
  FVectorGeometryLonLatFactory := AVectorGeometryLonLatFactory;
  FMarkFactoryConfig := AMarkFactoryConfig;
  FMarksGUIConfig := AMarksGUIConfig;
  FVectorItemSubsetBuilderFactory := AVectorItemSubsetBuilderFactory;
  FCoordToStringConverter := ACoordToStringConverter;
  FImporterList := AImporterList;
  FExporterList := AExporterList;

  FfrmMarkEditPoint :=
    TfrmMarkEditPoint.Create(
      ALanguageManager,
      AMediaPath,
      AProjectionSetChangeable,
      AVectorGeometryLonLatFactory,
      AAppearanceOfMarkFactory,
      FMarkSystem.MarkDb.Factory,
      FMarkSystem.CategoryDB,
      FMarkSystem.MarkDb.Factory.MarkPictureList,
      AViewPortState,
      ACoordRepresentationConfig,
      ACoordFromStringParser,
      ACoordToStringConverter
    );
  FfrmMarkEditPath :=
    TfrmMarkEditPath.Create(
      ALanguageManager,
      AMediaPath,
      AAppearanceOfMarkFactory,
      FMarkSystem.MarkDb.Factory,
      FMarkSystem.CategoryDB
    );
  FfrmMarkEditPoly :=
    TfrmMarkEditPoly.Create(
      ALanguageManager,
      AMediaPath,
      AAppearanceOfMarkFactory,
      FMarkSystem.MarkDb.Factory,
      FMarkSystem.CategoryDB
    );
  FfrmMarkCategoryEdit :=
    TfrmMarkCategoryEdit.Create(
      ALanguageManager,
      FMarkSystem.CategoryDB
    );
  FfrmImportConfigEdit :=
    TfrmImportConfigEdit.Create(
      ALanguageManager,
      AAppearanceOfMarkFactory,
      FMarkSystem.MarkDb.Factory,
      FMarkSystem.CategoryDB
    );
  FfrmJpegImportConfigEdit :=
    TfrmJpegImportConfigEdit.Create(
      ALanguageManager,
      AAppearanceOfMarkFactory,
      FMarkSystem.MarkDb.Factory,
      FMarkSystem.CategoryDB
    );
  FfrmPolygonForOperationConfig :=
    TfrmPolygonForOperationConfig.Create(
      ALanguageManager
    );
  FfrmMarkInfo :=
    TfrmMarkInfo.Create(
      ALanguageManager,
      ACoordToStringConverter,
      AValueToStringConverter,
      AGeoCalc,
      AInetConfig,
      AInternalDomainUrlHandler
    );
  FfrmMarkInfo.PopupParent := APopUpParent;
  FfrmMarksMultiEdit :=
    TfrmMarksMultiEdit.Create(
      ALanguageManager,
      AAppearanceOfMarkFactory,
      FMarkSystem.MarkDb.Factory,
      FMarkSystem.CategoryDB
    );

  FExportDialog := TSaveDialog.Create(nil);
  FExportDialog.Name := 'ExportDialog';
  FExportDialog.Options := [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing];

  FImportDialog := TOpenDialog.Create(nil);
  FImportDialog.Name := 'ImportDialog';
  FImportDialog.Options := [ofAllowMultiSelect, ofEnableSizing];


  FfrmMarkEditPathCoordinates :=
    TfrmMarkEditPathCoordinates.Create(
      ALanguageManager,
      AVectorGeometryLonLatFactory
    );

  FfrmMarkEditPointCoordinates :=
    TfrmMarkEditPointCoordinates.Create(
      ALanguageManager,
      AVectorGeometryLonLatFactory
    );
  
  FfrmMarkEditPointNew := TfrmMarkEditPointNew.Create(
    ALanguageManager,
    AMediaPath,
    AProjectionSetChangeable,
    AVectorGeometryLonLatFactory,
    AAppearanceOfMarkFactory,
    FMarkSystem.MarkDb.Factory,
    FMarkSystem.CategoryDB,
    FMarkSystem.MarkDb.Factory.MarkPictureList,
    AViewPortState,
    ACoordRepresentationConfig,
    ACoordFromStringParser,
    ACoordToStringConverter
  );
end;

destructor TMarkDbGUIHelper.Destroy;
begin
  FreeAndNil(FfrmMarkEditPoint);
  FreeAndNil(FfrmMarkEditPath);
  FreeAndNil(FfrmMarkEditPoly);
  FreeAndNil(FfrmMarkCategoryEdit);
  FreeAndNil(FfrmImportConfigEdit);
  FreeAndNil(FfrmJpegImportConfigedit);
  FreeAndNil(FfrmPolygonForOperationConfig);
  FreeAndNil(FfrmMarksMultiEdit);
  FreeAndNil(FfrmMarkInfo);
  FreeAndNil(FExportDialog);
  FreeAndNil(FImportDialog);

  FreeAndNil(FfrmMarkEditPathCoordinates);
  FreeAndNil(FfrmMarkEditPointCoordinates);
  FreeAndNil(FfrmMarkEditPointNew);
  
  inherited;
end;

function TMarkDbGUIHelper.IsMarksDBWritable: Boolean;
begin
  Result := FMarkSystem.State.GetStatic.WriteAccess;
  if not Result then begin
    MessageDlg(_('No write access to current Marks DB!'), mtError, [mbOk], 0);
  end;
end;

function TMarkDbGUIHelper.AddCategory(const Name: string): IMarkCategory;
var
  VCategory: IMarkCategory;
begin
  if not IsMarksDBWritable then begin
    Result := nil;
    Exit;
  end;
  VCategory := FMarkSystem.CategoryDB.Factory.CreateNew(Name);
  Result := FMarkSystem.CategoryDB.GetFirstCategoryByName(VCategory.Name);
  if Result = nil then begin
    Result := FMarkSystem.CategoryDB.UpdateCategory(nil, VCategory);
  end;
end;

function TMarkDbGUIHelper.DeleteCategoryModal(
  const ACategory: IMarkCategory;
  const AHandle: THandle
): Boolean;
var
  VMessage: string;
  VList: IMarkCategoryList;
begin
  Result := False;
  if not IsMarksDBWritable then begin
    Exit;
  end;
  if ACategory <> nil then begin
    if FMarkSystem.CategoryDB.GetCategoryByNameCount(ACategory.Name) > 1 then begin
      // Workaround soluton until MarksDB schema changed.
      // Current implementation can't delete subcategories safety:
      // http://www.sasgis.org/mantis/view.php?id=3435
      VMessage := Format(
        _('Can''t delete category: "%s".' + #13#10 +
          'Detected multiply categories with same name.'),
        [ACategory.Name]
      );
      MessageBox(AHandle, PChar(VMessage), PChar(SAS_MSG_error), MB_OK or MB_ICONERROR);
      Exit;
    end;
    VList := FMarkSystem.CategoryDB.GetSubCategoryListForCategory(ACategory);
    if Assigned(VList) and (VList.Count > 0) then begin
      VMessage := Format(SAS_MSG_DeleteSubCategoryAsk, [ACategory.Name, VList.Count]);
    end else begin
      VMessage := Format(SAS_MSG_DeleteMarkCategoryAsk, [ACategory.Name]);
    end;
    if MessageBox(AHandle, PChar(VMessage), PChar(SAS_MSG_coution), MB_YESNO or MB_ICONQUESTION) = IDYES then begin
      if Assigned(VList) then begin
        FMarkSystem.DeleteCategoryListWithMarks(VList);
      end;
      FMarkSystem.DeleteCategoryWithMarks(ACategory);
      Result := True;
    end;
  end;
end;

function TMarkDbGUIHelper.DeleteMarkModal(
  const AMarkId: IMarkId;
  const AHandle: THandle
): Boolean;
var
  VMessage: string;
  VMark: IVectorDataItem;
begin
  Result := False;
  if not IsMarksDBWritable then begin
    Exit;
  end;
  if AMarkId <> nil then begin
    case AMarkId.MarkType of
      midPoint: VMessage := SAS_MSG_DeleteMarkPointAsk;
      midLine: VMessage := SAS_MSG_DeleteMarkPathAsk;
      midPoly: VMessage := SAS_MSG_DeleteMarkPolyAsk;
    else
      VMessage := _('Are you sure you want to delete placemark of unknown type with name "%0:s"?');
    end;
    VMessage := Format(VMessage, [AMarkId.Name]);
    if MessageBox(AHandle, PChar(VMessage), PChar(SAS_MSG_coution), MB_YESNO or MB_ICONQUESTION) = IDYES then begin
      VMark := FMarkSystem.MarkDb.GetMarkByID(AMarkId);
      if Assigned(VMark) then begin
        FMarkSystem.MarkDb.UpdateMark(VMark, nil);
        Result := True;
      end;
    end;
  end;
end;

function TMarkDbGUIHelper.DeleteMarksModal(
  const AMarkIDList: IInterfaceListStatic;
  const AHandle: THandle
): Boolean;
var
  VMark: IMarkId;
  VMessage: string;
begin
  Result := False;
  if not IsMarksDBWritable then begin
    Exit;
  end;
  if (AMarkIDList <> nil) and (AMarkIDList.Count > 0) then begin
    if AMarkIDList.Count = 1 then begin
      VMark := IMarkId(AMarkIDList[0]);
      Result := DeleteMarkModal(VMark, AHandle);
    end else begin
      VMessage := Format(SAS_MSG_DeleteManyMarksAsk, [AMarkIDList.Count]);
      if MessageBox(AHandle, PChar(VMessage), PChar(SAS_MSG_coution), MB_YESNO or MB_ICONQUESTION) = IDYES then begin
        FMarkSystem.MarkDb.UpdateMarkList(AMarkIDList, nil);
        Result := True;
      end;
    end;
  end;
end;

function TMarkDbGUIHelper.EditCategoryModal(
  const ACategory: IMarkCategory;
  const AIsNewCategory: Boolean
): IMarkCategory;
begin
  if AIsNewCategory and not IsMarksDBWritable then begin
    Result := nil;
    Exit;
  end;
  Result :=
    FfrmMarkCategoryEdit.EditCategory(
      ACategory,
      AIsNewCategory,
      FMarkSystem.State.GetStatic.WriteAccess
    );
  if (Result <> nil) and not IsMarksDBWritable then begin
    Result := nil;
  end;
end;

function TMarkDbGUIHelper.EditMarkModal(
  const AMark: IVectorDataItem;
  const AIsNewMark: Boolean;
  var AVisible: Boolean
): IVectorDataItem;
var
  VWriteAccess: Boolean;
begin
  Result := nil;
  VWriteAccess := FMarkSystem.State.GetStatic.WriteAccess;
  if Supports(AMark.Geometry, IGeometryLonLatPoint) then begin
    Result := FfrmMarkEditPoint.EditMark(AMark, AIsNewMark, AVisible, VWriteAccess);
  end else if Supports(AMark.Geometry, IGeometryLonLatLine) then begin
    Result := FfrmMarkEditPath.EditMark(AMark, AIsNewMark, AVisible, VWriteAccess);
  end else if Supports(AMark.Geometry, IGeometryLonLatPolygon) then begin
    Result := FfrmMarkEditPoly.EditMark(AMark, AIsNewMark, AVisible, VWriteAccess);
  end;
  if (Result <> nil) and not IsMarksDBWritable then begin
    Result := nil;
  end;
end;

function TMarkDbGUIHelper.EditModalImportConfig: IImportConfig;
begin
  Result := FfrmImportConfigEdit.GetImportConfig;
end;

function TMarkDbGUIHelper.EditModalJpegImportConfig: IInterface;
begin
  Result := FfrmJpegImportConfigEdit.GetConfig;
end;

function TMarkDbGUIHelper.GetActiveExporter(
  const AExporterList: IVectorItemTreeExporterListStatic
): IVectorItemTreeExporterListItem;
var
  VIndex: Integer;
begin
  Result := nil;
  VIndex := FExportDialog.FilterIndex - 1;
  if (VIndex >= 0) and (VIndex < AExporterList.Count) then begin
    Result := AExporterList.Items[VIndex];
  end;
end;

procedure TMarkDbGUIHelper.PrepareExportDialog(
  const AExporterList: IVectorItemTreeExporterListStatic
);
var
  VSelectedFilter: Integer;
  VFilterStr: string;
  i: Integer;
  VItem: IVectorItemTreeExporterListItem;
begin
  VSelectedFilter := FExportDialog.FilterIndex;
  VFilterStr := '';
  for i := 0 to AExporterList.Count - 1 do begin
    VItem := AExporterList.Items[i];
    if i = 0 then begin
      FExportDialog.DefaultExt := VItem.DefaultExt;
    end else begin
      VFilterStr := VFilterStr + '|';
    end;
    VFilterStr := VFilterStr + VItem.Name + ' (*.' + VItem.DefaultExt + ')|*.' + VItem.DefaultExt;
  end;
  FExportDialog.Filter := VFilterStr;
  FExportDialog.FilterIndex := VSelectedFilter;
end;

procedure TMarkDbGUIHelper.ExportCategory(
  const AMarkCategory: IMarkCategory;
  AIgnoreMarksVisible: Boolean
);
var
  VFileName: string;
  VSubCategoryList: IMarkCategoryList;
  VCategoryTree: IMarkCategoryTree;
  VMarkTree: IVectorItemTree;
  VExporterList: IVectorItemTreeExporterListStatic;
  VExporterItem: IVectorItemTreeExporterListItem;
  VNotifier: INotifierOperation;
begin
  if AMarkCategory <> nil then begin
    VFileName := ReplaceIllegalFileNameChars(AMarkCategory.Name);
    VExporterList := FExporterList.GetStatic;
    PrepareExportDialog(VExporterList);
    FExportDialog.FileName := VFileName;
    if FExportDialog.Execute then begin
      VFileName := FExportDialog.FileName;
      if VFileName <> '' then begin
        VExporterItem := GetActiveExporter(VExporterList);
        if Assigned(VExporterItem) then begin
          VSubCategoryList := FMarkSystem.CategoryDB.GetCategoryWithSubCategories(AMarkCategory);
          if not AIgnoreMarksVisible then begin
            VSubCategoryList := FMarkSystem.CategoryDB.FilterVisibleCategories(VSubCategoryList);
          end;
          VCategoryTree := FMarkSystem.CategoryDB.CategoryListToStaticTree(VSubCategoryList);
          VMarkTree := FMarkSystem.CategoryTreeToMarkTree(VCategoryTree, AIgnoreMarksVisible);
          VNotifier := TNotifierOperationFake.Create;
          VExporterItem.Exporter.ProcessExport(VNotifier.CurrentOperation, VNotifier, VFileName, VMarkTree);
        end;
      end;
    end;
  end;
end;

procedure TMarkDbGUIHelper.ExportCategoryList(
  const ACategoryList: IMarkCategoryList;
  AIgnoreMarksVisible: Boolean
);
var
  VFileName: string;
  VCategoryTree: IMarkCategoryTree;
  VMarkTree: IVectorItemTree;
  VExporterList: IVectorItemTreeExporterListStatic;
  VExporterItem: IVectorItemTreeExporterListItem;
  VNotifier: INotifierOperation;
begin
  if (ACategoryList <> nil) and (ACategoryList.Count > 0) then begin
    VExporterList := FExporterList.GetStatic;
    PrepareExportDialog(VExporterList);
    if FExportDialog.Execute then begin
      VFileName := FExportDialog.FileName;
      if VFileName <> '' then begin
        VExporterItem := GetActiveExporter(VExporterList);
        if Assigned(VExporterItem) then begin
          VCategoryTree := FMarkSystem.CategoryDB.CategoryListToStaticTree(ACategoryList);
          VMarkTree := FMarkSystem.CategoryTreeToMarkTree(VCategoryTree, AIgnoreMarksVisible);
          VNotifier := TNotifierOperationFake.Create;
          VExporterItem.Exporter.ProcessExport(VNotifier.CurrentOperation, VNotifier, VFileName, VMarkTree);
        end;
      end;
    end;
  end;
end;

procedure TMarkDbGUIHelper.ExportMark(const AMark: IVectorDataItem);
var
  VFileName: string;
  VMarkTree: IVectorItemTree;
  VSubsetBuilder: IVectorItemSubsetBuilder;
  VExporterList: IVectorItemTreeExporterListStatic;
  VExporterItem: IVectorItemTreeExporterListItem;
  VNotifier: INotifierOperation;
begin
  if AMark <> nil then begin
    VFileName := ReplaceIllegalFileNameChars(AMark.Name);
    VExporterList := FExporterList.GetStatic;
    PrepareExportDialog(VExporterList);
    FExportDialog.FileName := VFileName;
    if FExportDialog.Execute then begin
      VFileName := FExportDialog.FileName;
      if VFileName <> '' then begin
        VExporterItem := GetActiveExporter(VExporterList);
        if Assigned(VExporterItem) then begin
          VSubsetBuilder := FVectorItemSubsetBuilderFactory.Build;
          VSubsetBuilder.Add(AMark);
          VMarkTree := TVectorItemTree.Create('Export', VSubsetBuilder.MakeStaticAndClear, nil);
          VNotifier := TNotifierOperationFake.Create;
          VExporterItem.Exporter.ProcessExport(VNotifier.CurrentOperation, VNotifier, VFileName, VMarkTree);
        end;
      end;
    end;
  end;
end;

function TMarkDbGUIHelper.GetMarkIdCaption(const AMarkId: IMarkId): string;
var
  VPointCaptionFormat: string;
  VPolygonCaptionFormat: string;
  VPathCaptionFormat: string;
  VFormat: string;
  VName: string;
  VMultiFormat: Boolean;
begin
  VName := AMarkId.Name;
  if VName = '' then begin
    VName := '(NoName)';
  end;
  if FMarksGUIConfig.IsAddTypeToCaption then begin
    VMultiFormat := (AMarkId.MultiGeometryCount > 1);
    if VMultiFormat then begin
      VPointCaptionFormat := SAS_STR_ExtendedMultiPointCaption;
      VPolygonCaptionFormat := SAS_STR_ExtendedMultiPolygonCaption;
      VPathCaptionFormat := SAS_STR_ExtendedMultiPathCaption;
    end else begin
      VPointCaptionFormat := SAS_STR_ExtendedPointCaption;
      VPolygonCaptionFormat := SAS_STR_ExtendedPolygonCaption;
      VPathCaptionFormat := SAS_STR_ExtendedPathCaption;
    end;
    case AMarkId.MarkType of
      midPoint: VFormat := VPointCaptionFormat;
      midLine: VFormat := VPathCaptionFormat;
      midPoly: VFormat := VPolygonCaptionFormat;
    else
      begin
        VFormat := '%0:s';
        VMultiFormat := False;
      end;
    end;
    if VMultiFormat then begin
      Result := Format(VFormat, [VName, AMarkId.MultiGeometryCount]);
    end else begin
      Result := Format(VFormat, [VName]);
    end;
  end else begin
    Result := VName;
  end;
end;

function TMarkDbGUIHelper.ImportFilesModalInternal(
  const AFiles: IStringListStatic;
  const AImporterList: IVectorItemTreeImporterListStatic
): IInterfaceListStatic;

type
  TImportRec = record
    FExt: string;
    FConfig: IInterface;
    FImporter: IVectorItemTreeImporter;
  end;
  TImportRecArr = array of TImportRec;

  function _RecIndexByFileExt(
    AExt: string;
    var ARecArr: TImportRecArr
  ): Integer;
  var
    I: Integer;
    VConfig: IInterface;
    VImporter: IVectorItemTreeImporter;
  begin
    Result := -1;
    if SameText(AExt, '.jpeg') then begin
      AExt := '.jpg';
    end;
    for I := 0 to Length(ARecArr) - 1 do begin
      if SameText(AExt, ARecArr[I].FExt) then begin
        Result := I;
        Exit;
      end;
    end;
    VImporter := AImporterList.GetImporterByExt(AExt);
    if Assigned(VImporter) then begin
      if SameText(AExt, '.jpg') then begin
        VConfig := EditModalJpegImportConfig;
      end else begin
        VConfig := EditModalImportConfig;
      end;
      if Assigned(VConfig) then begin
        I := Length(ARecArr);
        SetLength(ARecArr, I + 1);
        ARecArr[I].FExt := AExt;
        ARecArr[I].FImporter := VImporter;
        ARecArr[I].FConfig := VConfig;
        Result := I;
      end;
    end;
  end;

var
  I, J: Integer;
  VCount: Integer;
  VFileName: string;
  VTree: IVectorItemTree;
  VImportConfig: IImportConfig;
  VRecArr: TImportRecArr;
  VNotifier: INotifierOperation;
  VMsg: string;
begin
  Result := nil;
  if not IsMarksDBWritable then begin
    Exit;
  end;

  VCount := 0;
  SetLength(VRecArr, 0);

  if Assigned(AFiles) and (AFiles.Count > 0) then begin
    VNotifier := TNotifierOperationFake.Create;
    for I := 0 to AFiles.Count - 1 do begin
      VFileName := AFiles.Items[I];
      if FileExists(VFileName) then begin
        J := _RecIndexByFileExt(ExtractFileExt(VFileName), VRecArr);
        if J < 0 then begin
          Break;
        end;
        VTree := VRecArr[J].FImporter.ProcessImport(VNotifier.CurrentOperation, VNotifier, VFileName, VRecArr[J].FConfig);
        if Assigned(VTree) then begin
          if Supports(VRecArr[J].FConfig, IImportConfig, VImportConfig) then begin
            Result := FMarkSystem.ImportItemsTree(VTree, VImportConfig);
            Inc(VCount);
          end else begin
            Break;
          end;
        end;
      end else begin
        MessageDlg(Format(_('Can''t open file: %s'), [VFileName]), mtError, [mbOK], 0);
      end;
    end;
  end;

  if VCount > 0 then begin
    VMsg := _(
      'Import finished. Total processed: %d files. Successfull imported: %d files.' + #13#10 +
      'Fit to screen the last imported item?'
    );
    VMsg := Format(VMsg, [AFiles.Count, VCount]);
    if MessageDlg(VMsg, mtInformation, [mbYes, mbNo], 0) = mrNo then begin
      Result := nil;
    end;
  end else begin
    MessageDlg(_('Nothing to import!'), mtError, [mbOK], 0);
  end;
end;

procedure TMarkDbGUIHelper.PrepareImportDialog(const AImporterList: IVectorItemTreeImporterListStatic);
var
  VSelectedFilter: Integer;
  VFilterStr: string;
  i: Integer;
  VItem: IVectorItemTreeImporterListItem;
  VAllMasks: string;
begin
  VSelectedFilter := FImportDialog.FilterIndex;
  VFilterStr := '';
  VAllMasks := '';
  for i := 0 to AImporterList.Count - 1 do begin
    VItem := AImporterList.Items[i];
    VFilterStr := VFilterStr + '|' + VItem.Name + ' (*.' + VItem.DefaultExt + ')|*.' + VItem.DefaultExt;
    if i > 0 then begin
      VAllMasks := VAllMasks + ';';
    end;
    VAllMasks := VAllMasks + '*.' + VItem.DefaultExt;
  end;
  VFilterStr := _('All compatible formats') + '(' + VAllMasks + ')|' + VAllMasks + VFilterStr;
  FImportDialog.Filter := VFilterStr;
  FImportDialog.FilterIndex := VSelectedFilter;
end;

function TMarkDbGUIHelper.ImportModal(ParentWnd: HWND): IInterfaceListStatic;
var
  VList: IVectorItemTreeImporterListStatic;
  VFiles: IStringListStatic;
begin
  Result := nil;
  VFiles := ImportFileDialog(ParentWnd);
  if Assigned(VFiles) then begin
    VList := FImporterList.GetStatic;
    Result := ImportFilesModalInternal(VFiles, VList);
  end;
end;

function TMarkDbGUIHelper.ImportFileDialog(ParentWnd: HWND): IStringListStatic;
var
  VList: IVectorItemTreeImporterListStatic;
  VStrings: TStrings;
begin
  Result := nil;
  VList := FImporterList.GetStatic;
  PrepareImportDialog(VList);
  if (FImportDialog.Execute(ParentWnd)) then begin
    VStrings := FImportDialog.Files;
    if Assigned(VStrings) and (VStrings.Count > 0) then begin
      Result := TStringListStatic.CreateByStrings(VStrings);
    end;
  end;
end;

function TMarkDbGUIHelper.ImportFilesModal(
  const AFiles: IStringListStatic
): IInterfaceListStatic;
var
  VList: IVectorItemTreeImporterListStatic;
begin
  if not IsMarksDBWritable then begin
    Result := nil;
    Exit;
  end;
  VList := FImporterList.GetStatic;
  Result := ImportFilesModalInternal(AFiles, VList);
end;

function TMarkDbGUIHelper.MarkToPlainText(AMark: IVectorDataItem): string;
var
  VCategory: ICategory;
  VMarkWithCategory: IVectorDataItemWithCategory;
  VCategoryName: string;
  VMarkName: string;
  VGeometryText: string;
begin
  Assert(Assigned(AMark));
  VCategoryName := '';
  if Supports(AMark.MainInfo, IVectorDataItemWithCategory, VMarkWithCategory) then begin
    VCategory := VMarkWithCategory.Category;
    VCategoryName := VCategory.Name;
  end;
  VMarkName := AMark.Name;
  VGeometryText := GeometryLonLatToPlainText(AMark.Geometry, FCoordToStringConverter.GetStatic, #13#10, #13#10#13#10, #13#10#13#10#13#10);

  Result := VCategoryName;
  if (Result <> '') and  (VMarkName <> '') then begin
    Result := Result + ', ';
  end;
  Result := Result + VMarkName;
  if (Result <> '') then begin
    Result := Result + #13#10;
  end;
  Result := Result + VGeometryText;
end;

function TMarkDbGUIHelper.MarkIdListToText(
  AMarksIdList: IInterfaceListStatic
): string;
var
  i: Integer;
  VMarkId: IMarkId;
  VMark: IVectorDataItem;
  VMarkText: string;
begin
  Result := '';
  for i := 0 to AMarksIdList.Count - 1 do begin
    VMarkId := IMarkId(AMarksIdList.Items[i]);
    VMark := FMarkSystem.MarkDb.GetMarkByID(VMarkId);
    if Assigned(VMark) then begin
      VMarkText := MarkToPlainText(VMark);
      if VMarkText <> '' then begin
        if Result <> '' then begin
          Result := Result + #13#10;
        end;
        Result := Result + VMarkText;
      end;
    end;
  end;
end;

function TMarkDbGUIHelper.MarksMultiEditModal(const ACategory: ICategory): IImportConfig;
begin
  if not IsMarksDBWritable then begin
    Result := nil;
    Exit;
  end;
  Result := FfrmMarksMultiEdit.GetImportConfig(ACategory);
end;

procedure TMarkDbGUIHelper.ShowMarkInfo(
  const AMark: IVectorDataItem
);
begin
  if AMark <> nil then begin
    FfrmMarkInfo.ShowInfoModal(AMark);
  end;
end;


function TMarkDbGUIHelper.PolygonForOperation(
  const AGeometry: IGeometryLonLat;
  const AProjection: IProjection
): IGeometryLonLatPolygon;
var
  VPoint: IGeometryLonLatPoint;
  VLine: IGeometryLonLatLine;
  VPoly: IGeometryLonLatPolygon;
  VDefRadius: String;
  VRadius: Double;
  VShape: TShapeType;
begin
  Result := nil;
  if not Assigned(AGeometry.Bounds) then begin
    Exit;
  end;

  if Supports(AGeometry, IGeometryLonLatPolygon, VPoly) then begin
    Result := VPoly;
  end else if Supports(AGeometry, IGeometryLonLatLine, VLine) then begin
    VDefRadius := '100';
    if InputQuery('', _('Radius, m'), VDefRadius) then begin
      try
        VRadius := str2r(VDefRadius);
      except
        ShowMessage(SAS_ERR_ParamsInput);
        Exit;
      end;
      Result :=
        FVectorGeometryLonLatFactory.CreateLonLatPolygonByLine(
          AProjection.ProjectionType.Datum,
          VLine,
          VRadius
        );
    end;
  end else begin
    if Supports(AGeometry, IGeometryLonLatPoint, VPoint) then begin
      if FfrmPolygonForOperationConfig.GetOptions(VRadius, VShape) then begin
        case VShape of
          stCircle: begin
            Result :=
              FVectorGeometryLonLatFactory.CreateLonLatPolygonCircleByPoint(
                AProjection.ProjectionType.Datum,
                VPoint.Point,
                VRadius
              );
          end;
          stSquare: begin
            Result :=
              FVectorGeometryLonLatFactory.CreateLonLatPolygonSquareByPoint(
                AProjection.ProjectionType.Datum,
                VPoint.Point,
                VRadius
              );
          end;
          stSquareOnSurface: begin
            Result :=
              FVectorGeometryLonLatFactory.CreateLonLatPolygonSquareOnSurfaceByPoint(
                AProjection.ProjectionType.Datum,
                VPoint.Point,
                VRadius
              );
          end;
        else
          Assert(False);
        end;
      end;
    end;
  end;
end;

function TMarkDbGUIHelper.SaveMarkModal(
  const AMark: IVectorDataItem;
  const AGeometry: IGeometryLonLat;
  AAsNewMark: Boolean;
  const ADescription: string;
  const ATemplate: IMarkTemplate
): Boolean;
var
  VMark: IVectorDataItem;
  VSourceMark: IVectorDataItem;
  VVisible: Boolean;
  VResult: IVectorDataItem;
  VDescription: string;
begin
  Result := False;
  if not IsMarksDBWritable then begin
    Exit;
  end;
  VSourceMark := nil;
  if AMark <> nil then begin
    VVisible := FMarkSystem.MarkDb.GetMarkVisible(AMark);
    if AAsNewMark then begin
      VSourceMark := nil;
    end else begin
      VSourceMark := AMark;
    end;
    VMark := AMark;
    if ADescription <> '' then begin
      VMark := FMarkSystem.MarkDb.Factory.ModifyName(VMark, '', ADescription);
    end;
    VMark := FMarkSystem.MarkDb.Factory.ModifyGeometry(VMark, AGeometry);
  end else begin
    VVisible := True;
    VDescription := ADescription;
    if VDescription = '' then begin
      if FMarksGUIConfig.IsAddTimeToDescription then begin
        VDescription := DateTimeToStr(Now);
      end;
    end;
    VMark := FMarkSystem.MarkDb.Factory.CreateNewMark(AGeometry, '', VDescription, ATemplate);
  end;
  if VMark <> nil then begin
    VMark := EditMarkModal(VMark, VSourceMark = nil, VVisible);
    if VMark <> nil then begin
      VResult := FMarkSystem.MarkDb.UpdateMark(VSourceMark, VMark);
      if VResult <> nil then begin
        FMarkSystem.MarkDb.SetMarkVisible(VResult, VVisible);
        Result := True;
      end;
    end;
  end;
end;

function TMarkDbGUIHelper.SaveMarkUngroupModal(
  const AMark: IVectorDataItem;
  const AGeometry: IGeometryLonLat;
  const ADescription: string;
  const ATemplate: IMarkTemplate
): Boolean;
var
  VMark: IVectorDataItem;
  VVisible: Boolean;
  VResult: IVectorDataItem;
  VDescription: string;
  VGeometryMultiLine: IGeometryLonLatMultiLine;
  VGeometryMultiPolygon: IGeometryLonLatMultiPolygon;
  i: Integer;
  VSingleMark: IVectorDataItem;
begin
  Result := False;
  if not IsMarksDBWritable then begin
    Exit;
  end;
  if Supports(AGeometry, IGeometryLonLatMultiLine) or
    Supports(AGeometry, IGeometryLonLatMultiPolygon)
  then begin
    if AMark <> nil then begin
      VVisible := FMarkSystem.MarkDb.GetMarkVisible(AMark);
      VMark := FMarkSystem.MarkDb.Factory.ModifyGeometry(AMark, AGeometry);
      if ADescription <> '' then begin
        VMark := FMarkSystem.MarkDb.Factory.ModifyName(VMark, '', ADescription);
      end;
    end else begin
      VVisible := True;
      VDescription := ADescription;
      if VDescription = '' then begin
        if FMarksGUIConfig.IsAddTimeToDescription then begin
          VDescription := DateTimeToStr(Now);
        end;
      end;
      VMark := FMarkSystem.MarkDb.Factory.CreateNewMark(AGeometry, '', VDescription, ATemplate);
    end;
    if VMark <> nil then begin
      VMark := EditMarkModal(VMark, True, VVisible);
      if VMark <> nil then begin
        if Supports(AGeometry, IGeometryLonLatMultiLine, VGeometryMultiLine) then begin
          for i := 0 to VGeometryMultiLine.Count - 1 do begin
            VSingleMark := VMark;
            VSingleMark := FMarkSystem.MarkDb.Factory.ModifyGeometry(VSingleMark, VGeometryMultiLine.Item[i]);
            VSingleMark :=  FMarkSystem.MarkDb.Factory.ModifyName(VSingleMark, VMark.Name + '_#' + IntToStr(i+1));
            VResult := FMarkSystem.MarkDb.UpdateMark(nil, VSingleMark);
            if VResult <> nil then begin
              FMarkSystem.MarkDb.SetMarkVisible(VResult, VVisible);
              Result := True;
            end;
          end;
        end else if Supports(AGeometry, IGeometryLonLatMultiPolygon, VGeometryMultiPolygon) then begin
          for i := 0 to VGeometryMultiPolygon.Count - 1 do begin
            VSingleMark := VMark;
            VSingleMark := FMarkSystem.MarkDb.Factory.ModifyGeometry(VSingleMark, VGeometryMultiPolygon.Item[i]);
            VSingleMark :=  FMarkSystem.MarkDb.Factory.ModifyName(VSingleMark, VMark.Name + '_#' + IntToStr(i+1));
            VResult := FMarkSystem.MarkDb.UpdateMark(nil, VSingleMark);
            if VResult <> nil then begin
              FMarkSystem.MarkDb.SetMarkVisible(VResult, VVisible);
              Result := True;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TMarkDbGUIHelper.UpdateMark(
  const AMark: IVectorDataItem;
  const AGeometry: IGeometryLonLat
): Boolean;
var
  VMark: IVectorDataItem;
  VResult: IVectorDataItem;
begin
  Result := False;
  if not IsMarksDBWritable then begin
    Exit;
  end;
  if AMark <> nil then begin
    VMark := FMarkSystem.MarkDb.Factory.ModifyGeometry(AMark, AGeometry);
    if VMark <> nil then begin
      VResult := FMarkSystem.MarkDb.UpdateMark(AMark, VMark);
      if VResult <> nil then begin
        Result := True;
      end;
    end;
  end;
end;

procedure TMarkDbGUIHelper.AddMarkIdListToMergePolygons(
  const AMarkIdList: IInterfaceListStatic;
  const AMergePolygonsPresenter: IMergePolygonsPresenter
);
var
  I: Integer;
  VMarkId: IMarkId;
  VMark: IVectorDataItem;
  VSubset: IVectorItemSubset;
  VSubsetBuilder: IVectorItemSubsetBuilder;
begin
  if AMarkIdList <> nil then begin
    VSubsetBuilder := FVectorItemSubsetBuilderFactory.Build;
    for I := 0 to AMarkIdList.Count - 1 do begin
      VMarkId := IMarkId(AMarkIdList[I]);
      VMark := FMarkSystem.MarkDb.GetMarkByID(VMarkId);
      if Supports(VMark.Geometry, IGeometryLonLatPolygon) then begin
        VSubsetBuilder.Add(VMark);
      end;
    end;
    if VSubsetBuilder.Count > 0 then begin
      VSubset := VSubsetBuilder.MakeStaticAndClear;
      AMergePolygonsPresenter.AddVectorItems(VSubset);
    end else begin
      MessageDlg(_('No one polygon selected!'), mtWarning, [mbOk], 0);
    end;
  end else begin
    MessageDlg(_('Please, select at least one polygon!'), mtWarning, [mbOk], 0);
  end;
end;

procedure AddItems(
  const ATree: IVectorItemTree;
  const ABuilder: IVectorItemSubsetBuilder
);
var
  I: Integer;
  VItem: IVectorDataItem;
  VSubset: IVectorItemSubset;
begin
  VSubset := ATree.Items;
  if Assigned(VSubset) then begin
    for I := 0 to VSubset.Count - 1 do begin
      VItem := VSubset.Items[I];
      if Supports(VItem.Geometry, IGeometryLonLatPolygon) then begin
        ABuilder.Add(VItem);
      end;
    end;
  end;
  for I := 0 to ATree.SubTreeItemCount - 1 do begin
    AddItems(ATree.GetSubTreeItem(I), ABuilder);
  end;
end;

procedure TMarkDbGUIHelper.AddCategoryToMergePolygons(
  const ACategory: IMarkCategory;
  const AMergePolygonsPresenter: IMergePolygonsPresenter
);
var
  VIsFound: Boolean;
  VSubset: IVectorItemSubset;
  VSubsetBuilder: IVectorItemSubsetBuilder;
  VSubCategoryList: IMarkCategoryList;
  VCategoryTree: IMarkCategoryTree;
  VMarkTree: IVectorItemTree;
begin
  VIsFound := False;
  if Assigned(ACategory) then begin
    VSubsetBuilder := FVectorItemSubsetBuilderFactory.Build;
    VSubCategoryList := FMarkSystem.CategoryDB.GetCategoryWithSubCategories(ACategory);
    VCategoryTree := FMarkSystem.CategoryDB.CategoryListToStaticTree(VSubCategoryList);
    VMarkTree := FMarkSystem.CategoryTreeToMarkTree(VCategoryTree, False);
    AddItems(VMarkTree, VSubsetBuilder);
    if VSubsetBuilder.Count > 0 then begin
      VSubset := VSubsetBuilder.MakeStaticAndClear;
      AMergePolygonsPresenter.AddVectorItems(VSubset);
      VIsFound := True;
    end;
  end;
  if not VIsFound then begin
    MessageDlg(_('Please, select category with at least one polygon!'), mtWarning, [mbOk], 0);
  end;
end;

procedure TMarkDbGUIHelper.AddGeometryModal(
  const AMarkType: Byte;
  const AMapGoto: IMapViewGoto
);

type
  TVectorDataItemArray = array of IVectorDataItem;

  function IsGeometryExists(
    const AGeometry: IGeometryLonLat;
    out AItems: TVectorDataItemArray
  ): Boolean;
  var
    I, J: Integer;
    VList: IMarkCategoryList;
    VSubset: IVectorItemSubset;
  begin
    AItems := nil;

    VList := FMarkSystem.CategoryDB.GetCategoriesList;

    VSubset :=
      FMarkSystem.MarkDb.GetMarkSubsetByCategoryListInRect(
        AGeometry.Bounds.Rect,
        VList,
        True, // include hidden marks
        DoublePoint(0, 0)
      );

    if not Assigned(VSubset) then begin
      Result := False;
      Exit;
    end;
    
    J := 0;
    for I := 0 to VSubset.Count - 1 do begin
      if AGeometry.IsSameGeometry(VSubset.Items[I].Geometry) then begin
        SetLength(AItems, J+1);
        AItems[J] := VSubset.Items[I];
        Inc(J);
      end;
    end;

    Result := J > 0;
  end;

  function AllowAddGeometry(const AMark: IVectorDataItem): Boolean;
  var
    I: Integer;
    VMsg: string;
    VResult: Integer;
    VItems: TVectorDataItemArray;
  begin
    Result := AMark <> nil;

    if Result and IsGeometryExists(AMark.Geometry, VItems) then begin

      if Length(VItems) = 1 then begin
        VMsg := Format(
          _('There is a Mark with same coordinates ("%s").' + #13#10 +
            'Do you want to replace it?'),
          [VItems[0].Name]
        );
      end else begin
        VMsg := Format(
          _('There are %d Marks with same coordinates.' + #13#10 +
            'Do you want to replace them all with the new mark?'),
          [Length(VItems)]
        );
      end;

      VResult := MessageDlg(VMsg, mtConfirmation, [mbYes, mbCancel], 0);

      case VResult of
        mrYes: begin
          for I := 0 to Length(VItems) - 1 do begin
            // delete marks with same coordinates from db
            FMarkSystem.MarkDb.UpdateMark(VItems[I], nil);
          end;
        end;
        mrCancel: begin
          Result := False;
        end;
      end;
    end;
  end;

var
  VMark: IVectorDataItem;
  VGeometry: IGeometryLonLat;
  VIsVisible: Boolean;
begin
  if not IsMarksDBWritable then begin
    Exit; // db is read-only
  end;

  VMark := nil;
  VIsVisible := True;

  case AMarkType of

    1: begin // point
      VGeometry := FfrmMarkEditPointCoordinates.GetLonLatPoint; // show editor #1
      if VGeometry = nil then begin
        Exit; // cancelled by user
      end;
      VMark := FMarkSystem.MarkDb.Factory.CreateNewMark(VGeometry, '', '');
      VMark := FfrmMarkEditPointNew.AddMark(VMark, VIsVisible); // show editor #2
    end;

    2, 3: begin // path and polygon
      if AMarkType = 2 then begin
        VGeometry := FfrmMarkEditPathCoordinates.GetLonLatLine;
      end else begin
        VGeometry := FfrmMarkEditPathCoordinates.GetLonLatPolygon;
      end;
      if VGeometry = nil then begin
        Exit;
      end;
      VMark := FMarkSystem.MarkDb.Factory.CreateNewMark(VGeometry, '', '');
      VMark := Self.EditMarkModal(VMark, True, VIsVisible);
    end;

    4: begin // sector
      // todo
      MessageDlg('Not implemented yet...', mtInformation, [mbOk], 0);
    end;
  else
    raise Exception.CreateFmt('Unexpected MarkType value: %d', [AMarkType]);
  end;

  if AllowAddGeometry(VMark) then begin
    // add mark into db
    FMarkSystem.MarkDb.UpdateMark(nil, VMark);

    // navigate to mark's position
    if VIsVisible then begin
      AMapGoto.FitRectToScreen(VMark.Geometry.Bounds.Rect);
    end;
  end;
end;

end.
