/////////////////////////////////////////////////////////////////////////////
// Имя:        samples/drawing/Drawing.d
// Purpose:     shows and tests DC features
// Author:      Robert Roebling
// Ported by:   Heromyth 2007-6-3
// Created:     04/01/98
// RCS-ИД:      $Ид: Drawing.d,v 1.2 2007/06/11 06:42:06 afb Exp $
// Copyright:   (c) Robert Roebling
// Licence:     wxWindows licence
/////////////////////////////////////////////////////////////////////////////

// ============================================================================
// declarations
// ============================================================================

import wx.wx;

import std.math;

typedef цел wxCoord;
typedef byte wxDash;

// ----------------------------------------------------------------------------
// ressources
// ----------------------------------------------------------------------------

// the application иконка


// ----------------------------------------------------------------------------
// ants
// ----------------------------------------------------------------------------

// what do we show on screen (there are too many shapes to put them all on
// screen simultaneously)
enum ScreenToShow
{
    Show_Default,
    Show_Text,
    Show_Lines,
    Show_Brushes,
    Show_Polygons,
    Show_Mask,
    Show_Ops,
    Show_Regions,
    Show_Circles,
    Show_Splines,
    Show_Alpha,
    Show_Gradient,
    Show_Max
};


/*  Mapping modes (same values as used by Windows, don't change) */
enum MapMode
{
    wxMM_TEXT = 1,
    wxMM_LOMETRIC,
    wxMM_HIMETRIC,
    wxMM_LOENGLISH,
    wxMM_HIENGLISH,
    wxMM_TWIPS,
    wxMM_ISOTROPIC,
    wxMM_ANISOTROPIC,
    wxMM_POINTS,
    wxMM_METRIC
};

// ----------------------------------------------------------------------------
// global variables
// ----------------------------------------------------------------------------

static Битмап gs_bmpNoMask,
                gs_bmpWithColMask,
                gs_bmpMask,
                gs_bmpWithMask,
                gs_bmp4,
                gs_bmp4_mono,
                gs_bmp36;

// ----------------------------------------------------------------------------
// private classes
// ----------------------------------------------------------------------------

// Define a new application тип, each program should derive a class from Прил
class Drawing : public Прил
{
public:
    // override base class virtuals
    // ----------------------------

// `Main program' equivalent: the program execution "starts" here
    public override бул ПриИниц()
    {
        // Create the main application окно
        MyFrame frame = new MyFrame("Drawing sample",
                                     Точка(50, 50), Размер(550, 340));

        // Show it and tell the application that it's our main окно
        frame.Show(да);
        ТопОкно(frame);

        if ( !LoadImages() )
        {
            Log temp = new Log();
            temp.LogError("Can't load one of the битмап files needed 
            for this sample from the current or родитель 
            directory, please copy them there.");

            // stop here
            DeleteBitmaps();

            return нет;
        }

        // ok, continue
        return да;
    }

    public override цел ПриВыходе() { DeleteBitmaps(); return 0; }

		//---------------------------------------------------------------------

		static проц Main()
		{
			Drawing прил = new Drawing();
			прил.Пуск();
		}



    protected проц DeleteBitmaps()
    {
        delete gs_bmpNoMask;
        delete gs_bmpWithColMask;
        delete gs_bmpMask;
        delete gs_bmpWithMask;
        delete gs_bmp4;
        delete gs_bmp4_mono;
        delete gs_bmp36;

    }


    protected бул LoadImages()
    {
        gs_bmpNoMask = new Битмап();
        gs_bmpWithColMask = new Битмап();
        gs_bmpMask = new Битмап();
        gs_bmpWithMask = new Битмап();
        gs_bmp4 = new Битмап();
        gs_bmp4_mono = new Битмап();
        gs_bmp36 = new Битмап();

/*
        wxPathList pathList;
        pathList.Добавь(("."));
        pathList.Добавь((".."));
*/

        // ткст путь = pathList.FindValidPath(("pat4.bmp"));
        ткст путь = "../Samples/Drawing/pat4.bmp";
        if ( !путь )
            return нет;

        /* 4 colour битмап */
        gs_bmp4.ЗагрузиФайл(путь, ТипБитмапа.wxBITMAP_TYPE_BMP);
        /* turn into mono-битмап */
        gs_bmp4_mono.ЗагрузиФайл(путь, ТипБитмапа.wxBITMAP_TYPE_BMP);
        Маска mask4 = new Маска(gs_bmp4_mono, Цвет.wxBLACK);
        gs_bmp4_mono.маска(mask4);

        // путь = pathList.FindValidPath(("pat36.bmp"));
        путь = "../Samples/Drawing/pat36.bmp";
        if ( !путь )
            return нет;
        gs_bmp36.ЗагрузиФайл(путь, ТипБитмапа.wxBITMAP_TYPE_BMP);
        Маска mask36 = new Маска(gs_bmp36, Цвет.wxBLACK);
        gs_bmp36.маска(mask36);

        // путь = pathList.FindValidPath(("рисунок.bmp"));
        путь = "../Samples/Drawing/рисунок.bmp";
        if ( !путь )
            return нет;
        gs_bmpNoMask.ЗагрузиФайл(путь, ТипБитмапа.wxBITMAP_TYPE_BMP);
        gs_bmpWithMask.ЗагрузиФайл(путь, ТипБитмапа.wxBITMAP_TYPE_BMP);
        gs_bmpWithColMask.ЗагрузиФайл(путь, ТипБитмапа.wxBITMAP_TYPE_BMP);

        // путь = pathList.FindValidPath(("маска.bmp"));
        путь = "../Samples/Drawing/маска.bmp";
        if ( !путь )
            return нет;
        gs_bmpMask.ЗагрузиФайл(путь, ТипБитмапа.wxBITMAP_TYPE_BMP);

        Маска маска = new Маска(gs_bmpMask, Цвет.wxBLACK);
        gs_bmpWithMask.маска(маска);

        маска = new Маска(gs_bmpWithColMask, Цвет.wxWHITE);
        gs_bmpWithColMask.маска(маска);

        return да;
    }

};

// Create a new application object: this macro will allow wxWidgets to create
// the application object during program execution (it's better than using a
// static object for many reasons) and also declares the accessor function
// wxGetApp() which will return the reference of the right тип (i.e. Drawing and
// not Прил)
цел main()
{
	Drawing.Main();
	return 0;
}




// Define a new frame тип: this is going to be our main frame
class MyFrame : public Фрейм
{

    // frame ructor
    this( ткст title,  Точка поз,  Размер size)
    {
        super(пусто, wxID_ANY, title, поз, size,
                     wxDEFAULT_FRAME_STYLE | wxNO_FULL_REPAINT_ON_RESIZE);
        // set the frame иконка
        иконка = new Icon("../Samples/Drawing/mondrian.png");

        Меню menuFile = new Меню();
        menuFile.Append(File_ShowDefault, "&Default screen\tF1");
        menuFile.Append(File_ShowText, "&Текст screen\tF2");
        menuFile.Append(File_ShowLines, "&Lines screen\tF3");
        menuFile.Append(File_ShowBrushes, "&Brushes screen\tF4");
        menuFile.Append(File_ShowPolygons, "&Polygons screen\tF5");
        menuFile.Append(File_ShowMask, "&Маска screen\tF6");
        menuFile.Append(File_ShowOps, "&ROP screen\tF7");
        menuFile.Append(File_ShowRegions, "Re&gions screen\tF8");
        menuFile.Append(File_ShowCircles, "&Circles screen\tF9");

//        menuFile.Append(File_ShowAlpha, "&Alpha screen\tF10");

        menuFile.Append(File_ShowSplines, "&Splines screen\tF11");
        menuFile.Append(File_ShowGradients, "&Gradients screen\tF12");
        menuFile.AppendSeparator();
        menuFile.AppendCheckItem(File_Clip, "&Clip\tCtrl-C", "Clip/unclip drawing");

        menuFile.AppendCheckItem(File_GraphicContext, "&Use GraphicContext\tCtrl-Y", "Use GraphicContext");

        menuFile.AppendSeparator();
        menuFile.Append(File_About, "&About...\tCtrl-A", "Show about dialog");
        menuFile.AppendSeparator();
        menuFile.Append(File_Quit, "E&xit\tAlt-X", "Quit this program");

        Меню menuMapMode = new Меню();
        menuMapMode.Append( MapMode_Text, "&TEXT map mode" );
        menuMapMode.Append( MapMode_Lometric, "&LOMETRIC map mode" );
        menuMapMode.Append( MapMode_Twips, "T&WIPS map mode" );
        menuMapMode.Append( MapMode_Points, "&POINTS map mode" );
        menuMapMode.Append( MapMode_Metric, "&METRIC map mode" );

        Меню menuUserScale = new Меню();
        menuUserScale.Append( UserScale_StretchHoriz, "Stretch &горизонтально\tCtrl-H" );
        menuUserScale.Append( UserScale_ShrinkHoriz, "Shrin&k горизонтально\tCtrl-G" );
        menuUserScale.Append( UserScale_StretchVertic, "Stretch &vertically\tCtrl-V" );
        menuUserScale.Append( UserScale_ShrinkVertic, "&Shrink vertically\tCtrl-W" );
        menuUserScale.AppendSeparator();
        menuUserScale.Append( UserScale_Restore, "&Restore to normal\tCtrl-0" );

        Меню menuAxis = new Меню();
        menuAxis.AppendCheckItem( AxisMirror_Horiz, "Зеркало горизонтально\tCtrl-M" );
        menuAxis.AppendCheckItem( AxisMirror_Vertic, "Зеркало vertically\tCtrl-N" );

        Меню menuLogical = new Меню();
        menuLogical.Append( LogicalOrigin_MoveDown, "Move &down\tCtrl-D" );
        menuLogical.Append( LogicalOrigin_MoveUp, "Move &up\tCtrl-U" );
        menuLogical.Append( LogicalOrigin_MoveLeft, "Move &right\tCtrl-L" );
        menuLogical.Append( LogicalOrigin_MoveRight, "Move &left\tCtrl-R" );
        menuLogical.AppendSeparator();
        menuLogical.Append( LogicalOrigin_Set, ("Установи to (&100, 100)\tShift-Ctrl-1") );
        menuLogical.Append( LogicalOrigin_Restore, "&Restore to normal\tShift-Ctrl-0" );

        Меню menuColour = new Меню();

        menuColour.Append( Colour_TextForeground, "Текст &foreground..." );
        menuColour.Append( Colour_TextBackground, "Текст &background..." );
        menuColour.Append( Colour_Background, "Фон &colour..." );

        menuColour.AppendCheckItem( Colour_BackgroundMode, "&Opaque/transparent\tCtrl-B" );
        menuColour.AppendCheckItem( Colour_TextureBackgound, "Draw textured back&ground\tCtrl-T" );

        // now append the freshly created меню to the меню bar...
        MenuBar menuBar = new MenuBar();
        menuBar.Append(menuFile, "&File");
        menuBar.Append(menuMapMode, "&Mode");
        menuBar.Append(menuUserScale, "&Масштабируй");
        menuBar.Append(menuAxis, "&Axis");
        menuBar.Append(menuLogical, "&Origin");
        menuBar.Append(menuColour, "&Colours");

        // ... and attach this меню bar to the frame
        this.menuBar = menuBar;




        CreateStatusBar(2);
        StatusText = "Welcome to wxWidgets!";


        m_mapMode = MapMode.wxMM_TEXT;
        m_xUserScale = 1.0;
        m_yUserScale = 1.0;
        m_xLogicalOrigin = 0;
        m_yLogicalOrigin = 0;
        m_xAxisReversed = нет;
        m_yAxisReversed = нет;
        m_backgroundMode = СтильЗаливки.wxSOLID;
        m_colourForeground = Цвет.wxRED;
        m_colourBackground = Цвет.wxBLUE;
        m_textureBackground = нет;

         m_canvas = new MyCanvas( this );
        m_canvas.SetScrollbars( 10, 10, 100, 240 );

// the event tables connect the wxWidgets events with the functions (event
// handlers) which process them. It can be also done at run-time, but for the
// simple меню events like this the static method is much simpler.

    EVT_MENU      (File_Quit,     &OnQuit);
    EVT_MENU      (File_About,    &OnAbout);
    EVT_MENU      (File_Clip,     &OnClip);
    EVT_MENU      (File_GraphicContext, &OnGraphicContext);



    EVT_MENU_RANGE(MenuShow_First,   MenuShow_Last,   &OnShow);
    EVT_MENU_RANGE(MenuOption_First, MenuOption_Last, &OnOption);


    }

    // event handlers (these functions should _not_ be virtual)
    проц OnQuit(Объект sender, Событие e)
    {
        // CommandEvent event = cast(CommandEvent) e;
        // да is to force the frame to close
        Закрой(да);
    }

    проц OnAbout(Объект sender, Событие e)
    {
        // CommandEvent event = cast(CommandEvent) e;
        ткст msg;
        msg = ("This is the about dialog of the drawing sample.\n
                    This sample tests various primitive drawing functions\n
                    (without any attempts to prevent flicker).\n
                    Copyright (c) Robert Roebling 1999");


        MessageBox(msg, "About Drawing", Диалог.wxOK | Диалог.wxICON_INFORMATION, this);
    }


    проц OnClip(Объект sender, Событие e)
    {
        CommandEvent event = cast(CommandEvent) e;
        m_canvas.Clip(event.IsChecked());
    }


    проц OnGraphicContext(Объект sender, Событие e)
    {
        CommandEvent event = cast(CommandEvent) e;
        m_canvas.UseGraphicContext(event.IsChecked());
    }


    проц OnShow(Объект sender, Событие e)
    {
        CommandEvent event = cast(CommandEvent) e;
        m_canvas.ToShow(cast(ScreenToShow)(event.ИД() - MenuShow_First));
    }


    проц OnOption(Объект sender, Событие e)
    {
        CommandEvent event = cast(CommandEvent) e;
        switch (event.ИД())
        {
            case MapMode_Text:
                m_mapMode = MapMode.wxMM_TEXT;
                break;
            case MapMode_Lometric:
                m_mapMode = MapMode.wxMM_LOMETRIC;
                break;
            case MapMode_Twips:
                m_mapMode = MapMode.wxMM_TWIPS;
                break;
            case MapMode_Points:
                m_mapMode = MapMode.wxMM_POINTS;
                break;
            case MapMode_Metric:
                m_mapMode = MapMode.wxMM_METRIC;
                break;

            case LogicalOrigin_MoveDown:
                m_yLogicalOrigin += 10;
                break;
            case LogicalOrigin_MoveUp:
                m_yLogicalOrigin -= 10;
                break;
            case LogicalOrigin_MoveLeft:
                m_xLogicalOrigin += 10;
                break;
            case LogicalOrigin_MoveRight:
                m_xLogicalOrigin -= 10;
                break;
            case LogicalOrigin_Set:
                m_xLogicalOrigin =
                m_yLogicalOrigin = -100;
                break;
            case LogicalOrigin_Restore:
                m_xLogicalOrigin =
                m_yLogicalOrigin = 0;
                break;

            case UserScale_StretchHoriz:
                m_xUserScale *= 1.10;
                break;
            case UserScale_ShrinkHoriz:
                m_xUserScale /= 1.10;
                break;
            case UserScale_StretchVertic:
                m_yUserScale *= 1.10;
                break;
            case UserScale_ShrinkVertic:
                m_yUserScale /= 1.10;
                break;
            case UserScale_Restore:
                m_xUserScale =
                m_yUserScale = 1.0;
                break;

            case AxisMirror_Vertic:
                m_yAxisReversed = !m_yAxisReversed;
                break;
            case AxisMirror_Horiz:
                m_xAxisReversed = !m_xAxisReversed;
                break;


            case Colour_TextForeground:
                m_colourForeground = SelectColour();
                break;
            case Colour_TextBackground:
                m_colourBackground = SelectColour();
                break;
            case Colour_Background:
                {
                    Цвет col = SelectColour();
//                    if ( col.Ок() )
                    if ( col !is пусто )
                    {
                        m_backgroundBrush.colour(col);
                    }
                }
                break;


            case Colour_BackgroundMode:
                m_backgroundMode = m_backgroundMode == СтильЗаливки.wxSOLID ? СтильЗаливки.wxTRANSPARENT
                                                               : СтильЗаливки.wxSOLID;
                break;

            case Colour_TextureBackgound:
                m_textureBackground = ! m_textureBackground;
                break;

            default:
                // skip Refresh()
                return;
        }

        m_canvas.Refresh();
    }


    Цвет SelectColour()
    {
        Цвет col;
        ColourData данные;
        ColourДиалог dialog = new ColourДиалог(this, данные);

        if ( dialog.ShowModal() == wxID_OK )
        {
            col = dialog.colourData().colour();
        }

        return col;
    }


    проц PrepareDC(DC dc)
    {
        dc.SetLogicalOrigin( m_xLogicalOrigin, m_yLogicalOrigin );
        dc.SetAxisOrientation( !m_xAxisReversed, m_yAxisReversed );
        dc.SetUserScale( m_xUserScale, m_yUserScale );
        dc.MapMode( m_mapMode );
    }

    СтильЗаливки         m_backgroundMode;
    бул         m_textureBackground;
    цел         m_mapMode;
    дво      m_xUserScale;
    дво      m_yUserScale;
    цел         m_xLogicalOrigin;
    цел         m_yLogicalOrigin;
    бул        m_xAxisReversed,
                m_yAxisReversed;
    Цвет      m_colourForeground,    // these are _text_ colours
                m_colourBackground;
    Кисть       m_backgroundBrush;
    MyCanvas   m_canvas;


};


// ----------------------------------------------------------------------------
// MyCanvas
// ----------------------------------------------------------------------------
// define a scrollable canvas for drawing onto
class MyCanvas: public ScrolledWindow
{

    this( MyFrame родитель )
    {

    super(родитель, wxID_ANY, wxDefaultPosition, wxDefaultSize,
                           wxHSCROLL | wxVSCROLL | wxNO_FULL_REPAINT_ON_RESIZE);


    m_owner = родитель;
    m_show = ScreenToShow.Show_Default;
    // m_smile_bmp = new Битмап(smile_xpm);
    m_smile_bmp = new Битмап("../Samples/Drawing/smile.xpm", ТипБитмапа.wxBITMAP_TYPE_XPM);
    //m_smile_bmp = пусто;

    m_std_icon = ArtProvider.GetIcon( ArtID.wxART_INFORMATION );
    m_clip = нет;

    m_useContext = нет;

// the event tables connect the wxWidgets events with the functions (event
// handlers) which process them.
    EVT_PAINT  (&OnPaint);
    EVT_MOTION (&OnMouseMove);

    }

    проц OnPaint(Объект sender, Событие e)
    {
        PaintEvent event = cast(PaintEvent) e;

        PaintDC dc = new PaintDC(this);
        PrepareDC(dc);
        m_owner.PrepareDC(dc);

        dc.ФоновыйРежим( m_owner.m_backgroundMode );


        if(m_owner.m_backgroundBrush !is пусто)
//            MessageBox("m_owner.m_backgroundBrush is пусто");
//        else
            dc.Фон( m_owner.m_backgroundBrush );


//        if ( m_owner.m_colourForeground.Ок() )
        if ( m_owner.m_colourForeground !is пусто )
            dc.ППланТекста( m_owner.m_colourForeground );
//        if ( m_owner.m_colourBackground.Ок() )
        if ( m_owner.m_colourBackground !is пусто )
            dc.ЗПланТекста( m_owner.m_colourBackground );

        if ( m_owner.m_textureBackground) {
//            if ( ! m_owner.m_backgroundBrush.Ок() ) 
            if ( m_owner.m_backgroundBrush is пусто ) 
            {
                Цвет clr = new Цвет(0,128,0);
                Кисть с = new Кисть(clr, СтильЗаливки.wxSOLID);
                dc.Фон(с);
            }
        }


        if ( m_clip )
            dc.SetClippingRegion(100, 100, 100, 100);



        if ( m_owner.m_textureBackground )
        {
            dc.перо( Перо.wxMEDIUM_GREY_PEN);
            for ( цел i = 0; i < 200; i++ )
                dc.РисуйЛинию(0, i*10, i*10, 0);
        }



        switch ( m_show )
        {
            case ScreenToShow.Show_Default:
                DrawDefault(dc);
                break;

            case ScreenToShow.Show_Circles:
                DrawCircles(dc);
                break;

            case ScreenToShow.Show_Splines:
                DrawSplines(dc);
                break;

            case ScreenToShow.Show_Regions:
                DrawRegions(dc);
                break;

            case ScreenToShow.Show_Text:
                РисуйТекст(dc);
                break;

            case ScreenToShow.Show_Lines:
                DrawTestLines( 0, 100, 0, dc );
                DrawTestLines( 0, 320, 1, dc );
                DrawTestLines( 0, 540, 2, dc );
                DrawTestLines( 0, 760, 6, dc );
                break;

            case ScreenToShow.Show_Brushes:
                DrawTestBrushes(dc);
                break;

            case ScreenToShow.Show_Polygons:
                DrawTestPoly(dc);
                break;

            case ScreenToShow.Show_Mask:
                DrawImages(dc);
                break;

            case ScreenToShow.Show_Ops:
                DrawWithLogicalOps(dc);
                break;
            

/*
            case ScreenToShow.Show_Alpha:
                 DrawAlpha(dc);
                break;
*/

            case ScreenToShow.Show_Gradient:
                DrawGradients(dc);
                break;

            default:
                break;
        }

        dc.Dispose();
    }


    проц OnMouseMove(Объект sender, Событие e)
    {

        ClientDC dc = new ClientDC(this);
        PrepareDC(dc);
        m_owner.PrepareDC(dc);
        MouseEvent event = cast(MouseEvent) e;
        Точка поз = event.Положение();
        long x = dc.DeviceToLogicalX( поз.X );
        long y = dc.DeviceToLogicalY( поз.Y );

        ткст str = "Current mouse position: " ~ std.string.toString(x) ~ ", " ~ std.string.toString(y );
        m_owner.StatusText = str;

//        wxUnusedVar(event);

    }


    проц ToShow(ScreenToShow show) { m_show = show; Refresh(); }

    // set or remove the clipping region
    проц Clip(бул clip) { m_clip = clip; Refresh(); }

    проц UseGraphicContext(бул use) { m_useContext = use; Refresh(); }



    проц DrawTestLines( цел x, цел y, цел ширина, DC dc )
    {
        dc.перо( new Перо( "black", ширина, СтильЗаливки.wxSOLID) );
        dc.кисть( Кисть.wxRED_BRUSH );
        dc.РисуйТекст(("Testing lines of ширина " ~ std.string.toString(ширина)), x + 10, y - 10);
        dc.РисуйПрям( x+10, y+10, 100, 190 );

        dc.РисуйТекст(("Solid/dot/short dash/long dash/dot dash"), x + 150, y + 10);
        dc.перо( new Перо( "black", ширина, СтильЗаливки.wxSOLID) );
        dc.РисуйЛинию( x+20, y+20, 100, y+20 );
        dc.перо( new Перо( "black", ширина, СтильЗаливки.wxDOT) );
        dc.РисуйЛинию( x+20, y+30, 100, y+30 );
        dc.перо( new Перо( "black", ширина, СтильЗаливки.wxSHORT_DASH) );
        dc.РисуйЛинию( x+20, y+40, 100, y+40 );
//        dc.перо( new Перо( "black", ширина, СтильЗаливки.wxLONG_DASH) );
//        dc.РисуйЛинию( x+20, y+50, 100, y+50 );
        dc.перо( new Перо( "black", ширина, СтильЗаливки.wxDOT_DASH) );
        dc.РисуйЛинию( x+20, y+60, 100, y+60 );

        dc.РисуйТекст(("Misc hatches"), x + 150, y + 70);
        dc.перо( new Перо( "black", ширина, СтильЗаливки.wxBDIAGONAL_HATCH) );
        dc.РисуйЛинию( x+20, y+70, 100, y+70 );
        dc.перо( new Перо( "black", ширина, СтильЗаливки.wxCROSSDIAG_HATCH) );
        dc.РисуйЛинию( x+20, y+80, 100, y+80 );
        dc.перо( new Перо( "black", ширина, СтильЗаливки.wxFDIAGONAL_HATCH) );
        dc.РисуйЛинию( x+20, y+90, 100, y+90 );
        dc.перо( new Перо( "black", ширина, СтильЗаливки.wxCROSS_HATCH) );
        dc.РисуйЛинию( x+20, y+100, 100, y+100 );
        dc.перо( new Перо( "black", ширина, СтильЗаливки.wxHORIZONTAL_HATCH) );
        dc.РисуйЛинию( x+20, y+110, 100, y+110 );
        dc.перо( new Перо( "black", ширина, СтильЗаливки.wxVERTICAL_HATCH) );
        dc.РисуйЛинию( x+20, y+120, 100, y+120 );

        dc.РисуйТекст(("User dash"), x + 150, y + 140);
        Перо ud = new Перо( "black", ширина, СтильЗаливки.wxUSER_DASH );
        wxDash dash1[6];
        dash1[0] = 8;  // Long dash  <---------+
        dash1[1] = 2;  // Short gap            |
        dash1[2] = 3;  // Short dash           |
        dash1[3] = 2;  // Short gap            |
        dash1[4] = 3;  // Short dash           |
        dash1[5] = 2;  // Short gap and repeat +
        // ud.SetDashes( 6, dash1 );
        dc.перо( ud );
        dc.РисуйЛинию( x+20, y+140, 100, y+140 );
        dash1[0] = 5;  // Make first dash shorter
        // ud.SetDashes( 6, dash1 );
        dc.перо( ud );
        dc.РисуйЛинию( x+20, y+150, 100, y+150 );
        dash1[2] = 5;  // Make second dash longer
        // ud.SetDashes( 6, dash1 );
        dc.перо( ud );
        dc.РисуйЛинию( x+20, y+160, 100, y+160 );
        dash1[4] = 5;  // Make third dash longer
        // ud.SetDashes( 6, dash1 );
        dc.перо( ud );
        dc.РисуйЛинию( x+20, y+170, 100, y+170 );
    }


    проц DrawTestPoly(DC dc)
    {
        Кисть brushHatch = new Кисть( Цвет.wxRED, СтильЗаливки.wxFDIAGONAL_HATCH);
        dc.кисть(brushHatch);

        Точка[5] star;
        star[0] = Точка(100, 60);
        star[1] = Точка(60, 150);
        star[2] = Точка(160, 100);
        star[3] = Точка(40, 100);
        star[4] = Точка(140, 150);

        dc.РисуйТекст(("You should see two (irregular) stars below, the left one hatched"), 10, 10);
        dc.РисуйТекст(("except for the central region and the right one entirely hatched"), 10, 30);
        dc.РисуйТекст(("The third star only has a hatched outline"), 10, 50);

        dc.РисуйМногоуг(star.length, star, 0, 30);
        dc.РисуйМногоуг(star.length, star, 160, 30, СтильЗаливки.wxWINDING_RULE);

        Точка[10] star2;
        star2[0] = Точка(0, 100);
        star2[1] = Точка(-59, -81);
        star2[2] = Точка(95, 31);
        star2[3] = Точка(-95, 31);
        star2[4] = Точка(59, -81);
        star2[5] = Точка(0, 80);
        star2[6] = Точка(-47, -64);
        star2[7] = Точка(76, 24);
        star2[8] = Точка(-76, 24);
        star2[9] = Точка(47, -64);
        цел[2] счёт = [5, 5];

//        dc.DrawPolyPolygon( счёт.length, счёт, star2, 450, 150);
    }


    проц DrawTestBrushes(DC dc)
    {
        static  wxCoord WIDTH = 200;
        static  wxCoord HEIGHT = 80;

        wxCoord x = 10,
                y = 10;

        dc.кисть( new Кисть( Цвет.wxGREEN, СтильЗаливки.wxSOLID) );
        dc.РисуйПрям(x, y, WIDTH, HEIGHT);
        dc.РисуйТекст( "Solid зелёный", x + 10, y + 10);

        y += HEIGHT;
        dc.кисть( new Кисть(Цвет.wxRED, СтильЗаливки.wxCROSSDIAG_HATCH) );
        dc.РисуйПрям(x, y, WIDTH, HEIGHT);
        dc.РисуйТекст(("Hatched красный"), x + 10, y + 10);

        y += HEIGHT;
        dc.кисть( new Кисть(gs_bmpMask));
        dc.РисуйПрям(x, y, WIDTH, HEIGHT);
        dc.РисуйТекст(("Stipple mono"), x + 10, y + 10);

        y += HEIGHT;
        dc.кисть( new Кисть(gs_bmpNoMask));
        dc.РисуйПрям(x, y, WIDTH, HEIGHT);
        dc.РисуйТекст(("Stipple colour"), x + 10, y + 10);
    }


    проц РисуйТекст(DC dc)
    {
        // set underlined шрифт for testing
        dc.шрифт( new Шрифт(12, FontFamily.wxMODERN, FontStyle.wxNORMAL, FontWeight.wxNORMAL, да) );
        dc.РисуйТекст( "This is текст", 110, 10 );
        dc.DrawRotatedText( "That is текст", 20, 10, -45 );

        // use wxSWISS_FONT and not FontFamily.wxNORMAL_FONT as the latter can't be rotated
        // under Win9x (it is not TrueType)
        dc.шрифт( Шрифт.wxSWISS_FONT );

        //wxString текст;
        ткст текст;
        dc.ФоновыйРежим(СтильЗаливки.wxTRANSPARENT);

        for ( цел n = -180; n < 180; n += 30 )
        {
            // текст.Printf(("     %d rotated текст"), n);
            текст = "     %d rotated текст";
            dc.DrawRotatedText(текст , 400, 400, n);
        }

        dc.шрифт( new Шрифт( 18, FontFamily.wxSWISS, FontStyle.wxNORMAL, FontWeight.wxNORMAL ) );

        dc.РисуйТекст( "This is Swiss 18pt текст.", 110, 40 );

        цел length;
        цел высота;
        цел descent;
        цел externalLeading;
        dc.GetTextExtent( "This is Swiss 18pt текст.", length, высота, descent, externalLeading, пусто);
        //текст.Printf( "Dimensions are length %ld, высота %ld, descent %ld", length, высота, descent );
        текст = "Dimensions are length %ld, высота %ld, descent %ld";
        dc.РисуйТекст( текст, 110, 80 );

        //текст.Printf( ("CharHeight() returns: %d"), dc.CharHeight() );
        текст = "CharHeight() returns: %d";
        dc.РисуйТекст( текст, 110, 120 );

        dc.РисуйПрям( 100, 40, 4, высота );

        // test the logical function effect
        wxCoord y = 150;
        dc.LogicalFunction(Logic.wxINVERT);
        dc.РисуйТекст( "There should be no текст below", 110, 150 );
        dc.РисуйПрям( 110, y, 100, высота );

        // twice drawn inverted should result in invisible
        y += высота;
        dc.РисуйТекст( "Invisible текст", 110, y );
        dc.РисуйПрям( 110, y, 100, высота );
        dc.РисуйТекст( "Invisible текст", 110, y );
        dc.РисуйПрям( 110, y, 100, высота );
        dc.LogicalFunction(Logic.wxCOPY);

        y += высота;
        dc.РисуйПрям( 110, y, 100, высота );
        dc.РисуйТекст( "Visible текст", 110, y );
    }


    проц DrawImages(DC dc)
    {
        dc.РисуйТекст(("original рисунок"), 0, 0);
        dc.РисуйБитмап(gs_bmpNoMask, 0, 20, 0);
        dc.РисуйТекст(("with colour маска"), 0, 100);
        dc.РисуйБитмап(gs_bmpWithColMask, 0, 120, да);
        dc.РисуйТекст(("the маска рисунок"), 0, 200);
        dc.РисуйБитмап(gs_bmpMask, 0, 220, 0);
        dc.РисуйТекст(("masked рисунок"), 0, 300);
        dc.РисуйБитмап(gs_bmpWithMask, 0, 320, да);

        цел cx = gs_bmpWithColMask.Ширина(),
            cy = gs_bmpWithColMask.Высота();

        MemoryDC memDC = new MemoryDC();

        memDC.SelectObject(gs_bmpWithColMask);
        for ( size_t n = 0; n < rasterOperations.length; n++ )
        {
            wxCoord x = cast(wxCoord) (120 + 150*(n%4)),
                    y =  cast(wxCoord) (20 + 100*(n/4));

            dc.РисуйТекст(rasterOperations[n].имя, x, y - 20);
            dc.Blit(x, y, cx, cy, memDC, 0, 0, rasterOperations[n].rop, да);
        }
        memDC.SelectObject(Битмап.wxNullBitmap);
    }


    проц DrawWithLogicalOps(DC dc)
    {
        static  wxCoord w = 60;
        static  wxCoord h = 60;

        // reuse the текст colour here
        dc.перо( new Перо(m_owner.m_colourForeground, 1, СтильЗаливки.wxSOLID));
        dc.кисть( Кисть.wxTRANSPARENT_BRUSH );

        size_t n;
        for ( n = 0; n < rasterOperations.length; n++ )
        {
            wxCoord x = cast(wxCoord) (20 + 150*(n%4)),
                    y = cast(wxCoord) (20 + 100*(n/4));

            dc.РисуйТекст(rasterOperations[n].имя, x, y - 20);
            dc.LogicalFunction(rasterOperations[n].rop);
            dc.РисуйПрям(x, y, w, h);
            dc.РисуйЛинию(x, y, x + w, y + h);
            dc.РисуйЛинию(x + w, y, x, y + h);
        }

        // now some filled rectangles
        dc.кисть( new Кисть(m_owner.m_colourForeground, СтильЗаливки.wxSOLID));

        for ( n = 0; n < rasterOperations.length; n++ )
        {
            wxCoord x = cast(wxCoord) (20 + 150*(n%4)),
                    y = cast(wxCoord) (500 + 100*(n/4));

            dc.РисуйТекст(rasterOperations[n].имя, x, y - 20);
            dc.LogicalFunction(rasterOperations[n].rop);
            dc.РисуйПрям(x, y, w, h);
        }
    }

/+++++
    проц DrawAlpha(DC dc)
    {

        GCDC dc = new GCDC( this );
        PrepareDC( dc );


        дво margin = 20 ;
        дво ширина = 180 ;
        дво radius = 30 ;
        
        dc.перо( new Перо( new Цвет( 128, 0, 0 ),12, СтильЗаливки.wxSOLID));
        dc.кисть( new Кисть( new Цвет( 255, 0, 0 ),СтильЗаливки.wxSOLID));
        
        wx.common.Rect к = wx.common.Rect( cast(цел) margin, cast(цел)(margin+ширина*0.66), cast(цел) ширина, cast(цел)ширина) ;

        
        dc.РисуйОкруглыйПрям( к.X, к.Y, к.Ширина, к.Ширина, radius ) ;
        
        dc.перо( new Перо( new Цвет( 0, 0, 128 ),12, СтильЗаливки.wxSOLID));
        dc.кисть( new Кисть( new Цвет( 0, 0, 255 ),СтильЗаливки.wxSOLID));
        
        //к.Offset( ширина * 0.8 , - ширина * 0.66 ) ;
        
        dc.РисуйОкруглыйПрям( к.X, к.Y, к.Ширина, к.Ширина, radius ) ;
        
        dc.перо( new Перо( new Цвет( 128, 128, 0 ),12, СтильЗаливки.wxSOLID));
        dc.кисть( new Кисть( new Цвет( 192, 192, 0 ),СтильЗаливки.wxSOLID));

        //к.Offset( ширина * 0.8 , ширина *0.5 ) ;
        
        dc.РисуйОкруглыйПрям( к.X, к.Y, к.Ширина, к.Ширина, radius ) ;
        
        dc.перо( Перо.wxTRANSPARENT_PEN ) ;
        dc.кисть( new Кисть( new Цвет( 255,255,128 ) ) );
        dc.РисуйОкруглыйПрям( 0 , cast(цел)(margin + ширина / 2) , cast(цел) ширина * 3 , 100 , radius) ;
        
        dc.ППланТекста( new Цвет(255,255,0 ) );
        dc.шрифт( new Шрифт( 40, FontFamily.wxSWISS, FontStyle.wxITALIC, FontWeight.wxNORMAL ) );
        dc.РисуйТекст( "Hello!", 120, 80 );
    }
+++++/

    проц DrawRegions(DC dc)
    {
        dc.РисуйТекст(("You should see a красный прям partly covered by a cyan one on the left"), 10, 5);
        dc.РисуйТекст(("and 5 smileys from which 4 are partially clipped on the right"),
                    10, 5 + (cast(WindowDC)dc).CharHeight());
        dc.РисуйТекст(("The second copy should be identical but right part of it should be offset by 10 pixels."),
                    10, 5 + 2*(cast(WindowDC)dc).CharHeight());

        DrawRegionsHelper(dc, 10, да);
        DrawRegionsHelper(dc, 350, нет);
    }



    проц DrawCircles(DC dc)
    {
        цел x = 100,
            y = 100,
            к = 20;

        dc.перо( Перо.wxRED_PEN );
        dc.кисть( Кисть.wxGREEN_BRUSH );

        dc.РисуйТекст(("Some circles"), 0, y);
        dc.DrawCircle(x, y, к);
        dc.DrawCircle(x + 2*к, y, к);
        dc.DrawCircle(x + 4*к, y, к);

        y += 2*к;
        dc.РисуйТекст(("And ellipses"), 0, y);
        dc.РисуйЭллипс(x - к, y, 2*к, к);
        dc.РисуйЭллипс(x + к, y, 2*к, к);
        dc.РисуйЭллипс(x + 3*к, y, 2*к, к);

        y += 2*к;
        dc.РисуйТекст(("And arcs"), 0, y);
        dc.DrawArc(x - к, y, x + к, y, x, y);
        dc.DrawArc(x + 4*к, y, x + 2*к, y, x + 3*к, y);
        dc.DrawArc(x + 5*к, y, x + 5*к, y, x + 6*к, y);

        y += 2*к;
        dc.DrawEllipticArc(x - к, y, 2*к, к, 0, 90);
        dc.DrawEllipticArc(x + к, y, 2*к, к, 90, 180);
        dc.DrawEllipticArc(x + 3*к, y, 2*к, к, 180, 270);
        dc.DrawEllipticArc(x + 5*к, y, 2*к, к, 270, 360);
        
        // same as above, just transparent кисть
        
        dc.перо( Перо.wxRED_PEN );
        dc.кисть( Кисть.wxTRANSPARENT_BRUSH );

        y += 2*к;
        dc.РисуйТекст(("Some circles"), 0, y);
        dc.DrawCircle(x, y, к);
        dc.DrawCircle(x + 2*к, y, к);
        dc.DrawCircle(x + 4*к, y, к);

        y += 2*к;
        dc.РисуйТекст(("And ellipses"), 0, y);
        dc.РисуйЭллипс(x - к, y, 2*к, к);
        dc.РисуйЭллипс(x + к, y, 2*к, к);
        dc.РисуйЭллипс(x + 3*к, y, 2*к, к);

        y += 2*к;
        dc.РисуйТекст(("And arcs"), 0, y);
        dc.DrawArc(x - к, y, x + к, y, x, y);
        dc.DrawArc(x + 4*к, y, x + 2*к, y, x + 3*к, y);
        dc.DrawArc(x + 5*к, y, x + 5*к, y, x + 6*к, y);

        y += 2*к;
        dc.DrawEllipticArc(x - к, y, 2*к, к, 0, 90);
        dc.DrawEllipticArc(x + к, y, 2*к, к, 90, 180);
        dc.DrawEllipticArc(x + 3*к, y, 2*к, к, 180, 270);
        dc.DrawEllipticArc(x + 5*к, y, 2*к, к, 270, 360);
        
    }


    проц DrawSplines(DC dc)
    {

        dc.РисуйТекст(("Some splines"), 10, 5);

        // values are hardcoded rather than randomly generated
        // so the output can be compared between native
        // implementations on platforms with different random
        // generators

         цел R = 300;
         Точка center = Точка( R + 20, R + 20 );
         цел angles[7] = [ 0, 10, 33, 77, 13, 145, 90 ];
         цел radii[5] = [ 100 , 59, 85, 33, 90 ];
         const цел N = 200;
        Точка[N] pts;

        // background spline calculation
        бцел radius_pos = 0;
        бцел angle_pos = 0;
        цел угол = 0;
        for ( цел i = 0; i < N; i++ )
        {
            угол += angles[ angle_pos ];
            цел к = R * radii[ radius_pos ] / 100;
            pts[ i ].X = center.X + cast(wxCoord)( к * cos( PI * угол / 180.0) );
            pts[ i ].Y = center.Y + cast(wxCoord)( к * sin( PI * угол / 180.0) );

            angle_pos++;
            if ( angle_pos >= angles.length ) angle_pos = 0;

            radius_pos++;
            if ( radius_pos >= radii.length ) radius_pos = 0;
        }

        // background spline drawing
        dc.перо( Перо.wxRED_PEN );
        dc.DrawSpline( pts);

        // less detailed spline calculation
        Точка letters[4][5];
        // w
        letters[0][0] = Точка( 0,1); //  O           O
        letters[0][1] = Точка( 1,3); //   *         *
        letters[0][2] = Точка( 2,2); //    *   O   *
        letters[0][3] = Точка( 3,3); //     * * * *
        letters[0][4] = Точка( 4,1); //      O   O
        // x1
        letters[1][0] = Точка( 5,1); //  O*O
        letters[1][1] = Точка( 6,1); //     *
        letters[1][2] = Точка( 7,2); //      O
        letters[1][3] = Точка( 8,3); //       *
        letters[1][4] = Точка( 9,3); //        O*O
        // x2
        letters[2][0] = Точка( 5,3); //        O*O
        letters[2][1] = Точка( 6,3); //       *
        letters[2][2] = Точка( 7,2); //      O
        letters[2][3] = Точка( 8,1); //     *
        letters[2][4] = Точка( 9,1); //  O*O
        // W
        letters[3][0] = Точка(10,0); //  O           O
        letters[3][1] = Точка(11,3); //   *         *
        letters[3][2] = Точка(12,1); //    *   O   *
        letters[3][3] = Точка(13,3); //     * * * *
        letters[3][4] = Точка(14,0); //      O   O

         цел dx = 2 * R / letters[3][4].X;
         цел h[4] = [ -R/2, 0, R/4, R/2 ];

        for ( цел m = 0; m < 4; m++ )
        {
            for ( цел n = 0; n < 5; n++ )
            {
                letters[m][n].X = center.X - R + letters[m][n].X * dx;
                letters[m][n].Y = center.X + h[ letters[m][n].Y ];
            }

            dc.перо( new Перо( "синий", 1, СтильЗаливки.wxDOT) );
            dc.DrawLines(letters[m]);
            dc.перо( new Перо( "black", 4, СтильЗаливки.wxSOLID) );
            dc.DrawSpline(letters[m]);
        }


        dc.РисуйТекст(("Splines not supported."), 10, 5);

    }



    проц DrawDefault(DC dc)
    {
        // mark the origin
        dc.DrawCircle(0, 0, 10);


        // GetPixel and FloodFill not supported by Mac OS X CoreGraphics
        // (FloodFill uses Blit from a non-MemoryDC)
        //flood fill using кисть, starting at 1,1 and replacing whatever colour we find there
        dc.кисть( new Кисть(new Цвет(128,128,0), СтильЗаливки.wxSOLID));

        Цвет tmpColour = new Цвет();
        dc.GetPixel(1,1, tmpColour);
        dc.FloodFill(1,1, tmpColour, FloodStyle.wxFLOOD_SURFACE);


        dc.DrawCheckMark(5, 80, 15, 15);
        dc.DrawCheckMark(25, 80, 30, 30);
        dc.DrawCheckMark(60, 80, 60, 60);

        // this is the test for "blitting битмап into DC damages selected кисть" bug
        wxCoord rectSize =cast(wxCoord)( m_std_icon.Ширина() + 10);

        wxCoord x = 100;
        dc.перо( Перо.wxTRANSPARENT_PEN);

        dc.кисть( Кисть.wxGREEN_BRUSH );
        dc.РисуйПрям(x, 10, rectSize, rectSize);

        dc.РисуйБитмап(m_smile_bmp, x + 5, 15, да);
        x += rectSize + 10;
        dc.РисуйПрям(x, 10, rectSize, rectSize);

        dc.DrawIcon(m_std_icon, x + 5, 15);
        x += rectSize + 10;
        dc.РисуйПрям(x, 10, rectSize, rectSize);

        // test for "transparent" битмап drawing (it intersects with the last
        // rectangle above)
        //dc.кисть( Кисть.wxTRANSPARENT_BRUSH );

        if (m_smile_bmp.Ок())
            dc.РисуйБитмап(m_smile_bmp, x + rectSize - 20, rectSize - 10, да);

        dc.кисть( Кисть.wxBLACK_BRUSH );
        dc.РисуйПрям( 0, 160, 1000, 300 );

        // draw lines
        Битмап битмап = new Битмап(20,70);
        MemoryDC memdc = new MemoryDC();
        memdc.SelectObject( битмап );
        memdc.кисть( Кисть.wxBLACK_BRUSH );
        memdc.перо( Перо.wxWHITE_PEN );
        memdc.РисуйПрям(0,0,20,70);
        memdc.РисуйЛинию( 10,0,10,70 );

        // to the right
        Перо перо = Перо.wxRED_PEN;
        memdc.перо(перо);
        memdc.РисуйЛинию( 10, 5,10, 5 );
        memdc.РисуйЛинию( 10,10,11,10 );
        memdc.РисуйЛинию( 10,15,12,15 );
        memdc.РисуйЛинию( 10,20,13,20 );

    /*
        memdc.перо( Перо.wxRED_PEN );
        memdc.РисуйЛинию( 12, 5,12, 5 );
        memdc.РисуйЛинию( 12,10,13,10 );
        memdc.РисуйЛинию( 12,15,14,15 );
        memdc.РисуйЛинию( 12,20,15,20 );
    */

        // same to the left
        memdc.РисуйЛинию( 10,25,10,25 );
        memdc.РисуйЛинию( 10,30, 9,30 );
        memdc.РисуйЛинию( 10,35, 8,35 );
        memdc.РисуйЛинию( 10,40, 7,40 );

        // XOR draw lines
        dc.перо( Перо.wxWHITE_PEN );
        memdc.LogicalFunction( Logic.wxINVERT );
        memdc.перо( Перо.wxWHITE_PEN );
        memdc.РисуйЛинию( 10,50,10,50 );
        memdc.РисуйЛинию( 10,55,11,55 );
        memdc.РисуйЛинию( 10,60,12,60 );
        memdc.РисуйЛинию( 10,65,13,65 );

        memdc.РисуйЛинию( 12,50,12,50 );
        memdc.РисуйЛинию( 12,55,13,55 );
        memdc.РисуйЛинию( 12,60,14,60 );
        memdc.РисуйЛинию( 12,65,15,65 );

        memdc.SelectObject( Битмап.wxNullBitmap );
        dc.РисуйБитмап( битмап, 10, 170 );
        wxImage рисунок = битмап.ConvertToImage();
        рисунок.Ремасштабируй( 60,210 );
        битмап = new Битмап(рисунок);
        dc.РисуйБитмап( битмап, 50, 170 );

        // test the rectangle outline drawing - there should be one pixel between
        // the прям and the lines
        dc.перо( Перо.wxWHITE_PEN);
        dc.кисть( Кисть.wxTRANSPARENT_BRUSH );
        dc.РисуйПрям(150, 170, 49, 29);
        dc.РисуйПрям(200, 170, 49, 29);
        dc.перо( Перо.wxWHITE_PEN );
        dc.РисуйЛинию(250, 210, 250, 170);
        dc.РисуйЛинию(260, 200, 150, 200);

        // test the rectangle filled drawing - there should be one pixel between
        // the прям and the lines
        dc.перо(Перо.wxTRANSPARENT_PEN);
        dc.кисть( Кисть.wxWHITE_BRUSH );
        dc.РисуйПрям(300, 170, 49, 29);
        dc.РисуйПрям(350, 170, 49, 29);
        dc.перо( Перо.wxWHITE_PEN );
        dc.РисуйЛинию(400, 170, 400, 210);
        dc.РисуйЛинию(300, 200, 410, 200);

        // a few more tests of this вид
        dc.перо( Перо.wxRED_PEN );
        dc.кисть( Кисть.wxWHITE_BRUSH );
        dc.РисуйПрям(300, 220, 1, 1);
        dc.РисуйПрям(310, 220, 2, 2);
        dc.РисуйПрям(320, 220, 3, 3);
        dc.РисуйПрям(330, 220, 4, 4);

        dc.перо(Перо.wxTRANSPARENT_PEN);
        dc.кисть( Кисть.wxWHITE_BRUSH );
        dc.РисуйПрям(300, 230, 1, 1);
        dc.РисуйПрям(310, 230, 2, 2);
        dc.РисуйПрям(320, 230, 3, 3);
        dc.РисуйПрям(330, 230, 4, 4);

        // and now for filled прям with outline
        dc.перо( Перо.wxRED_PEN );
        dc.кисть( Кисть.wxWHITE_BRUSH );
        dc.РисуйПрям(500, 170, 49, 29);
        dc.РисуйПрям(550, 170, 49, 29);
        dc.перо( Перо.wxWHITE_PEN );
        dc.РисуйЛинию(600, 170, 600, 210);
        dc.РисуйЛинию(500, 200, 610, 200);

        // test the rectangle outline drawing - there should be one pixel between
        // the прям and the lines
        dc.перо( Перо.wxWHITE_PEN );
        dc.кисть( Кисть.wxTRANSPARENT_BRUSH );
        dc.РисуйОкруглыйПрям(150, 270, 49, 29, 6);
        dc.РисуйОкруглыйПрям(200, 270, 49, 29, 6);
        dc.перо( Перо.wxWHITE_PEN );
        dc.РисуйЛинию(250, 270, 250, 310);
        dc.РисуйЛинию(150, 300, 260, 300);

        // test the rectangle filled drawing - there should be one pixel between
        // the прям and the lines
        dc.перо(Перо.wxTRANSPARENT_PEN);
        dc.кисть( Кисть.wxWHITE_BRUSH );
        dc.РисуйОкруглыйПрям(300, 270, 49, 29, 6);
        dc.РисуйОкруглыйПрям(350, 270, 49, 29, 6);
        dc.перо( Перо.wxWHITE_PEN );
        dc.РисуйЛинию(400, 270, 400, 310);
        dc.РисуйЛинию(300, 300, 410, 300);

        // Added by JACS to demonstrate bizarre behaviour.
        // With a size of 70, we get a missing красный RHS,
        // and the высота is too small, so we get yellow
        // showing. With a size of 40, it draws as expected:
        // it just shows a white rectangle with красный outline.
        цел totalWidth = 70;
        цел totalHeight = 70;
        Битмап bitmap2 = new Битмап(totalWidth, totalHeight);

        MemoryDC memdc2 = new MemoryDC();
        memdc2.SelectObject(bitmap2);

        Цвет clr = new Цвет(255, 255, 0);
        Кисть yellowBrush = new Кисть(clr, СтильЗаливки.wxSOLID);
        memdc2.Фон( yellowBrush );
        memdc2.Очисть();



        Перо yellowPen = new Перо(clr, 1, СтильЗаливки.wxSOLID);

        // Now draw a white rectangle with красный outline. It should
        // entirely eclipse the yellow background.
        memdc2.перо( Перо.wxRED_PEN );
        memdc2.кисть(Кисть.wxWHITE_BRUSH);

        memdc2.РисуйПрям(0, 0, totalWidth, totalHeight);

        memdc2.перо( Перо.wxNullPen );
        memdc2.кисть( Кисть.wxNullBrush );
        memdc2.SelectObject( Битмап.wxNullBitmap );

        dc.РисуйБитмап(bitmap2, 500, 270);

        // Repeat, but draw directly on dc
        // Draw a yellow rectangle filling the битмап

        x = 600; цел y = 270;
        dc.перо(yellowPen);
        dc.кисть( yellowBrush );
        dc.РисуйПрям(x, y, totalWidth, totalHeight);

        // Now draw a white rectangle with красный outline. It should
        // entirely eclipse the yellow background.
        dc.перо( Перо.wxRED_PEN );
        dc.кисть(Кисть.wxWHITE_BRUSH);

        dc.РисуйПрям(x, y, totalWidth, totalHeight);

    }


    проц DrawGradients(DC dc)
    {
        static  цел TEXT_HEIGHT = 15;
        Log tempLog = new Log();
        tempLog.LogMessage("Sorry! This function has not been implemented by wxD.");

/+++++
        // LHS: linear
        Rect к = {10, 10, 50, 50};
        dc.РисуйТекст(("wxRIGHT"), к.X, к.Y);
        к.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillLinear(к, wxWHITE, wxBLUE, wxRIGHT);

        к.Offset(0, к.Высота + 10);
        dc.РисуйТекст(("wxLEFT"), к.X, к.Y);
        к.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillLinear(к, *wxWHITE, *wxBLUE, wxLEFT);

        к.Offset(0, к.Высота + 10);
        dc.РисуйТекст(("wxDOWN"), к.X, к.Y);
        к.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillLinear(к, *wxWHITE, *wxBLUE, wxDOWN);

        к.Offset(0, к.Высота + 10);
        dc.РисуйТекст(("wxUP"), к.X, к.Y);
        к.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillLinear(к, *wxWHITE, *wxBLUE, wxUP);


        // RHS: concentric
        к = new Rect(200, 10, 50, 50);
        dc.РисуйТекст(("Синий inside"), к.X, к.Y);
        к.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillConcentric(к, *wxBLUE, *wxWHITE);

        к.Offset(0, к.Высота + 10);
        dc.РисуйТекст(("White inside"), к.X, к.Y);
        к.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillConcentric(к, *wxWHITE, *wxBLUE);

        к.Offset(0, к.Высота + 10);
        dc.РисуйТекст(("Синий in top left corner"), к.X, к.Y);
        к.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillConcentric(к, *wxBLUE, *wxWHITE, Точка(0, 0));

        к.Offset(0, к.Высота + 10);
        dc.РисуйТекст(("Синий in bottom right corner"), к.X, к.Y);
        к.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillConcentric(к, *wxBLUE, *wxWHITE, Точка(к.Ширина, к.Высота));
+++++/
    }

    проц DrawRegionsHelper(DC dc, wxCoord x, бул firstTime)
    {
        wxCoord y = 100;

        dc.DestroyClippingRegion();
        dc.кисть( Кисть.wxWHITE_BRUSH );
        dc.перо( Перо.wxTRANSPARENT_PEN );
        dc.РисуйПрям( x, y, 310, 310 );

        dc.SetClippingRegion( x + 10, y + 10, 100, 270 );

        dc.кисть( Кисть.wxRED_BRUSH );
        dc.РисуйПрям( x, y, 310, 310 );

        dc.SetClippingRegion( x + 10, y + 10, 100, 100 );

        dc.кисть( Кисть.wxCYAN_BRUSH );
        dc.РисуйПрям( x, y, 310, 310 );

        dc.DestroyClippingRegion();

        Region region = new Region(x + 110, y + 20, 100, 270);

  version(__WXMAC__) {} else
  {
        if ( !firstTime )
            region.Offset(10, 10);
  }

        dc.SetClippingRegion(region);

        dc.кисть( Кисть.wxGREY_BRUSH );
        dc.РисуйПрям( x, y, 310, 310 );

        if (m_smile_bmp.Ок())
        {
            dc.РисуйБитмап( m_smile_bmp, x + 150, y + 150, да );
            dc.РисуйБитмап( m_smile_bmp, x + 130, y + 10,  да );
            dc.РисуйБитмап( m_smile_bmp, x + 130, y + 280, да );
            dc.РисуйБитмап( m_smile_bmp, x + 100, y + 70,  да );
            dc.РисуйБитмап( m_smile_bmp, x + 200, y + 70,  да );
        }
    }


private
    {
    MyFrame m_owner;

    ScreenToShow m_show;
    Битмап     m_smile_bmp;
    Icon       m_std_icon;
    бул         m_clip;

    бул         m_useContext ;


    }
};

// ----------------------------------------------------------------------------
// ants
// ----------------------------------------------------------------------------

// IDs for the controls and the меню commands
enum
{
    // меню items
    File_Quit = MenuIDs.wxID_EXIT,
    File_About = MenuIDs.wxID_ABOUT,

    MenuShow_First = wxID_HIGHEST,
    File_ShowDefault = MenuShow_First,
    File_ShowText,
    File_ShowLines,
    File_ShowBrushes,
    File_ShowPolygons,
    File_ShowMask,
    File_ShowOps,
    File_ShowRegions,
    File_ShowCircles,
    File_ShowSplines,

    File_ShowAlpha,

    File_ShowGradients,
    MenuShow_Last = File_ShowGradients,

    File_Clip,

    File_GraphicContext,


    MenuOption_First,

    MapMode_Text = MenuOption_First,
    MapMode_Lometric,
    MapMode_Twips,
    MapMode_Points,
    MapMode_Metric,

    UserScale_StretchHoriz,
    UserScale_ShrinkHoriz,
    UserScale_StretchVertic,
    UserScale_ShrinkVertic,
    UserScale_Restore,

    AxisMirror_Horiz,
    AxisMirror_Vertic,

    LogicalOrigin_MoveDown,
    LogicalOrigin_MoveUp,
    LogicalOrigin_MoveLeft,
    LogicalOrigin_MoveRight,
    LogicalOrigin_Set,
    LogicalOrigin_Restore,


    Colour_TextForeground,
    Colour_TextBackground,
    Colour_Background,

    Colour_BackgroundMode,
    Colour_TextureBackgound,

    MenuOption_Last = Colour_TextureBackgound
};



struct rasterOp
{
     ткст имя;
    Logic           rop;
};

static rasterOp[] rasterOperations =
[
    { "wxAND",          Logic.wxAND           },
    { "wxAND_INVERT",   Logic.wxAND_INVERT    },
    { "wxAND_REVERSE",  Logic.wxAND_REVERSE   },
    { "wxCLEAR",        Logic.wxCLEAR         },
    { "wxCOPY",         Logic.wxCOPY          },
    { "wxEQUIV",        Logic.wxEQUIV         },
    { "Logic.wxINVERT", Logic.wxINVERT        },
    { "wxNAND",         Logic.wxNAND          },
    { "wxNO_OP",        Logic.wxNO_OP         },
    { "wxOR",           Logic.wxOR            },
    { "wxOR_INVERT",    Logic.wxOR_INVERT     },
    { "wxOR_REVERSE",   Logic.wxOR_REVERSE    },
    { "wxSET",          Logic.wxSET           },
    { "wxSRC_INVERT",   Logic.wxSRC_INVERT    },
    { "wxXOR",          Logic.wxXOR           },
];
