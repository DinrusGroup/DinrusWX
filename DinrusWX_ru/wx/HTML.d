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
static extern (C) ЦелУкз wxHtmlTag_GetParent(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlTag_GetFirstSibling(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlTag_GetLastSibling(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlTag_GetChildren(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlTag_GetPreviousSibling(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlTag_GetNextSibling(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlTag_GetNextTag(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlTag_GetName(ЦелУкз сам);
static extern (C) бул   wxHtmlTag_HasParam(ЦелУкз сам, ткст par);
static extern (C) ЦелУкз wxHtmlTag_GetParam(ЦелУкз сам, ткст par, бул with_commas);
static extern (C) бул   wxHtmlTag_GetParamAsColour(ЦелУкз сам, ткст par, ЦелУкз clr);
static extern (C) бул   wxHtmlTag_GetParamAsInt(ЦелУкз сам, ткст par, inout цел clr);
static extern (C) цел    wxHtmlTag_ScanParam(ЦелУкз сам, ткст par, ткст format, ЦелУкз param);
static extern (C) ЦелУкз wxHtmlTag_GetAllParams(ЦелУкз сам);
static extern (C) бул   wxHtmlTag_IsEnding(ЦелУкз сам);
static extern (C) бул   wxHtmlTag_HasEnding(ЦелУкз сам);
static extern (C) цел    wxHtmlTag_GetBeginPos(ЦелУкз сам);
static extern (C) цел    wxHtmlTag_GetEndPos1(ЦелУкз сам);
static extern (C) цел    wxHtmlTag_GetEndPos2(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias HtmlTag wxHtmlTag;
public class HtmlTag : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new HtmlTag(ptr);
    }
    //-----------------------------------------------------------------------------
    private static HtmlTag FindObj(ЦелУкз ptr)
    {
        return cast(HtmlTag)НайдиОбъект(ptr, &HtmlTag.Нов);
    }

    public HtmlTag родитель()
    {
        return HtmlTag.FindObj(wxHtmlTag_GetParent(wxobj));
    }

    public HtmlTag FirstSibling()
    {
        return HtmlTag.FindObj(wxHtmlTag_GetFirstSibling(wxobj));
    }

    public HtmlTag LastSibling()
    {
        return HtmlTag.FindObj(wxHtmlTag_GetLastSibling(wxobj));
    }

    public HtmlTag Отпрыски()
    {
        return HtmlTag.FindObj(wxHtmlTag_GetChildren(wxobj));
    }

    //-----------------------------------------------------------------------------

    public HtmlTag PreviousSibling()
    {
        return HtmlTag.FindObj(wxHtmlTag_GetPreviousSibling(wxobj));
    }

    public HtmlTag NextSibling()
    {
        return HtmlTag.FindObj(wxHtmlTag_GetNextSibling(wxobj));
    }

    //-----------------------------------------------------------------------------

    public HtmlTag NextTag()
    {
        return HtmlTag.FindObj(wxHtmlTag_GetNextTag(wxobj));
    }

    //-----------------------------------------------------------------------------

    public ткст Имя()
    {
        return cast(ткст) new wxString(wxHtmlTag_GetName(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public бул HasParam(ткст par)
    {
        return wxHtmlTag_HasParam(wxobj, par);
    }

    public ткст GetParam(ткст par, бул with_commas)
    {
        return cast(ткст) new wxString(wxHtmlTag_GetParam(wxobj, par, with_commas), да);
    }

    //-----------------------------------------------------------------------------

    public бул GetParamAsColour(ткст par, Цвет clr)
    {
        return wxHtmlTag_GetParamAsColour(wxobj, par, wxObject.SafePtr(clr));
    }

    //-----------------------------------------------------------------------------

    public бул GetParamAsInt(ткст par, out цел clr)
    {
        clr = 0;
        return wxHtmlTag_GetParamAsInt(wxobj, par, clr);
    }

    //-----------------------------------------------------------------------------

    public цел ScanParam(ткст par, ткст format, wxObject param)
    {
        return wxHtmlTag_ScanParam(wxobj, par, format, wxObject.SafePtr(param));
    }

    //-----------------------------------------------------------------------------

    public ткст AllParams()
    {
        return cast(ткст) new wxString(wxHtmlTag_GetAllParams(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    /* public бул IsEnding() { return wxHtmlTag_IsEnding(wxobj); } */

    public бул HasEnding()
    {
        return wxHtmlTag_HasEnding(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел BeginPos()
    {
        return wxHtmlTag_GetBeginPos(wxobj);
    }

    public цел EndPos1()
    {
        return wxHtmlTag_GetEndPos1(wxobj);
    }

    public цел EndPos2()
    {
        return wxHtmlTag_GetEndPos2(wxobj);
    }

    //-----------------------------------------------------------------------------
    /+
    public static implicit operator HtmlTag (ЦелУкз объ)
    {
        return cast(HtmlTag)НайдиОбъект(объ, &HtmlTag.Нов);
    }
    +/
}

public abstract class HtmlFilter : wxObject
{
    // TODO

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    /*public abstract бул CanRead(FSFile file);
    public abstract ткст ReadFile(FSFile file);*/
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlCell_ctor();
static extern (C) проц   wxHtmlCell_SetParent(ЦелУкз сам, ЦелУкз p);
static extern (C) ЦелУкз wxHtmlCell_GetParent(ЦелУкз сам);
static extern (C) цел    wxHtmlCell_GetPosX(ЦелУкз сам);
static extern (C) цел    wxHtmlCell_GetPosY(ЦелУкз сам);
static extern (C) цел    wxHtmlCell_GetWidth(ЦелУкз сам);
static extern (C) цел    wxHtmlCell_GetHeight(ЦелУкз сам);
static extern (C) цел    wxHtmlCell_GetDescent(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlCell_GetId(ЦелУкз сам);
static extern (C) проц   wxHtmlCell_SetId(ЦелУкз сам, ткст ид);
static extern (C) ЦелУкз wxHtmlCell_GetNext(ЦелУкз сам);
static extern (C) проц   wxHtmlCell_SetPos(ЦелУкз сам, цел x, цел y);
static extern (C) проц   wxHtmlCell_SetLink(ЦелУкз сам, ЦелУкз link);
static extern (C) проц   wxHtmlCell_SetNext(ЦелУкз сам, ЦелУкз cell);
static extern (C) проц   wxHtmlCell_Layout(ЦелУкз сам, цел w);
static extern (C) проц   wxHtmlCell_Draw(ЦелУкз сам, ЦелУкз dc, цел x, цел y, цел view_y1, цел view_y2, ЦелУкз info);
static extern (C) проц   wxHtmlCell_DrawInvisible(ЦелУкз сам, ЦелУкз dc, цел x, цел y, ЦелУкз info);
static extern (C) ЦелУкз wxHtmlCell_Find(ЦелУкз сам, цел condition, ЦелУкз param);
static extern (C) проц   wxHtmlCell_OnMouseClick(ЦелУкз сам, ЦелУкз родитель, цел x, цел y, ЦелУкз evt);
static extern (C) бул   wxHtmlCell_AdjustPagebreak(ЦелУкз сам, inout цел pagebreak);
static extern (C) проц   wxHtmlCell_SetCanLiveOnPagebreak(ЦелУкз сам, бул can);
static extern (C) проц   wxHtmlCell_GetHorizontalConstraints(ЦелУкз сам, inout цел left, inout цел right);
static extern (C) бул   wxHtmlCell_IsTerminalCell(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlCell_FindCellByPos(ЦелУкз сам, цел x, цел y);
//! \endcond

alias HtmlCell wxHtmlCell;
public class HtmlCell : wxObject
{
    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxHtmlCell_ctor());
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new HtmlCell(ptr);
    }
    public static HtmlCell FindObj(ЦелУкз ptr)
    {
        return cast(HtmlCell)НайдиОбъект(ptr, &HtmlCell.Нов);
    }

    //-----------------------------------------------------------------------------

    public проц родитель(HtmlContainerCell значение)
    {
        wxHtmlCell_SetParent(wxobj, wxObject.SafePtr(значение));
    }
    public HtmlContainerCell родитель()
    {
        return cast(HtmlContainerCell)НайдиОбъект(wxHtmlCell_GetParent(wxobj), &HtmlContainerCell.Нов);
    }

    //-----------------------------------------------------------------------------

    public цел X()
    {
        return wxHtmlCell_GetPosX(wxobj);
    }

    public цел Y()
    {
        return wxHtmlCell_GetPosY(wxobj);
    }

    public цел Ширь()
    {
        return wxHtmlCell_GetWidth(wxobj);
    }

    public цел Высь()
    {
        return wxHtmlCell_GetHeight(wxobj);
    }

    /* helper */
    public цел PosX()
    {
        return X;
    }
    public цел PosY()
    {
        return Y;
    }

    public Точка Позиция()
    {
        return Точка(X,Y);
    }
    public проц  Позиция(Точка тчк)
    {
        УстPos(тчк.X,тчк.Y);
    }

    public Размер размер()
    {
        return Размер(Ширь,Высь);
    }

    public Прямоугольник прям()
    {
        return Прямоугольник(X,Y,Ширь,Высь);
    }

    //-----------------------------------------------------------------------------

    public цел Descent()
    {
        return wxHtmlCell_GetDescent(wxobj);
    }

    //-----------------------------------------------------------------------------

    public  ткст Ид()
    {
        return cast(ткст) new wxString(wxHtmlCell_GetId(wxobj), да);
    }
    public  проц Ид(ткст значение)
    {
        wxHtmlCell_SetId(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public HtmlCell Next()
    {
        return cast(HtmlCell)НайдиОбъект(wxHtmlCell_GetNext(wxobj), &HtmlCell.Нов);
    }
    public проц Next(HtmlCell значение)
    {
        wxHtmlCell_SetNext(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public проц УстPos(цел x, цел y)
    {
        wxHtmlCell_SetPos(wxobj, x, y);
    }

    //-----------------------------------------------------------------------------

    public проц Link(HtmlLinkInfo значение)
    {
        wxHtmlCell_SetLink(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public  проц Раскладка(цел w)
    {
        wxHtmlCell_Layout(wxobj, w);
    }

    //-----------------------------------------------------------------------------

    public  проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info)
    {
        wxHtmlCell_Draw(wxobj, wxObject.SafePtr(dc), x, y, view_y1, view_y2, wxObject.SafePtr(info));
    }

    //-----------------------------------------------------------------------------

    public  проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info)
    {
        wxHtmlCell_DrawInvisible(wxobj, wxObject.SafePtr(dc), x, y, wxObject.SafePtr(info));
    }

    //-----------------------------------------------------------------------------

    public  HtmlCell Find(цел condition, wxObject param)
    {
        return cast(HtmlCell)НайдиОбъект(wxHtmlCell_Find(wxobj, condition, wxObject.SafePtr(param)), &HtmlCell.Нов);
    }

    //-----------------------------------------------------------------------------

    public  проц OnMouseClick(Окно родитель, цел x, цел y, MouseEvent evt)
    {
        wxHtmlCell_OnMouseClick(wxobj, wxObject.SafePtr(родитель), x, y, wxObject.SafePtr(evt));
    }

    //-----------------------------------------------------------------------------

    public  бул AdjustPagebreak(inout цел pagebreak)
    {
        return wxHtmlCell_AdjustPagebreak(wxobj, pagebreak);
    }

    //-----------------------------------------------------------------------------

    public проц CanLiveOnPagebreak(бул значение)
    {
        wxHtmlCell_SetCanLiveOnPagebreak(wxobj, значение);
    }

    //-----------------------------------------------------------------------------
    /*
            public проц GetHorizontalConstraints(out цел left, out цел right)
            {
                left = right = 0;
                wxHtmlCell_GetHorizontalConstraints(wxobj, left, right);
            }
    */
    //-----------------------------------------------------------------------------

    public  бул IsTerminalCell()
    {
        return wxHtmlCell_IsTerminalCell(wxobj);
    }

    //-----------------------------------------------------------------------------

    public HtmlCell FindCellByPos(цел x, цел y)
    {
        return cast(HtmlCell)НайдиОбъект(wxHtmlCell_FindCellByPos(wxobj, x, y), &HtmlCell.Нов);
    }

    //-----------------------------------------------------------------------------
    /+
    public static implicit operator HtmlCell (ЦелУкз объ)
    {
        return cast(HtmlCell)НайдиОбъект(объ, &HtmlCell.Нов);
    }
    +/
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlFontCell_ctor(ЦелУкз шрифт);
static extern (C) проц   wxHtmlFontCell_Draw(ЦелУкз сам, ЦелУкз dc, цел x, цел y, цел view_y1, цел view_y2, ЦелУкз info);
static extern (C) проц   wxHtmlFontCell_DrawInvisible(ЦелУкз сам, ЦелУкз dc, цел x, цел y, ЦелУкз info);
//! \endcond

alias HtmlFontCell wxHtmlFontCell;
public class HtmlFontCell : HtmlCell
{
    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Шрифт шрифт)
    {
        this(wxHtmlFontCell_ctor(wxObject.SafePtr(шрифт)));
    }

    //-----------------------------------------------------------------------------

    public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info)
    {
        wxHtmlFontCell_Draw(wxobj, wxObject.SafePtr(dc), x, y, view_y1, view_y2, wxObject.SafePtr(info));
    }

    //-----------------------------------------------------------------------------

    public override проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info)
    {
        wxHtmlFontCell_DrawInvisible(wxobj, wxObject.SafePtr(dc), x, y, wxObject.SafePtr(info));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlContainerCell_ctor(ЦелУкз родитель);
static extern (C) проц   wxHtmlContainerCell_Layout(ЦелУкз сам, цел w);
static extern (C) проц   wxHtmlContainerCell_Draw(ЦелУкз сам, ЦелУкз dc, цел x, цел y, цел view_y1, цел view_y2, ЦелУкз info);
static extern (C) проц   wxHtmlContainerCell_DrawInvisible(ЦелУкз сам, ЦелУкз dc, цел x, цел y, ЦелУкз info);
static extern (C) бул   wxHtmlContainerCell_AdjustPagebreak(ЦелУкз сам, inout цел pagebreak);
static extern (C) проц   wxHtmlContainerCell_InsertCell(ЦелУкз сам, ЦелУкз cell);
static extern (C) проц   wxHtmlContainerCell_SetAlignHor(ЦелУкз сам, цел al);
static extern (C) цел    wxHtmlContainerCell_GetAlignHor(ЦелУкз сам);
static extern (C) проц   wxHtmlContainerCell_SetAlignVer(ЦелУкз сам, цел al);
static extern (C) цел    wxHtmlContainerCell_GetAlignVer(ЦелУкз сам);
static extern (C) проц   wxHtmlContainerCell_SetIndent(ЦелУкз сам, цел i, цел what, цел units);
static extern (C) цел    wxHtmlContainerCell_GetIndent(ЦелУкз сам, цел ind);
static extern (C) цел    wxHtmlContainerCell_GetIndentUnits(ЦелУкз сам, цел ind);
static extern (C) проц   wxHtmlContainerCell_SetAlign(ЦелУкз сам, ЦелУкз tag);
static extern (C) проц   wxHtmlContainerCell_SetWidthFloat(ЦелУкз сам, цел w, цел units);
static extern (C) проц   wxHtmlContainerCell_SetWidthFloatTag(ЦелУкз сам, ЦелУкз tag, double pixel_scale);
static extern (C) проц   wxHtmlContainerCell_SetMinHeight(ЦелУкз сам, цел h, цел alignment);
static extern (C) проц   wxHtmlContainerCell_SetBackgroundColour(ЦелУкз сам, ЦелУкз clr);
static extern (C) ЦелУкз wxHtmlContainerCell_GetBackgroundColour(ЦелУкз сам);
static extern (C) проц   wxHtmlContainerCell_SetBorder(ЦелУкз сам, ЦелУкз clr1, ЦелУкз clr2);
static extern (C) ЦелУкз wxHtmlContainerCell_GetLink(ЦелУкз сам, цел x, цел y);
static extern (C) ЦелУкз wxHtmlContainerCell_Find(ЦелУкз сам, цел condition, ЦелУкз param);
static extern (C) проц   wxHtmlContainerCell_OnMouseClick(ЦелУкз сам, ЦелУкз родитель, цел x, цел y, ЦелУкз evt);
static extern (C) проц   wxHtmlContainerCell_GetHorizontalConstraints(ЦелУкз сам, inout цел left, inout цел right);
static extern (C) ЦелУкз wxHtmlContainerCell_GetFirstCell(ЦелУкз сам);
static extern (C) бул   wxHtmlContainerCell_IsTerminalCell(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlContainerCell_FindCellByPos(ЦелУкз сам, цел x, цел y);
//! \endcond

alias HtmlContainerCell wxHtmlContainerCell;
public class HtmlContainerCell : HtmlCell
{
    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(HtmlContainerCell родитель)
    {
        this(wxHtmlContainerCell_ctor(wxObject.SafePtr(родитель)));
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new HtmlContainerCell(ptr);
    }

    //-----------------------------------------------------------------------------

    public override проц Раскладка(цел w)
    {
        wxHtmlContainerCell_Layout(wxobj, w);
    }

    //-----------------------------------------------------------------------------

    public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info)
    {
        wxHtmlContainerCell_Draw(wxobj, wxObject.SafePtr(dc), x, y, view_y1, view_y2, wxObject.SafePtr(info));
    }

    //-----------------------------------------------------------------------------

    public override проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info)
    {
        wxHtmlContainerCell_DrawInvisible(wxobj, wxObject.SafePtr(dc), x, y, wxObject.SafePtr(info));
    }

    //-----------------------------------------------------------------------------

    public override бул AdjustPagebreak(inout цел pagebreak)
    {
        return wxHtmlContainerCell_AdjustPagebreak(wxobj, pagebreak);
    }

    //-----------------------------------------------------------------------------

    public проц InsertCell(HtmlCell cell)
    {
        wxHtmlContainerCell_InsertCell(wxobj, wxObject.SafePtr(cell));
    }

    //-----------------------------------------------------------------------------

    public проц AlignHor(цел значение)
    {
        wxHtmlContainerCell_SetAlignHor(wxobj, значение);
    }
    public цел AlignHor()
    {
        return wxHtmlContainerCell_GetAlignHor(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц AlignVer(цел значение)
    {
        wxHtmlContainerCell_SetAlignVer(wxobj, значение);
    }
    public цел AlignVer()
    {
        return wxHtmlContainerCell_GetAlignVer(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц УстIndent(цел i, цел what, цел units)
    {
        wxHtmlContainerCell_SetIndent(wxobj, i, what, units);
    }

    public цел GetIndent(цел ind)
    {
        return wxHtmlContainerCell_GetIndent(wxobj, ind);
    }

    public цел GetIndentUnits(цел ind)
    {
        return wxHtmlContainerCell_GetIndentUnits(wxobj, ind);
    }

    //-----------------------------------------------------------------------------

    public проц Align(HtmlTag значение)
    {
        wxHtmlContainerCell_SetAlign(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public проц УстWidthFloat(цел w, цел units)
    {
        wxHtmlContainerCell_SetWidthFloat(wxobj, w, units);
    }

    public проц УстWidthFloat(HtmlTag tag, double pixel_scale)
    {
        wxHtmlContainerCell_SetWidthFloatTag(wxobj, wxObject.SafePtr(tag), pixel_scale);
    }

    //-----------------------------------------------------------------------------

    public проц УстMinHeight(цел h, цел alignment)
    {
        wxHtmlContainerCell_SetMinHeight(wxobj, h, alignment);
    }

    //-----------------------------------------------------------------------------

    public проц цветФона(Цвет значение)
    {
        wxHtmlContainerCell_SetBackgroundColour(wxobj, wxObject.SafePtr(значение));
    }
    public Цвет цветФона()
    {
        return new Цвет(wxHtmlContainerCell_GetBackgroundColour(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public проц УстBorder(Цвет clr1, Цвет clr2)
    {
        wxHtmlContainerCell_SetBorder(wxobj, wxObject.SafePtr(clr1), wxObject.SafePtr(clr2));
    }

    //-----------------------------------------------------------------------------

    public  HtmlLinkInfo GetLink(цел x, цел y)
    {
        return cast(HtmlLinkInfo)НайдиОбъект(wxHtmlContainerCell_GetLink(wxobj, x, y), &HtmlLinkInfo.Нов);
    }

    //-----------------------------------------------------------------------------

    public override HtmlCell Find(цел condition, wxObject param)
    {
//            return cast(HtmlCell)НайдиОбъект(wxHtmlContainerCell_Find(wxobj, condition, wxObject.SafePtr(param)), &HtmlCell.Нов);
        return HtmlCell.FindObj(wxHtmlContainerCell_Find(wxobj, condition, wxObject.SafePtr(param)));
    }

    //-----------------------------------------------------------------------------

    public override проц OnMouseClick(Окно родитель, цел x, цел y, MouseEvent evt)
    {
        wxHtmlContainerCell_OnMouseClick(wxobj, wxObject.SafePtr(родитель), x, y, wxObject.SafePtr(evt));
    }

    //-----------------------------------------------------------------------------
    /*
            public проц GetHorizontalConstraints(out цел left, out цел right)
            {
                left = right = 0;
                wxHtmlContainerCell_GetHorizontalConstraints(wxobj, left, right);
            }
    */
    //-----------------------------------------------------------------------------
    /*
            public HtmlCell FirstCell() { return HtmlCell.FindObj(wxHtmlContainerCell_GetFirstCell(wxobj)); }
    */
    //-----------------------------------------------------------------------------

    public override бул IsTerminalCell()
    {
        return wxHtmlContainerCell_IsTerminalCell(wxobj);
    }

    //-----------------------------------------------------------------------------

    public override HtmlCell FindCellByPos(цел x, цел y)
    {
        return HtmlCell.FindObj(wxHtmlContainerCell_FindCellByPos(wxobj, x, y));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlColourCell_ctor(ЦелУкз clr, цел флаги);
static extern (C) проц   wxHtmlColourCell_Draw(ЦелУкз сам, ЦелУкз dc, цел x, цел y, цел view_y1, цел view_y2, ЦелУкз info);
static extern (C) проц   wxHtmlColourCell_DrawInvisible(ЦелУкз сам, ЦелУкз dc, цел x, цел y, ЦелУкз info);
//! \endcond

alias HtmlColourCell wxHtmlColourCell;
public class HtmlColourCell : HtmlCell
{
    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public  this(Цвет clr, цел флаги)
    {
        this(wxHtmlColourCell_ctor(wxObject.SafePtr(clr), флаги));
    }

    //-----------------------------------------------------------------------------

    public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info)
    {
        wxHtmlColourCell_Draw(wxobj, wxObject.SafePtr(dc), x, y, view_y1, view_y2, wxObject.SafePtr(info));
    }

    //-----------------------------------------------------------------------------

    public override проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info)
    {
        wxHtmlColourCell_DrawInvisible(wxobj, wxObject.SafePtr(dc), x, y, wxObject.SafePtr(info));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlLinkInfo_ctor();
/*static extern (C) ЦелУкз wxHtmlLinkInfo_ctor(ткст href, ткст target);*/
/*static extern (C) ЦелУкз wxHtmlLinkInfo_ctor(ЦелУкз l);*/
static extern (C) проц   wxHtmlLinkInfo_SetEvent(ЦелУкз сам, ЦелУкз e);
static extern (C) проц   wxHtmlLinkInfo_SetHtmlCell(ЦелУкз сам, ЦелУкз e);
static extern (C) ЦелУкз wxHtmlLinkInfo_GetHref(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlLinkInfo_GetTarget(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlLinkInfo_GetEvent(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlLinkInfo_GetHtmlCell(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias HtmlLinkInfo wxHtmlLinkInfo;
public class HtmlLinkInfo : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public  this()
    {
        super(wxHtmlLinkInfo_ctor());
    }

    //-----------------------------------------------------------------------------

    /*public  this(ткст href, ткст target)
    	{ super(wxHtmlLinkInfo_ctor(href, target)); }*/

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new HtmlCell(ptr);
    }

    //-----------------------------------------------------------------------------

    /*public  this(HtmlLinkInfo l)
    	{ super(wxHtmlLinkInfo_ctor(wxObject.SafePtr(l))); }*/
    //-----------------------------------------------------------------------------

    public проц event(MouseEvent значение)
    {
        wxHtmlLinkInfo_SetEvent(wxobj, wxObject.SafePtr(значение));
    }
    public MouseEvent event()
    {
        return cast(MouseEvent)НайдиОбъект(wxHtmlLinkInfo_GetEvent(wxobj), cast(wxObject function (ЦелУкз))&MouseEvent.Нов);
    }

    //-----------------------------------------------------------------------------

    public ткст Href()
    {
        return cast(ткст) new wxString(wxHtmlLinkInfo_GetHref(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public ткст Target()
    {
        return cast(ткст) new wxString(wxHtmlLinkInfo_GetTarget(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public HtmlCell htmlCell()
    {
        return cast(HtmlCell)НайдиОбъект(wxHtmlLinkInfo_GetHtmlCell(wxobj), &HtmlCell.Нов);
    }
    public проц htmlCell(HtmlCell значение)
    {
        wxHtmlLinkInfo_SetHtmlCell(wxobj, wxObject.SafePtr(значение));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlWidgetCell_ctor(ЦелУкз wnd, цел w);
static extern (C) проц   wxHtmlWidgetCell_Draw(ЦелУкз сам, ЦелУкз dc, цел x, цел y, цел view_y1, цел view_y2, ЦелУкз info);
static extern (C) проц   wxHtmlWidgetCell_DrawInvisible(ЦелУкз сам, ЦелУкз dc, цел x, цел y, ЦелУкз info);
static extern (C) проц   wxHtmlWidgetCell_Layout(ЦелУкз сам, цел w);
//! \endcond

//-----------------------------------------------------------------------------

alias HtmlWidgetCell wxHtmlWidgetCell;
public class HtmlWidgetCell : HtmlCell
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно wnd, цел w)
    {
        this(wxHtmlWidgetCell_ctor(wxObject.SafePtr(wnd), w));
    }

    //-----------------------------------------------------------------------------

    public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info)
    {
        wxHtmlWidgetCell_Draw(wxobj, wxObject.SafePtr(dc), x, y, view_y1, view_y2, wxObject.SafePtr(info));
    }

    //-----------------------------------------------------------------------------

    public override проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info)
    {
        wxHtmlWidgetCell_DrawInvisible(wxobj, wxObject.SafePtr(dc), x, y, wxObject.SafePtr(info));
    }

    //-----------------------------------------------------------------------------

    public override проц Раскладка(цел w)
    {
        wxHtmlWidgetCell_Layout(wxobj, w);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlWordCell_ctor(ткст word, ЦелУкз dc);
static extern (C) проц   wxHtmlWordCell_Draw(ЦелУкз сам, ЦелУкз dc, цел x, цел y, цел view_y1, цел view_y2, ЦелУкз info);
//! \endcond

//-----------------------------------------------------------------------------

alias HtmlWordCell wxHtmlWordCell;
public class HtmlWordCell : HtmlCell
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public  this(ткст word, DC dc)
    {
        this(wxHtmlWordCell_ctor(word, wxObject.SafePtr(dc)));
    }

    //-----------------------------------------------------------------------------

    public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info)
    {
        wxHtmlWordCell_Draw(wxobj, wxObject.SafePtr(dc), x, y, view_y1, view_y2, wxObject.SafePtr(info));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) бул   wxHtmlFilterPlainText_CanRead(ЦелУкз сам, ЦелУкз file);
static extern (C) ЦелУкз wxHtmlFilterPlainText_ReadFile(ЦелУкз сам, ЦелУкз file);
//! \endcond

//-----------------------------------------------------------------------------

alias HtmlFilterPlainText wxHtmlFilterPlainText;
public class HtmlFilterPlainText : HtmlFilter
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //-----------------------------------------------------------------------------

    /*public override бул CanRead(FSFile file)
    {
        return wxHtmlFilterPlainText_CanRead(wxobj, wxObject.SafePtr(file));
    }

    //-----------------------------------------------------------------------------

    public override ткст ReadFile(FSFile file)
    {
        return cast(ткст) new wxString(wxHtmlFilterPlainText_ReadFile(wxobj, wxObject.SafePtr(file)));
    }
    }

    //-----------------------------------------------------------------------------

           //! \cond EXTERN
           static extern (C) бул   wxHtmlFilterHTML_CanRead(ЦелУкз сам, ЦелУкз file);
           static extern (C) ЦелУкз wxHtmlFilterHTML_ReadFile(ЦелУкз сам, ЦелУкз file);
           //! \endcond

           //-----------------------------------------------------------------------------

       alias HtmlFilterHTML wxHtmlFilterHTML;
       public class HtmlFilterHTML : HtmlFilter
       {
           public this(ЦелУкз wxobj)
               { super(wxobj); }

           //-----------------------------------------------------------------------------

           /*public override бул CanRead(FSFile file)
           {
               return wxHtmlFilterHTML_CanRead(wxobj, wxObject.SafePtr(file));
           }

           //-----------------------------------------------------------------------------

           public override ткст ReadFile(FSFile file)
           {
               return cast(ткст) new wxString(wxHtmlFilterHTML_ReadFile(wxobj, wxObject.SafePtr(file)));
           }*/
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlTagsModule_ctor();
static extern (C) бул   wxHtmlTagsModule_OnInit(ЦелУкз сам);
static extern (C) проц   wxHtmlTagsModule_OnExit(ЦелУкз сам);
static extern (C) проц   wxHtmlTagsModule_FillHandlersTable(ЦелУкз сам, ЦелУкз parser);
//! \endcond

//-----------------------------------------------------------------------------

alias HtmlTagsModule wxHtmlTagsModule;
public class HtmlTagsModule : wxObject // TODO: Module
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxHtmlTagsModule_ctor());
    }

    //-----------------------------------------------------------------------------

    public бул ПоИниц()
    {
        return wxHtmlTagsModule_OnInit(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц ПоВыходу()
    {
        wxHtmlTagsModule_OnExit(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц FillHandlersTable(HtmlWinParser  parser)
    {
        wxHtmlTagsModule_FillHandlersTable(wxobj, wxObject.SafePtr(parser));
    }
}

//-----------------------------------------------------------------------------

public abstract class HtmlWinTagHandler : HtmlTagHandler
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlWinParser_ctor(ЦелУкз wnd);
static extern (C) проц   wxHtmlWinParser_InitParser(ЦелУкз сам, ткст source);
static extern (C) проц   wxHtmlWinParser_DoneParser(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlWinParser_GetProduct(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlWinParser_OpenURL(ЦелУкз сам, цел тип, ткст url);
static extern (C) проц   wxHtmlWinParser_SetDC(ЦелУкз сам, ЦелУкз dc, double pixel_scale);
static extern (C) ЦелУкз wxHtmlWinParser_GetDC(ЦелУкз сам);
static extern (C) double wxHtmlWinParser_GetPixelScale(ЦелУкз сам);
static extern (C) цел    wxHtmlWinParser_GetCharHeight(ЦелУкз сам);
static extern (C) цел    wxHtmlWinParser_GetCharWidth(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlWinParser_GetWindow(ЦелУкз сам);
static extern (C) проц   wxHtmlWinParser_SetFonts(ЦелУкз сам, ткст normal_face, ткст fixed_face, цел* sizes);
static extern (C) проц   wxHtmlWinParser_AddModule(ЦелУкз сам, ЦелУкз mod);
static extern (C) проц   wxHtmlWinParser_RemoveModule(ЦелУкз сам, ЦелУкз mod);
static extern (C) ЦелУкз wxHtmlWinParser_GetContainer(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlWinParser_OpenContainer(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlWinParser_SetContainer(ЦелУкз сам, ЦелУкз c);
static extern (C) ЦелУкз wxHtmlWinParser_CloseContainer(ЦелУкз сам);
static extern (C) цел    wxHtmlWinParser_GetFontSize(ЦелУкз сам);
static extern (C) проц   wxHtmlWinParser_SetFontSize(ЦелУкз сам, цел s);
static extern (C) цел    wxHtmlWinParser_GetFontBold(ЦелУкз сам);
static extern (C) проц   wxHtmlWinParser_SetFontBold(ЦелУкз сам, цел x);
static extern (C) цел    wxHtmlWinParser_GetFontItalic(ЦелУкз сам);
static extern (C) проц   wxHtmlWinParser_SetFontItalic(ЦелУкз сам, цел x);
static extern (C) цел    wxHtmlWinParser_GetFontUnderlined(ЦелУкз сам);
static extern (C) проц   wxHtmlWinParser_SetFontUnderlined(ЦелУкз сам, цел x);
static extern (C) цел    wxHtmlWinParser_GetFontFixed(ЦелУкз сам);
static extern (C) проц   wxHtmlWinParser_SetFontFixed(ЦелУкз сам, цел x);
static extern (C) ЦелУкз wxHtmlWinParser_GetFontFace(ЦелУкз сам);
static extern (C) проц   wxHtmlWinParser_SetFontFace(ЦелУкз сам, ткст face);
static extern (C) цел    wxHtmlWinParser_GetAlign(ЦелУкз сам);
static extern (C) проц   wxHtmlWinParser_SetAlign(ЦелУкз сам, цел a);
static extern (C) ЦелУкз wxHtmlWinParser_GetLinkColor(ЦелУкз сам);
static extern (C) проц   wxHtmlWinParser_SetLinkColor(ЦелУкз сам, ЦелУкз clr);
static extern (C) ЦелУкз wxHtmlWinParser_GetActualColor(ЦелУкз сам);
static extern (C) проц   wxHtmlWinParser_SetActualColor(ЦелУкз сам, ЦелУкз clr);
static extern (C) ЦелУкз wxHtmlWinParser_GetLink(ЦелУкз сам);
static extern (C) проц   wxHtmlWinParser_SetLink(ЦелУкз сам, ЦелУкз link);
static extern (C) ЦелУкз wxHtmlWinParser_CreateCurrentFont(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias HtmlWinParser wxHtmlWinParser;
public class HtmlWinParser : HtmlParser
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(HtmlWindow wnd)
    {
        super(wxHtmlWinParser_ctor(wxObject.SafePtr(wnd)));
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new HtmlWinParser(ptr);
    }
    //-----------------------------------------------------------------------------

    public override проц InitParser(ткст source)
    {
        wxHtmlWinParser_InitParser(wxobj, source);
    }

    //-----------------------------------------------------------------------------

    public override проц DoneParser()
    {
        wxHtmlWinParser_DoneParser(wxobj);
    }

    //-----------------------------------------------------------------------------

    public override wxObject Product()
    {
//FIXME            return НайдиОбъект(wxHtmlWinParser_GetProduct(wxobj), typeof(wxObject));
        return НайдиОбъект(wxHtmlWinParser_GetProduct(wxobj));
    }

    //-----------------------------------------------------------------------------

    /*public FSFile OpenURL(HtmlURLType тип, ткст url)
    {
        return wxHtmlWinParser_OpenURL(wxobj, wxObject.SafePtr(тип), url);
    }*/

    //-----------------------------------------------------------------------------

    public проц УстDC(DC dc, double pixel_scale)
    {
        wxHtmlWinParser_SetDC(wxobj, wxObject.SafePtr(dc), pixel_scale);
    }

    //-----------------------------------------------------------------------------

    public DC GetDC()
    {
        return cast(DC)НайдиОбъект(wxHtmlWinParser_GetDC(wxobj), &DC.Нов);
    }

    //-----------------------------------------------------------------------------

    public double PixelScale()
    {
        return wxHtmlWinParser_GetPixelScale(wxobj);
    }

    //-----------------------------------------------------------------------------

    public цел ВысьСим()
    {
        return wxHtmlWinParser_GetCharHeight(wxobj);
    }

    public цел ШирьСим()
    {
        return wxHtmlWinParser_GetCharWidth(wxobj);
    }

    //-----------------------------------------------------------------------------

    public HtmlWindow окно()
    {
        return cast(HtmlWindow)НайдиОбъект(wxHtmlWinParser_GetWindow(wxobj), &HtmlWindow.Нов);
    }

    //-----------------------------------------------------------------------------

    public проц УстFonts(ткст normal_face, ткст fixed_face, цел[] sizes)
    {
        wxHtmlWinParser_SetFonts(wxobj, normal_face, fixed_face, sizes.ptr);
    }

    //-----------------------------------------------------------------------------

    public проц AddModule(HtmlTagsModule mod)
    {
        wxHtmlWinParser_AddModule(wxobj, wxObject.SafePtr(mod));
    }

    public проц RemoveModule(HtmlTagsModule mod)
    {
        wxHtmlWinParser_RemoveModule(wxobj, wxObject.SafePtr(mod));
    }

    //-----------------------------------------------------------------------------

    public HtmlContainerCell Container()
    {
        return cast(HtmlContainerCell)НайдиОбъект(wxHtmlWinParser_GetContainer(wxobj), &HtmlContainerCell.Нов);
    }

    public HtmlContainerCell УстContainter(HtmlContainerCell cont)
    {
        return cast(HtmlContainerCell)НайдиОбъект(wxHtmlWinParser_SetContainer(wxobj, wxObject.SafePtr(cont)), &HtmlContainerCell.Нов);
    }

    //-----------------------------------------------------------------------------

    public HtmlContainerCell OpenContainer()
    {
        return cast(HtmlContainerCell)НайдиОбъект(wxHtmlWinParser_OpenContainer(wxobj), &HtmlContainerCell.Нов);
    }

    public HtmlContainerCell CloseContainer()
    {
        return cast(HtmlContainerCell)НайдиОбъект(wxHtmlWinParser_CloseContainer(wxobj), &HtmlContainerCell.Нов);
    }

    //-----------------------------------------------------------------------------

    public цел FontSize()
    {
        return wxHtmlWinParser_GetFontSize(wxobj);
    }
    public проц FontSize(цел значение)
    {
        wxHtmlWinParser_SetFontSize(wxobj, значение);
    }

    public цел FontBold()
    {
        return wxHtmlWinParser_GetFontBold(wxobj);
    }
    public проц FontBold(цел значение)
    {
        wxHtmlWinParser_SetFontBold(wxobj, значение);
    }

    public цел FontItalic()
    {
        return wxHtmlWinParser_GetFontItalic(wxobj);
    }
    public проц FontItalic(цел значение)
    {
        wxHtmlWinParser_SetFontItalic(wxobj, значение);
    }

    public цел FontUnderlined()
    {
        return wxHtmlWinParser_GetFontUnderlined(wxobj);
    }
    public проц FontUnderlined(цел значение)
    {
        wxHtmlWinParser_SetFontUnderlined(wxobj, значение);
    }

    public цел FontFixed()
    {
        return wxHtmlWinParser_GetFontFixed(wxobj);
    }
    public проц FontFixed(цел значение)
    {
        wxHtmlWinParser_SetFontFixed(wxobj, значение);
    }

    public ткст FontFace()
    {
        return cast(ткст) new wxString(wxHtmlWinParser_GetFontFace(wxobj), да);
    }
    public проц FontFace(ткст значение)
    {
        wxHtmlWinParser_SetFontFace(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public цел Align()
    {
        return wxHtmlWinParser_GetAlign(wxobj);
    }
    public проц Align(цел значение)
    {
        wxHtmlWinParser_SetAlign(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public Цвет LinkColor()
    {
        return new Цвет(wxHtmlWinParser_GetLinkColor(wxobj), да);
    }
    public проц LinkColor(Цвет значение)
    {
        wxHtmlWinParser_SetLinkColor(wxobj, wxObject.SafePtr(значение));
    }

    public Цвет ActualColor()
    {
        return new Цвет(wxHtmlWinParser_GetActualColor(wxobj), да);
    }
    public проц ActualColor(Цвет значение)
    {
        wxHtmlWinParser_SetActualColor(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public HtmlLinkInfo Link()
    {
        return cast(HtmlLinkInfo)НайдиОбъект(wxHtmlWinParser_GetLink(wxobj), &HtmlLinkInfo.Нов);
    }
    public проц Link(HtmlLinkInfo значение)
    {
        wxHtmlWinParser_SetLink(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public Шрифт CreateCurrentFont()
    {
        return new Шрифт(wxHtmlWinParser_CreateCurrentFont(wxobj));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) проц   wxHtmlTagHandler_SetParser(ЦелУкз сам, ЦелУкз parser);
//! \endcond

//-----------------------------------------------------------------------------

public abstract class HtmlTagHandler : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Parser(HtmlParser значение)
    {
        wxHtmlTagHandler_SetParser(wxobj, wxObject.SafePtr(значение));
    }

    //-----------------------------------------------------------------------------

    public abstract ткст GetSupportedTags();
    public abstract бул HandleTag(HtmlTag tag);
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlEntitiesParser_ctor();
static extern (C) проц   wxHtmlEntitiesParser_SetEncoding(ЦелУкз сам, цел кодировка);
static extern (C) ЦелУкз wxHtmlEntitiesParser_Parse(ЦелУкз сам, ткст input);
static extern (C) char   wxHtmlEntitiesParser_GetEntityChar(ЦелУкз сам, ткст entity);
static extern (C) char   wxHtmlEntitiesParser_GetCharForCode(ЦелУкз сам, бцел code);
//! \endcond

//-----------------------------------------------------------------------------

alias HtmlEntitiesParser wxHtmlEntitiesParser;
public class HtmlEntitiesParser : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public  this()
    {
        super(wxHtmlEntitiesParser_ctor());
    }

    //-----------------------------------------------------------------------------

    public проц Кодировка(FontEncoding значение)
    {
        wxHtmlEntitiesParser_SetEncoding(wxobj, cast(цел)значение);
    }

    //-----------------------------------------------------------------------------

    public ткст Parse(ткст input)
    {
        return cast(ткст) new wxString(wxHtmlEntitiesParser_Parse(wxobj, input), да);
    }

    //-----------------------------------------------------------------------------

    public char GetEntityChar(ткст entity)
    {
        return wxHtmlEntitiesParser_GetEntityChar(wxobj, entity);
    }

    public char GetCharForCode(цел code)
    {
        return wxHtmlEntitiesParser_GetCharForCode(wxobj, cast(бцел)code);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) проц   wxHtmlParser_SetFS(ЦелУкз сам, ЦелУкз fs);
static extern (C) ЦелУкз wxHtmlParser_GetFS(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlParser_OpenURL(ЦелУкз сам, цел тип, ткст url);
static extern (C) ЦелУкз wxHtmlParser_Parse(ЦелУкз сам, ткст source);
static extern (C) проц   wxHtmlParser_InitParser(ЦелУкз сам, ткст source);
static extern (C) проц   wxHtmlParser_DoneParser(ЦелУкз сам);
static extern (C) проц   wxHtmlParser_StopParsing(ЦелУкз сам);
static extern (C) проц   wxHtmlParser_DoParsing(ЦелУкз сам, цел begin_pos, цел end_pos);
static extern (C) проц   wxHtmlParser_DoParsingAll(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlParser_GetCurrentTag(ЦелУкз сам);
static extern (C) проц   wxHtmlParser_AddTagHandler(ЦелУкз сам, ЦелУкз обработчик);
static extern (C) проц   wxHtmlParser_PushTagHandler(ЦелУкз сам, ЦелУкз обработчик, ткст tags);
static extern (C) проц   wxHtmlParser_PopTagHandler(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlParser_GetSource(ЦелУкз сам);
static extern (C) проц   wxHtmlParser_SetSource(ЦелУкз сам, ткст src);
static extern (C) проц   wxHtmlParser_SetSourceAndSaveState(ЦелУкз сам, ткст src);
static extern (C) бул   wxHtmlParser_RestoreState(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlParser_ExtractCharsetInformation(ЦелУкз сам, ткст markup);
//! \endcond

//-----------------------------------------------------------------------------

public abstract class HtmlParser : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //-----------------------------------------------------------------------------

    /*public проц УстFS(FileSystem fs)
    {
        wxHtmlParser_SetFS(wxobj, wxObject.SafePtr(fs));
    }

    //-----------------------------------------------------------------------------

    public FileSystem GetFS()
    {
        return wxHtmlParser_GetFS(wxobj);
    }

    //-----------------------------------------------------------------------------

    public FSFile OpenURL(HtmlURLType тип, ткст url)
    {
        return wxHtmlParser_OpenURL(wxobj, wxObject.SafePtr(тип), url);
    }*/

    //-----------------------------------------------------------------------------

    public wxObject Parse(ткст source)
    {
        return new wxObject(wxHtmlParser_Parse(wxobj, source));
    }

    //-----------------------------------------------------------------------------

    public  проц InitParser(ткст source)
    {
        wxHtmlParser_InitParser(wxobj, source);
    }

    //-----------------------------------------------------------------------------

    public  проц DoneParser()
    {
        wxHtmlParser_DoneParser(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц StopParsing()
    {
        wxHtmlParser_StopParsing(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц DoParsing(цел begin_pos, цел end_pos)
    {
        wxHtmlParser_DoParsing(wxobj, begin_pos, end_pos);
    }

    //-----------------------------------------------------------------------------

    public проц DoParsing()
    {
        wxHtmlParser_DoParsingAll(wxobj);
    }

    //-----------------------------------------------------------------------------

    public HtmlTag GetCurrentTag()
    {
        return HtmlTag.FindObj(wxHtmlParser_GetCurrentTag(wxobj));
    }

    //-----------------------------------------------------------------------------

    public abstract wxObject Product();

    //-----------------------------------------------------------------------------

    public проц AddTagHandler(HtmlTagHandler обработчик)
    {
        wxHtmlParser_AddTagHandler(wxobj, wxObject.SafePtr(обработчик));
    }

    //-----------------------------------------------------------------------------

    public проц PushTagHandler(HtmlTagHandler обработчик, ткст tags)
    {
        wxHtmlParser_PushTagHandler(wxobj, wxObject.SafePtr(обработчик), tags);
    }

    //-----------------------------------------------------------------------------

    public проц PopTagHandler()
    {
        wxHtmlParser_PopTagHandler(wxobj);
    }

    //-----------------------------------------------------------------------------

    public ткст Source()
    {
        return cast(ткст) new wxString(wxHtmlParser_GetSource(wxobj), да);
    }
    public проц Source(ткст значение)
    {
        wxHtmlParser_SetSource(wxobj, значение);
    }

    public проц SourceAndSaveState(ткст значение)
    {
        wxHtmlParser_SetSourceAndSaveState(wxobj, значение);
    }

    public бул RestoreState()
    {
        return wxHtmlParser_RestoreState(wxobj);
    }

    //-----------------------------------------------------------------------------

    public ткст ExtractCharsetInformation(ткст markup)
    {
        return cast(ткст) new wxString(wxHtmlParser_ExtractCharsetInformation(wxobj, markup), да);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) цел    wxHtmlProcessor_GetPriority(ЦелУкз сам);
static extern (C) проц   wxHtmlProcessor_Enable(ЦелУкз сам, бул вкл);
static extern (C) бул   wxHtmlProcessor_IsEnabled(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

public abstract class HtmlProcessor : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    //-----------------------------------------------------------------------------

    public abstract ткст Process(ткст текст);

    //-----------------------------------------------------------------------------

    public цел Priority()
    {
        return wxHtmlProcessor_GetPriority(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Активен(бул значение)
    {
        wxHtmlProcessor_Enable(wxobj, значение);
    }
    public бул Активен()
    {
        return wxHtmlProcessor_IsEnabled(wxobj);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlRenderingInfo_ctor();
static extern (C) проц wxHtmlRenderingInfo_dtor(ЦелУкз сам);
static extern (C) проц wxHtmlRenderingInfo_SetSelection(ЦелУкз сам, ЦелУкз s);
static extern (C) ЦелУкз wxHtmlRenderingInfo_GetSelection(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias HtmlRenderingInfo wxHtmlRenderingInfo;
public class HtmlRenderingInfo : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this()
    {
        this(wxHtmlRenderingInfo_ctor(), да);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxHtmlRenderingInfo_dtor(wxobj);
    }

    //-----------------------------------------------------------------------------

    public HtmlSelection Selection()
    {
        return cast(HtmlSelection)НайдиОбъект(wxHtmlRenderingInfo_GetSelection(wxobj), &HtmlSelection.Нов);
    }
    public проц Selection(HtmlSelection значение)
    {
        wxHtmlRenderingInfo_SetSelection(wxobj, wxObject.SafePtr(значение));
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlSelection_ctor();
static extern (C) проц wxHtmlSelection_dtor(ЦелУкз сам);
static extern (C) проц wxHtmlSelection_Set(ЦелУкз сам, inout Точка fromPos, ЦелУкз fromCell, inout Точка toPos, ЦелУкз toCell);
static extern (C) проц wxHtmlSelection_Set2(ЦелУкз сам, ЦелУкз fromCell, ЦелУкз toCell);
static extern (C) ЦелУкз wxHtmlSelection_GetFromCell(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlSelection_GetToCell(ЦелУкз сам);
static extern (C) проц wxHtmlSelection_GetFromPos(ЦелУкз сам, out Точка fromPos);
static extern (C) проц wxHtmlSelection_GetToPos(ЦелУкз сам, out Точка toPos);
static extern (C) проц wxHtmlSelection_GetFromPrivPos(ЦелУкз сам, out Точка fromPrivPos);
static extern (C) проц wxHtmlSelection_GetToPrivPos(ЦелУкз сам, out Точка toPrivPos);
static extern (C) проц wxHtmlSelection_SetFromPrivPos(ЦелУкз сам, inout Точка поз);
static extern (C) проц wxHtmlSelection_SetToPrivPos(ЦелУкз сам, inout Точка поз);
static extern (C) проц wxHtmlSelection_ClearPrivPos(ЦелУкз сам);
static extern (C) бул wxHtmlSelection_IsEmpty(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias HtmlSelection wxHtmlSelection;
public class HtmlSelection : wxObject
{
    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    private this(ЦелУкз wxobj, бул memOwn)
    {
        super(wxobj);
        this.memOwn = memOwn;
    }

    public this()
    {
        this(wxHtmlSelection_ctor(), да);
    }

    public static wxObject Нов(ЦелУкз ptr)
    {
        return new HtmlSelection(ptr);
    }

    //---------------------------------------------------------------------

    override protected проц dtor()
    {
        wxHtmlSelection_dtor(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц Уст(Точка fromPos, HtmlCell fromCell, Точка toPos, HtmlCell toCell)
    {
        wxHtmlSelection_Set(wxobj, fromPos, wxObject.SafePtr(fromCell), toPos, wxObject.SafePtr(toCell));
    }

    public проц Уст(HtmlCell fromCell, HtmlCell toCell)
    {
        wxHtmlSelection_Set2(wxobj, wxObject.SafePtr(fromCell), wxObject.SafePtr(toCell));
    }

    //-----------------------------------------------------------------------------

    public HtmlCell FromCell()
    {
        return cast(HtmlCell)НайдиОбъект(wxHtmlSelection_GetFromCell(wxobj), &HtmlCell.Нов);
    }

    public HtmlCell ToCell()
    {
        return cast(HtmlCell)НайдиОбъект(wxHtmlSelection_GetToCell(wxobj), &HtmlCell.Нов);
    }

    //-----------------------------------------------------------------------------

    public Точка FromPos()
    {
        Точка tpoint;
        wxHtmlSelection_GetFromPos(wxobj, tpoint);
        return tpoint;
    }

    public Точка ToPos()
    {
        Точка tpoint;
        wxHtmlSelection_GetToPos(wxobj, tpoint);
        return tpoint;
    }

    //-----------------------------------------------------------------------------

    public Точка FromPrivPos()
    {
        Точка tpoint;
        wxHtmlSelection_GetFromPrivPos(wxobj, tpoint);
        return tpoint;
    }

    public проц FromPrivPos(Точка значение)
    {
        wxHtmlSelection_SetFromPrivPos(wxobj, значение);
    }

    public Точка ToPrivPos()
    {
        Точка tpoint;
        wxHtmlSelection_GetToPrivPos(wxobj, tpoint);
        return tpoint;
    }

    public проц ToPrivPos(Точка значение)
    {
        wxHtmlSelection_SetToPrivPos(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц ClearPrivPos()
    {
        wxHtmlSelection_ClearPrivPos(wxobj);
    }

    //-----------------------------------------------------------------------------

    public бул Empty()
    {
        return wxHtmlSelection_IsEmpty(wxobj);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
static extern (C) ЦелУкз wxHtmlEasyPrinting_ctor(ткст имя, ЦелУкз родитель);
static extern (C) бул   wxHtmlEasyPrinting_PreviewFile(ЦелУкз сам, ткст htmlfile);
static extern (C) бул   wxHtmlEasyPrinting_PreviewText(ЦелУкз сам, ткст htmltext, ткст basepath);
static extern (C) бул   wxHtmlEasyPrinting_PrintFile(ЦелУкз сам, ткст htmlfile);
static extern (C) бул   wxHtmlEasyPrinting_PrintText(ЦелУкз сам, ткст htmltext, ткст basepath);
//static extern (C) проц   wxHtmlEasyPrinting_PrinterУстup(ЦелУкз сам);
static extern (C) проц   wxHtmlEasyPrinting_PageУстup(ЦелУкз сам);
static extern (C) проц   wxHtmlEasyPrinting_SetHeader(ЦелУкз сам, ткст header, цел pg);
static extern (C) проц   wxHtmlEasyPrinting_SetFooter(ЦелУкз сам, ткст footer, цел pg);
static extern (C) проц   wxHtmlEasyPrinting_SetFonts(ЦелУкз сам, ткст normal_face, ткст fixed_face, цел* sizes);
static extern (C) проц   wxHtmlEasyPrinting_SetStandardFonts(ЦелУкз сам, цел Размер, ткст normal_face, ткст fixed_face);
static extern (C) ЦелУкз wxHtmlEasyPrinting_GetPrintData(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlEasyPrinting_GetPageУстupData(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias HtmlEasyPrinting wxHtmlEasyPrinting;
public class HtmlEasyPrinting : wxObject
{
    public const цел wxPAGE_ODD	= 0;
    public const цел wxPAGE_EVEN	= 1;
    public const цел wxPAGE_ALL	= 2;

    //-----------------------------------------------------------------------------

    public this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        this("Printing", null);
    }

    public this(ткст имя)
    {
        this(имя, null);
    }

    public this(ткст имя, Окно parentWindow)
    {
        super(wxHtmlEasyPrinting_ctor(имя, wxObject.SafePtr(parentWindow)));
    }

    //-----------------------------------------------------------------------------

    public бул PreviewFile(ткст htmlfile)
    {
        return wxHtmlEasyPrinting_PreviewFile(wxobj, htmlfile);
    }

    //-----------------------------------------------------------------------------

    public бул PreviewText(ткст htmltext)
    {
        return PreviewText(htmltext, "");
    }

    public бул PreviewText(ткст htmltext, ткст basepath)
    {
        return wxHtmlEasyPrinting_PreviewText(wxobj, htmltext, basepath);
    }

    //-----------------------------------------------------------------------------

    public бул PrintFile(ткст htmlfile)
    {
        return wxHtmlEasyPrinting_PrintFile(wxobj, htmlfile);
    }

    //-----------------------------------------------------------------------------

    public бул PrintText(ткст htmltext)
    {
        return PrintText(htmltext, "");
    }

    public бул PrintText(ткст htmltext, ткст basepath)
    {
        return wxHtmlEasyPrinting_PrintText(wxobj, htmltext, basepath);
    }

    //-----------------------------------------------------------------------------

    /*public проц PrinterУстup()
    {
    	wxHtmlEasyPrinting_PrinterУстup(wxobj);
    }*/

    //-----------------------------------------------------------------------------

    public проц PageУстup()
    {
        wxHtmlEasyPrinting_PageУстup(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц УстHeader(ткст header)
    {
        УстHeader(header, wxPAGE_ALL);
    }

    public проц УстHeader(ткст header, цел pg)
    {
        wxHtmlEasyPrinting_SetHeader(wxobj, header, pg);
    }

    //-----------------------------------------------------------------------------

    public проц УстFooter(ткст footer)
    {
        УстFooter(footer, wxPAGE_ALL);
    }

    public проц УстFooter(ткст footer, цел pg)
    {
        wxHtmlEasyPrinting_SetFooter(wxobj, footer, pg);
    }

    //-----------------------------------------------------------------------------

    public проц УстFonts(ткст normal_face, ткст fixed_face)
    {
        УстFonts(normal_face, fixed_face, null);
    }

    public проц УстFonts(ткст normal_face, ткст fixed_face, цел[] sizes)
    {
        wxHtmlEasyPrinting_SetFonts(wxobj, normal_face, fixed_face, sizes.ptr);
    }

    //-----------------------------------------------------------------------------

    public проц УстStandardFonts()
    {
        УстStandardFonts(-1, "", "");
    }

    public проц УстStandardFonts(цел Размер)
    {
        УстStandardFonts(Размер, "", "");
    }

    public проц УстStandardFonts(цел Размер, ткст normal_face)
    {
        УстStandardFonts(Размер, normal_face, "");
    }

    public проц УстStandardFonts(цел Размер, ткст normal_face, ткст fixed_face)
    {
        wxHtmlEasyPrinting_SetStandardFonts(wxobj, Размер, normal_face, fixed_face);
    }

    //-----------------------------------------------------------------------------

    public PrintData printData()
    {
        return cast(PrintData)НайдиОбъект(wxHtmlEasyPrinting_GetPrintData(wxobj), &PrintData.Нов);
    }

    //-----------------------------------------------------------------------------

    public PageУстupDialogData PageУстupData()
    {
        return cast(PageУстupDialogData)НайдиОбъект(wxHtmlEasyPrinting_GetPageУстupData(wxobj), &PageУстupDialogData.Нов);
    }
}

//-----------------------------------------------------------------------------

//! \cond EXTERN
extern (C)
{
    alias проц function(HtmlWindow объ, ЦелУкз link) Virtual_OnLinkClicked;
    alias проц function(HtmlWindow объ, ЦелУкз титул) Virtual_OnУстTitle;
    alias проц function(HtmlWindow объ, ЦелУкз cell, цел x, цел y) Virtual_OnCellMouseHover;
    alias проц function(HtmlWindow объ, ЦелУкз cell, цел x, цел y, ЦелУкз mouseevent) Virtual_OnCellClicked;
    alias цел function(HtmlWindow объ, цел тип, ЦелУкз url, ЦелУкз redirect) Virtual_OnOpeningURL;
}

static extern (C) ЦелУкз wxHtmlWindow_ctor();
static extern (C) проц   wxHtmlWindow_RegisterVirtual(ЦелУкз сам, HtmlWindow объ,
        Virtual_OnLinkClicked onLinkClicked,
        Virtual_OnУстTitle onУстTitle,
        Virtual_OnCellMouseHover onCellMouseHover,
        Virtual_OnCellClicked onCellClicked,
        Virtual_OnOpeningURL onOpeningURL);
static extern (C) бул   wxHtmlWindow_Create(ЦелУкз сам, ЦелУкз родитель, цел ид, inout Точка поз, inout Размер Размер, бцел стиль, ткст имя);
static extern (C) бул   wxHtmlWindow_SetPage(ЦелУкз сам, ткст source);
static extern (C) бул   wxHtmlWindow_AppendToPage(ЦелУкз сам, ткст source);
static extern (C) бул   wxHtmlWindow_LoadPage(ЦелУкз сам, ткст location);
static extern (C) бул   wxHtmlWindow_LoadFile(ЦелУкз сам, ткст имяф);
static extern (C) ЦелУкз wxHtmlWindow_GetOpenedPage(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlWindow_GetOpenedAnchor(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlWindow_GetOpenedPageTitle(ЦелУкз сам);
static extern (C) проц   wxHtmlWindow_SetRelatedFrame(ЦелУкз сам, ЦелУкз frame, ткст format);
static extern (C) ЦелУкз wxHtmlWindow_GetRelatedFrame(ЦелУкз сам);
static extern (C) проц   wxHtmlWindow_SetRelatedStatusBar(ЦелУкз сам, цел bar);
static extern (C) проц   wxHtmlWindow_SetFonts(ЦелУкз сам, ткст normal_face, ткст fixed_face, цел* sizes);
static extern (C) проц   wxHtmlWindow_SetBorders(ЦелУкз сам, цел b);
static extern (C) проц   wxHtmlWindow_ReadCustomization(ЦелУкз сам, ЦелУкз cfg, ткст path);
static extern (C) проц   wxHtmlWindow_WriteCustomization(ЦелУкз сам, ЦелУкз cfg, ткст path);
static extern (C) бул   wxHtmlWindow_HistoryBack(ЦелУкз сам);
static extern (C) бул   wxHtmlWindow_HistoryForward(ЦелУкз сам);
static extern (C) бул   wxHtmlWindow_HistoryCanBack(ЦелУкз сам);
static extern (C) бул   wxHtmlWindow_HistoryCanForward(ЦелУкз сам);
static extern (C) проц   wxHtmlWindow_HistoryClear(ЦелУкз сам);
static extern (C) ЦелУкз wxHtmlWindow_GetInternalRepresentation(ЦелУкз сам);
static extern (C) проц   wxHtmlWindow_AddFilter(ЦелУкз filter);
static extern (C) ЦелУкз wxHtmlWindow_GetParser(ЦелУкз сам);
static extern (C) проц   wxHtmlWindow_AddProcessor(ЦелУкз сам, ЦелУкз processor);
static extern (C) проц   wxHtmlWindow_AddGlobalProcessor(ЦелУкз processor);
static extern (C) бул   wxHtmlWindow_AcceptsFocusFromKeyboard(ЦелУкз сам);
static extern (C) проц   wxHtmlWindow_OnУстTitle(ЦелУкз сам, ткст титул);
static extern (C) проц   wxHtmlWindow_OnCellClicked(ЦелУкз сам, ЦелУкз cell, цел x, цел y, ЦелУкз evt);
static extern (C) проц   wxHtmlWindow_OnLinkClicked(ЦелУкз сам, ЦелУкз link);
static extern (C) цел    wxHtmlWindow_OnOpeningURL(ЦелУкз сам, цел тип, ткст url, ткст redirect);

static extern (C) проц   wxHtmlWindow_SelectAll(ЦелУкз сам);
static extern (C) проц   wxHtmlWindow_SelectWord(ЦелУкз сам, inout Точка поз);
static extern (C) проц   wxHtmlWindow_SelectLine(ЦелУкз сам, inout Точка поз);

static extern (C) ЦелУкз wxHtmlWindow_ToText(ЦелУкз сам);

static extern (C) ЦелУкз wxHtmlWindow_SelectionToText(ЦелУкз сам);
//! \endcond

//-----------------------------------------------------------------------------

alias HtmlWindow wxHtmlWindow;
public class HtmlWindow : ScrolledWindow
{
    public const цел wxHW_SCROLLBAR_NEVER   = 0x0002;
    public const цел wxHW_SCROLLBAR_AUTO    = 0x0004;
    public const цел wxHW_NO_SELECTION      = 0x0008;

    //-----------------------------------------------------------------------------

    public this(ЦелУкз  wxobj)
    {
        super(wxobj);
    }

    public this()
    {
        super(wxHtmlWindow_ctor());
    }

    public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxHW_SCROLLBAR_AUTO, ткст имя = "htmlWindow")
    {
        super(wxHtmlWindow_ctor());

        wxHtmlWindow_RegisterVirtual(wxobj, this,
                                     &staticDoOnLinkClicked,
                                     &staticDoOnУстTitle,
                                     &staticDoOnCellMouseHover,
                                     &staticDoOnCellClicked,
                                     &staticDoOnOpeningURL
                                    );

        if (!создай(родитель, ид, поз, Размер, стиль, имя))
        {
            throw new InvalidOperationException("Не удалось создать HtmlWindow");
        }
    }

    //---------------------------------------------------------------------
    // ctors with сам created ид

    public this(Окно родитель, Точка поз = вхДефПоз, Размер Размер = вхДефРазм, цел стиль = wxHW_SCROLLBAR_AUTO, ткст имя = "htmlWindow")
    {
        this(родитель, Окно.УникИД, поз, Размер, стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public override бул создай(Окно родитель, цел ид, inout Точка поз, inout Размер Размер, цел стиль, ткст имя)
    {
        return wxHtmlWindow_Create(wxobj, wxObject.SafePtr(родитель), ид, поз, Размер, cast(бцел)стиль, имя);
    }

    //-----------------------------------------------------------------------------

    public бул УстPage(ткст source)
    {
        return wxHtmlWindow_SetPage(wxobj, source);
    }

    public бул AppendToPage(ткст source)
    {
        return wxHtmlWindow_AppendToPage(wxobj, source);
    }

    //-----------------------------------------------------------------------------

    public  бул LoadPage(ткст location)
    {
        return wxHtmlWindow_LoadPage(wxobj, location);
    }

    public бул ЗагрузиФайл(ткст имяф)
    {
        return wxHtmlWindow_LoadFile(wxobj, имяф);
    }

    //-----------------------------------------------------------------------------

    public ткст OpenedPage()
    {
        return cast(ткст) new wxString(wxHtmlWindow_GetOpenedPage(wxobj), да);
    }

    public ткст OpenedAnchor()
    {
        return cast(ткст) new wxString(wxHtmlWindow_GetOpenedAnchor(wxobj), да);
    }

    public ткст OpenedPageTitle()
    {
        return cast(ткст) new wxString(wxHtmlWindow_GetOpenedPageTitle(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public проц УстRelatedFrame(Frame frame, ткст format)
    {
        wxHtmlWindow_SetRelatedFrame(wxobj, wxObject.SafePtr(frame), format);
    }

    public Frame RelatedFrame()
    {
        return cast(Frame)НайдиОбъект(wxHtmlWindow_GetRelatedFrame(wxobj), &Frame.Нов);
    }

    //-----------------------------------------------------------------------------

    public проц RelatedStatusBar(цел значение)
    {
        wxHtmlWindow_SetRelatedStatusBar(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public проц УстFonts(ткст normal_face, ткст fixed_face, цел[] sizes)
    {
        wxHtmlWindow_SetFonts(wxobj, normal_face, fixed_face, sizes.ptr);
    }

    //-----------------------------------------------------------------------------

    public проц Borders(цел значение)
    {
        wxHtmlWindow_SetBorders(wxobj, значение);
    }

    //-----------------------------------------------------------------------------

    public  проц ReadCustomization(Config cfg, ткст path)
    {
        wxHtmlWindow_ReadCustomization(wxobj, wxObject.SafePtr(cfg), path);
    }

    //-----------------------------------------------------------------------------

    public  проц WriteCustomization(Config cfg, ткст path)
    {
        wxHtmlWindow_WriteCustomization(wxobj, wxObject.SafePtr(cfg), path);
    }

    //-----------------------------------------------------------------------------

    public бул HistoryBack()
    {
        return wxHtmlWindow_HistoryBack(wxobj);
    }

    public бул HistoryForward()
    {
        return wxHtmlWindow_HistoryForward(wxobj);
    }

    public бул HistoryCanBack()
    {
        return wxHtmlWindow_HistoryCanBack(wxobj);
    }

    public бул HistoryCanForward()
    {
        return wxHtmlWindow_HistoryCanForward(wxobj);
    }

    public проц HistoryClear()
    {
        wxHtmlWindow_HistoryClear(wxobj);
    }

    //-----------------------------------------------------------------------------

    public HtmlContainerCell InternalRepresentation()
    {
        return cast(HtmlContainerCell)НайдиОбъект(wxHtmlWindow_GetInternalRepresentation(wxobj), &HtmlContainerCell.Нов);
    }

    //-----------------------------------------------------------------------------

    public static проц AddFilter(HtmlFilter filter)
    {
        wxHtmlWindow_AddFilter(wxObject.SafePtr(filter));
    }

    //-----------------------------------------------------------------------------

    public HtmlWinParser Parser()
    {
        return cast(HtmlWinParser)НайдиОбъект(wxHtmlWindow_GetParser(wxobj), &HtmlWinParser.Нов);
    }

    //-----------------------------------------------------------------------------

    public проц AddProcessor(HtmlProcessor processor)
    {
        wxHtmlWindow_AddProcessor(wxobj, wxObject.SafePtr(processor));
    }

    public static проц AddGlobalProcessor(HtmlProcessor processor)
    {
        wxHtmlWindow_AddGlobalProcessor(wxObject.SafePtr(processor));
    }

    //-----------------------------------------------------------------------------

    public override бул фокусируемПоКлавиатуре()
    {
        return wxHtmlWindow_AcceptsFocusFromKeyboard(wxobj);
    }

    //-----------------------------------------------------------------------------

    static extern(C) private проц staticDoOnУстTitle(HtmlWindow объ, ЦелУкз титул)
    {
        объ.ПоУстановкеТитула(cast(ткст) new wxString(титул));
    }

    public  проц ПоУстановкеТитула(ткст титул)
    {
        wxHtmlWindow_OnУстTitle(wxobj, титул);
    }

    //-----------------------------------------------------------------------------

    static extern(C) private проц staticDoOnCellMouseHover(HtmlWindow объ, ЦелУкз cell, цел x, цел y)
    {
        объ.OnCellMouseHover(new HtmlCell(cell), x, y);
    }

    public  проц OnCellMouseHover(HtmlCell cell, цел x, цел y)
    {
        // Do nothing here
    }

    //-----------------------------------------------------------------------------

    static extern(C) private проц staticDoOnCellClicked(HtmlWindow объ, ЦелУкз cell, цел x, цел y, ЦелУкз mouseevent)
    {
        объ.OnCellClicked(new HtmlCell(cell), x, y, new MouseEvent(mouseevent));
    }

    public  проц OnCellClicked(HtmlCell cell, цел x, цел y, MouseEvent evt)
    {
        wxHtmlWindow_OnCellClicked(wxobj, wxObject.SafePtr(cell), x, y, wxObject.SafePtr(evt));
    }

    //-----------------------------------------------------------------------------

    static extern(C) private проц staticDoOnLinkClicked(HtmlWindow объ, ЦелУкз link)
    {
        объ.OnLinkClicked(new HtmlLinkInfo(link));
    }

    public  проц OnLinkClicked(HtmlLinkInfo link)
    {
        wxHtmlWindow_OnLinkClicked(wxobj, wxObject.SafePtr(link));
    }

    //-----------------------------------------------------------------------------

    static extern(C) private цел staticDoOnOpeningURL(HtmlWindow объ, цел тип, ЦелУкз url, ЦелУкз redirect)
    {
        return cast(цел)объ.OnOpeningURL(cast(HtmlURLType) тип, cast(ткст) new wxString(url), cast(ткст) new wxString(redirect));
    }

    public HtmlOpeningStatus OnOpeningURL(HtmlURLType тип, ткст url, ткст redirect)
    {
        return cast(HtmlOpeningStatus)wxHtmlWindow_OnOpeningURL(wxobj, cast(цел)тип, url, redirect);
    }

    //-----------------------------------------------------------------------------

    public проц SelectAll()
    {
        wxHtmlWindow_SelectAll(wxobj);
    }

    //-----------------------------------------------------------------------------

    public проц SelectLine(Точка поз)
    {
        wxHtmlWindow_SelectLine(wxobj, поз);
    }

    //-----------------------------------------------------------------------------

    public проц SelectWord(Точка поз)
    {
        wxHtmlWindow_SelectWord(wxobj, поз);
    }

    //-----------------------------------------------------------------------------

    public ткст Text()
    {
        return cast(ткст) new wxString(wxHtmlWindow_ToText(wxobj), да);
    }

    //-----------------------------------------------------------------------------

    public ткст SelectionText()
    {
        return cast(ткст) new wxString(wxHtmlWindow_SelectionToText(wxobj), да);
    }
}

