{******************************************************************************}
{* SAS.Planet (SAS.�������)                                                   *}
{* Copyright (C) 2007-2011, SAS.Planet development team.                      *}
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
{* http://sasgis.ru                                                           *}
{* az@sasgis.ru                                                               *}
{******************************************************************************}

unit u_BitmapMarkerProviderSimpleSquare;

interface

uses
  Types,
  GR32,
  i_BitmapMarker,
  i_BitmapMarkerProviderSimpleConfig,
  u_BitmapMarkerProviderSimpleBase;

type
  TBitmapMarkerProviderSimpleSquare = class(TBitmapMarkerProviderSimpleBase)
  protected
    function CreateMarker(ASize: Integer): IBitmapMarker; override;
  end;

implementation

uses
  t_GeoTypes,
  i_Bitmap32Static,
  u_Bitmap32Static,
  u_BitmapMarker;

{ TBitmapMarkerProviderSimpleSquare }

function TBitmapMarkerProviderSimpleSquare.CreateMarker(ASize: Integer): IBitmapMarker;
var
  VConfig: IBitmapMarkerProviderSimpleConfigStatic;
  VMarkerBitmap: TCustomBitmap32;
  VSize: TPoint;
  VCenterPoint: TDoublePoint;
  VMarkRect: TRect;
  VBitmapStatic: IBitmap32Static;
begin
  VMarkerBitmap := TCustomBitmap32.Create;
  try
    VConfig := Config;
    VSize := Point(ASize, ASize);

    VCenterPoint.X := VSize.X / 2;
    VCenterPoint.Y := VSize.Y / 2;

    VMarkerBitmap.SetSize(VSize.Y, VSize.Y);
    VMarkerBitmap.Clear(VConfig.MarkerColor);

    VMarkRect := VMarkerBitmap.BoundsRect;
    VMarkerBitmap.FrameRectTS(VMarkRect, VConfig.BorderColor);
  except
    VMarkerBitmap.Free;
    raise;
  end;
  VBitmapStatic := TBitmap32Static.CreateWithOwn(VMarkerBitmap);
  Result :=
    TBitmapMarker.Create(
      VBitmapStatic,
      VCenterPoint
    );
end;

end.
