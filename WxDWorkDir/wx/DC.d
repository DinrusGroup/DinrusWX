
module wx.DC;
public import wx.common;
public import wx.Window;
public import wx.Pen;
public import wx.Brush;
public import wx.ArrayInt;

		//! \cond EXTERN
		static extern (C) проц   wxDC_dtor(ЦУк сам);
		static extern (C) проц   wxDC_DrawBitmap(ЦУк сам, ЦУк bmp, цел x, цел y, бул transparent);
		static extern (C) проц   wxDC_DrawPolygon(ЦУк сам, цел n, Точка* points, цел xoffset, цел yoffset, цел fill_style);
		static extern (C) проц   wxDC_DrawLine(ЦУк сам, цел x1, цел y1, цел x2, цел y2);
		static extern (C) проц   wxDC_DrawRectangle(ЦУк сам, цел x1, цел y1, цел x2, цел y2);
		static extern (C) проц   wxDC_DrawText(ЦУк сам, ткст текст, цел x, цел y);
		static extern (C) проц   wxDC_DrawEllipse(ЦУк сам, цел x, цел y, цел ширина, цел высота);
		static extern (C) проц   wxDC_DrawPoint(ЦУк сам, цел x, цел y);
		static extern (C) проц   wxDC_DrawRoundedRectangle(ЦУк сам, цел x, цел y, цел ширина, цел высота, дво radius);
	
		static extern (C) проц   wxDC_SetBackgroundMode(ЦУк сам, СтильЗаливки mode);
	
		static extern (C) проц   wxDC_SetTextBackground(ЦУк сам, ЦУк colour);
		static extern (C) ЦУк wxDC_GetTextBackground(ЦУк сам);
	
		static extern (C) проц   wxDC_SetBrush(ЦУк сам, ЦУк кисть);
		static extern (C) ЦУк wxDC_GetBrush(ЦУк сам);
	
		static extern (C) проц   wxDC_SetBackground(ЦУк сам, ЦУк кисть);
		static extern (C) ЦУк wxDC_GetBackground(ЦУк сам);
	
		static extern (C) проц   wxDC_SetPen(ЦУк сам, ЦУк перо);
		static extern (C) ЦУк wxDC_GetPen(ЦУк сам);
	
		static extern (C) проц   wxDC_SetTextForeground(ЦУк сам, ЦУк colour);
		static extern (C) ЦУк wxDC_GetTextForeground(ЦУк сам);
	
		static extern (C) проц   wxDC_SetFont(ЦУк сам, ЦУк шрифт);
		static extern (C) ЦУк wxDC_GetFont(ЦУк сам);
	
		static extern (C) проц   wxDC_GetTextExtent(ЦУк сам, ткст str, out цел x, out цел y, out цел descent, out цел externalLeading, ЦУк theFont);
		static extern (C) проц   wxDC_Clear(ЦУк сам);
	
		static extern (C) проц   wxDC_DestroyClippingRegion(ЦУк сам);
		static extern (C) проц   wxDC_SetClippingRegion(ЦУк сам, цел x, цел y, цел ширина, цел высота);
		static extern (C) проц   wxDC_SetClippingRegionPos(ЦУк сам, inout Точка поз, inout Размер size);
		static extern (C) проц   wxDC_SetClippingRegionRect(ЦУк сам, inout Прямоугольник прям);
		static extern (C) проц   wxDC_SetClippingRegionReg(ЦУк сам, ЦУк reg);
	
		static extern (C) цел    wxDC_GetLogicalFunction(ЦУк сам);
		static extern (C) проц   wxDC_SetLogicalFunction(ЦУк сам, цел func);
	
		static extern (C) бул   wxDC_BeginDrawing(ЦУк сам);
		static extern (C) бул   wxDC_Blit(ЦУк сам, цел xdest, цел ydest, цел ширина, цел высота, ЦУк source, цел xsrc, цел ysrc, цел rop, бул useMask, цел xsrcMask, цел ysrcMask);
		static extern (C) проц   wxDC_EndDrawing(ЦУк сам);
		
		static extern (C) бул   wxDC_FloodFill(ЦУк сам, цел x, цел y, ЦУк col, цел стиль);
		
		static extern (C) бул   wxDC_GetPixel(ЦУк сам, цел x, цел y, ЦУк col);
		
		static extern (C) проц   wxDC_CrossHair(ЦУк сам, цел x, цел y);
		
		static extern (C) проц   wxDC_DrawArc(ЦУк сам, цел x1, цел y1, цел x2, цел y2, цел xc, цел yc);
		
		static extern (C) проц   wxDC_DrawCheckMark(ЦУк сам, цел x, цел y, цел ширина, цел высота);
		
		static extern (C) проц   wxDC_DrawEllipticArc(ЦУк сам, цел x, цел y, цел w, цел h, дво sa, дво ea);
		
		static extern (C) проц   wxDC_DrawLines(ЦУк сам, цел n, Точка* points, цел xoffset, цел yoffset);
		
		static extern (C) проц   wxDC_DrawCircle(ЦУк сам, цел x, цел y, цел radius);
		
		static extern (C) проц   wxDC_DrawIcon(ЦУк сам, ЦУк иконка, цел x, цел y);
		
		static extern (C) проц   wxDC_DrawRotatedText(ЦУк сам, ткст текст, цел x, цел y, дво угол);
		
		static extern (C) проц   wxDC_DrawLabel(ЦУк сам, ткст текст, ЦУк рисунок, inout Прямоугольник прям, цел alignment, цел indexAccel, inout Прямоугольник rectBounding);
		static extern (C) проц   wxDC_DrawLabel2(ЦУк сам, ткст текст, inout Прямоугольник прям, цел alignment, цел indexAccel);
		
		static extern (C) проц   wxDC_DrawSpline(ЦУк сам, цел x1, цел y1, цел x2, цел y2, цел x3, цел y3);
		static extern (C) проц   wxDC_DrawSpline2(ЦУк сам, цел n, Точка* points);
		
		static extern (C) бул   wxDC_StartDoc(ЦУк сам, ткст message);
		static extern (C) проц   wxDC_EndDoc(ЦУк сам);
		static extern (C) проц   wxDC_StartPage(ЦУк сам);
		static extern (C) проц   wxDC_EndPage(ЦУк сам);
		
		static extern (C) проц   wxDC_GetClippingBox(ЦУк сам, out цел x, out цел y, out цел w, out цел h);
		static extern (C) проц   wxDC_GetClippingBox2(ЦУк сам, out Прямоугольник прям);
		
		static extern (C) проц   wxDC_GetMultiLineTextExtent(ЦУк сам, ткст текст, out цел ширина, out цел высота, out цел heightline, ЦУк шрифт);
		
		static extern (C) бул   wxDC_GetPartialTextExtents(ЦУк сам, ткст текст, ЦУк widths);
		
		static extern (C) проц   wxDC_GetSize(ЦУк сам, out цел ширина, out цел высота);
		static extern (C) проц   wxDC_GetSize2(ЦУк сам, inout Размер size);
		static extern (C) проц   wxDC_GetSizeMM(ЦУк сам, out цел ширина, out цел высота);
		static extern (C) проц   wxDC_GetSizeMM2(ЦУк сам, inout Размер size);
		
		static extern (C) цел    wxDC_DeviceToLogicalX(ЦУк сам, цел x);
		static extern (C) цел    wxDC_DeviceToLogicalY(ЦУк сам, цел y);
		static extern (C) цел    wxDC_DeviceToLogicalXRel(ЦУк сам, цел x);
		static extern (C) цел    wxDC_DeviceToLogicalYRel(ЦУк сам, цел y);
		static extern (C) цел    wxDC_LogicalToDeviceX(ЦУк сам, цел x);
		static extern (C) цел    wxDC_LogicalToDeviceY(ЦУк сам, цел y);
		static extern (C) цел    wxDC_LogicalToDeviceXRel(ЦУк сам, цел x);
		static extern (C) цел    wxDC_LogicalToDeviceYRel(ЦУк сам, цел y);
		
		static extern (C) бул   wxDC_Ok(ЦУк сам);
		
		static extern (C) цел    wxDC_GetBackgroundMode(ЦУк сам);
		
		static extern (C) цел    wxDC_GetMapMode(ЦУк сам);
		static extern (C) проц   wxDC_SetMapMode(ЦУк сам, цел mode);
		
		static extern (C) проц   wxDC_GetUserScale(ЦУк сам, out дво x, out дво y);
		static extern (C) проц   wxDC_SetUserScale(ЦУк сам, дво x, дво y);
		
		static extern (C) проц   wxDC_GetLogicalScale(ЦУк сам, out дво x, out дво y);
		static extern (C) проц   wxDC_SetLogicalScale(ЦУк сам, дво x, дво y);
		
		static extern (C) проц   wxDC_GetLogicalOrigin(ЦУк сам, out цел x, out цел y);
		static extern (C) проц   wxDC_GetLogicalOrigin2(ЦУк сам, inout Точка pt);
		static extern (C) проц   wxDC_SetLogicalOrigin(ЦУк сам, цел x, цел y);
		
		static extern (C) проц   wxDC_GetDeviceOrigin(ЦУк сам, out цел x, out цел y);
		static extern (C) проц   wxDC_GetDeviceOrigin2(ЦУк сам, inout Точка pt);
		static extern (C) проц   wxDC_SetDeviceOrigin(ЦУк сам, цел x, цел y);
		
		static extern (C) проц   wxDC_SetAxisOrientation(ЦУк сам, бул xLeftRight, бул yBottomUp);
		
		static extern (C) проц   wxDC_CalcBoundingBox(ЦУк сам, цел x, цел y);
		static extern (C) проц   wxDC_ResetBoundingBox(ЦУк сам);
		
		static extern (C) цел    wxDC_MinX(ЦУк сам);
		static extern (C) цел    wxDC_MaxX(ЦУк сам);
		static extern (C) цел    wxDC_MinY(ЦУк сам);
		static extern (C) цел    wxDC_MaxY(ЦУк сам);
		//! \endcond

	alias DC wxDC;
	public class DC : wxObject
	{
		//---------------------------------------------------------------------

		public this(ЦУк шхобъ) 
			{ super(шхобъ);}

		override protected проц dtor() { wxDC_dtor(шхобъ); }

		//---------------------------------------------------------------------

		public проц ФоновыйРежим(СтильЗаливки значение) { wxDC_SetBackgroundMode(шхобъ, значение); }
		public СтильЗаливки ФоновыйРежим() { return cast(СтильЗаливки)wxDC_GetBackgroundMode(шхобъ); }

		//---------------------------------------------------------------------

		public проц кисть(Кисть значение) { wxDC_SetBrush(шхобъ, wxObject.SafePtr(значение)); }
		public Кисть кисть() { return new Кисть(wxDC_GetBrush(шхобъ)); }

		public проц Фон(Кисть значение) { wxDC_SetBackground(шхобъ, wxObject.SafePtr(значение)); }
		public Кисть Фон() { return new Кисть(wxDC_GetBackground(шхобъ)); }

		//---------------------------------------------------------------------

		public проц РисуйБитмап(Битмап bmp, цел x, цел y, бул useMask)
		{
			wxDC_DrawBitmap(шхобъ, wxObject.SafePtr(bmp), x, y, useMask);
		}
		
		public проц РисуйБитмап(Битмап bmp, цел x, цел y)
		{
			РисуйБитмап(bmp, x, y, нет);
		}
		
		public проц РисуйБитмап(Битмап bmp, Точка pt, бул useMask)
		{
			РисуйБитмап(bmp, pt.X, pt.Y, useMask);
		}
		
		public проц РисуйБитмап(Битмап bmp, Точка pt)
		{
			РисуйБитмап(bmp, pt.X, pt.Y, нет);
		}

		//---------------------------------------------------------------------

		public проц РисуйЭллипс(цел x, цел y, цел ширина, цел высота)
		{
			wxDC_DrawEllipse(шхобъ, x, y, ширина, высота);
		}
		
		public проц РисуйЭллипс(Точка pt, Размер sz)
		{
			РисуйЭллипс(pt.X, pt.Y, sz.Ширина, sz.Высота);
		}
		
		public проц РисуйЭллипс(Прямоугольник прям)
		{
			РисуйЭллипс(прям.X, прям.Y, прям.Ширина, прям.Высота);
		}

		//---------------------------------------------------------------------

		public проц РисуйТочку(цел x, цел y)
		{
			wxDC_DrawPoint(шхобъ, x, y);
		}
		
		public проц РисуйТочку(Точка pt)
		{
			РисуйТочку(pt.X, pt.Y);
		}

		//---------------------------------------------------------------------

		public проц РисуйЛинию(Точка p1, Точка p2)
		{ 
			РисуйЛинию(p1.X, p1.Y, p2.X, p2.Y); 
		}

		public проц РисуйЛинию(цел x1, цел y1, цел x2, цел y2)
		{
			wxDC_DrawLine(шхобъ, x1, y1, x2, y2);
		}

		//---------------------------------------------------------------------

		public проц РисуйМногоуг(Точка[] points)
		{ 
			РисуйМногоуг(points.length, points, 0, 0, СтильЗаливки.wxODDEVEN_RULE); 
		}
		
		public проц РисуйМногоуг(Точка[] points, цел xoffset, цел yoffset)
		{ 
			РисуйМногоуг(points.length, points, xoffset, yoffset, СтильЗаливки.wxODDEVEN_RULE); 
		}
		
		public проц РисуйМногоуг(Точка[] points, цел xoffset, цел yoffset, СтильЗаливки fill_style)
		{ 
			РисуйМногоуг(points.length, points, xoffset, yoffset, fill_style); 
		}

		public проц РисуйМногоуг(цел n, Точка[] points)
		{ 
			РисуйМногоуг(n, points, 0, 0, СтильЗаливки.wxODDEVEN_RULE); 
		}
		
		public проц РисуйМногоуг(цел n, Точка[] points, цел xoffset, цел yoffset)
		{ 
			РисуйМногоуг(n, points, xoffset, yoffset, СтильЗаливки.wxODDEVEN_RULE); 
		}
		
		public проц РисуйМногоуг(цел n, Точка[] points, цел xoffset, цел yoffset, СтильЗаливки fill_style)
		{
			wxDC_DrawPolygon(шхобъ, n, points.ptr, xoffset, yoffset, cast(цел)fill_style);
		}

		//---------------------------------------------------------------------

		public проц РисуйПрям(цел x1, цел y1, цел x2, цел y2)
		{
			wxDC_DrawRectangle(шхобъ, x1, y1, x2, y2);
		}
		
		public проц РисуйПрям(Точка pt, Размер sz)
		{
			РисуйПрям(pt.X, pt.Y, sz.Ширина, sz.Высота);
		} 

		public проц РисуйПрям(Прямоугольник прям)
		{
			wxDC_DrawRectangle(шхобъ, прям.X, прям.Y, прям.Ширина, прям.Высота);
		}

		//---------------------------------------------------------------------

		public проц РисуйТекст(ткст текст, цел x, цел y)
		{
			wxDC_DrawText(шхобъ, текст, x, y);
		}

		public проц РисуйТекст(ткст текст, Точка поз)
		{
			wxDC_DrawText(шхобъ, текст, поз.X, поз.Y);
		}
		
		//---------------------------------------------------------------------

		public проц РисуйОкруглыйПрям(цел x, цел y, цел ширина, цел высота, дво radius)
		{
			wxDC_DrawRoundedRectangle(шхобъ, x, y, ширина, высота, radius);
		}
		
		public проц РисуйОкруглыйПрям(Точка pt, Размер sz, дво radius)
		{
			РисуйОкруглыйПрям(pt.X, pt.Y, sz.Ширина, sz.Высота, radius);
		}
		
		public проц РисуйОкруглыйПрям(Прямоугольник к, дво radius)
		{
			РисуйОкруглыйПрям(к.X, к.Y, к.Ширина, к.Высота, radius);
		}

		//---------------------------------------------------------------------

		public проц перо(Перо значение) { wxDC_SetPen(шхобъ, значение.шхобъ); }
		public Перо перо() { return cast(Перо)FindObject(wxDC_GetPen(шхобъ), &Перо.Нов); }

		//---------------------------------------------------------------------

		public Цвет ППланТекста() { return cast(Цвет)FindObject(wxDC_GetTextForeground(шхобъ), &Цвет.Нов); }
		public проц ППланТекста(Цвет значение) { wxDC_SetTextForeground(шхобъ, wxObject.SafePtr(значение)); }

		public Цвет ЗПланТекста() { return cast(Цвет)FindObject(wxDC_GetTextBackground(шхобъ), &Цвет.Нов); }
		public проц ЗПланТекста(Цвет значение) { wxDC_SetTextBackground(шхобъ, wxObject.SafePtr(значение)); }

		//---------------------------------------------------------------------

		public Шрифт шрифт() { return cast(Шрифт)FindObject(wxDC_GetFont(шхобъ), &Шрифт.Нов); }
		public проц шрифт(Шрифт значение) { wxDC_SetFont(шхобъ, wxObject.SafePtr(значение)); }
		
		//---------------------------------------------------------------------

		public /+virtual+/ проц Очисть()
		{
			wxDC_Clear(шхобъ);
		}

		//---------------------------------------------------------------------

		public проц GetTextExtent(ткст str, out цел x, out цел y)
		{ 
			// Ignoring these parameters
			цел descent;
			цел externalLeading;

			GetTextExtent(str, x, y, descent, externalLeading, пусто); 
		}

		public проц GetTextExtent(ткст str, out цел x, out цел y, out цел descent, out цел externalLeading, Шрифт theFont)
		{
			wxDC_GetTextExtent(шхобъ, str, x, y, descent, externalLeading, wxObject.SafePtr(theFont));
		}

		//---------------------------------------------------------------------

		public проц DestroyClippingRegion()
		{
			wxDC_DestroyClippingRegion(шхобъ);
		}

		//---------------------------------------------------------------------

		public проц SetClippingRegion(цел x, цел y, цел ширина, цел высота)
		{
			wxDC_SetClippingRegion(шхобъ, x, y, ширина, высота);
		}

		public проц SetClippingRegion(Точка поз, Размер size)
		{
			wxDC_SetClippingRegionPos(шхобъ, поз, size);
		}

		public проц SetClippingRegion(Прямоугольник прям)
		{
			wxDC_SetClippingRegionRect(шхобъ, прям);
		}

		public проц SetClippingRegion(Region reg)
		{
			wxDC_SetClippingRegionReg(шхобъ, wxObject.SafePtr(reg));
		}

		//---------------------------------------------------------------------

		public Logic LogicalFunction() { return cast(Logic)wxDC_GetLogicalFunction(шхобъ); }
		public проц LogicalFunction(Logic значение) { wxDC_SetLogicalFunction(шхобъ, cast(цел)значение); }

		//---------------------------------------------------------------------

		public проц BeginDrawing()
		{
			wxDC_BeginDrawing(шхобъ);
		}

		//---------------------------------------------------------------------

		public бул Blit(цел xdest, цел ydest, цел ширина, цел высота, DC source, цел xsrc, цел ysrc, цел rop, бул useMask, цел xsrcMask, цел ysrcMask)
		{
			return wxDC_Blit(шхобъ, xdest, ydest, ширина, высота, wxObject.SafePtr(source), xsrc, ysrc, rop, useMask, xsrcMask, ysrcMask);
		}
		
		public бул Blit(цел xdest, цел ydest, цел ширина, цел высота, DC source) 
		{ 
			return Blit(xdest, ydest, ширина, высота, source, 0, 0, cast(цел) Logic.wxCOPY, нет, -1, -1); 
		}
		
		public бул Blit(цел xdest, цел ydest, цел ширина, цел высота, DC source, цел xsrc, цел ysrc)
		{
			return Blit(xdest, ydest, ширина, высота, source, xsrc, ysrc, cast(цел)Logic.wxCOPY, нет, -1, -1);
		}
		
		public бул Blit(цел xdest, цел ydest, цел ширина, цел высота, DC source, цел xsrc, цел ysrc, цел rop)
		{
			return Blit(xdest, ydest, ширина, высота, source, xsrc, ysrc, rop, нет, -1, -1);
		}
		
		public бул Blit(цел xdest, цел ydest, цел ширина, цел высота, DC source, цел xsrc, цел ysrc, цел rop, бул useMask)
		{
			return Blit(xdest, ydest, ширина, высота, source, xsrc, ysrc, rop, useMask, -1, -1);
		}
		
		public бул Blit(цел xdest, цел ydest, цел ширина, цел высота, DC source, цел xsrc, цел ysrc, цел rop, бул useMask, цел xsrcMask)
		{
			return Blit(xdest, ydest, ширина, высота, source, xsrc, ysrc, rop, useMask, xsrcMask, -1);
		}
		
		public бул Blit(Точка destPt, Размер sz, DC source, Точка srcPt, цел rop, бул useMask, Точка srcPtMask)
		{
			return Blit(destPt.X, destPt.Y, sz.Ширина, sz.Высота, source, srcPt.X, srcPt.Y, rop, useMask, srcPtMask.X, srcPtMask.Y);
		}
		
		public бул Blit(Точка destPt, Размер sz, DC source, Точка srcPt)
		{
			return Blit(destPt.X, destPt.Y, sz.Ширина, sz.Высота, source, srcPt.X, srcPt.Y, cast(цел)Logic.wxCOPY, нет, -1, -1);
		}
		
		public бул Blit(Точка destPt, Размер sz, DC source, Точка srcPt, цел rop)
		{
			return Blit(destPt.X, destPt.Y, sz.Ширина, sz.Высота, source, srcPt.X, srcPt.Y, rop, нет, -1, -1);
		}
		
		public бул Blit(Точка destPt, Размер sz, DC source, Точка srcPt, цел rop, бул useMask)
		{
			return Blit(destPt.X, destPt.Y, sz.Ширина, sz.Высота, source, srcPt.X, srcPt.Y, rop, useMask, -1, -1);
		}

		//---------------------------------------------------------------------

		public проц EndDrawing()
		{
			wxDC_EndDrawing(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public бул FloodFill(цел x, цел y, Цвет col)
		{
			return FloodFill(x, y, col, FloodStyle.wxFLOOD_SURFACE);
		}
		
		public бул FloodFill(цел x, цел y, Цвет col, цел стиль)
		{
			return wxDC_FloodFill(шхобъ, x, y, wxObject.SafePtr(col), стиль);
		}
		
		public бул FloodFill(Точка pt, Цвет col)
		{
			return FloodFill(pt, col, FloodStyle.wxFLOOD_SURFACE);
		}
		
		public бул FloodFill(Точка pt, Цвет col, цел стиль)
		{
			return FloodFill(pt.X, pt.Y, col, стиль);
		}
		
		//---------------------------------------------------------------------
		
		public бул GetPixel(цел x, цел y, Цвет col)
		{
			return wxDC_GetPixel(шхобъ, x, y, wxObject.SafePtr(col));
		}
		
		public бул GetPixel(Точка pt, Цвет col)
		{
			return GetPixel(pt.X, pt.Y, col);
		}
		
		//---------------------------------------------------------------------
		
		public проц CrossHair(цел x, цел y)
		{
			wxDC_CrossHair(шхобъ, x, y);
		}
		
		public проц CrossHair(Точка pt)
		{
			CrossHair(pt.X, pt.Y);
		}
		
		//---------------------------------------------------------------------
		
		public проц DrawArc(цел x1, цел y1, цел x2, цел y2, цел xc, цел yc)
		{
			wxDC_DrawArc(шхобъ, x1, y1, x2, y2, xc, yc);
		}
		
		public проц DrawArc(Точка pt1, Точка pt2, Точка centre)
		{
			DrawArc(pt1.X, pt1.Y, pt2.X, pt2.Y, centre.X, centre.Y);
		}
		
		//---------------------------------------------------------------------
		
		public проц DrawCheckMark(цел x, цел y, цел ширина, цел высота)
		{
			wxDC_DrawCheckMark(шхобъ, x, y, ширина, высота);
		}
		
		public проц DrawCheckMark(Прямоугольник прям)
		{
			DrawCheckMark(прям.X, прям.Y, прям.Ширина, прям.Высота);
		}
		
		//---------------------------------------------------------------------
		
		public проц DrawEllipticArc(цел x, цел y, цел w, цел h, дво sa, дво ea)
		{
			wxDC_DrawEllipticArc(шхобъ, x, y, w, h, sa, ea);
		}
		
		public проц DrawEllipticArc(Точка pt, Размер sz, дво sa, дво ea)
		{
			DrawEllipticArc(pt.X, pt.Y, sz.Ширина, sz.Высота, sa, ea);
		}
		
		//---------------------------------------------------------------------
		
		public проц DrawLines(Точка[] points, цел xoffset, цел yoffset)
		{
			wxDC_DrawLines(шхобъ, points.length, points.ptr, xoffset, yoffset);
		}
		
		public проц DrawLines(Точка[] points)
		{
			DrawLines(points, 0, 0);
		}
		
		public проц DrawLines(Точка[] points, цел xoffset)
		{
			DrawLines(points, xoffset, 0);
		}
		
		//---------------------------------------------------------------------
		
		public проц DrawCircle(цел x, цел y, цел radius)
		{
			wxDC_DrawCircle(шхобъ, x, y, radius);
		}
		
		public проц DrawCircle(Точка pt, цел radius)
		{
			DrawCircle(pt.X, pt.Y, radius);
		}
		
		//---------------------------------------------------------------------
		
		public проц DrawIcon(Icon иконка, цел x, цел y)
		{
			wxDC_DrawIcon(шхобъ, wxObject.SafePtr(иконка), x, y);
		}
		
		public проц DrawIcon(Icon иконка, Точка pt)
		{
			DrawIcon(иконка, pt.X, pt.Y);
		}
		
		//---------------------------------------------------------------------
		
		public проц DrawRotatedText(ткст текст, цел x, цел y, дво угол)
		{
			wxDC_DrawRotatedText(шхобъ, текст, x, y, угол);
		}
		
		public проц DrawRotatedText(ткст текст, Точка pt, дво угол)
		{
			DrawRotatedText(текст, pt.X, pt.Y, угол);
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ проц DrawLabel(ткст текст, Битмап рисунок, Прямоугольник прям, цел alignment, цел indexAccel, inout Прямоугольник rectBounding)
		{
			wxDC_DrawLabel(шхобъ, текст, wxObject.SafePtr(рисунок), прям, alignment, indexAccel, rectBounding);
		}
		
		public /+virtual+/ проц DrawLabel(ткст текст, Битмап рисунок, Прямоугольник прям)
		{
			Прямоугольник dummy;
			DrawLabel(текст, рисунок, прям, cast(цел)(Alignment.wxALIGN_LEFT | Alignment.wxALIGN_TOP), -1, dummy);
		}
		
		public /+virtual+/ проц DrawLabel(ткст текст, Битмап рисунок, Прямоугольник прям, цел alignment)
		{
			Прямоугольник dummy;
			DrawLabel(текст, рисунок, прям, alignment, -1, dummy);
		}
		
		public /+virtual+/ проц DrawLabel(ткст текст, Битмап рисунок, Прямоугольник прям, цел alignment, цел indexAccel)
		{
			Прямоугольник dummy;
			DrawLabel(текст, рисунок, прям, alignment, indexAccel, dummy);
		}
		
		//---------------------------------------------------------------------
		
		public проц DrawLabel(ткст текст, Прямоугольник прям, цел alignment, цел indexAccel)
		{
			wxDC_DrawLabel2(шхобъ, текст, прям, alignment, indexAccel);
		}
		
		public проц DrawLabel(ткст текст, Прямоугольник прям)
		{
			DrawLabel(текст, прям, cast(цел)(Alignment.wxALIGN_LEFT | Alignment.wxALIGN_TOP), -1);
		}
		
		public проц DrawLabel(ткст текст, Прямоугольник прям, цел alignment)
		{
			DrawLabel(текст, прям, alignment, -1);
		}
		
		//---------------------------------------------------------------------
		
		public проц DrawSpline(цел x1, цел y1, цел x2, цел y2, цел x3, цел y3)
		{
			wxDC_DrawSpline(шхобъ, x1, y1, x2, y2, x3, y3);
		}
		
		public проц DrawSpline(Точка[] points)
		{
			wxDC_DrawSpline2(шхобъ, points.length, points.ptr);
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ бул StartDoc(ткст message)
		{
			return wxDC_StartDoc(шхобъ, message);
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ проц EndDoc()
		{
			wxDC_EndDoc(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ проц StartPage()
		{
			wxDC_StartPage(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ проц EndPage()
		{
			wxDC_EndPage(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public проц GetClippingBox(out цел x, out цел y, out цел w, out цел h)
		{
			wxDC_GetClippingBox(шхобъ, x, y, w, h);
		}
		
		public проц GetClippingBox(out Прямоугольник прям)
		{
			wxDC_GetClippingBox2(шхобъ, прям);
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ проц GetMultiLineTextExtent(ткст текст, out цел ширина, out цел высота, out цел heightline, Шрифт шрифт)
		{
			wxDC_GetMultiLineTextExtent(шхобъ, текст, ширина, высота, heightline, wxObject.SafePtr(шрифт));
		}
		
		public /+virtual+/ проц GetMultiLineTextExtent(ткст текст, out цел ширина, out цел высота)
		{	
			цел heightline;
			
			GetMultiLineTextExtent(текст, ширина, высота, heightline, пусто);
		}
		
		public /+virtual+/ проц GetMultiLineTextExtent(ткст текст, out цел ширина, out цел высота, out цел heightline)
		{	
			GetMultiLineTextExtent(текст, ширина, высота, heightline, пусто);
		}
		
		//---------------------------------------------------------------------
		
		public бул GetPartialTextExtents(ткст текст, цел[] widths)
		{
			МассивЦел ai = new МассивЦел();
			
			for(цел i = 0; i < widths.length; ++i)
				ai.Добавь(widths[i]);
				
			return wxDC_GetPartialTextExtents(шхобъ, текст, МассивЦел.SafePtr(ai));
		}
		
		//---------------------------------------------------------------------
		
		public проц GetSize(out цел ширина, out цел высота)
		{
			wxDC_GetSize(шхобъ, ширина, высота);
		}
		
		public Размер size()
		{ 
			Размер size;
			wxDC_GetSize2(шхобъ, size);
			return size;
		}
		
		//---------------------------------------------------------------------
		
		public проц GetSizeMM(out цел ширина, out цел высота)
		{
			wxDC_GetSizeMM(шхобъ, ширина, высота);
		}
		
		public Размер SizeMM() { 
				Размер size;
				wxDC_GetSizeMM2(шхобъ, size);
				return size;
			}
		
		//---------------------------------------------------------------------
		
		public цел DeviceToLogicalX(цел x)
		{
			return wxDC_DeviceToLogicalX(шхобъ, x);
		}
		
		//---------------------------------------------------------------------
		
		public цел DeviceToLogicalY(цел y)
		{
			return wxDC_DeviceToLogicalY(шхобъ, y);
		}
		
		//---------------------------------------------------------------------
		
		public цел DeviceToLogicalXRel(цел x)
		{
			return wxDC_DeviceToLogicalXRel(шхобъ, x);
		}
		
		//---------------------------------------------------------------------
		
		public цел DeviceToLogicalYRel(цел y)
		{
			return wxDC_DeviceToLogicalYRel(шхобъ, y);
		}
		
		//---------------------------------------------------------------------
		
		public цел LogicalToDeviceX(цел x)
		{
			return wxDC_LogicalToDeviceX(шхобъ, x);
		}
		
		//---------------------------------------------------------------------
		
		public цел LogicalToDeviceY(цел y)
		{
			return wxDC_LogicalToDeviceY(шхобъ, y);
		}
		
		//---------------------------------------------------------------------
		
		public цел LogicalToDeviceXRel(цел x)
		{
			return wxDC_LogicalToDeviceXRel(шхобъ, x);
		}
		
		//---------------------------------------------------------------------
		
		public цел LogicalToDeviceYRel(цел y)
		{
			return wxDC_LogicalToDeviceYRel(шхобъ, y);
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ бул Ок() { return wxDC_Ok(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public цел MapMode() { return wxDC_GetMapMode(шхобъ); }
		public проц MapMode(цел значение) { wxDC_SetMapMode(шхобъ, значение); }
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ проц GetUserScale(out дво x, out дво y)
		{
			wxDC_GetUserScale(шхобъ, x, y);
		}
		
		public /+virtual+/ проц SetUserScale(дво x, дво y)
		{
			wxDC_SetUserScale(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ проц GetLogicalScale(out дво x, out дво y)
		{
			wxDC_GetLogicalScale(шхобъ, x, y);
		}
		
		public /+virtual+/ проц SetLogicalScale(дво x, дво y)
		{
			wxDC_SetLogicalScale(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------
		
		public проц GetLogicalOrigin(out цел x, out цел y)
		{
			wxDC_GetLogicalOrigin(шхобъ, x, y);
		}
		
		public Точка LogicalOrigin()
		{
			Точка pt;
			wxDC_GetLogicalOrigin2(шхобъ, pt);
			return pt;
		}
		
		public проц SetLogicalOrigin(цел x, цел y)
		{
			wxDC_SetLogicalOrigin(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------
		
		public проц GetDeviceOrigin(out цел x, out цел y)
		{
			wxDC_GetDeviceOrigin(шхобъ, x, y);
		}
		
		public Точка DeviceOrigin()
		{
			Точка pt;
			wxDC_GetDeviceOrigin2(шхобъ, pt);
			return pt;
		}
		
		public проц SetDeviceOrigin(цел x, цел y)
		{
			wxDC_SetDeviceOrigin(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------
		
		public проц SetAxisOrientation(бул xLeftRight, бул yBottomUp)
		{
			wxDC_SetAxisOrientation(шхобъ, xLeftRight, yBottomUp);
		}
		
		//---------------------------------------------------------------------
		
		public /+virtual+/ проц CalcBoundingBox(цел x, цел y)
		{
			wxDC_CalcBoundingBox(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------
		
		public проц ResetBoundingBox()
		{
			wxDC_ResetBoundingBox(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public цел MinX() { return wxDC_MinX(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public цел MaxX() { return wxDC_MaxX(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public цел MinY() { return wxDC_MinY(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public цел MaxY() { return wxDC_MaxY(шхобъ); }

		public static wxObject Нов(ЦУк ptr) { return new DC(ptr); }
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		//static extern (C) ЦУк wxWindowDC_ctor();
		static extern (C) ЦУк wxWindowDC_ctor(ЦУк окн);
		static extern (C) бул wxWindowDC_CanDrawBitmap(ЦУк сам);
		static extern (C) бул wxWindowDC_CanGetTextExtent(ЦУк сам);
		static extern (C) цел wxWindowDC_GetCharWidth(ЦУк сам);
		static extern (C) цел wxWindowDC_GetCharHeight(ЦУк сам);
		static extern (C) проц wxWindowDC_Clear(ЦУк сам);
		static extern (C) проц wxWindowDC_SetFont(ЦУк сам, ЦУк шрифт);
		static extern (C) проц wxWindowDC_SetPen(ЦУк сам, ЦУк перо);
		static extern (C) проц wxWindowDC_SetBrush(ЦУк сам, ЦУк кисть);
		static extern (C) проц wxWindowDC_SetBackground(ЦУк сам, ЦУк кисть);
		static extern (C) проц wxWindowDC_SetLogicalFunction(ЦУк сам, цел func);
		static extern (C) проц wxWindowDC_SetTextForeground(ЦУк сам, ЦУк colour);
		static extern (C) проц wxWindowDC_SetTextBackground(ЦУк сам, ЦУк colour);
		static extern (C) проц wxWindowDC_SetBackgroundMode(ЦУк сам, цел mode);
		static extern (C) проц wxWindowDC_SetPalette(ЦУк сам, ЦУк палитра);
		static extern (C) проц wxWindowDC_GetPPI(ЦУк сам, inout Размер size);
		static extern (C) цел wxWindowDC_GetDepth(ЦУк сам);
		//! \endcond
		
		//---------------------------------------------------------------------
	
	alias WindowDC wxWindowDC;
	public class WindowDC : DC
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }
			
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
		
		//public this()
		//	{ this(wxWindowDC_ctor(), да);}
			
		public this(Окно окн)
			{ this(wxWindowDC_ctor(wxObject.SafePtr(окн)), да);}
			
		//---------------------------------------------------------------------
		
		public бул CanDrawBitmap()
		{
			return wxWindowDC_CanDrawBitmap(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public бул CanGetTextExtent()
		{
			return wxWindowDC_CanGetTextExtent(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public цел GetCharWidth()
		{
			return wxWindowDC_GetCharWidth(шхобъ); 
		}
		
		//---------------------------------------------------------------------
		
		public цел GetCharHeight()
		{
			return wxWindowDC_GetCharHeight(шхобъ); 
		}
		
		//---------------------------------------------------------------------
		
		public цел CharHeight() { return wxWindowDC_GetCharHeight(шхобъ); }
		
		//---------------------------------------------------------------------

		public цел CharWidth() { return wxWindowDC_GetCharWidth(шхобъ); }
		
		//---------------------------------------------------------------------
		
		public override проц Очисть()
		{
			wxWindowDC_Clear(шхобъ);
		}
		
		//---------------------------------------------------------------------
		
		public проц SetFont(Шрифт шрифт)
		{
			wxWindowDC_SetFont(шхобъ, wxObject.SafePtr(шрифт));
		}
		
		//---------------------------------------------------------------------
		
		public проц SetPen(Перо перо)
		{
			wxWindowDC_SetPen(шхобъ, wxObject.SafePtr(перо));
		}
		
		//---------------------------------------------------------------------
		
		public проц SetBrush(Кисть кисть)
		{
			wxWindowDC_SetBrush(шхобъ, wxObject.SafePtr(кисть));
		}
		
		//---------------------------------------------------------------------
		
		public проц SetBackground(Кисть кисть)
		{
			wxWindowDC_SetBackground(шхобъ, wxObject.SafePtr(кисть));
		}
		
		//---------------------------------------------------------------------
		
		public проц SetLogicalFunction(цел func)
		{
			wxWindowDC_SetLogicalFunction(шхобъ, func);
		}
		
		//---------------------------------------------------------------------
		
		public проц SetTextForeground(Цвет colour)
		{
			wxWindowDC_SetTextForeground(шхобъ, wxObject.SafePtr(colour));
		}
		
		//---------------------------------------------------------------------
		
		public проц SetTextBackground(Цвет colour)
		{
			wxWindowDC_SetTextBackground(шхобъ, wxObject.SafePtr(colour));
		}
		
		//---------------------------------------------------------------------
		
		public проц SetBackgroundMode(цел mode)	
		{
			wxWindowDC_SetBackgroundMode(шхобъ, mode);
		}
		
		//---------------------------------------------------------------------
		
		public проц SetPalette(Палитра палитра)
		{
			wxWindowDC_SetPalette(шхобъ, wxObject.SafePtr(палитра));
		}
		
		//---------------------------------------------------------------------
		
		public Размер GetPPI()
		{
			Размер sz;
			wxWindowDC_GetPPI(шхобъ, sz);
			return sz;
		}
		
		//---------------------------------------------------------------------
		
		public цел GetDepth()
		{
			return wxWindowDC_GetDepth(шхобъ);
		}
	}
	
		//---------------------------------------------------------------------

		//! \cond EXTERN
		//static extern (C) ЦУк wxClientDC_ctor();
		static extern (C) ЦУк wxClientDC_ctor(ЦУк окно);
		//! \endcond

		//---------------------------------------------------------------------
		
	alias ClientDC wxClientDC;
	public class ClientDC : WindowDC
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }
			
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
			
	//	public this()
		//	{ this(wxClientDC_ctor(), да);}

		public this(Окно окно)
			{ this(wxClientDC_ctor(wxObject.SafePtr(окно)), да); }
	}
    
	//---------------------------------------------------------------------

		//! \cond EXTERN
		//static extern (C) ЦУк wxPaintDC_ctor();
		static extern (C) ЦУк wxPaintDC_ctor(ЦУк окно);
		//! \endcond

		//---------------------------------------------------------------------

	alias PaintDC wxPaintDC;
	public class PaintDC : WindowDC
	{
		public this(ЦУк шхобъ) 
			{ super(шхобъ); }
			
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
			
	//	public this()
			//{ this(wxPaintDC_ctor(), да); }
			
		public this(Окно окно)
			{ this(wxPaintDC_ctor(wxObject.SafePtr(окно)), да); }
	}
