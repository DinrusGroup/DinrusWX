
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
        static extern (C) IntPtr wxHtmlTag_GetParent(IntPtr сам);
        static extern (C) IntPtr wxHtmlTag_GetFirstSibling(IntPtr сам);
        static extern (C) IntPtr wxHtmlTag_GetLastSibling(IntPtr сам);
        static extern (C) IntPtr wxHtmlTag_GetChildren(IntPtr сам);
        static extern (C) IntPtr wxHtmlTag_GetPreviousSibling(IntPtr сам);
        static extern (C) IntPtr wxHtmlTag_GetNextSibling(IntPtr сам);
        static extern (C) IntPtr wxHtmlTag_GetNextTag(IntPtr сам);
        static extern (C) IntPtr wxHtmlTag_GetName(IntPtr сам);
        static extern (C) бул   wxHtmlTag_HasParam(IntPtr сам, ткст par);
        static extern (C) IntPtr wxHtmlTag_GetParam(IntPtr сам, ткст par, бул with_commas);
        static extern (C) бул   wxHtmlTag_GetParamAsColour(IntPtr сам, ткст par, IntPtr clr);
        static extern (C) бул   wxHtmlTag_GetParamAsInt(IntPtr сам, ткст par, inout цел clr);
        static extern (C) цел    wxHtmlTag_ScanParam(IntPtr сам, ткст par, ткст format, IntPtr param);
        static extern (C) IntPtr wxHtmlTag_GetAllParams(IntPtr сам);
        static extern (C) бул   wxHtmlTag_IsEnding(IntPtr сам);
        static extern (C) бул   wxHtmlTag_HasEnding(IntPtr сам);
        static extern (C) цел    wxHtmlTag_GetBeginPos(IntPtr сам);
        static extern (C) цел    wxHtmlTag_GetEndPos1(IntPtr сам);
        static extern (C) цел    wxHtmlTag_GetEndPos2(IntPtr сам);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlTag wxHtmlTag;
    public class HtmlTag : wxObject
    {
        public this(IntPtr wxobj) ;
	public static wxObject Нов(IntPtr ptr) ;
	private static HtmlTag FindObj(IntPtr ptr);
        public HtmlTag Родитель() ;
        public HtmlTag FirstSibling() ;
        public HtmlTag LastSibling();
        public HtmlTag Отпрыски() ;
        public HtmlTag PreviousSibling() ;
        public HtmlTag NextSibling() ;
        public HtmlTag NextTag() ;
        public ткст Имя() ;
        public бул HasParam(ткст par);
        public ткст GetParam(ткст par, бул with_commas);
        public бул GetParamAsColour(ткст par, Цвет clr);
        public бул GetParamAsInt(ткст par, out цел clr);
        public цел ScanParam(ткст par, ткст format, wxObject param);
        public ткст AllParams() ;
        // public бул IsEnding() ;
        public бул HasEnding() ;
        public цел BeginPos();
        public цел EndPos1();
        public цел EndPos2();
       // public static implicit operator HtmlTag (IntPtr объ);
   }

    public abstract class HtmlFilter : wxObject
    {
        // TODO

        public this(IntPtr wxobj);
        /*public abstract бул CanRead(FSFile file);
        public abstract ткст ReadFile(FSFile file);*/
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) IntPtr wxHtmlCell_ctor();
        static extern (C) проц   wxHtmlCell_SetParent(IntPtr сам, IntPtr p);
        static extern (C) IntPtr wxHtmlCell_GetParent(IntPtr сам);
        static extern (C) цел    wxHtmlCell_GetPosX(IntPtr сам);
        static extern (C) цел    wxHtmlCell_GetPosY(IntPtr сам);
        static extern (C) цел    wxHtmlCell_GetWidth(IntPtr сам);
        static extern (C) цел    wxHtmlCell_GetHeight(IntPtr сам);
        static extern (C) цел    wxHtmlCell_GetDescent(IntPtr сам);
        static extern (C) IntPtr wxHtmlCell_GetId(IntPtr сам);
        static extern (C) проц   wxHtmlCell_SetId(IntPtr сам, ткст ид);
        static extern (C) IntPtr wxHtmlCell_GetNext(IntPtr сам);
        static extern (C) проц   wxHtmlCell_SetPos(IntPtr сам, цел x, цел y);
        static extern (C) проц   wxHtmlCell_SetLink(IntPtr сам, IntPtr link);
        static extern (C) проц   wxHtmlCell_SetNext(IntPtr сам, IntPtr cell);
        static extern (C) проц   wxHtmlCell_Layout(IntPtr сам, цел w);
        static extern (C) проц   wxHtmlCell_Draw(IntPtr сам, IntPtr dc, цел x, цел y, цел view_y1, цел view_y2, IntPtr info);
        static extern (C) проц   wxHtmlCell_DrawInvisible(IntPtr сам, IntPtr dc, цел x, цел y, IntPtr info);
        static extern (C) IntPtr wxHtmlCell_Find(IntPtr сам, цел condition, IntPtr param);
        static extern (C) проц   wxHtmlCell_OnMouseClick(IntPtr сам, IntPtr родитель, цел x, цел y, IntPtr evt);
        static extern (C) бул   wxHtmlCell_AdjustPagebreak(IntPtr сам, inout цел pagebreak);
        static extern (C) проц   wxHtmlCell_SetCanLiveOnPagebreak(IntPtr сам, бул can);
        static extern (C) проц   wxHtmlCell_GetHorizontalConstraints(IntPtr сам, inout цел left, inout цел right);
        static extern (C) бул   wxHtmlCell_IsTerminalCell(IntPtr сам);
        static extern (C) IntPtr wxHtmlCell_FindCellByPos(IntPtr сам, цел x, цел y);
        //! \endcond

    alias HtmlCell wxHtmlCell;
    public class HtmlCell : wxObject
    {
        //-----------------------------------------------------------------------------

        public this(IntPtr wxobj) ;
        public this();
	    public static wxObject Нов(IntPtr ptr) ;
	    public static HtmlCell FindObj(IntPtr ptr) ;
        public проц Родитель(HtmlContainerCell значение) ;
        public HtmlContainerCell Родитель();
        public цел X() ;
        public цел Y() ;
        public цел Ширь();
        public цел Высь();
	    public цел PosX();
	    public цел PosY() ;
	    public Точка Позиция() ;
	    public проц  Позиция(Точка тчк) ;
	    public Размер разм() ;
	    public Прямоугольник прям();
        public цел Descent();
        public  ткст Ид() ;
        public  проц Ид(ткст значение) ;
        public HtmlCell Next() ;
        public проц Next(HtmlCell значение);
        public проц УстPos(цел x, цел y);
        public проц Link(HtmlLinkInfo значение) ;
        public  проц Раскладка(цел w);
        public  проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info);
        public  проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info);
        public  HtmlCell Find(цел condition, wxObject param);
        public  проц OnMouseClick(Окно родитель, цел x, цел y, MouseEvent evt);
        public  бул AdjustPagebreak(inout цел pagebreak);
        public проц CanLiveOnPagebreak(бул значение) ;
        //public проц GetHorizontalConstraints(out цел left, out цел right);
        public  бул IsTerminalCell();
        public HtmlCell FindCellByPos(цел x, цел y);
       // public static implicit operator HtmlCell (IntPtr объ) ;
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
		static extern (C) IntPtr wxHtmlFontCell_ctor(IntPtr шрифт);
		static extern (C) проц   wxHtmlFontCell_Draw(IntPtr сам, IntPtr dc, цел x, цел y, цел view_y1, цел view_y2, IntPtr info);
		static extern (C) проц   wxHtmlFontCell_DrawInvisible(IntPtr сам, IntPtr dc, цел x, цел y, IntPtr info);
        //! \endcond

	alias HtmlFontCell wxHtmlFontCell;
	public class HtmlFontCell : HtmlCell
	{
		//-----------------------------------------------------------------------------

		public this(IntPtr wxobj);
		public this(Шрифт шрифт);
		public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info);
		public override проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info);
	}

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) IntPtr wxHtmlContainerCell_ctor(IntPtr родитель);
        static extern (C) проц   wxHtmlContainerCell_Layout(IntPtr сам, цел w);
        static extern (C) проц   wxHtmlContainerCell_Draw(IntPtr сам, IntPtr dc, цел x, цел y, цел view_y1, цел view_y2, IntPtr info);
        static extern (C) проц   wxHtmlContainerCell_DrawInvisible(IntPtr сам, IntPtr dc, цел x, цел y, IntPtr info);
        static extern (C) бул   wxHtmlContainerCell_AdjustPagebreak(IntPtr сам, inout цел pagebreak);
        static extern (C) проц   wxHtmlContainerCell_InsertCell(IntPtr сам, IntPtr cell);
        static extern (C) проц   wxHtmlContainerCell_SetAlignHor(IntPtr сам, цел al);
        static extern (C) цел    wxHtmlContainerCell_GetAlignHor(IntPtr сам);
        static extern (C) проц   wxHtmlContainerCell_SetAlignVer(IntPtr сам, цел al);
        static extern (C) цел    wxHtmlContainerCell_GetAlignVer(IntPtr сам);
        static extern (C) проц   wxHtmlContainerCell_SetIndent(IntPtr сам, цел i, цел what, цел units);
        static extern (C) цел    wxHtmlContainerCell_GetIndent(IntPtr сам, цел ind);
        static extern (C) цел    wxHtmlContainerCell_GetIndentUnits(IntPtr сам, цел ind);
        static extern (C) проц   wxHtmlContainerCell_SetAlign(IntPtr сам, IntPtr tag);
        static extern (C) проц   wxHtmlContainerCell_SetWidthFloat(IntPtr сам, цел w, цел units);
        static extern (C) проц   wxHtmlContainerCell_SetWidthFloatTag(IntPtr сам, IntPtr tag, double pixel_scale);
        static extern (C) проц   wxHtmlContainerCell_SetMinHeight(IntPtr сам, цел h, цел alignment);
        static extern (C) проц   wxHtmlContainerCell_SetBackgroundColour(IntPtr сам, IntPtr clr);
        static extern (C) IntPtr wxHtmlContainerCell_GetBackgroundColour(IntPtr сам);
        static extern (C) проц   wxHtmlContainerCell_SetBorder(IntPtr сам, IntPtr clr1, IntPtr clr2);
        static extern (C) IntPtr wxHtmlContainerCell_GetLink(IntPtr сам, цел x, цел y);
        static extern (C) IntPtr wxHtmlContainerCell_Find(IntPtr сам, цел condition, IntPtr param);
        static extern (C) проц   wxHtmlContainerCell_OnMouseClick(IntPtr сам, IntPtr родитель, цел x, цел y, IntPtr evt);
        static extern (C) проц   wxHtmlContainerCell_GetHorizontalConstraints(IntPtr сам, inout цел left, inout цел right);
        static extern (C) IntPtr wxHtmlContainerCell_GetFirstCell(IntPtr сам);
        static extern (C) бул   wxHtmlContainerCell_IsTerminalCell(IntPtr сам);
        static extern (C) IntPtr wxHtmlContainerCell_FindCellByPos(IntPtr сам, цел x, цел y);
        //! \endcond

    alias HtmlContainerCell wxHtmlContainerCell;
    public class HtmlContainerCell : HtmlCell
    {
        //-----------------------------------------------------------------------------

        public this(IntPtr wxobj);
        public this(HtmlContainerCell родитель);
	public static wxObject Нов(IntPtr ptr);
        public override проц Раскладка(цел w);
        public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info);
        public override проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info);
        public override бул AdjustPagebreak(inout цел pagebreak);
        public проц InsertCell(HtmlCell cell);
        public проц AlignHor(цел значение) ;
        public цел AlignHor() ;
        public проц AlignVer(цел значение) ;
        public цел AlignVer() ;
        public проц УстIndent(цел i, цел what, цел units);
        public цел GetIndent(цел ind);
        public цел GetIndentUnits(цел ind);
        public проц Align(HtmlTag значение);
        public проц УстWidthFloat(цел w, цел units);
        public проц УстWidthFloat(HtmlTag tag, double pixel_scale);
        public проц УстMinHeight(цел h, цел alignment);
        public проц ЦветФона(Цвет значение) ;
        public Цвет ЦветФона() ;
        public проц УстBorder(Цвет clr1, Цвет clr2);
        public  HtmlLinkInfo GetLink(цел x, цел y);
        public override HtmlCell Find(цел condition, wxObject param);
        public override проц OnMouseClick(Окно родитель, цел x, цел y, MouseEvent evt);
       // public проц GetHorizontalConstraints(out цел left, out цел right);
        //public HtmlCell FirstCell() ;
        public override бул IsTerminalCell();
        public override HtmlCell FindCellByPos(цел x, цел y);
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
		static extern (C) IntPtr wxHtmlColourCell_ctor(IntPtr clr, цел флаги);
		static extern (C) проц   wxHtmlColourCell_Draw(IntPtr сам, IntPtr dc, цел x, цел y, цел view_y1, цел view_y2, IntPtr info);
		static extern (C) проц   wxHtmlColourCell_DrawInvisible(IntPtr сам, IntPtr dc, цел x, цел y, IntPtr info);
        //! \endcond

	alias HtmlColourCell wxHtmlColourCell;
	public class HtmlColourCell : HtmlCell
	{
		//-----------------------------------------------------------------------------

		public this(IntPtr wxobj);
		public  this(Цвет clr, цел флаги);
		public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info);
		public override проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info);
	}

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
		static extern (C) IntPtr wxHtmlLinkInfo_ctor();
		/*static extern (C) IntPtr wxHtmlLinkInfo_ctor(ткст href, ткст target);*/
		/*static extern (C) IntPtr wxHtmlLinkInfo_ctor(IntPtr l);*/
		static extern (C) проц   wxHtmlLinkInfo_SetEvent(IntPtr сам, IntPtr e);
		static extern (C) проц   wxHtmlLinkInfo_SetHtmlCell(IntPtr сам, IntPtr e);
		static extern (C) IntPtr wxHtmlLinkInfo_GetHref(IntPtr сам);
		static extern (C) IntPtr wxHtmlLinkInfo_GetTarget(IntPtr сам);
		static extern (C) IntPtr wxHtmlLinkInfo_GetEvent(IntPtr сам);
		static extern (C) IntPtr wxHtmlLinkInfo_GetHtmlCell(IntPtr сам);
        //! \endcond

		//-----------------------------------------------------------------------------

	alias HtmlLinkInfo wxHtmlLinkInfo;
	public class HtmlLinkInfo : wxObject
	{
		public this(IntPtr wxobj);
		public  this();
		//public  this(ткст href, ткст target);
		public static wxObject Нов(IntPtr ptr);
		//public  this(HtmlLinkInfo l);
		public проц event(MouseEvent значение) ;
		public MouseEvent event() ;
		public ткст Href();
		public ткст Target() ;
		public HtmlCell htmlCell();
		public проц htmlCell(HtmlCell значение) ;
	}

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) IntPtr wxHtmlWidgetCell_ctor(IntPtr wnd, цел w);
        static extern (C) проц   wxHtmlWidgetCell_Draw(IntPtr сам, IntPtr dc, цел x, цел y, цел view_y1, цел view_y2, IntPtr info);
        static extern (C) проц   wxHtmlWidgetCell_DrawInvisible(IntPtr сам, IntPtr dc, цел x, цел y, IntPtr info);
        static extern (C) проц   wxHtmlWidgetCell_Layout(IntPtr сам, цел w);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlWidgetCell wxHtmlWidgetCell;
    public class HtmlWidgetCell : HtmlCell
    {
		public this(IntPtr wxobj);
        public this(Окно wnd, цел w);
        public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info);
        public override проц DrawInvisible(DC dc, цел x, цел y, HtmlRenderingInfo info);
        public override проц Раскладка(цел w);
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) IntPtr wxHtmlWordCell_ctor(ткст word, IntPtr dc);
        static extern (C) проц   wxHtmlWordCell_Draw(IntPtr сам, IntPtr dc, цел x, цел y, цел view_y1, цел view_y2, IntPtr info);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlWordCell wxHtmlWordCell;
    public class HtmlWordCell : HtmlCell
    {
		public this(IntPtr wxobj);
        public  this(ткст word, DC dc);
        public override проц Draw(DC dc, цел x, цел y, цел view_y1, цел view_y2, HtmlRenderingInfo info);
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) бул   wxHtmlFilterPlainText_CanRead(IntPtr сам, IntPtr file);
        static extern (C) IntPtr wxHtmlFilterPlainText_ReadFile(IntPtr сам, IntPtr file);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlFilterPlainText wxHtmlFilterPlainText;
    public class HtmlFilterPlainText : HtmlFilter
    {
        public this(IntPtr wxobj) ;

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
        static extern (C) бул   wxHtmlFilterHTML_CanRead(IntPtr сам, IntPtr file);
        static extern (C) IntPtr wxHtmlFilterHTML_ReadFile(IntPtr сам, IntPtr file);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlFilterHTML wxHtmlFilterHTML;
    public class HtmlFilterHTML : HtmlFilter
    {
        public this(IntPtr wxobj)
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
        static extern (C) IntPtr wxHtmlTagsModule_ctor();
        static extern (C) бул   wxHtmlTagsModule_OnInit(IntPtr сам);
        static extern (C) проц   wxHtmlTagsModule_OnExit(IntPtr сам);
        static extern (C) проц   wxHtmlTagsModule_FillHandlersTable(IntPtr сам, IntPtr parser);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlTagsModule wxHtmlTagsModule;
    public class HtmlTagsModule : wxObject // TODO: Module
    {
		public this(IntPtr wxobj);
        public this();
        public бул ПоИниц();
        public проц ПоВыходу();
        public проц FillHandlersTable(HtmlWinParser  parser);
    }

	//-----------------------------------------------------------------------------

    public abstract class HtmlWinTagHandler : HtmlTagHandler
    {
        public this(IntPtr wxobj);
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) IntPtr wxHtmlWinParser_ctor(IntPtr wnd);
        static extern (C) проц   wxHtmlWinParser_InitParser(IntPtr сам, ткст source);
        static extern (C) проц   wxHtmlWinParser_DoneParser(IntPtr сам);
        static extern (C) IntPtr wxHtmlWinParser_GetProduct(IntPtr сам);
        static extern (C) IntPtr wxHtmlWinParser_OpenURL(IntPtr сам, цел тип, ткст url);
        static extern (C) проц   wxHtmlWinParser_SetDC(IntPtr сам, IntPtr dc, double pixel_scale);
        static extern (C) IntPtr wxHtmlWinParser_GetDC(IntPtr сам);
        static extern (C) double wxHtmlWinParser_GetPixelScale(IntPtr сам);
        static extern (C) цел    wxHtmlWinParser_GetCharHeight(IntPtr сам);
        static extern (C) цел    wxHtmlWinParser_GetCharWidth(IntPtr сам);
        static extern (C) IntPtr wxHtmlWinParser_GetWindow(IntPtr сам);
        static extern (C) проц   wxHtmlWinParser_SetFonts(IntPtr сам, ткст normal_face, ткст fixed_face, цел* sizes);
        static extern (C) проц   wxHtmlWinParser_AddModule(IntPtr сам, IntPtr mod);
        static extern (C) проц   wxHtmlWinParser_RemoveModule(IntPtr сам, IntPtr mod);
        static extern (C) IntPtr wxHtmlWinParser_GetContainer(IntPtr сам);
        static extern (C) IntPtr wxHtmlWinParser_OpenContainer(IntPtr сам);
        static extern (C) IntPtr wxHtmlWinParser_SetContainer(IntPtr сам, IntPtr c);
        static extern (C) IntPtr wxHtmlWinParser_CloseContainer(IntPtr сам);
        static extern (C) цел    wxHtmlWinParser_GetFontSize(IntPtr сам);
        static extern (C) проц   wxHtmlWinParser_SetFontSize(IntPtr сам, цел s);
        static extern (C) цел    wxHtmlWinParser_GetFontBold(IntPtr сам);
        static extern (C) проц   wxHtmlWinParser_SetFontBold(IntPtr сам, цел x);
        static extern (C) цел    wxHtmlWinParser_GetFontItalic(IntPtr сам);
        static extern (C) проц   wxHtmlWinParser_SetFontItalic(IntPtr сам, цел x);
        static extern (C) цел    wxHtmlWinParser_GetFontUnderlined(IntPtr сам);
        static extern (C) проц   wxHtmlWinParser_SetFontUnderlined(IntPtr сам, цел x);
        static extern (C) цел    wxHtmlWinParser_GetFontFixed(IntPtr сам);
        static extern (C) проц   wxHtmlWinParser_SetFontFixed(IntPtr сам, цел x);
        static extern (C) IntPtr wxHtmlWinParser_GetFontFace(IntPtr сам);
        static extern (C) проц   wxHtmlWinParser_SetFontFace(IntPtr сам, ткст face);
        static extern (C) цел    wxHtmlWinParser_GetAlign(IntPtr сам);
        static extern (C) проц   wxHtmlWinParser_SetAlign(IntPtr сам, цел a);
        static extern (C) IntPtr wxHtmlWinParser_GetLinkColor(IntPtr сам);
        static extern (C) проц   wxHtmlWinParser_SetLinkColor(IntPtr сам, IntPtr clr);
        static extern (C) IntPtr wxHtmlWinParser_GetActualColor(IntPtr сам);
        static extern (C) проц   wxHtmlWinParser_SetActualColor(IntPtr сам, IntPtr clr);
        static extern (C) IntPtr wxHtmlWinParser_GetLink(IntPtr сам);
        static extern (C) проц   wxHtmlWinParser_SetLink(IntPtr сам, IntPtr link);
        static extern (C) IntPtr wxHtmlWinParser_CreateCurrentFont(IntPtr сам);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlWinParser wxHtmlWinParser;
    public class HtmlWinParser : HtmlParser
    {
		public this(IntPtr wxobj);
        public this(HtmlWindow wnd);
	    public static wxObject Нов(IntPtr ptr) ;
        public override проц InitParser(ткст source);
        public override проц DoneParser();
        public override wxObject Product();
        //public FSFile OpenURL(HtmlURLType тип, ткст url);
        public проц УстDC(DC dc, double pixel_scale);
        public DC GetDC();
        public double PixelScale();
        public цел ВысьСим();
        public цел ШирьСим() ;
        public HtmlWindow окно();
        public проц УстFonts(ткст normal_face, ткст fixed_face, цел[] sizes);
        public проц AddModule(HtmlTagsModule mod);
        public проц RemoveModule(HtmlTagsModule mod);
        public HtmlContainerCell Container() ;
        public HtmlContainerCell УстContainter(HtmlContainerCell cont);
        public HtmlContainerCell OpenContainer();
        public HtmlContainerCell CloseContainer();
        public цел FontSize() ;
        public проц FontSize(цел значение) ;
        public цел FontBold() ;
        public проц FontBold(цел значение) ;
        public цел FontItalic() ;
        public проц FontItalic(цел значение) ;
        public цел FontUnderlined();
        public проц FontUnderlined(цел значение) ;
        public цел FontFixed() ;
        public проц FontFixed(цел значение);
        public ткст FontFace() ;
        public проц FontFace(ткст значение) ;
        public цел Align();
        public проц Align(цел значение) ;
        public Цвет LinkColor() ;
        public проц LinkColor(Цвет значение) ;
        public Цвет ActualColor() ;
        public проц ActualColor(Цвет значение);
        public HtmlLinkInfo Link() ;
        public проц Link(HtmlLinkInfo значение) ;
        public Шрифт CreateCurrentFont();
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) проц   wxHtmlTagHandler_SetParser(IntPtr сам, IntPtr parser);
        //! \endcond

        //-----------------------------------------------------------------------------

    public abstract class HtmlTagHandler : wxObject
    {
        public this(IntPtr wxobj) ;
        public проц Parser(HtmlParser значение);
        public abstract ткст GetSupportedTags();
        public abstract бул HandleTag(HtmlTag tag);
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) IntPtr wxHtmlEntitiesParser_ctor();
        static extern (C) проц   wxHtmlEntitiesParser_SetEncoding(IntPtr сам, цел кодировка);
        static extern (C) IntPtr wxHtmlEntitiesParser_Parse(IntPtr сам, ткст input);
        static extern (C) char   wxHtmlEntitiesParser_GetEntityChar(IntPtr сам, ткст entity);
        static extern (C) char   wxHtmlEntitiesParser_GetCharForCode(IntPtr сам, бцел code);
        //! \endcond

        //-----------------------------------------------------------------------------

    alias HtmlEntitiesParser wxHtmlEntitiesParser;
    public class HtmlEntitiesParser : wxObject
    {
		public this(IntPtr wxobj);
        public  this();
        public проц Кодировка(FontEncoding значение) ;
        public ткст Parse(ткст input);
        public char GetEntityChar(ткст entity);
        public char GetCharForCode(цел code);
    }

	//-----------------------------------------------------------------------------

         //! \cond EXTERN
        static extern (C) проц   wxHtmlParser_SetFS(IntPtr сам, IntPtr fs);
        static extern (C) IntPtr wxHtmlParser_GetFS(IntPtr сам);
        static extern (C) IntPtr wxHtmlParser_OpenURL(IntPtr сам, цел тип, ткст url);
        static extern (C) IntPtr wxHtmlParser_Parse(IntPtr сам, ткст source);
        static extern (C) проц   wxHtmlParser_InitParser(IntPtr сам, ткст source);
        static extern (C) проц   wxHtmlParser_DoneParser(IntPtr сам);
        static extern (C) проц   wxHtmlParser_StopParsing(IntPtr сам);
        static extern (C) проц   wxHtmlParser_DoParsing(IntPtr сам, цел begin_pos, цел end_pos);
        static extern (C) проц   wxHtmlParser_DoParsingAll(IntPtr сам);
        static extern (C) IntPtr wxHtmlParser_GetCurrentTag(IntPtr сам);
        static extern (C) проц   wxHtmlParser_AddTagHandler(IntPtr сам, IntPtr обработчик);
        static extern (C) проц   wxHtmlParser_PushTagHandler(IntPtr сам, IntPtr обработчик, ткст tags);
        static extern (C) проц   wxHtmlParser_PopTagHandler(IntPtr сам);
        static extern (C) IntPtr wxHtmlParser_GetSource(IntPtr сам);
        static extern (C) проц   wxHtmlParser_SetSource(IntPtr сам, ткст src);
        static extern (C) проц   wxHtmlParser_SetSourceAndSaveState(IntPtr сам, ткст src);
        static extern (C) бул   wxHtmlParser_RestoreState(IntPtr сам);
        static extern (C) IntPtr wxHtmlParser_ExtractCharsetInformation(IntPtr сам, ткст markup);
        //! \endcond

        //-----------------------------------------------------------------------------

    public abstract class HtmlParser : wxObject
    {
        public this(IntPtr wxobj) ;
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

        public wxObject Parse(ткст source);
        public  проц InitParser(ткст source);
        public  проц DoneParser();
        public проц StopParsing();
        public проц DoParsing(цел begin_pos, цел end_pos);
        public проц DoParsing();
        public HtmlTag GetCurrentTag();
        public abstract wxObject Product();
        public проц AddTagHandler(HtmlTagHandler обработчик);
        public проц PushTagHandler(HtmlTagHandler обработчик, ткст tags);
        public проц PopTagHandler();
        public ткст Source();
        public проц Source(ткст значение) ;
        public проц SourceAndSaveState(ткст значение);
        public бул RestoreState();
        public ткст ExtractCharsetInformation(ткст markup);
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
        static extern (C) цел    wxHtmlProcessor_GetPriority(IntPtr сам);
        static extern (C) проц   wxHtmlProcessor_Enable(IntPtr сам, бул вкл);
        static extern (C) бул   wxHtmlProcessor_IsEnabled(IntPtr сам);
        //! \endcond

        //-----------------------------------------------------------------------------

    public abstract class HtmlProcessor : wxObject
    {
        public this(IntPtr wxobj) ;
        public abstract ткст Process(ткст текст);
        public цел Priority() ;
        public проц Активен(бул значение);
        public бул Активен();
    }

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
		static extern (C) IntPtr wxHtmlRenderingInfo_ctor();
		static extern (C) проц wxHtmlRenderingInfo_dtor(IntPtr сам);
		static extern (C) проц wxHtmlRenderingInfo_SetSelection(IntPtr сам, IntPtr s);
		static extern (C) IntPtr wxHtmlRenderingInfo_GetSelection(IntPtr сам);
        //! \endcond

		//-----------------------------------------------------------------------------

	alias HtmlRenderingInfo wxHtmlRenderingInfo;
	public class HtmlRenderingInfo : wxObject
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		override protected проц dtor();
		public HtmlSelection Выбор() ;
		public проц Выбор(HtmlSelection значение) ;
	}

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
		static extern (C) IntPtr wxHtmlSelection_ctor();
		static extern (C) проц wxHtmlSelection_dtor(IntPtr сам);
		static extern (C) проц wxHtmlSelection_Set(IntPtr сам, inout Точка fromPos, IntPtr fromCell, inout Точка toPos, IntPtr toCell);
		static extern (C) проц wxHtmlSelection_Set2(IntPtr сам, IntPtr fromCell, IntPtr toCell);
		static extern (C) IntPtr wxHtmlSelection_GetFromCell(IntPtr сам);
		static extern (C) IntPtr wxHtmlSelection_GetToCell(IntPtr сам);
		static extern (C) проц wxHtmlSelection_GetFromPos(IntPtr сам, out Точка fromPos);
		static extern (C) проц wxHtmlSelection_GetToPos(IntPtr сам, out Точка toPos);
		static extern (C) проц wxHtmlSelection_GetFromPrivPos(IntPtr сам, out Точка fromPrivPos);
		static extern (C) проц wxHtmlSelection_GetToPrivPos(IntPtr сам, out Точка toPrivPos);
		static extern (C) проц wxHtmlSelection_SetFromPrivPos(IntPtr сам, inout Точка поз);
		static extern (C) проц wxHtmlSelection_SetToPrivPos(IntPtr сам, inout Точка поз);
		static extern (C) проц wxHtmlSelection_ClearPrivPos(IntPtr сам);
		static extern (C) бул wxHtmlSelection_IsEmpty(IntPtr сам);
        //! \endcond

		//-----------------------------------------------------------------------------

	alias HtmlSelection wxHtmlSelection;
	public class HtmlSelection : wxObject
	{
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this();
		public static wxObject Нов(IntPtr ptr) ;
		override protected проц dtor();
		public проц Уст(Точка fromPos, HtmlCell fromCell, Точка toPos, HtmlCell toCell);
		public проц Уст(HtmlCell fromCell, HtmlCell toCell);
		public HtmlCell FromCell();
		public HtmlCell ToCell() ;
		public Точка FromPos();
		public Точка ToPos() ;
		public Точка FromPrivPos() ;
		public проц FromPrivPos(Точка значение) ;
		public Точка ToPrivPos() ;
		public проц ToPrivPos(Точка значение) ;
		public проц ClearPrivPos();
		public бул Empty() ;
	}

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
		static extern (C) IntPtr wxHtmlEasyPrinting_ctor(ткст имя, IntPtr родитель);
		static extern (C) бул   wxHtmlEasyPrinting_PreviewFile(IntPtr сам, ткст htmlfile);
		static extern (C) бул   wxHtmlEasyPrinting_PreviewText(IntPtr сам, ткст htmltext, ткст basepath);
		static extern (C) бул   wxHtmlEasyPrinting_PrintFile(IntPtr сам, ткст htmlfile);
		static extern (C) бул   wxHtmlEasyPrinting_PrintText(IntPtr сам, ткст htmltext, ткст basepath);
		//static extern (C) проц   wxHtmlEasyPrinting_PrinterУстup(IntPtr сам);
		static extern (C) проц   wxHtmlEasyPrinting_PageУстup(IntPtr сам);
		static extern (C) проц   wxHtmlEasyPrinting_SetHeader(IntPtr сам, ткст header, цел pg);
		static extern (C) проц   wxHtmlEasyPrinting_SetFooter(IntPtr сам, ткст footer, цел pg);
		static extern (C) проц   wxHtmlEasyPrinting_SetFonts(IntPtr сам, ткст normal_face, ткст fixed_face, цел* sizes);
		static extern (C) проц   wxHtmlEasyPrinting_SetStandardFonts(IntPtr сам, цел разм, ткст normal_face, ткст fixed_face);
		static extern (C) IntPtr wxHtmlEasyPrinting_GetPrintData(IntPtr сам);
		static extern (C) IntPtr wxHtmlEasyPrinting_GetPageУстupData(IntPtr сам);
        //! \endcond

		//-----------------------------------------------------------------------------

	alias HtmlEasyPrinting wxHtmlEasyPrinting;
	public class HtmlEasyPrinting : wxObject
	{
		public const цел wxPAGE_ODD	= 0;
		public const цел wxPAGE_EVEN	= 1;
		public const цел wxPAGE_ALL	= 2;

		//-----------------------------------------------------------------------------

		public this(IntPtr wxobj);
		public this();
		public this(ткст имя);
		public this(ткст имя, Окно parentWindow);
		public бул PreviewFile(ткст htmlfile);
		public бул PreviewText(ткст htmltext);
		public бул PreviewText(ткст htmltext, ткст basepath);
		public бул PrintFile(ткст htmlfile);
		public бул PrintText(ткст htmltext);
		public бул PrintText(ткст htmltext, ткст basepath);
		//public проц PrinterУстup();
		public проц PageУстup();
		public проц УстHeader(ткст header);
		public проц УстHeader(ткст header, цел pg);
		public проц УстFooter(ткст footer);
		public проц УстFooter(ткст footer, цел pg);
		public проц УстFonts(ткст normal_face, ткст fixed_face);
		public проц УстFonts(ткст normal_face, ткст fixed_face, цел[] sizes);
		public проц УстStandardFonts();
		public проц УстStandardFonts(цел разм);
		public проц УстStandardFonts(цел разм, ткст normal_face);
		public проц УстStandardFonts(цел разм, ткст normal_face, ткст fixed_face);
		public PrintData printData();
		public PageУстupDialogData PageУстupData();
	}

	//-----------------------------------------------------------------------------

        //! \cond EXTERN
		extern (C) {
		alias проц function(HtmlWindow объ, IntPtr link) Virtual_OnLinkClicked;
		alias проц function(HtmlWindow объ, IntPtr title) Virtual_OnУстTitle;
		alias проц function(HtmlWindow объ, IntPtr cell, цел x, цел y) Virtual_OnCellMouseHover;
		alias проц function(HtmlWindow объ, IntPtr cell, цел x, цел y, IntPtr mouseevent) Virtual_OnCellClicked;
		alias цел function(HtmlWindow объ, цел тип, IntPtr url, IntPtr redirect) Virtual_OnOpeningURL;
		}

		static extern (C) IntPtr wxHtmlWindow_ctor();
		static extern (C) проц   wxHtmlWindow_RegisterVirtual(IntPtr сам, HtmlWindow объ,
			Virtual_OnLinkClicked onLinkClicked,
			Virtual_OnУстTitle onУстTitle,
			Virtual_OnCellMouseHover onCellMouseHover,
			Virtual_OnCellClicked onCellClicked,
			Virtual_OnOpeningURL onOpeningURL);
		static extern (C) бул   wxHtmlWindow_Create(IntPtr сам, IntPtr родитель, цел ид, inout Точка поз, inout Размер разм, бцел стиль, ткст имя);
		static extern (C) бул   wxHtmlWindow_SetPage(IntPtr сам, ткст source);
		static extern (C) бул   wxHtmlWindow_AppendToPage(IntPtr сам, ткст source);
		static extern (C) бул   wxHtmlWindow_LoadPage(IntPtr сам, ткст location);
		static extern (C) бул   wxHtmlWindow_LoadFile(IntPtr сам, ткст filename);
		static extern (C) IntPtr wxHtmlWindow_GetOpenedPage(IntPtr сам);
		static extern (C) IntPtr wxHtmlWindow_GetOpenedAnchor(IntPtr сам);
		static extern (C) IntPtr wxHtmlWindow_GetOpenedPageTitle(IntPtr сам);
		static extern (C) проц   wxHtmlWindow_SetRelatedFrame(IntPtr сам, IntPtr frame, ткст format);
		static extern (C) IntPtr wxHtmlWindow_GetRelatedFrame(IntPtr сам);
		static extern (C) проц   wxHtmlWindow_SetRelatedStatusBar(IntPtr сам, цел bar);
		static extern (C) проц   wxHtmlWindow_SetFonts(IntPtr сам, ткст normal_face, ткст fixed_face, цел* sizes);
		static extern (C) проц   wxHtmlWindow_SetBorders(IntPtr сам, цел b);
		static extern (C) проц   wxHtmlWindow_ReadCustomization(IntPtr сам, IntPtr cfg, ткст path);
		static extern (C) проц   wxHtmlWindow_WriteCustomization(IntPtr сам, IntPtr cfg, ткст path);
		static extern (C) бул   wxHtmlWindow_HistoryBack(IntPtr сам);
		static extern (C) бул   wxHtmlWindow_HistoryForward(IntPtr сам);
		static extern (C) бул   wxHtmlWindow_HistoryCanBack(IntPtr сам);
		static extern (C) бул   wxHtmlWindow_HistoryCanForward(IntPtr сам);
		static extern (C) проц   wxHtmlWindow_HistoryClear(IntPtr сам);
		static extern (C) IntPtr wxHtmlWindow_GetInternalRepresentation(IntPtr сам);
		static extern (C) проц   wxHtmlWindow_AddFilter(IntPtr filter);
		static extern (C) IntPtr wxHtmlWindow_GetParser(IntPtr сам);
		static extern (C) проц   wxHtmlWindow_AddProcessor(IntPtr сам, IntPtr processor);
		static extern (C) проц   wxHtmlWindow_AddGlobalProcessor(IntPtr processor);
		static extern (C) бул   wxHtmlWindow_AcceptsFocusFromKeyboard(IntPtr сам);
		static extern (C) проц   wxHtmlWindow_OnУстTitle(IntPtr сам, ткст title);
		static extern (C) проц   wxHtmlWindow_OnCellClicked(IntPtr сам, IntPtr cell, цел x, цел y, IntPtr evt);
		static extern (C) проц   wxHtmlWindow_OnLinkClicked(IntPtr сам, IntPtr link);
		static extern (C) цел    wxHtmlWindow_OnOpeningURL(IntPtr сам, цел тип, ткст url, ткст redirect);

		static extern (C) проц   wxHtmlWindow_SelectAll(IntPtr сам);
		static extern (C) проц   wxHtmlWindow_SelectWord(IntPtr сам, inout Точка поз);
		static extern (C) проц   wxHtmlWindow_SelectLine(IntPtr сам, inout Точка поз);

		static extern (C) IntPtr wxHtmlWindow_ToText(IntPtr сам);

		static extern (C) IntPtr wxHtmlWindow_SelectionToText(IntPtr сам);
        //! \endcond

		//-----------------------------------------------------------------------------

	alias HtmlWindow wxHtmlWindow;
	public class HtmlWindow : ScrolledWindow
	{
		public const цел wxHW_SCROLLBAR_NEVER   = 0x0002;
		public const цел wxHW_SCROLLBAR_AUTO    = 0x0004;
		public const цел wxHW_NO_SELECTION      = 0x0008;

		//-----------------------------------------------------------------------------

		public this(IntPtr  wxobj);
		public this();
		public this(Окно родитель, цел ид /*= wxID_ANY*/, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxHW_SCROLLBAR_AUTO, ткст имя = "htmlWindow");
		public this(Окно родитель, Точка поз = вхДефПоз, Размер разм = вхДефРазм, цел стиль = wxHW_SCROLLBAR_AUTO, ткст имя = "htmlWindow");
		public override бул Создай(Окно родитель, цел ид, inout Точка поз, inout Размер разм, цел стиль, ткст имя);
		public бул УстPage(ткст source);
		public бул AppendToPage(ткст source);
		public  бул LoadPage(ткст location);
		public бул ЗагрузиФайл(ткст filename);
		public ткст OpenedPage();
		public ткст OpenedAnchor() ;
		public ткст OpenedPageTitle() ;
		public проц УстRelatedFrame(Frame frame, ткст format);
		public Frame RelatedFrame() ;
		public проц RelatedStatusBar(цел значение);
		public проц УстFonts(ткст normal_face, ткст fixed_face, цел[] sizes);
		public проц Borders(цел значение);
		public  проц ReadCustomization(Config cfg, ткст path);
		public  проц WriteCustomization(Config cfg, ткст path);
		public бул HistoryBack();
		public бул HistoryForward();
		public бул HistoryCanBack();
		public бул HistoryCanForward();
		public проц HistoryClear();
		public HtmlContainerCell InternalRepresentation() ;
		public static проц AddFilter(HtmlFilter filter);
		public HtmlWinParser Parser();
		public проц AddProcessor(HtmlProcessor processor);
		public static проц AddGlobalProcessor(HtmlProcessor processor);
		public override бул ПринимаетФокусПоКлавиатуре();
		static extern(C) private проц staticDoOnУстTitle(HtmlWindow объ, IntPtr title);
		public  проц OnУстTitle(ткст title);
		static extern(C) private проц staticDoOnCellMouseHover(HtmlWindow объ, IntPtr cell, цел x, цел y);
		public  проц OnCellMouseHover(HtmlCell cell, цел x, цел y);
		static extern(C) private проц staticDoOnCellClicked(HtmlWindow объ, IntPtr cell, цел x, цел y, IntPtr mouseevent);
		public  проц OnCellClicked(HtmlCell cell, цел x, цел y, MouseEvent evt);
		static extern(C) private проц staticDoOnLinkClicked(HtmlWindow объ, IntPtr link);
		public  проц OnLinkClicked(HtmlLinkInfo link);
		static extern(C) private цел staticDoOnOpeningURL(HtmlWindow объ, цел тип, IntPtr url, IntPtr redirect);
		public HtmlOpeningStatus OnOpeningURL(HtmlURLType тип, ткст url, ткст redirect);
		public проц SelectAll();
		public проц SelectLine(Точка поз);
		public проц SelectWord(Точка поз);
		public ткст Text() ;
		public ткст SelectionText() ;
	}

