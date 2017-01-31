//-----------------------------------------------------------------------------
// wxD - HTML.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - HTML.cs
//
/// The wxHTML wrapper classes.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: HTML.d,v 1.14 2009/01/16 14:06:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.HTML;
public import wx.common;
public import wx.ScrolledWindow;
public import wx.Frame;
public import wx.Config;
public import wx.PrintData;
public import wx.MouseEvent;

//version(LDC) { pragma(ldc, "verbose") }

//class HtmlContainerCell;
//class HtmlFilter;
//class HtmlTag;

	public enum HtmlURLType
	{
		wxHTML_URL_PAGE,
		wxHTML_URL_IMAGE,
		wxHTML_URL_OTHER
	}
	
	//-----------------------------------------------------------------------------
	
	public enum HtmlOpeningStatus
	{
		wxHTML_OPEN,
		wxHTML_BLOCK,
		wxHTML_REDIRECT
	}
	
	//-----------------------------------------------------------------------------

		//! \cond EXTERN
        static extern (C) ЦУк wxHtmlTag_GetParent(ЦУк сам);
        static extern (C) ЦУк wxHtmlTag_GetFirstSibling(ЦУк сам);
        static extern (C) ЦУк wxHtmlTag_GetLastSibling(ЦУк сам);
        static extern (C) ЦУк wxHtmlTag_GetChildren(ЦУк сам);
        static extern (C) ЦУк wxHtmlTag_GetPreviousSibling(ЦУк сам);
        static extern (C) ЦУк wxHtmlTag_GetNextSibling(ЦУк сам);
        static extern (C) ЦУк wxHtmlTag_GetNextTag(ЦУк сам);
        static extern (C) ЦУк wxHtmlTag_GetName(ЦУк сам);
        static extern (C) бул   wxHtmlTag_HasParam(ЦУк сам, ткст par);
        static extern (C) ЦУк wxHtmlTag_GetParam(ЦУк сам, ткст par, бул with_commas);
        static extern (C) бул   wxHtmlTag_GetParamAsColour(ЦУк сам, ткст par, ЦУк clr);
        static extern (C) бул   wxHtmlTag_GetParamAsInt(ЦУк сам, ткст par, inout цел clr);
        static extern (C) цел    wxHtmlTag_ScanParam(ЦУк сам, ткст par, ткст format, ЦУк param);
        static extern (C) ЦУк wxHtmlTag_GetAllParams(ЦУк сам);
        static extern (C) бул   wxHtmlTag_IsEnding(ЦУк сам);
        static extern (C) бул   wxHtmlTag_HasEnding(ЦУк сам);
        static extern (C) цел    wxHtmlTag_GetBeginPos(ЦУк сам);
        static extern (C) цел    wxHtmlTag_GetEndPos1(ЦУк сам);
        static extern (C) цел    wxHtmlTag_GetEndPos2(ЦУк сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlTag wxHtmlTag;
    public class HtmlTag : wxObject
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

	public static wxObject Нов(ЦУк ptr) { return new HtmlTag(ptr); }
        //-----------------------------------------------------------------------------
	private static HtmlTag FindObj(ЦУк ptr) { return cast(HtmlTag)FindObject(ptr, &HtmlTag.Нов); }

        public HtmlTag Parent() { return HtmlTag.FindObj(wxHtmlTag_GetParent(шхобъ)); }

        public HtmlTag FirstSibling() { return HtmlTag.FindObj(wxHtmlTag_GetFirstSibling(шхобъ)); }

        public HtmlTag LastSibling() { return HtmlTag.FindObj(wxHtmlTag_GetLastSibling(шхобъ)); }

        public HtmlTag Children() { return HtmlTag.FindObj(wxHtmlTag_GetChildren(шхобъ)); }

        //-----------------------------------------------------------------------------

        public HtmlTag PreviousSibling() { return HtmlTag.FindObj(wxHtmlTag_GetPreviousSibling(шхобъ)); }

        public HtmlTag NextSibling() { return HtmlTag.FindObj(wxHtmlTag_GetNextSibling(шхобъ)); }

        //-----------------------------------------------------------------------------

        public HtmlTag NextTag() { return HtmlTag.FindObj(wxHtmlTag_GetNextTag(шхобъ)); }

        //-----------------------------------------------------------------------------

        public ткст Имя() { return cast(ткст) new wxString(wxHtmlTag_GetName(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public бул HasParam(ткст par)
        {
            return wxHtmlTag_HasParam(шхобъ, par);
        }

        public ткст GetParam(ткст par, бул with_commas)
        {
            return cast(ткст) new wxString(wxHtmlTag_GetParam(шхобъ, par, with_commas), да);
        }

        //-----------------------------------------------------------------------------

        public бул GetParamAsColour(ткст par, Цвет clr)
        {
            return wxHtmlTag_GetParamAsColour(шхобъ, par, wxObject.SafePtr(clr));
        }

        //-----------------------------------------------------------------------------

        public бул GetParamAsInt(ткст par, out цел clr)
        {
            clr = 0;
            return wxHtmlTag_GetParamAsInt(шхобъ, par, clr);
        }

        //-----------------------------------------------------------------------------

        public цел ScanParam(ткст par, ткст format, wxObject param)
        {
            return wxHtmlTag_ScanParam(шхобъ, par, format, wxObject.SafePtr(param));
        }

        //-----------------------------------------------------------------------------

        public ткст AllParams() { return cast(ткст) new wxString(wxHtmlTag_GetAllParams(шхобъ), да); }

        //-----------------------------------------------------------------------------

        /* public бул IsEnding() { return wxHtmlTag_IsEnding(шхобъ); } */

        public бул HasEnding() { return wxHtmlTag_HasEnding(шхобъ); }

        //-----------------------------------------------------------------------------

        public цел BeginPos() { return wxHtmlTag_GetBeginPos(шхобъ); }

        public цел EndPos1() { return wxHtmlTag_GetEndPos1(шхобъ); }

        public цел EndPos2() { return wxHtmlTag_GetEndPos2(шхобъ); }

        //-----------------------------------------------------------------------------
/+
        public static implicit operator HtmlTag (ЦУк объ) 
        {
            return cast(HtmlTag)FindObject(объ, &HtmlTag.Нов);
        }
+/
    }

    public abstract class HtmlFilter : wxObject
    {
        // TODO

        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        /*public abstract бул Читается(FSFile file);
        public abstract ткст ReadFile(FSFile file);*/
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) ЦУк wxHtmlCell_ctor();
        static extern (C) проц   wxHtmlCell_SetParent(ЦУк сам, ЦУк p);
        static extern (C) ЦУк wxHtmlCell_GetParent(ЦУк сам);
        static extern (C) цел    wxHtmlCell_GetPosX(ЦУк сам);
        static extern (C) цел    wxHtmlCell_GetPosY(ЦУк сам);
        static extern (C) цел    wxHtmlCell_GetWidth(ЦУк сам);
        static extern (C) цел    wxHtmlCell_GetHeight(ЦУк сам);
        static extern (C) цел    wxHtmlCell_GetDescent(ЦУк сам);
        static extern (C) ЦУк wxHtmlCell_GetId(ЦУк сам);
        static extern (C) проц   wxHtmlCell_SetId(ЦУк сам, ткст ид);
        static extern (C) ЦУк wxHtmlCell_GetNext(ЦУк сам);
        static extern (C) проц   wxHtmlCell_SetPos(ЦУк сам, цел x, цел y);
        static extern (C) проц   wxHtmlCell_SetLink(ЦУк сам, ЦУк link);
        static extern (C) проц   wxHtmlCell_SetNext(ЦУк сам, ЦУк cell);
        static extern (C) проц   wxHtmlCell_Layout(ЦУк сам, цел w);
        static extern (C) проц   wxHtmlCell_Draw(ЦУк сам, ЦУк dc, цел x, цел y, цел view_y1, цел view_y2, ЦУк info);
        static extern (C) проц   wxHtmlCell_DrawInvisible(ЦУк сам, ЦУк dc, цел x, цел y, ЦУк info);
        static extern (C) ЦУк wxHtmlCell_Find(ЦУк сам, цел condition, ЦУк param);
        //static extern (C) проц   wxHtmlCell_OnMouseClick(ЦУк сам, ЦУк родитель, цел x, цел y, ЦУк evt);
        static extern (C) бул   wxHtmlCell_AdjustPagebreak(ЦУк сам, inout цел pagebreak);
        static extern (C) проц   wxHtmlCell_SetCanLiveOnPagebreak(ЦУк сам, бул can);
        static extern (C) проц   wxHtmlCell_GetHorizontalConstraints(ЦУк сам, inout цел left, inout цел right);
        static extern (C) бул   wxHtmlCell_IsTerminalCell(ЦУк сам);
        static extern (C) ЦУк wxHtmlCell_FindCellByPos(ЦУк сам, цел x, цел y);
        //! \endcond

    alias HtmlCell wxHtmlCell;
    public class HtmlCell : wxObject
    {
        //-----------------------------------------------------------------------------

        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        public this()
            { super(wxHtmlCell_ctor()); }

	public static wxObject Нов(ЦУк ptr) { return new HtmlCell(ptr); }
	public static HtmlCell FindObj(ЦУк ptr) { return cast(HtmlCell)FindObject(ptr, &HtmlCell.Нов); }
	
        //-----------------------------------------------------------------------------

        public проц Parent(HtmlContainerCell значение) { wxHtmlCell_SetParent(шхобъ, wxObject.SafePtr(значение)); }
        public HtmlContainerCell Parent() { return cast(HtmlContainerCell)FindObject(wxHtmlCell_GetParent(шхобъ), &HtmlContainerCell.Нов); }

        //-----------------------------------------------------------------------------

        public цел X() { return wxHtmlCell_GetPosX(шхобъ); }

        public цел Y() { return wxHtmlCell_GetPosY(шхобъ); }

        public цел Ширина() { return wxHtmlCell_GetWidth(шхобъ); }

        public цел Высота() { return wxHtmlCell_GetHeight(шхобъ); }

	/* helper */
	public цел PosX() { return X; }
	public цел PosY() { return Y; }

	public Точка Положение() { return Точка(X,Y); }
	public проц  Положение(Точка pt) { SetPos(pt.X,pt.Y); }

	public Размер size() { return Размер(Ширина,Высота); }

	public Прямоугольник прям() { return Прямоугольник(X,Y,Ширина,Высота); }

        //-----------------------------------------------------------------------------

        public цел Descent() { return wxHtmlCell_GetDescent(шхобъ); }

        //-----------------------------------------------------------------------------

        public /+virtual+/ ткст Ид() { return cast(ткст) new wxString(wxHtmlCell_GetId(шхобъ), да); }
        public /+virtual+/ проц Ид(ткст значение) { wxHtmlCell_SetId(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public HtmlCell Next() { return cast(HtmlCell)FindObject(wxHtmlCell_GetNext(шхобъ), &HtmlCell.Нов); }
        public проц Next(HtmlCell значение) { wxHtmlCell_SetNext(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public проц SetPos(цел x, цел y)
        {
            wxHtmlCell_SetPos(шхобъ, x, y);
        }

        //-----------------------------------------------------------------------------

        public проц Link(HtmlLinkInfo значение) { wxHtmlCell_SetLink(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public /+virtual+/ проц Layout(цел w)
        {
            wxHtmlCell_Layout(шхобъ, w);
        }

        //-----------------------------------------------------------------------------

        public /+virtual+/ проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info)
        {
            wxHtmlCell_Draw(шхобъ, wxObject.SafePtr(dc), x, y, view_y1, view_y2, wxObject.SafePtr(info));
        }

        //-----------------------------------------------------------------------------

        public /+virtual+/ проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info)
        {
            wxHtmlCell_DrawInvisible(шхобъ, wxObject.SafePtr(dc), x, y, wxObject.SafePtr(info));
        }

        //-----------------------------------------------------------------------------

        public /+virtual+/ HtmlCell Find(цел condition, wxObject param)
        {
            return cast(HtmlCell)FindObject(wxHtmlCell_Find(шхобъ, condition, wxObject.SafePtr(param)), &HtmlCell.Нов);
        }

        //-----------------------------------------------------------------------------
/+
        public /+virtual+/ проц OnMouseClick(Окно родитель, цел x, цел y, MouseEvent evt)
        {
            wxHtmlCell_OnMouseClick(шхобъ, wxObject.SafePtr(родитель), x, y, wxObject.SafePtr(evt));
        }
+/
        //-----------------------------------------------------------------------------

        public /+virtual+/ бул AdjustPagebreak(inout цел pagebreak)
        {
            return wxHtmlCell_AdjustPagebreak(шхобъ, pagebreak);
        }

        //-----------------------------------------------------------------------------

        public проц CanLiveOnPagebreak(бул значение) { wxHtmlCell_SetCanLiveOnPagebreak(шхобъ, значение); }

        //-----------------------------------------------------------------------------
/*
        public проц GetHorizontalConstraints(out цел left, out цел right)
        {
            left = right = 0;
            wxHtmlCell_GetHorizontalConstraints(шхобъ, left, right);
        }
*/
        //-----------------------------------------------------------------------------

        public /+virtual+/ бул IsTerminalCell() { return wxHtmlCell_IsTerminalCell(шхобъ); }

        //-----------------------------------------------------------------------------

        public HtmlCell FindCellByPos(цел x, цел y)
        {
            return cast(HtmlCell)FindObject(wxHtmlCell_FindCellByPos(шхобъ, x, y), &HtmlCell.Нов);
        }

        //-----------------------------------------------------------------------------
/+
        public static implicit operator HtmlCell (ЦУк объ) 
        {
            return cast(HtmlCell)FindObject(объ, &HtmlCell.Нов);
        }
+/
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
		static extern (C) ЦУк wxHtmlFontCell_ctor(ЦУк шрифт);
		static extern (C) проц   wxHtmlFontCell_Draw(ЦУк сам, ЦУк dc, цел x, цел y, цел view_y1, цел view_y2, ЦУк info);
		static extern (C) проц   wxHtmlFontCell_DrawInvisible(ЦУк сам, ЦУк dc, цел x, цел y, ЦУк info);
        //! \endcond

	alias HtmlFontCell wxHtmlFontCell;
	public class HtmlFontCell : HtmlCell
	{
		//-----------------------------------------------------------------------------

		public this(ЦУк шхобъ)
			{ super(шхобъ);}

		public this(Шрифт шрифт)
			{ this(wxHtmlFontCell_ctor(wxObject.SafePtr(шрифт))); }

		//-----------------------------------------------------------------------------

		public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info)
		{
			wxHtmlFontCell_Draw(шхобъ, wxObject.SafePtr(dc), x, y, view_y1, view_y2, wxObject.SafePtr(info));
		}
		
		//-----------------------------------------------------------------------------
		
		public override проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info)
		{
			wxHtmlFontCell_DrawInvisible(шхобъ, wxObject.SafePtr(dc), x, y, wxObject.SafePtr(info));
		}
	}

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) ЦУк wxHtmlContainerCell_ctor(ЦУк родитель);
        static extern (C) проц   wxHtmlContainerCell_Layout(ЦУк сам, цел w);
        static extern (C) проц   wxHtmlContainerCell_Draw(ЦУк сам, ЦУк dc, цел x, цел y, цел view_y1, цел view_y2, ЦУк info);
        static extern (C) проц   wxHtmlContainerCell_DrawInvisible(ЦУк сам, ЦУк dc, цел x, цел y, ЦУк info);
        static extern (C) бул   wxHtmlContainerCell_AdjustPagebreak(ЦУк сам, inout цел pagebreak);
        static extern (C) проц   wxHtmlContainerCell_InsertCell(ЦУк сам, ЦУк cell);
        static extern (C) проц   wxHtmlContainerCell_SetAlignHor(ЦУк сам, цел al);
        static extern (C) цел    wxHtmlContainerCell_GetAlignHor(ЦУк сам);
        static extern (C) проц   wxHtmlContainerCell_SetAlignVer(ЦУк сам, цел al);
        static extern (C) цел    wxHtmlContainerCell_GetAlignVer(ЦУк сам);
        static extern (C) проц   wxHtmlContainerCell_SetIndent(ЦУк сам, цел i, цел what, цел units);
        static extern (C) цел    wxHtmlContainerCell_GetIndent(ЦУк сам, цел ind);
        static extern (C) цел    wxHtmlContainerCell_GetIndentUnits(ЦУк сам, цел ind);
        static extern (C) проц   wxHtmlContainerCell_SetAlign(ЦУк сам, ЦУк tag);
        static extern (C) проц   wxHtmlContainerCell_SetWidthFloat(ЦУк сам, цел w, цел units);
        static extern (C) проц   wxHtmlContainerCell_SetWidthFloatTag(ЦУк сам, ЦУк tag, дво pixel_scale);
        static extern (C) проц   wxHtmlContainerCell_SetMinHeight(ЦУк сам, цел h, цел alignment);
        static extern (C) проц   wxHtmlContainerCell_SetBackgroundColour(ЦУк сам, ЦУк clr);
        static extern (C) ЦУк wxHtmlContainerCell_GetBackgroundColour(ЦУк сам);
        static extern (C) проц   wxHtmlContainerCell_SetBorder(ЦУк сам, ЦУк clr1, ЦУк clr2);
        static extern (C) ЦУк wxHtmlContainerCell_GetLink(ЦУк сам, цел x, цел y);
        static extern (C) ЦУк wxHtmlContainerCell_Find(ЦУк сам, цел condition, ЦУк param);
      //  static extern (C) проц   wxHtmlContainerCell_OnMouseClick(ЦУк сам, ЦУк родитель, цел x, цел y, ЦУк evt);
        static extern (C) проц   wxHtmlContainerCell_GetHorizontalConstraints(ЦУк сам, inout цел left, inout цел right);
        static extern (C) ЦУк wxHtmlContainerCell_GetFirstCell(ЦУк сам);
        static extern (C) бул   wxHtmlContainerCell_IsTerminalCell(ЦУк сам);
        static extern (C) ЦУк wxHtmlContainerCell_FindCellByPos(ЦУк сам, цел x, цел y);
        //! \endcond

    alias HtmlContainerCell wxHtmlContainerCell;
    public class HtmlContainerCell : HtmlCell
    {
        //-----------------------------------------------------------------------------

        public this(ЦУк шхобъ)
            { super(шхобъ); }

        public this(HtmlContainerCell родитель)
            { this(wxHtmlContainerCell_ctor(wxObject.SafePtr(родитель))); }

	public static wxObject Нов(ЦУк ptr) { return new HtmlContainerCell(ptr); }

        //-----------------------------------------------------------------------------

        public override проц Layout(цел w)
        {
            wxHtmlContainerCell_Layout(шхобъ, w);
        }

        //-----------------------------------------------------------------------------

        public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info)
        {
            wxHtmlContainerCell_Draw(шхобъ, wxObject.SafePtr(dc), x, y, view_y1, view_y2, wxObject.SafePtr(info));
        }

        //-----------------------------------------------------------------------------

        public override проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info)
        {
            wxHtmlContainerCell_DrawInvisible(шхобъ, wxObject.SafePtr(dc), x, y, wxObject.SafePtr(info));
        }

        //-----------------------------------------------------------------------------

        public override бул AdjustPagebreak(inout цел pagebreak)
        {
            return wxHtmlContainerCell_AdjustPagebreak(шхобъ, pagebreak);
        }

        //-----------------------------------------------------------------------------

        public проц InsertCell(HtmlCell cell)
        {
            wxHtmlContainerCell_InsertCell(шхобъ, wxObject.SafePtr(cell));
        }

        //-----------------------------------------------------------------------------

        public проц AlignHor(цел значение) { wxHtmlContainerCell_SetAlignHor(шхобъ, значение); }
        public цел AlignHor() { return wxHtmlContainerCell_GetAlignHor(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц AlignVer(цел значение) { wxHtmlContainerCell_SetAlignVer(шхобъ, значение); }
        public цел AlignVer() { return wxHtmlContainerCell_GetAlignVer(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц SetIndent(цел i, цел what, цел units)
        {
            wxHtmlContainerCell_SetIndent(шхобъ, i, what, units);
        }

        public цел GetIndent(цел ind)
        {
            return wxHtmlContainerCell_GetIndent(шхобъ, ind);
        }

        public цел GetIndentUnits(цел ind)
        {
            return wxHtmlContainerCell_GetIndentUnits(шхобъ, ind);
        }

        //-----------------------------------------------------------------------------

        public проц Align(HtmlTag значение) { wxHtmlContainerCell_SetAlign(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public проц SetWidthFloat(цел w, цел units)
        {
            wxHtmlContainerCell_SetWidthFloat(шхобъ, w, units);
        }

        public проц SetWidthFloat(HtmlTag tag, дво pixel_scale)
        {
            wxHtmlContainerCell_SetWidthFloatTag(шхобъ, wxObject.SafePtr(tag), pixel_scale);
        }

        //-----------------------------------------------------------------------------

        public проц SetMinHeight(цел h, цел alignment)
        {
            wxHtmlContainerCell_SetMinHeight(шхобъ, h, alignment);
        }

        //-----------------------------------------------------------------------------

        public проц ЦветЗП(Цвет значение) { wxHtmlContainerCell_SetBackgroundColour(шхобъ, wxObject.SafePtr(значение)); }
        public Цвет ЦветЗП() { return new Цвет(wxHtmlContainerCell_GetBackgroundColour(шхобъ), да); }

        //-----------------------------------------------------------------------------

        public проц SetBorder(Цвет clr1, Цвет clr2)
        {
            wxHtmlContainerCell_SetBorder(шхобъ, wxObject.SafePtr(clr1), wxObject.SafePtr(clr2));
        }

        //-----------------------------------------------------------------------------

        public /+virtual+/ HtmlLinkInfo GetLink(цел x, цел y)
        {
            return cast(HtmlLinkInfo)FindObject(wxHtmlContainerCell_GetLink(шхобъ, x, y), &HtmlLinkInfo.Нов);
        }

        //-----------------------------------------------------------------------------

        public override HtmlCell Find(цел condition, wxObject param)
        {
//            return cast(HtmlCell)FindObject(wxHtmlContainerCell_Find(шхобъ, condition, wxObject.SafePtr(param)), &HtmlCell.Нов);
            return HtmlCell.FindObj(wxHtmlContainerCell_Find(шхобъ, condition, wxObject.SafePtr(param)));
        }

        //-----------------------------------------------------------------------------
/+
        public override проц OnMouseClick(Окно родитель, цел x, цел y, MouseEvent evt)
        {
            wxHtmlContainerCell_OnMouseClick(шхобъ, wxObject.SafePtr(родитель), x, y, wxObject.SafePtr(evt));
        }
+/
        //-----------------------------------------------------------------------------
/*
        public проц GetHorizontalConstraints(out цел left, out цел right)
        {
            left = right = 0;
            wxHtmlContainerCell_GetHorizontalConstraints(шхобъ, left, right);
        }
*/
        //-----------------------------------------------------------------------------
/*
        public HtmlCell FirstCell() { return HtmlCell.FindObj(wxHtmlContainerCell_GetFirstCell(шхобъ)); }
*/
        //-----------------------------------------------------------------------------

        public override бул IsTerminalCell() { return wxHtmlContainerCell_IsTerminalCell(шхобъ); }

        //-----------------------------------------------------------------------------

        public override HtmlCell FindCellByPos(цел x, цел y)
        {
            return HtmlCell.FindObj(wxHtmlContainerCell_FindCellByPos(шхобъ, x, y));
        }
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
		static extern (C) ЦУк wxHtmlColourCell_ctor(ЦУк clr, цел флаги);
		static extern (C) проц   wxHtmlColourCell_Draw(ЦУк сам, ЦУк dc, цел x, цел y, цел view_y1, цел view_y2, ЦУк info);
		static extern (C) проц   wxHtmlColourCell_DrawInvisible(ЦУк сам, ЦУк dc, цел x, цел y, ЦУк info);
        //! \endcond

	alias HtmlColourCell wxHtmlColourCell;
	public class HtmlColourCell : HtmlCell
	{
		//-----------------------------------------------------------------------------

		public this(ЦУк шхобъ)
			{ super(шхобъ);}

		public  this(Цвет clr, цел флаги)
			{ this(wxHtmlColourCell_ctor(wxObject.SafePtr(clr), флаги)); }

		//-----------------------------------------------------------------------------

		public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info)
		{
			wxHtmlColourCell_Draw(шхобъ, wxObject.SafePtr(dc), x, y, view_y1, view_y2, wxObject.SafePtr(info));
		}

		//-----------------------------------------------------------------------------

		public override проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info)
		{
			wxHtmlColourCell_DrawInvisible(шхобъ, wxObject.SafePtr(dc), x, y, wxObject.SafePtr(info));
		}
	}

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
		static extern (C) ЦУк wxHtmlLinkInfo_ctor();
		/*static extern (C) ЦУк wxHtmlLinkInfo_ctor(ткст href, ткст target);*/
		/*static extern (C) ЦУк wxHtmlLinkInfo_ctor(ЦУк l);*/
		static extern (C) проц   wxHtmlLinkInfo_SetEvent(ЦУк сам, ЦУк e);
		static extern (C) проц   wxHtmlLinkInfo_SetHtmlCell(ЦУк сам, ЦУк e);
		static extern (C) ЦУк wxHtmlLinkInfo_GetHref(ЦУк сам);
		static extern (C) ЦУк wxHtmlLinkInfo_GetTarget(ЦУк сам);
		static extern (C) ЦУк wxHtmlLinkInfo_GetEvent(ЦУк сам);
		static extern (C) ЦУк wxHtmlLinkInfo_GetHtmlCell(ЦУк сам);
        //! \endcond
		
		//-----------------------------------------------------------------------------
		
	alias HtmlLinkInfo wxHtmlLinkInfo;
	public class HtmlLinkInfo : wxObject
	{
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
		
		public  this()
			{ super(wxHtmlLinkInfo_ctor()); }
		
		//-----------------------------------------------------------------------------
		
		/*public  this(ткст href, ткст target)
			{ super(wxHtmlLinkInfo_ctor(href, target)); }*/

		public static wxObject Нов(ЦУк ptr) { return new HtmlCell(ptr); }
		
		//-----------------------------------------------------------------------------
		
		/*public  this(HtmlLinkInfo l)
			{ super(wxHtmlLinkInfo_ctor(wxObject.SafePtr(l))); }*/
		//-----------------------------------------------------------------------------
		
		public проц event(MouseEvent значение) { wxHtmlLinkInfo_SetEvent(шхобъ, wxObject.SafePtr(значение)); }
		public MouseEvent event() { return cast(MouseEvent)FindObject(wxHtmlLinkInfo_GetEvent(шхобъ), cast(wxObject function (ЦУк))&MouseEvent.Нов); }
		
		//-----------------------------------------------------------------------------
		
		public ткст Href() { return cast(ткст) new wxString(wxHtmlLinkInfo_GetHref(шхобъ), да); }
		
		//-----------------------------------------------------------------------------
		
		public ткст Target() { return cast(ткст) new wxString(wxHtmlLinkInfo_GetTarget(шхобъ), да); }
		
		//-----------------------------------------------------------------------------
		
		public HtmlCell htmlCell() { return cast(HtmlCell)FindObject(wxHtmlLinkInfo_GetHtmlCell(шхобъ), &HtmlCell.Нов); }
		public проц htmlCell(HtmlCell значение) { wxHtmlLinkInfo_SetHtmlCell(шхобъ, wxObject.SafePtr(значение)); }
	}

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) ЦУк wxHtmlWidgetCell_ctor(ЦУк wnd, цел w);
        static extern (C) проц   wxHtmlWidgetCell_Draw(ЦУк сам, ЦУк dc, цел x, цел y, цел view_y1, цел view_y2, ЦУк info);
        static extern (C) проц   wxHtmlWidgetCell_DrawInvisible(ЦУк сам, ЦУк dc, цел x, цел y, ЦУк info);
        static extern (C) проц   wxHtmlWidgetCell_Layout(ЦУк сам, цел w);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlWidgetCell wxHtmlWidgetCell;
    public class HtmlWidgetCell : HtmlCell
    {
		public this(ЦУк шхобъ)
			{ super(шхобъ);}

        public this(Окно wnd, цел w)
            { this(wxHtmlWidgetCell_ctor(wxObject.SafePtr(wnd), w)); }

        //-----------------------------------------------------------------------------

        public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info)
        {
            wxHtmlWidgetCell_Draw(шхобъ, wxObject.SafePtr(dc), x, y, view_y1, view_y2, wxObject.SafePtr(info));
        }

        //-----------------------------------------------------------------------------

        public override проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info)
        {
            wxHtmlWidgetCell_DrawInvisible(шхобъ, wxObject.SafePtr(dc), x, y, wxObject.SafePtr(info));
        }

        //-----------------------------------------------------------------------------

        public override проц Layout(цел w)
        {
            wxHtmlWidgetCell_Layout(шхобъ, w);
        }
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) ЦУк wxHtmlWordCell_ctor(ткст word, ЦУк dc);
        static extern (C) проц   wxHtmlWordCell_Draw(ЦУк сам, ЦУк dc, цел x, цел y, цел view_y1, цел view_y2, ЦУк info);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlWordCell wxHtmlWordCell;
    public class HtmlWordCell : HtmlCell
    {
		public this(ЦУк шхобъ)
			{ super(шхобъ);}

        public  this(ткст word, DC dc)
            { this(wxHtmlWordCell_ctor(word, wxObject.SafePtr(dc))); }

        //-----------------------------------------------------------------------------

        public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info)
        {
            wxHtmlWordCell_Draw(шхобъ, wxObject.SafePtr(dc), x, y, view_y1, view_y2, wxObject.SafePtr(info));
        }
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) бул   wxHtmlFilterPlainText_CanRead(ЦУк сам, ЦУк file);
        static extern (C) ЦУк wxHtmlFilterPlainText_ReadFile(ЦУк сам, ЦУк file);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlFilterPlainText wxHtmlFilterPlainText;
    public class HtmlFilterPlainText : HtmlFilter
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        //-----------------------------------------------------------------------------

        /*public override бул Читается(FSFile file)
        {
            return wxHtmlFilterPlainText_CanRead(шхобъ, wxObject.SafePtr(file));
        }

        //-----------------------------------------------------------------------------

        public override ткст ReadFile(FSFile file)
        {
            return cast(ткст) new wxString(wxHtmlFilterPlainText_ReadFile(шхобъ, wxObject.SafePtr(file)));
        }
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) бул   wxHtmlFilterHTML_CanRead(ЦУк сам, ЦУк file);
        static extern (C) ЦУк wxHtmlFilterHTML_ReadFile(ЦУк сам, ЦУк file);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlFilterHTML wxHtmlFilterHTML;
    public class HtmlFilterHTML : HtmlFilter
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        //-----------------------------------------------------------------------------

        /*public override бул Читается(FSFile file)
        {
            return wxHtmlFilterHTML_CanRead(шхобъ, wxObject.SafePtr(file));
        }

        //-----------------------------------------------------------------------------

        public override ткст ReadFile(FSFile file)
        {
            return cast(ткст) new wxString(wxHtmlFilterHTML_ReadFile(шхобъ, wxObject.SafePtr(file)));
        }*/
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) ЦУк wxHtmlTagsModule_ctor();
        static extern (C) бул   wxHtmlTagsModule_OnInit(ЦУк сам);
        static extern (C) проц   wxHtmlTagsModule_OnExit(ЦУк сам);
        static extern (C) проц   wxHtmlTagsModule_FillHandlersTable(ЦУк сам, ЦУк parser);
        //! \endcond
        
        //-----------------------------------------------------------------------------

    alias HtmlTagsModule wxHtmlTagsModule;
    public class HtmlTagsModule : wxObject // TODO: Module
    {
		public this(ЦУк шхобъ)
			{ super(шхобъ);}

        public this()
            { super(wxHtmlTagsModule_ctor()); }

        //-----------------------------------------------------------------------------

        public бул ПриИниц()
        {
            return wxHtmlTagsModule_OnInit(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц ПриВыходе()
        {
            wxHtmlTagsModule_OnExit(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц FillHandlersTable(HtmlWinParser  parser)
        {
            wxHtmlTagsModule_FillHandlersTable(шхобъ, wxObject.SafePtr(parser));
        }
    }

	//-----------------------------------------------------------------------------

    public abstract class HtmlWinTagHandler : HtmlTagHandler
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) ЦУк wxHtmlWinParser_ctor(ЦУк wnd);
        static extern (C) проц   wxHtmlWinParser_InitParser(ЦУк сам, ткст source);
        static extern (C) проц   wxHtmlWinParser_DoneParser(ЦУк сам);
        static extern (C) ЦУк wxHtmlWinParser_GetProduct(ЦУк сам);
        static extern (C) ЦУк wxHtmlWinParser_OpenURL(ЦУк сам, цел тип, ткст url);
        static extern (C) проц   wxHtmlWinParser_SetDC(ЦУк сам, ЦУк dc, дво pixel_scale);
        static extern (C) ЦУк wxHtmlWinParser_GetDC(ЦУк сам);
        static extern (C) дво wxHtmlWinParser_GetPixelScale(ЦУк сам);
        static extern (C) цел    wxHtmlWinParser_GetCharHeight(ЦУк сам);
        static extern (C) цел    wxHtmlWinParser_GetCharWidth(ЦУк сам);
        static extern (C) ЦУк wxHtmlWinParser_GetWindow(ЦУк сам);
        static extern (C) проц   wxHtmlWinParser_SetFonts(ЦУк сам, ткст normal_face, ткст fixed_face, цел* sizes);
        static extern (C) проц   wxHtmlWinParser_AddModule(ЦУк сам, ЦУк mod);
        static extern (C) проц   wxHtmlWinParser_RemoveModule(ЦУк сам, ЦУк mod);
        static extern (C) ЦУк wxHtmlWinParser_GetContainer(ЦУк сам);
        static extern (C) ЦУк wxHtmlWinParser_OpenContainer(ЦУк сам);
        static extern (C) ЦУк wxHtmlWinParser_SetContainer(ЦУк сам, ЦУк c);
        static extern (C) ЦУк wxHtmlWinParser_CloseContainer(ЦУк сам);
        static extern (C) цел    wxHtmlWinParser_GetFontSize(ЦУк сам);
        static extern (C) проц   wxHtmlWinParser_SetFontSize(ЦУк сам, цел s);
        static extern (C) цел    wxHtmlWinParser_GetFontBold(ЦУк сам);
        static extern (C) проц   wxHtmlWinParser_SetFontBold(ЦУк сам, цел x);
        static extern (C) цел    wxHtmlWinParser_GetFontItalic(ЦУк сам);
        static extern (C) проц   wxHtmlWinParser_SetFontItalic(ЦУк сам, цел x);
        static extern (C) цел    wxHtmlWinParser_GetFontUnderlined(ЦУк сам);
        static extern (C) проц   wxHtmlWinParser_SetFontUnderlined(ЦУк сам, цел x);
        static extern (C) цел    wxHtmlWinParser_GetFontFixed(ЦУк сам);
        static extern (C) проц   wxHtmlWinParser_SetFontFixed(ЦУк сам, цел x);
        static extern (C) ЦУк wxHtmlWinParser_GetFontFace(ЦУк сам);
        static extern (C) проц   wxHtmlWinParser_SetFontFace(ЦУк сам, ткст face);
        static extern (C) цел    wxHtmlWinParser_GetAlign(ЦУк сам);
        static extern (C) проц   wxHtmlWinParser_SetAlign(ЦУк сам, цел a);
        static extern (C) ЦУк wxHtmlWinParser_GetLinkColor(ЦУк сам);
        static extern (C) проц   wxHtmlWinParser_SetLinkColor(ЦУк сам, ЦУк clr);
        static extern (C) ЦУк wxHtmlWinParser_GetActualColor(ЦУк сам);
        static extern (C) проц   wxHtmlWinParser_SetActualColor(ЦУк сам, ЦУк clr);
        static extern (C) ЦУк wxHtmlWinParser_GetLink(ЦУк сам);
        static extern (C) проц   wxHtmlWinParser_SetLink(ЦУк сам, ЦУк link);
        static extern (C) ЦУк wxHtmlWinParser_CreateCurrentFont(ЦУк сам);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlWinParser wxHtmlWinParser;
    public class HtmlWinParser : HtmlParser
    {
		public this(ЦУк шхобъ)
			{ super(шхобъ);}

        public this(HtmlWindow wnd)
            { super(wxHtmlWinParser_ctor(wxObject.SafePtr(wnd))); }

	public static wxObject Нов(ЦУк ptr) { return new HtmlWinParser(ptr); }
        //-----------------------------------------------------------------------------

        public override проц InitParser(ткст source)
        {
            wxHtmlWinParser_InitParser(шхобъ, source);
        }

        //-----------------------------------------------------------------------------

        public override проц DoneParser()
        {
            wxHtmlWinParser_DoneParser(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public override wxObject Product()
        {
//FIXME            return FindObject(wxHtmlWinParser_GetProduct(шхобъ), typeof(wxObject));
              return FindObject(wxHtmlWinParser_GetProduct(шхобъ));
        }

        //-----------------------------------------------------------------------------

        /*public FSFile OpenURL(HtmlURLType тип, ткст url)
        {
            return wxHtmlWinParser_OpenURL(шхобъ, wxObject.SafePtr(тип), url);
        }*/

        //-----------------------------------------------------------------------------

        public проц SetDC(DC dc, дво pixel_scale)
        {
            wxHtmlWinParser_SetDC(шхобъ, wxObject.SafePtr(dc), pixel_scale);
        }

        //-----------------------------------------------------------------------------

        public DC GetDC() { return cast(DC)FindObject(wxHtmlWinParser_GetDC(шхобъ), &DC.Нов); }

        //-----------------------------------------------------------------------------

        public дво PixelScale() { return wxHtmlWinParser_GetPixelScale(шхобъ); }

        //-----------------------------------------------------------------------------

        public цел CharHeight() { return wxHtmlWinParser_GetCharHeight(шхобъ); }

        public цел CharWidth() { return wxHtmlWinParser_GetCharWidth(шхобъ); }

        //-----------------------------------------------------------------------------

        public HtmlWindow окно() { return cast(HtmlWindow)FindObject(wxHtmlWinParser_GetWindow(шхобъ), &HtmlWindow.Нов); }

        //-----------------------------------------------------------------------------

        public проц SetFonts(ткст normal_face, ткст fixed_face, цел[] sizes)
        {
            wxHtmlWinParser_SetFonts(шхобъ, normal_face, fixed_face, sizes.ptr);
        }

        //-----------------------------------------------------------------------------

        public проц AddModule(HtmlTagsModule mod)
        {
            wxHtmlWinParser_AddModule(шхобъ, wxObject.SafePtr(mod));
        }

        public проц RemoveModule(HtmlTagsModule mod)
        {
            wxHtmlWinParser_RemoveModule(шхобъ, wxObject.SafePtr(mod));
        }

        //-----------------------------------------------------------------------------

        public HtmlContainerCell Container() { return cast(HtmlContainerCell)FindObject(wxHtmlWinParser_GetContainer(шхобъ), &HtmlContainerCell.Нов); }

        public HtmlContainerCell SetContainter(HtmlContainerCell cont)
        {
            return cast(HtmlContainerCell)FindObject(wxHtmlWinParser_SetContainer(шхобъ, wxObject.SafePtr(cont)), &HtmlContainerCell.Нов);
        }

        //-----------------------------------------------------------------------------

        public HtmlContainerCell OpenContainer()
        {
            return cast(HtmlContainerCell)FindObject(wxHtmlWinParser_OpenContainer(шхобъ), &HtmlContainerCell.Нов);
        }

        public HtmlContainerCell CloseContainer()
        {
            return cast(HtmlContainerCell)FindObject(wxHtmlWinParser_CloseContainer(шхобъ), &HtmlContainerCell.Нов);
        }

        //-----------------------------------------------------------------------------

        public цел FontSize() { return wxHtmlWinParser_GetFontSize(шхобъ); }
        public проц FontSize(цел значение) { wxHtmlWinParser_SetFontSize(шхобъ, значение); }

        public цел FontBold() { return wxHtmlWinParser_GetFontBold(шхобъ); }
        public проц FontBold(цел значение) { wxHtmlWinParser_SetFontBold(шхобъ, значение); }

        public цел FontItalic() { return wxHtmlWinParser_GetFontItalic(шхобъ); }
        public проц FontItalic(цел значение) { wxHtmlWinParser_SetFontItalic(шхобъ, значение); }

        public цел FontUnderlined() { return wxHtmlWinParser_GetFontUnderlined(шхобъ); }
        public проц FontUnderlined(цел значение) { wxHtmlWinParser_SetFontUnderlined(шхобъ, значение); }

        public цел FontFixed() { return wxHtmlWinParser_GetFontFixed(шхобъ); }
        public проц FontFixed(цел значение) { wxHtmlWinParser_SetFontFixed(шхобъ, значение); }

        public ткст FontFace() { return cast(ткст) new wxString(wxHtmlWinParser_GetFontFace(шхобъ), да); }
        public проц FontFace(ткст значение) { wxHtmlWinParser_SetFontFace(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public цел Align() { return wxHtmlWinParser_GetAlign(шхобъ); }
        public проц Align(цел значение) { wxHtmlWinParser_SetAlign(шхобъ, значение); }

        //-----------------------------------------------------------------------------

        public Цвет LinkColor() { return new Цвет(wxHtmlWinParser_GetLinkColor(шхобъ), да); }
        public проц LinkColor(Цвет значение) { wxHtmlWinParser_SetLinkColor(шхобъ, wxObject.SafePtr(значение)); }

        public Цвет ActualColor() { return new Цвет(wxHtmlWinParser_GetActualColor(шхобъ), да); }
        public проц ActualColor(Цвет значение) { wxHtmlWinParser_SetActualColor(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public HtmlLinkInfo Link() { return cast(HtmlLinkInfo)FindObject(wxHtmlWinParser_GetLink(шхобъ), &HtmlLinkInfo.Нов); }
        public проц Link(HtmlLinkInfo значение) { wxHtmlWinParser_SetLink(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public Шрифт CreateCurrentFont()
        {
            return new Шрифт(wxHtmlWinParser_CreateCurrentFont(шхобъ));
        }
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) проц   wxHtmlTagHandler_SetParser(ЦУк сам, ЦУк parser);
        //! \endcond

        //-----------------------------------------------------------------------------

    public abstract class HtmlTagHandler : wxObject
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц Parser(HtmlParser значение) { wxHtmlTagHandler_SetParser(шхобъ, wxObject.SafePtr(значение)); }

        //-----------------------------------------------------------------------------

        public abstract ткст GetSupportedTags();
        public abstract бул HandleTag(HtmlTag tag);
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) ЦУк wxHtmlEntitiesParser_ctor();
        static extern (C) проц   wxHtmlEntitiesParser_SetEncoding(ЦУк сам, цел encoding);
        static extern (C) ЦУк wxHtmlEntitiesParser_Parse(ЦУк сам, ткст input);
        static extern (C) сим   wxHtmlEntitiesParser_GetEntityChar(ЦУк сам, ткст entity);
        static extern (C) сим   wxHtmlEntitiesParser_GetCharForCode(ЦУк сам, бцел code);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlEntitiesParser wxHtmlEntitiesParser;
    public class HtmlEntitiesParser : wxObject
    {
		public this(ЦУк шхобъ)
			{ super(шхобъ);}

        public  this()
            { super(wxHtmlEntitiesParser_ctor()); }

        //-----------------------------------------------------------------------------

        public проц Encoding(FontEncoding значение) { wxHtmlEntitiesParser_SetEncoding(шхобъ, cast(цел)значение); }

        //-----------------------------------------------------------------------------

        public ткст Parse(ткст input)
        {
            return cast(ткст) new wxString(wxHtmlEntitiesParser_Parse(шхобъ, input), да);
        }

        //-----------------------------------------------------------------------------

        public сим GetEntityChar(ткст entity)
        {
            return wxHtmlEntitiesParser_GetEntityChar(шхобъ, entity);
        }

        public сим GetCharForCode(цел code)
        {
            return wxHtmlEntitiesParser_GetCharForCode(шхобъ, cast(бцел)code);
        }
    }

	//-----------------------------------------------------------------------------

         //! \cond EXTERN
        static extern (C) проц   wxHtmlParser_SetFS(ЦУк сам, ЦУк fs);
        static extern (C) ЦУк wxHtmlParser_GetFS(ЦУк сам);
        static extern (C) ЦУк wxHtmlParser_OpenURL(ЦУк сам, цел тип, ткст url);
        static extern (C) ЦУк wxHtmlParser_Parse(ЦУк сам, ткст source);
        static extern (C) проц   wxHtmlParser_InitParser(ЦУк сам, ткст source);
        static extern (C) проц   wxHtmlParser_DoneParser(ЦУк сам);
        static extern (C) проц   wxHtmlParser_StopParsing(ЦУк сам);
        static extern (C) проц   wxHtmlParser_DoParsing(ЦУк сам, цел begin_pos, цел end_pos);
        static extern (C) проц   wxHtmlParser_DoParsingAll(ЦУк сам);
        static extern (C) ЦУк wxHtmlParser_GetCurrentTag(ЦУк сам);
        static extern (C) проц   wxHtmlParser_AddTagHandler(ЦУк сам, ЦУк handler);
        static extern (C) проц   wxHtmlParser_PushTagHandler(ЦУк сам, ЦУк handler, ткст tags);
        static extern (C) проц   wxHtmlParser_PopTagHandler(ЦУк сам);
        static extern (C) ЦУк wxHtmlParser_GetSource(ЦУк сам);
        static extern (C) проц   wxHtmlParser_SetSource(ЦУк сам, ткст src);
        static extern (C) проц   wxHtmlParser_SetSourceAndSaveState(ЦУк сам, ткст src);
        static extern (C) бул   wxHtmlParser_RestoreState(ЦУк сам);
        static extern (C) ЦУк wxHtmlParser_ExtractCharsetInformation(ЦУк сам, ткст markup);
        //! \endcond

        //-----------------------------------------------------------------------------

    public abstract class HtmlParser : wxObject
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        //-----------------------------------------------------------------------------

        /*public проц SetFS(FileSystem fs)
        {
            wxHtmlParser_SetFS(шхобъ, wxObject.SafePtr(fs));
        }

        //-----------------------------------------------------------------------------

        public FileSystem GetFS()
        {
            return wxHtmlParser_GetFS(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public FSFile OpenURL(HtmlURLType тип, ткст url)
        {
            return wxHtmlParser_OpenURL(шхобъ, wxObject.SafePtr(тип), url);
        }*/

        //-----------------------------------------------------------------------------

        public wxObject Parse(ткст source)
        {
            return new wxObject(wxHtmlParser_Parse(шхобъ, source));
        }

        //-----------------------------------------------------------------------------

        public /+virtual+/ проц InitParser(ткст source)
        {
            wxHtmlParser_InitParser(шхобъ, source);
        }

        //-----------------------------------------------------------------------------

        public /+virtual+/ проц DoneParser()
        {
            wxHtmlParser_DoneParser(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц StopParsing()
        {
            wxHtmlParser_StopParsing(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public проц DoParsing(цел begin_pos, цел end_pos)
        {
            wxHtmlParser_DoParsing(шхобъ, begin_pos, end_pos);
        }

        //-----------------------------------------------------------------------------

        public проц DoParsing()
        {
            wxHtmlParser_DoParsingAll(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public HtmlTag GetCurrentTag()
        {
            return HtmlTag.FindObj(wxHtmlParser_GetCurrentTag(шхобъ));
        }

        //-----------------------------------------------------------------------------

        public abstract wxObject Product();

        //-----------------------------------------------------------------------------

        public проц AddTagHandler(HtmlTagHandler handler)
        {
            wxHtmlParser_AddTagHandler(шхобъ, wxObject.SafePtr(handler));
        }

        //-----------------------------------------------------------------------------

        public проц PushTagHandler(HtmlTagHandler handler, ткст tags)
        {
            wxHtmlParser_PushTagHandler(шхобъ, wxObject.SafePtr(handler), tags);
        }

        //-----------------------------------------------------------------------------

        public проц PopTagHandler()
        {
            wxHtmlParser_PopTagHandler(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public ткст Source() { return cast(ткст) new wxString(wxHtmlParser_GetSource(шхобъ), да); }
        public проц Source(ткст значение) { wxHtmlParser_SetSource(шхобъ, значение); }

        public проц SourceAndSaveState(ткст значение) { wxHtmlParser_SetSourceAndSaveState(шхобъ, значение); }

        public бул RestoreState()
        {
            return wxHtmlParser_RestoreState(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public ткст ExtractCharsetInformation(ткст markup)
        {
            return cast(ткст) new wxString(wxHtmlParser_ExtractCharsetInformation(шхобъ, markup), да);
        }
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) цел    wxHtmlProcessor_GetPriority(ЦУк сам);
        static extern (C) проц   wxHtmlProcessor_Enable(ЦУк сам, бул enable);
        static extern (C) бул   wxHtmlProcessor_IsEnabled(ЦУк сам);
        //! \endcond

        //-----------------------------------------------------------------------------

    public abstract class HtmlProcessor : wxObject
    {
        public this(ЦУк шхобъ) 
            { super(шхобъ); }

        //-----------------------------------------------------------------------------

        public abstract ткст Process(ткст текст);

        //-----------------------------------------------------------------------------

        public цел Priority() { return wxHtmlProcessor_GetPriority(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц Enabled(бул значение) { wxHtmlProcessor_Enable(шхобъ, значение); }
        public бул Enabled() { return wxHtmlProcessor_IsEnabled(шхобъ); }
    }
    
	//-----------------------------------------------------------------------------
    
        //! \cond EXTERN
		static extern (C) ЦУк wxHtmlRenderingInfo_ctor();
		static extern (C) проц wxHtmlRenderingInfo_dtor(ЦУк сам);
		static extern (C) проц wxHtmlRenderingInfo_SetSelection(ЦУк сам, ЦУк s);
		static extern (C) ЦУк wxHtmlRenderingInfo_GetSelection(ЦУк сам);
        //! \endcond
		
		//-----------------------------------------------------------------------------
		
	alias HtmlRenderingInfo wxHtmlRenderingInfo;
	public class HtmlRenderingInfo : wxObject
	{
		public this(ЦУк шхобъ)
		{	
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
			
		public this()
			{ this(wxHtmlRenderingInfo_ctor(), да);}
			
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxHtmlRenderingInfo_dtor(шхобъ); }
			
		//-----------------------------------------------------------------------------
		
		public HtmlSelection Selection() { return cast(HtmlSelection)FindObject(wxHtmlRenderingInfo_GetSelection(шхобъ), &HtmlSelection.Нов); }
		public проц Selection(HtmlSelection значение) { wxHtmlRenderingInfo_SetSelection(шхобъ, wxObject.SafePtr(значение)); }
	}
	
	//-----------------------------------------------------------------------------
	
        //! \cond EXTERN
		static extern (C) ЦУк wxHtmlSelection_ctor();
		static extern (C) проц wxHtmlSelection_dtor(ЦУк сам);
		static extern (C) проц wxHtmlSelection_Set(ЦУк сам, inout Точка fromPos, ЦУк fromCell, inout Точка toPos, ЦУк toCell);
		static extern (C) проц wxHtmlSelection_Set2(ЦУк сам, ЦУк fromCell, ЦУк toCell);
		static extern (C) ЦУк wxHtmlSelection_GetFromCell(ЦУк сам);
		static extern (C) ЦУк wxHtmlSelection_GetToCell(ЦУк сам);
		static extern (C) проц wxHtmlSelection_GetFromPos(ЦУк сам, out Точка fromPos);
		static extern (C) проц wxHtmlSelection_GetToPos(ЦУк сам, out Точка toPos);
		//static extern (C) проц wxHtmlSelection_GetFromPrivPos(ЦУк сам, out Точка fromPrivPos);
		//static extern (C) проц wxHtmlSelection_GetToPrivPos(ЦУк сам, out Точка toPrivPos);
		//static extern (C) проц wxHtmlSelection_SetFromPrivPos(ЦУк сам, inout Точка поз);
		//static extern (C) проц wxHtmlSelection_SetToPrivPos(ЦУк сам, inout Точка поз);
		//static extern (C) проц wxHtmlSelection_ClearPrivPos(ЦУк сам);
		static extern (C) бул wxHtmlSelection_IsEmpty(ЦУк сам);
        //! \endcond
		
		//-----------------------------------------------------------------------------

	alias HtmlSelection wxHtmlSelection;
	public class HtmlSelection : wxObject
	{
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
			
		public this()
			{ this(wxHtmlSelection_ctor(), да);}
			
		public static wxObject Нов(ЦУк ptr) { return new HtmlSelection(ptr); }
		
		//---------------------------------------------------------------------
				
		override protected проц dtor() { wxHtmlSelection_dtor(шхобъ); }
			
		//-----------------------------------------------------------------------------
		
		public проц Установи(Точка fromPos, HtmlCell fromCell, Точка toPos, HtmlCell toCell)
		{
			wxHtmlSelection_Set(шхобъ, fromPos, wxObject.SafePtr(fromCell), toPos, wxObject.SafePtr(toCell));
		}
		
		public проц Установи(HtmlCell fromCell, HtmlCell toCell)
		{
			wxHtmlSelection_Set2(шхобъ, wxObject.SafePtr(fromCell), wxObject.SafePtr(toCell));
		}
		
		//-----------------------------------------------------------------------------
		
		public HtmlCell FromCell() { return cast(HtmlCell)FindObject(wxHtmlSelection_GetFromCell(шхобъ), &HtmlCell.Нов); }
		
		public HtmlCell ToCell() { return cast(HtmlCell)FindObject(wxHtmlSelection_GetToCell(шхобъ), &HtmlCell.Нов); }
		
		//-----------------------------------------------------------------------------
		
		public Точка FromPos() { 
				Точка tpoint;
				wxHtmlSelection_GetFromPos(шхобъ, tpoint);
				return tpoint;
			}
		
		public Точка ToPos() {
				Точка tpoint;
				wxHtmlSelection_GetToPos(шхобъ, tpoint);
				return tpoint;
			}
		
		//-----------------------------------------------------------------------------
	/+	
		public Точка FromPrivPos() { 
				Точка tpoint;
				wxHtmlSelection_GetFromPrivPos(шхобъ, tpoint);
				return tpoint;
			}
			
		public проц FromPrivPos(Точка значение) { wxHtmlSelection_SetFromPrivPos(шхобъ, значение); }
		
		public Точка ToPrivPos() {
				Точка tpoint;
				wxHtmlSelection_GetToPrivPos(шхобъ, tpoint);
				return tpoint;
			}
			
		public проц ToPrivPos(Точка значение) { wxHtmlSelection_SetToPrivPos(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public проц ClearPrivPos()
		{
			wxHtmlSelection_ClearPrivPos(шхобъ);
		}
	+/	
		//-----------------------------------------------------------------------------
		
		public бул Empty() { return wxHtmlSelection_IsEmpty(шхобъ); }
	}
	
	//-----------------------------------------------------------------------------
	
        //! \cond EXTERN
		static extern (C) ЦУк wxHtmlEasyPrinting_ctor(ткст имя, ЦУк родитель);
		static extern (C) бул   wxHtmlEasyPrinting_PreviewFile(ЦУк сам, ткст htmlfile);
		static extern (C) бул   wxHtmlEasyPrinting_PreviewText(ЦУк сам, ткст htmltext, ткст basepath);
		static extern (C) бул   wxHtmlEasyPrinting_PrintFile(ЦУк сам, ткст htmlfile);
		static extern (C) бул   wxHtmlEasyPrinting_PrintText(ЦУк сам, ткст htmltext, ткст basepath);
		//static extern (C) проц   wxHtmlEasyPrinting_PrinterSetup(ЦУк сам);
		static extern (C) проц   wxHtmlEasyPrinting_PageSetup(ЦУк сам);
		static extern (C) проц   wxHtmlEasyPrinting_SetHeader(ЦУк сам, ткст header, цел pg);
		static extern (C) проц   wxHtmlEasyPrinting_SetFooter(ЦУк сам, ткст footer, цел pg);
		static extern (C) проц   wxHtmlEasyPrinting_SetFonts(ЦУк сам, ткст normal_face, ткст fixed_face, цел* sizes);
		static extern (C) проц   wxHtmlEasyPrinting_SetStandardFonts(ЦУк сам, цел size, ткст normal_face, ткст fixed_face);
		static extern (C) ЦУк wxHtmlEasyPrinting_GetPrintData(ЦУк сам);
		static extern (C) ЦУк wxHtmlEasyPrinting_GetPageSetupData(ЦУк сам);
        //! \endcond
		
		//-----------------------------------------------------------------------------
		
	alias HtmlEasyPrinting wxHtmlEasyPrinting;
	public class HtmlEasyPrinting : wxObject
	{
		public const цел wxPAGE_ODD	= 0;
		public const цел wxPAGE_EVEN	= 1;
		public const цел wxPAGE_ALL	= 2;
		
		//-----------------------------------------------------------------------------
	
		public this(ЦУк шхобъ)
			{ super(шхобъ);}
			
		public this()
			{ this("Printing", пусто);}
			
		public this(ткст имя)
			{ this(имя, пусто);}
			
		public this(ткст имя, Окно parentWindow)
			{ super(wxHtmlEasyPrinting_ctor(имя, wxObject.SafePtr(parentWindow)));}
			
		//-----------------------------------------------------------------------------
		
		public бул PreviewFile(ткст htmlfile)
		{
			return wxHtmlEasyPrinting_PreviewFile(шхобъ, htmlfile);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул PreviewText(ткст htmltext)
		{
			return PreviewText(htmltext, "");
		}
		
		public бул PreviewText(ткст htmltext, ткст basepath)
		{
			return wxHtmlEasyPrinting_PreviewText(шхобъ, htmltext, basepath);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул PrintFile(ткст htmlfile)
		{
			return wxHtmlEasyPrinting_PrintFile(шхобъ, htmlfile);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул PrintText(ткст htmltext)
		{
			return PrintText(htmltext, "");
		}
		
		public бул PrintText(ткст htmltext, ткст basepath)
		{
			return wxHtmlEasyPrinting_PrintText(шхобъ, htmltext, basepath);
		}
		
		//-----------------------------------------------------------------------------
		
		/*public проц PrinterSetup()
		{
			wxHtmlEasyPrinting_PrinterSetup(шхобъ);
		}*/
		
		//-----------------------------------------------------------------------------
		
		public проц PageSetup()
		{
			wxHtmlEasyPrinting_PageSetup(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц SetHeader(ткст header)
		{
			SetHeader(header, wxPAGE_ALL);
		}
		
		public проц SetHeader(ткст header, цел pg)
		{
			wxHtmlEasyPrinting_SetHeader(шхобъ, header, pg);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц SetFooter(ткст footer)
		{
			SetFooter(footer, wxPAGE_ALL);
		}
		
		public проц SetFooter(ткст footer, цел pg)
		{
			wxHtmlEasyPrinting_SetFooter(шхобъ, footer, pg);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц SetFonts(ткст normal_face, ткст fixed_face)
		{
			SetFonts(normal_face, fixed_face, пусто);
		}
		
		public проц SetFonts(ткст normal_face, ткст fixed_face, цел[] sizes)
		{
			wxHtmlEasyPrinting_SetFonts(шхобъ, normal_face, fixed_face, sizes.ptr);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц SetStandardFonts()
		{
			SetStandardFonts(-1, "", "");
		}
		
		public проц SetStandardFonts(цел size)
		{
			SetStandardFonts(size, "", "");
		}
		
		public проц SetStandardFonts(цел size, ткст normal_face)
		{
			SetStandardFonts(size, normal_face, "");
		}
		
		public проц SetStandardFonts(цел size, ткст normal_face, ткст fixed_face)
		{
			wxHtmlEasyPrinting_SetStandardFonts(шхобъ, size, normal_face, fixed_face);
		}
		
		//-----------------------------------------------------------------------------
		
		public PrintData printData() { return cast(PrintData)FindObject(wxHtmlEasyPrinting_GetPrintData(шхобъ), &PrintData.Нов); }
		
		//-----------------------------------------------------------------------------
		
		public PageSetupДиалогData PageSetupData() { return cast(PageSetupДиалогData)FindObject(wxHtmlEasyPrinting_GetPageSetupData(шхобъ), &PageSetupДиалогData.Нов); }
	}

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
		extern (C) {
		alias проц function(HtmlWindow объ, ЦУк link) Virtual_OnLinkClicked;
		alias проц function(HtmlWindow объ, ЦУк title) Virtual_OnSetTitle;
		alias проц function(HtmlWindow объ, ЦУк cell, цел x, цел y) Virtual_OnCellMouseHover;
		alias проц function(HtmlWindow объ, ЦУк cell, цел x, цел y, ЦУк mouseevent) Virtual_OnCellClicked;
		alias цел function(HtmlWindow объ, цел тип, ЦУк url, ЦУк redirect) Virtual_OnOpeningURL;
		}

		static extern (C) ЦУк wxHtmlWindow_ctor();
		static extern (C) проц   wxHtmlWindow_RegisterVirtual(ЦУк сам, HtmlWindow объ, 
			Virtual_OnLinkClicked onLinkClicked,
			Virtual_OnSetTitle onSetTitle,
			Virtual_OnCellMouseHover onCellMouseHover,
			Virtual_OnCellClicked onCellClicked,
			Virtual_OnOpeningURL onOpeningURL);
		static extern (C) бул   wxHtmlWindow_Create(ЦУк сам, ЦУк родитель, цел ид, inout Точка поз, inout Размер size, бцел стиль, ткст имя);
		static extern (C) бул   wxHtmlWindow_SetPage(ЦУк сам, ткст source);
		static extern (C) бул   wxHtmlWindow_AppendToPage(ЦУк сам, ткст source);
		static extern (C) бул   wxHtmlWindow_LoadPage(ЦУк сам, ткст location);
		static extern (C) бул   wxHtmlWindow_LoadFile(ЦУк сам, ткст фимя);
		static extern (C) ЦУк wxHtmlWindow_GetOpenedPage(ЦУк сам);
		static extern (C) ЦУк wxHtmlWindow_GetOpenedAnchor(ЦУк сам);
		static extern (C) ЦУк wxHtmlWindow_GetOpenedPageTitle(ЦУк сам);
		static extern (C) проц   wxHtmlWindow_SetRelatedFrame(ЦУк сам, ЦУк frame, ткст format);
		static extern (C) ЦУк wxHtmlWindow_GetRelatedFrame(ЦУк сам);
		static extern (C) проц   wxHtmlWindow_SetRelatedStatusBar(ЦУк сам, цел bar);
		static extern (C) проц   wxHtmlWindow_SetFonts(ЦУк сам, ткст normal_face, ткст fixed_face, цел* sizes);
		static extern (C) проц   wxHtmlWindow_SetBorders(ЦУк сам, цел с);
		static extern (C) проц   wxHtmlWindow_ReadCustomization(ЦУк сам, ЦУк cfg, ткст путь);
		static extern (C) проц   wxHtmlWindow_WriteCustomization(ЦУк сам, ЦУк cfg, ткст путь);
		static extern (C) бул   wxHtmlWindow_HistoryBack(ЦУк сам);
		static extern (C) бул   wxHtmlWindow_HistoryForward(ЦУк сам);
		static extern (C) бул   wxHtmlWindow_HistoryCanBack(ЦУк сам);
		static extern (C) бул   wxHtmlWindow_HistoryCanForward(ЦУк сам);
		static extern (C) проц   wxHtmlWindow_HistoryClear(ЦУк сам);
		static extern (C) ЦУк wxHtmlWindow_GetInternalRepresentation(ЦУк сам);
		static extern (C) проц   wxHtmlWindow_AddFilter(ЦУк filter);
		static extern (C) ЦУк wxHtmlWindow_GetParser(ЦУк сам);
		static extern (C) проц   wxHtmlWindow_AddProcessor(ЦУк сам, ЦУк processor);
		static extern (C) проц   wxHtmlWindow_AddGlobalProcessor(ЦУк processor);
		static extern (C) бул   wxHtmlWindow_AcceptsFocusFromKeyboard(ЦУк сам);
		static extern (C) проц   wxHtmlWindow_OnSetTitle(ЦУк сам, ткст title);
		static extern (C) проц   wxHtmlWindow_OnCellClicked(ЦУк сам, ЦУк cell, цел x, цел y, ЦУк evt);
		static extern (C) проц   wxHtmlWindow_OnLinkClicked(ЦУк сам, ЦУк link);
		static extern (C) цел    wxHtmlWindow_OnOpeningURL(ЦУк сам, цел тип, ткст url, ткст redirect);
		
		static extern (C) проц   wxHtmlWindow_SelectAll(ЦУк сам);
		static extern (C) проц   wxHtmlWindow_SelectWord(ЦУк сам, inout Точка поз);
		static extern (C) проц   wxHtmlWindow_SelectLine(ЦУк сам, inout Точка поз);
		
		static extern (C) ЦУк wxHtmlWindow_ToText(ЦУк сам);
		
		static extern (C) ЦУк wxHtmlWindow_SelectionToText(ЦУк сам);
        //! \endcond
		
		//-----------------------------------------------------------------------------

	alias HtmlWindow wxHtmlWindow;
	public class HtmlWindow : ScrolledWindow
	{
		public const цел wxHW_SCROLLBAR_NEVER   = 0x0002;
		public const цел wxHW_SCROLLBAR_AUTO    = 0x0004;
		public const цел wxHW_NO_SELECTION      = 0x0008;

		//-----------------------------------------------------------------------------

		public this(ЦУк  шхобъ)
			{ super(шхобъ); }

		public this()
			{ super(wxHtmlWindow_ctor()); }
		
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxHW_SCROLLBAR_AUTO, ткст имя = "htmlWindow")
		{
			super(wxHtmlWindow_ctor());

			wxHtmlWindow_RegisterVirtual(шхобъ, this,
				&staticDoOnLinkClicked,
				&staticDoOnSetTitle,
				&staticDoOnCellMouseHover,
				&staticDoOnCellClicked,
				&staticDoOnOpeningURL
				);

			if (!Create(родитель, ид, поз, size, стиль, имя)) 
			{
				throw new InvalidOperationException("Failed to create HtmlWindow");
			}
		}
		
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель, Точка поз = wxDefaultPosition, Размер size = wxDefaultSize, цел стиль = wxHW_SCROLLBAR_AUTO, ткст имя = "htmlWindow")
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}

		//-----------------------------------------------------------------------------

		public override бул Create(Окно родитель, цел ид, inout Точка поз, inout Размер size, цел стиль, ткст имя)
		{
			return wxHtmlWindow_Create(шхобъ, wxObject.SafePtr(родитель), ид, поз, size, cast(бцел)стиль, имя);
		}

		//-----------------------------------------------------------------------------

		public бул SetPage(ткст source)
		{
			return wxHtmlWindow_SetPage(шхобъ, source);
		}
		
		public бул AppendToPage(ткст source)
		{
			return wxHtmlWindow_AppendToPage(шхобъ, source);
		}

		//-----------------------------------------------------------------------------
		
		public /+virtual+/ бул LoadPage(ткст location)
		{
			return wxHtmlWindow_LoadPage(шхобъ, location);
		}
		
		public бул ЗагрузиФайл(ткст фимя)
		{
			return wxHtmlWindow_LoadFile(шхобъ, фимя);
		}
		
		//-----------------------------------------------------------------------------
		
		public ткст OpenedPage() { return cast(ткст) new wxString(wxHtmlWindow_GetOpenedPage(шхобъ), да); } 
		
		public ткст OpenedAnchor() { return cast(ткст) new wxString(wxHtmlWindow_GetOpenedAnchor(шхобъ), да); }
		
		public ткст OpenedPageTitle() { return cast(ткст) new wxString(wxHtmlWindow_GetOpenedPageTitle(шхобъ), да); }
		
		//-----------------------------------------------------------------------------
		
		public проц SetRelatedFrame(Frame frame, ткст format)
		{
			wxHtmlWindow_SetRelatedFrame(шхобъ, wxObject.SafePtr(frame), format);
		}
		
		public Frame RelatedFrame() { return cast(Frame)FindObject(wxHtmlWindow_GetRelatedFrame(шхобъ), &Frame.Нов); }
		
		//-----------------------------------------------------------------------------
		
		public проц RelatedStatusBar(цел значение) { wxHtmlWindow_SetRelatedStatusBar(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public проц SetFonts(ткст normal_face, ткст fixed_face, цел[] sizes)
		{
			wxHtmlWindow_SetFonts(шхобъ, normal_face, fixed_face, sizes.ptr);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц Borders(цел значение) { wxHtmlWindow_SetBorders(шхобъ, значение); }
		
		//-----------------------------------------------------------------------------
		
		public /+virtual+/ проц ReadCustomization(Config cfg, ткст путь)
		{
			wxHtmlWindow_ReadCustomization(шхобъ, wxObject.SafePtr(cfg), путь);
		}
		
		//-----------------------------------------------------------------------------
		
		public /+virtual+/ проц WriteCustomization(Config cfg, ткст путь)
		{
			wxHtmlWindow_WriteCustomization(шхобъ, wxObject.SafePtr(cfg), путь);
		}
		
		//-----------------------------------------------------------------------------
		
		public бул HistoryBack()
		{
			return wxHtmlWindow_HistoryBack(шхобъ);
		}
		
		public бул HistoryForward()
		{
			return wxHtmlWindow_HistoryForward(шхобъ);
		}
		
		public бул HistoryCanBack()
		{
			return wxHtmlWindow_HistoryCanBack(шхобъ);
		}
		
		public бул HistoryCanForward()
		{
			return wxHtmlWindow_HistoryCanForward(шхобъ);
		}
		
		public проц HistoryClear()
		{
			wxHtmlWindow_HistoryClear(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public HtmlContainerCell InternalRepresentation() { return cast(HtmlContainerCell)FindObject(wxHtmlWindow_GetInternalRepresentation(шхобъ), &HtmlContainerCell.Нов); }
		
		//-----------------------------------------------------------------------------
		
		public static проц AddFilter(HtmlFilter filter)
		{
			wxHtmlWindow_AddFilter(wxObject.SafePtr(filter));
		}
		
		//-----------------------------------------------------------------------------
		
		public HtmlWinParser Parser() { return cast(HtmlWinParser)FindObject(wxHtmlWindow_GetParser(шхобъ), &HtmlWinParser.Нов); }
		
		//-----------------------------------------------------------------------------
		
		public проц AddProcessor(HtmlProcessor processor)
		{
			wxHtmlWindow_AddProcessor(шхобъ, wxObject.SafePtr(processor));
		}
		
		public static проц AddGlobalProcessor(HtmlProcessor processor)
		{
			wxHtmlWindow_AddGlobalProcessor(wxObject.SafePtr(processor));
		}
		
		//-----------------------------------------------------------------------------
		
		public override бул AcceptsFocusFromKeyboard()
		{
			return wxHtmlWindow_AcceptsFocusFromKeyboard(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		static extern(C) private проц staticDoOnSetTitle(HtmlWindow объ, ЦУк title)
		{			
			объ.OnSetTitle(cast(ткст) new wxString(title));
		}
		
		public /+virtual+/ проц OnSetTitle(ткст title)
		{
			wxHtmlWindow_OnSetTitle(шхобъ, title);
		}
		
		//-----------------------------------------------------------------------------
		
		static extern(C) private проц staticDoOnCellMouseHover(HtmlWindow объ, ЦУк cell, цел x, цел y)
		{
			объ.OnCellMouseHover(new HtmlCell(cell), x, y);
		}
		
		public /+virtual+/ проц OnCellMouseHover(HtmlCell cell, цел x, цел y)
		{
			// Do nothing here
		}
		
		//-----------------------------------------------------------------------------
		
		static extern(C) private проц staticDoOnCellClicked(HtmlWindow объ, ЦУк cell, цел x, цел y, ЦУк mouseevent)
		{
			объ.OnCellClicked(new HtmlCell(cell), x, y, new MouseEvent(mouseevent));
		}
		
		public /+virtual+/ проц OnCellClicked(HtmlCell cell, цел x, цел y, MouseEvent evt)
		{
			wxHtmlWindow_OnCellClicked(шхобъ, wxObject.SafePtr(cell), x, y, wxObject.SafePtr(evt));
		}
		
		//-----------------------------------------------------------------------------
		
		static extern(C) private проц staticDoOnLinkClicked(HtmlWindow объ, ЦУк link)
		{
			объ.OnLinkClicked(new HtmlLinkInfo(link));
		}
		
		public /+virtual+/ проц OnLinkClicked(HtmlLinkInfo link)
		{
			wxHtmlWindow_OnLinkClicked(шхобъ, wxObject.SafePtr(link));
		}
		
		//-----------------------------------------------------------------------------
		
		static extern(C) private цел staticDoOnOpeningURL(HtmlWindow объ, цел тип, ЦУк url, ЦУк redirect)
		{
			return cast(цел)объ.OnOpeningURL(cast(HtmlURLType) тип, cast(ткст) new wxString(url), cast(ткст) new wxString(redirect));
		}
		
		public HtmlOpeningStatus OnOpeningURL(HtmlURLType тип, ткст url, ткст redirect)
		{
			return cast(HtmlOpeningStatus)wxHtmlWindow_OnOpeningURL(шхобъ, cast(цел)тип, url, redirect);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц SelectAll()
		{
			wxHtmlWindow_SelectAll(шхобъ);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц SelectLine(Точка поз)
		{
			wxHtmlWindow_SelectLine(шхобъ, поз);
		}
		
		//-----------------------------------------------------------------------------
		
		public проц SelectWord(Точка поз)
		{
			wxHtmlWindow_SelectWord(шхобъ, поз);
		}
		
		//-----------------------------------------------------------------------------
		
		public ткст Текст() { return cast(ткст) new wxString(wxHtmlWindow_ToText(шхобъ), да); }
		
		//-----------------------------------------------------------------------------
		
		public ткст SelectionText() { return cast(ткст) new wxString(wxHtmlWindow_SelectionToText(шхобъ), да); }
	}
		
