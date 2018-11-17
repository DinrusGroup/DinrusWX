//-----------------------------------------------------------------------------
// wxD - DC.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - DC.cs
//
/// The wxDC wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: DC.d,v 1.10 2007/01/08 23:19:13 afb Exp $
//-----------------------------------------------------------------------------


module wx.DC;
public import wx.common;
public import wx.Window;
public import wx.Pen;
public import wx.Brush;
public import wx.ArrayInt;

		//! \cond EXTERN
		static extern (C) проц   wxDC_dtor(IntPtr сам);
		static extern (C) проц   wxDC_DrawBitmap(IntPtr сам, IntPtr bmp, цел x, цел y, бул transparent);
		static extern (C) проц   wxDC_DrawPolygon(IntPtr сам, цел n, Точка* points, цел xoffset, цел yoffset, цел fill_style);
		static extern (C) проц   wxDC_DrawLine(IntPtr сам, цел x1, цел y1, цел x2, цел y2);
		static extern (C) проц   wxDC_DrawRectangle(IntPtr сам, цел x1, цел y1, цел x2, цел y2);
		static extern (C) проц   wxDC_DrawText(IntPtr сам, ткст текст, цел x, цел y);
		static extern (C) проц   wxDC_DrawEllipse(IntPtr сам, цел x, цел y, цел ширь, цел высь);
		static extern (C) проц   wxDC_DrawPoint(IntPtr сам, цел x, цел y);
		static extern (C) проц   wxDC_DrawRoundedRectangle(IntPtr сам, цел x, цел y, цел ширь, цел высь, double radius);
	
		static extern (C) проц   wxDC_SetBackgroundMode(IntPtr сам, FillStyle mode);
	
		static extern (C) проц   wxDC_SetTextBackground(IntPtr сам, IntPtr цвет);
		static extern (C) IntPtr wxDC_GetTextBackground(IntPtr сам);
	
		static extern (C) проц   wxDC_SetBrush(IntPtr сам, IntPtr brush);
		static extern (C) IntPtr wxDC_GetBrush(IntPtr сам);
	
		static extern (C) проц   wxDC_SetBackground(IntPtr сам, IntPtr brush);
		static extern (C) IntPtr wxDC_GetBackground(IntPtr сам);
	
		static extern (C) проц   wxDC_SetPen(IntPtr сам, IntPtr pen);
		static extern (C) IntPtr wxDC_GetPen(IntPtr сам);
	
		static extern (C) проц   wxDC_SetTextForeground(IntPtr сам, IntPtr цвет);
		static extern (C) IntPtr wxDC_GetTextForeground(IntPtr сам);
	
		static extern (C) проц   wxDC_SetFont(IntPtr сам, IntPtr шрифт);
		static extern (C) IntPtr wxDC_GetFont(IntPtr сам);
	
		static extern (C) проц   wxDC_GetTextExtent(IntPtr сам, ткст стр, out цел x, out цел y, out цел descent, out цел внешнееВступление, IntPtr theFont);
		static extern (C) проц   wxDC_Clear(IntPtr сам);
	
		static extern (C) проц   wxDC_DestroyClippingRegion(IntPtr сам);
		static extern (C) проц   wxDC_SetClippingRegion(IntPtr сам, цел x, цел y, цел ширь, цел высь);
		static extern (C) проц   wxDC_SetClippingRegionPos(IntPtr сам, inout Точка поз, inout Размер разм);
		static extern (C) проц   wxDC_SetClippingRegionRect(IntPtr сам, inout Прямоугольник прям);
		static extern (C) проц   wxDC_SetClippingRegionReg(IntPtr сам, IntPtr reg);
	
		static extern (C) цел    wxDC_GetLogicalFunction(IntPtr сам);
		static extern (C) проц   wxDC_SetLogicalFunction(IntPtr сам, цел func);
	
		static extern (C) бул   wxDC_BeginDrawing(IntPtr сам);
		static extern (C) бул   wxDC_Blit(IntPtr сам, цел xdest, цел ydest, цел ширь, цел высь, IntPtr source, цел xsrc, цел ysrc, цел rop, бул useMask, цел xsrcMask, цел ysrcMask);
		static extern (C) проц   wxDC_EndDrawing(IntPtr сам);
		
		static extern (C) бул   wxDC_FloodFill(IntPtr сам, цел x, цел y, IntPtr col, цел стиль);
		
		static extern (C) бул   wxDC_GetPixel(IntPtr сам, цел x, цел y, IntPtr col);
		
		static extern (C) проц   wxDC_CrossHair(IntPtr сам, цел x, цел y);
		
		static extern (C) проц   wxDC_DrawArc(IntPtr сам, цел x1, цел y1, цел x2, цел y2, цел xc, цел yc);
		
		static extern (C) проц   wxDC_DrawCheckMark(IntPtr сам, цел x, цел y, цел ширь, цел высь);
		
		static extern (C) проц   wxDC_DrawEllipticArc(IntPtr сам, цел x, цел y, цел w, цел h, double sa, double ea);
		
		static extern (C) проц   wxDC_DrawLines(IntPtr сам, цел n, Точка* points, цел xoffset, цел yoffset);
		
		static extern (C) проц   wxDC_DrawCircle(IntPtr сам, цел x, цел y, цел radius);
		
		static extern (C) проц   wxDC_DrawIcon(IntPtr сам, IntPtr пиктограмма, цел x, цел y);
		
		static extern (C) проц   wxDC_DrawRotatedText(IntPtr сам, ткст текст, цел x, цел y, double angle);
		
		static extern (C) проц   wxDC_DrawLabel(IntPtr сам, ткст текст, IntPtr рисунок, inout Прямоугольник прям, цел alignment, цел indexAccel, inout Прямоугольник rectBounding);
		static extern (C) проц   wxDC_DrawLabel2(IntPtr сам, ткст текст, inout Прямоугольник прям, цел alignment, цел indexAccel);
		
		static extern (C) проц   wxDC_DrawSpline(IntPtr сам, цел x1, цел y1, цел x2, цел y2, цел x3, цел y3);
		static extern (C) проц   wxDC_DrawSpline2(IntPtr сам, цел n, Точка* points);
		
		static extern (C) бул   wxDC_StartDoc(IntPtr сам, ткст message);
		static extern (C) проц   wxDC_EndDoc(IntPtr сам);
		static extern (C) проц   wxDC_StartPage(IntPtr сам);
		static extern (C) проц   wxDC_EndPage(IntPtr сам);
		
		static extern (C) проц   wxDC_GetClippingBox(IntPtr сам, out цел x, out цел y, out цел w, out цел h);
		static extern (C) проц   wxDC_GetClippingBox2(IntPtr сам, out Прямоугольник прям);
		
		static extern (C) проц   wxDC_GetMultiLineTextExtent(IntPtr сам, ткст текст, out цел ширь, out цел высь, out цел heightline, IntPtr шрифт);
		
		static extern (C) бул   wxDC_GetPartialTextExtents(IntPtr сам, ткст текст, IntPtr widths);
		
		static extern (C) проц   wxDC_GetSize(IntPtr сам, out цел ширь, out цел высь);
		static extern (C) проц   wxDC_GetSize2(IntPtr сам, inout Размер разм);
		static extern (C) проц   wxDC_GetSizeMM(IntPtr сам, out цел ширь, out цел высь);
		static extern (C) проц   wxDC_GetSizeMM2(IntPtr сам, inout Размер разм);
		
		static extern (C) цел    wxDC_DeviceToLogicalX(IntPtr сам, цел x);
		static extern (C) цел    wxDC_DeviceToLogicalY(IntPtr сам, цел y);
		static extern (C) цел    wxDC_DeviceToLogicalXRel(IntPtr сам, цел x);
		static extern (C) цел    wxDC_DeviceToLogicalYRel(IntPtr сам, цел y);
		static extern (C) цел    wxDC_LogicalToDeviceX(IntPtr сам, цел x);
		static extern (C) цел    wxDC_LogicalToDeviceY(IntPtr сам, цел y);
		static extern (C) цел    wxDC_LogicalToDeviceXRel(IntPtr сам, цел x);
		static extern (C) цел    wxDC_LogicalToDeviceYRel(IntPtr сам, цел y);
		
		static extern (C) бул   wxDC_Ok(IntPtr сам);
		
		static extern (C) цел    wxDC_GetBackgroundMode(IntPtr сам);
		
		static extern (C) цел    wxDC_GetMapMode(IntPtr сам);
		static extern (C) проц   wxDC_SetMapMode(IntPtr сам, цел mode);
		
		static extern (C) проц   wxDC_GetUserScale(IntPtr сам, out double x, out double y);
		static extern (C) проц   wxDC_SetUserScale(IntPtr сам, double x, double y);
		
		static extern (C) проц   wxDC_GetLogicalScale(IntPtr сам, out double x, out double y);
		static extern (C) проц   wxDC_SetLogicalScale(IntPtr сам, double x, double y);
		
		static extern (C) проц   wxDC_GetLogicalOrigin(IntPtr сам, out цел x, out цел y);
		static extern (C) проц   wxDC_GetLogicalOrigin2(IntPtr сам, inout Точка тчк);
		static extern (C) проц   wxDC_SetLogicalOrigin(IntPtr сам, цел x, цел y);
		
		static extern (C) проц   wxDC_GetDeviceOrigin(IntPtr сам, out цел x, out цел y);
		static extern (C) проц   wxDC_GetDeviceOrigin2(IntPtr сам, inout Точка тчк);
		static extern (C) проц   wxDC_SetDeviceOrigin(IntPtr сам, цел x, цел y);
		
		static extern (C) проц   wxDC_SetAxisOrientation(IntPtr сам, бул xLeftRight, бул yBottomUp);
		
		static extern (C) проц   wxDC_CalcBoundingBox(IntPtr сам, цел x, цел y);
		static extern (C) проц   wxDC_ResetBoundingBox(IntPtr сам);
		
		static extern (C) цел    wxDC_MinX(IntPtr сам);
		static extern (C) цел    wxDC_MaxX(IntPtr сам);
		static extern (C) цел    wxDC_MinY(IntPtr сам);
		static extern (C) цел    wxDC_MaxY(IntPtr сам);
		//! \endcond

	alias DC wxDC;
	public class DC : wxObject
	{
		//---------------------------------------------------------------------

		public this(IntPtr wxobj) ;
		override protected проц dtor() ;
		public проц BackgroundMode(FillStyle значение);
		public FillStyle BackgroundMode() ;
		public проц brush(Кисть значение);
		public Кисть brush() ;
		public проц Background(Кисть значение) ;
		public Кисть Background() ;
		public проц DrawBitmap(Битмап bmp, цел x, цел y, бул useMask);
		public проц DrawBitmap(Битмап bmp, цел x, цел y);
		public проц DrawBitmap(Битмап bmp, Точка тчк, бул useMask);
		public проц DrawBitmap(Битмап bmp, Точка тчк);
		public проц DrawEllipse(цел x, цел y, цел ширь, цел высь);
		public проц DrawEllipse(Точка тчк, Размер рм);
		public проц DrawEllipse(Прямоугольник прям);
		public проц DrawPoint(цел x, цел y);
		public проц DrawPoint(Точка тчк);
		public проц DrawLine(Точка p1, Точка p2);
		public проц DrawLine(цел x1, цел y1, цел x2, цел y2);
		public проц DrawPolygon(Точка[] points);
		public проц DrawPolygon(Точка[] points, цел xoffset, цел yoffset);
		public проц DrawPolygon(Точка[] points, цел xoffset, цел yoffset, FillStyle fill_style);
		public проц DrawPolygon(цел n, Точка[] points);
		public проц DrawPolygon(цел n, Точка[] points, цел xoffset, цел yoffset);
		public проц DrawPolygon(цел n, Точка[] points, цел xoffset, цел yoffset, FillStyle fill_style);
		public проц DrawRectangle(цел x1, цел y1, цел x2, цел y2);
		public проц DrawRectangle(Точка тчк, Размер рм);
		public проц DrawRectangle(Прямоугольник прям);
		public проц DrawText(ткст текст, цел x, цел y);
		public проц DrawText(ткст текст, Точка поз);
		public проц DrawRoundedRectangle(цел x, цел y, цел ширь, цел высь, double radius);
		public проц DrawRoundedRectangle(Точка тчк, Размер рм, double radius);
		public проц DrawRoundedRectangle(Прямоугольник r, double radius);
		public проц pen(Pen значение);
		public Pen pen();
		public Цвет TextForeground();
		public проц TextForeground(Цвет значение) ;
		public Цвет TextBackground() ;
		public проц TextBackground(Цвет значение) ;
		public Шрифт шрифт() ;
		public проц шрифт(Шрифт значение);
		public  проц Clear();
		public проц ДайПротяженностьТекста(ткст стр, out цел x, out цел y);
		public проц ДайПротяженностьТекста(ткст стр, out цел x, out цел y, out цел descent, out цел внешнееВступление, Шрифт theFont);
		public проц DestroyClippingRegion();
		public проц УстClippingRegion(цел x, цел y, цел ширь, цел высь);
		public проц УстClippingRegion(Точка поз, Размер разм);
		public проц УстClippingRegion(Прямоугольник прям);
		public проц УстClippingRegion(Регион reg);
		public Logic LogicalFunction();
		public проц LogicalFunction(Logic значение);
		public проц BeginDrawing();
		public бул Blit(цел xdest, цел ydest, цел ширь, цел высь, DC source, цел xsrc, цел ysrc, цел rop, бул useMask, цел xsrcMask, цел ysrcMask);
		public бул Blit(цел xdest, цел ydest, цел ширь, цел высь, DC source);
		public бул Blit(цел xdest, цел ydest, цел ширь, цел высь, DC source, цел xsrc, цел ysrc);		
		public бул Blit(цел xdest, цел ydest, цел ширь, цел высь, DC source, цел xsrc, цел ysrc, цел rop);		
		public бул Blit(цел xdest, цел ydest, цел ширь, цел высь, DC source, цел xsrc, цел ysrc, цел rop, бул useMask);
		public бул Blit(цел xdest, цел ydest, цел ширь, цел высь, DC source, цел xsrc, цел ysrc, цел rop, бул useMask, цел xsrcMask);
		public бул Blit(Точка destPt, Размер рм, DC source, Точка srcPt, цел rop, бул useMask, Точка srcPtMask);
		public бул Blit(Точка destPt, Размер рм, DC source, Точка srcPt);
		public бул Blit(Точка destPt, Размер рм, DC source, Точка srcPt, цел rop);
		public бул Blit(Точка destPt, Размер рм, DC source, Точка srcPt, цел rop, бул useMask);
		public проц EndDrawing();
		public бул FloodFill(цел x, цел y, Цвет col);
		public бул FloodFill(цел x, цел y, Цвет col, цел стиль);
		public бул FloodFill(Точка тчк, Цвет col);
		public бул FloodFill(Точка тчк, Цвет col, цел стиль);
		public бул GetPixel(цел x, цел y, Цвет col);
		public бул GetPixel(Точка тчк, Цвет col);
		public проц CrossHair(цел x, цел y);
		public проц CrossHair(Точка тчк);
		public проц DrawArc(цел x1, цел y1, цел x2, цел y2, цел xc, цел yc);
		public проц DrawArc(Точка pt1, Точка pt2, Точка centre);
		public проц DrawCheckMark(цел x, цел y, цел ширь, цел высь);
		public проц DrawCheckMark(Прямоугольник прям);
		public проц DrawEllipticArc(цел x, цел y, цел w, цел h, double sa, double ea);
		public проц DrawEllipticArc(Точка тчк, Размер рм, double sa, double ea);
		public проц DrawLines(Точка[] points, цел xoffset, цел yoffset);
		public проц DrawLines(Точка[] points);
		public проц DrawLines(Точка[] points, цел xoffset);
		public проц DrawCircle(цел x, цел y, цел radius);
		public проц DrawCircle(Точка тчк, цел radius);
		public проц DrawIcon(Пиктограмма пиктограмма, цел x, цел y);
		public проц DrawIcon(Пиктограмма пиктограмма, Точка тчк);
		public проц DrawRotatedText(ткст текст, цел x, цел y, double angle);
		public проц DrawRotatedText(ткст текст, Точка тчк, double angle);
		public  проц DrawLabel(ткст текст, Битмап рисунок, Прямоугольник прям, цел alignment, цел indexAccel, inout Прямоугольник rectBounding);
		public  проц DrawLabel(ткст текст, Битмап рисунок, Прямоугольник прям);
		public  проц DrawLabel(ткст текст, Битмап рисунок, Прямоугольник прям, цел alignment);
		public  проц DrawLabel(ткст текст, Битмап рисунок, Прямоугольник прям, цел alignment, цел indexAccel);
		public проц DrawLabel(ткст текст, Прямоугольник прям, цел alignment, цел indexAccel);
		public проц DrawLabel(ткст текст, Прямоугольник прям);
		public проц DrawLabel(ткст текст, Прямоугольник прям, цел alignment);
		public проц DrawSpline(цел x1, цел y1, цел x2, цел y2, цел x3, цел y3);
		public проц DrawSpline(Точка[] points);
		public  бул StartDoc(ткст message);
		public  проц EndDoc();
		public  проц StartPage();
		public  проц EndPage();
		public проц GetClippingBox(out цел x, out цел y, out цел w, out цел h);
		public проц GetClippingBox(out Прямоугольник прям);
		public  проц GetMultiLineTextExtent(ткст текст, out цел ширь, out цел высь, out цел heightline, Шрифт шрифт);
		public  проц GetMultiLineTextExtent(ткст текст, out цел ширь, out цел высь);
		public  проц GetMultiLineTextExtent(ткст текст, out цел ширь, out цел высь, out цел heightline);
		public бул GetPartialTextExtents(ткст текст, цел[] widths);
		public проц GetSize(out цел ширь, out цел высь);
		public Размер разм();
		public проц GetSizeMM(out цел ширь, out цел высь);
		public Размер SizeMM() ;
		public цел DeviceToLogicalX(цел x);
		public цел DeviceToLogicalY(цел y);
		public цел DeviceToLogicalXRel(цел x);
		public цел DeviceToLogicalYRel(цел y);
		public цел LogicalToDeviceX(цел x);
		public цел LogicalToDeviceY(цел y);
		public цел LogicalToDeviceXRel(цел x);
		public цел LogicalToDeviceYRel(цел y);
		public  бул Ок();
		public цел MapMode();
		public проц MapMode(цел значение);
		public  проц GetUserScale(out double x, out double y);
		public  проц УстUserScale(double x, double y);
		public  проц GetLogicalScale(out double x, out double y);
		public  проц УстLogicalScale(double x, double y);
		public проц GetLogicalOrigin(out цел x, out цел y);
		public Точка LogicalOrigin();
		public проц УстLogicalOrigin(цел x, цел y);
		public проц GetDeviceOrigin(out цел x, out цел y);
		public Точка DeviceOrigin();
		public проц УстDeviceOrigin(цел x, цел y);
		public проц УстAxisOrientation(бул xLeftRight, бул yBottomUp);
		public  проц CalcBoundingBox(цел x, цел y);
		public проц ResetBoundingBox();
		public цел MinX();
		public цел MaxX() ;
		public цел MinY() ;
		public цел MaxY() ;
		public static wxObject Нов(IntPtr ptr) ;
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxWindowDC_ctor();
		static extern (C) IntPtr wxWindowDC_ctor2(IntPtr win);
		static extern (C) бул wxWindowDC_CanDrawBitmap(IntPtr сам);
		static extern (C) бул wxWindowDC_CanGetTextExtent(IntPtr сам);
		static extern (C) цел wxWindowDC_GetCharWidth(IntPtr сам);
		static extern (C) цел wxWindowDC_GetCharHeight(IntPtr сам);
		static extern (C) проц wxWindowDC_Clear(IntPtr сам);
		static extern (C) проц wxWindowDC_SetFont(IntPtr сам, IntPtr шрифт);
		static extern (C) проц wxWindowDC_SetPen(IntPtr сам, IntPtr pen);
		static extern (C) проц wxWindowDC_SetBrush(IntPtr сам, IntPtr brush);
		static extern (C) проц wxWindowDC_SetBackground(IntPtr сам, IntPtr brush);
		static extern (C) проц wxWindowDC_SetLogicalFunction(IntPtr сам, цел func);
		static extern (C) проц wxWindowDC_SetTextForeground(IntPtr сам, IntPtr цвет);
		static extern (C) проц wxWindowDC_SetTextBackground(IntPtr сам, IntPtr цвет);
		static extern (C) проц wxWindowDC_SetBackgroundMode(IntPtr сам, цел mode);
		static extern (C) проц wxWindowDC_SetPalette(IntPtr сам, IntPtr палитра);
		static extern (C) проц wxWindowDC_GetPPI(IntPtr сам, inout Размер разм);
		static extern (C) цел wxWindowDC_GetDepth(IntPtr сам);
		//! \endcond
		
		//---------------------------------------------------------------------
	
	alias WindowDC wxWindowDC;
	public class WindowDC : DC
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		public this(Окно win);
		public бул CanDrawBitmap();
		public бул CanGetTextExtent();
		public цел GetCharWidth();
		public цел GetCharHeight();
		public цел ВысьСим() ;
		public цел ШирьСим() ;
		public override проц Clear();
		public проц УстFont(Шрифт шрифт);
		public проц УстPen(Pen pen);
		public проц УстBrush(Кисть brush);
		public проц УстBackground(Кисть brush);
		public проц УстLogicalFunction(цел func);
		public проц УстTextForeground(Цвет цвет);
		public проц УстTextBackground(Цвет цвет);
		public проц УстBackgroundMode(цел mode)	;
		public проц УстPalette(Палитра палитра);
		public Размер GetPPI();
		public цел GetDepth();
	}
	
		//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxClientDC_ctor();
		static extern (C) IntPtr wxClientDC_ctor2(IntPtr окно);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias ClientDC wxClientDC;
	public class ClientDC : WindowDC
	{
		public this(IntPtr wxobj) ;
		private this(IntPtr wxobj, бул memOwn);
		public this();
		public this(Окно окно);
	}
    
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) IntPtr wxPaintDC_ctor();
		static extern (C) IntPtr wxPaintDC_ctor2(IntPtr окно);
		//! \endcond

		//---------------------------------------------------------------------

	alias PaintDC wxPaintDC;
	public class PaintDC : WindowDC
	{
		public this(IntPtr wxobj) ;
		private this(IntPtr wxobj, бул memOwn);;
		public this(Окно окно);
	}
