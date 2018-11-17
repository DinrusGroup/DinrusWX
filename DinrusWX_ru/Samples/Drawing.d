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

import stdrus;

typedef цел wxCoord;
typedef byte wxDash;

// ----------------------------------------------------------------------------
// ressources
// ----------------------------------------------------------------------------

// the application пиктограмма


// ----------------------------------------------------------------------------
// ants
// ----------------------------------------------------------------------------

// what do we покажи on screen (there are too many shapes to put them all on
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

// Define a new application тип, each program should derive a class from Апп
class Drawing : public Апп
{
public:
    // override base class virtuals
    // ----------------------------

// `Main program' equivalent: the program execution "starts" here
    public override бул ПоИниц()
    {
        // Создай the main application окно
        MyFrame frame = new MyFrame("Пример с рисованием",
                                     Точка(50, 50), Размер(550, 340));

        // Покажи it and tell the application that it's our main окно
        frame.Покажи(да);
        ТопОкно(frame);

        if ( !LoadImages() )
        {
            Log temp = new Log();
            temp.LogError("Can't load one of the битмап files needed 
            for this sample from the current or родитель 
            directory, please copy them there.");

            // stop here
            DeleteBitmaps();

            return false;
        }

        // ok, continue
        return да;
    }

    public override цел ПоВыходу() { DeleteBitmaps(); return 0; }

		//---------------------------------------------------------------------

		static проц Main()
		{
			Drawing app = new Drawing();
			app.Пуск();
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

        // ткст path = pathList.FindValidPath(("pat4.bmp"));
        ткст path = "./data/pat4.bmp";
        if ( !path )
            return false;

        /* 4 цвет битмап */
        gs_bmp4.ЗагрузиФайл(path, BitmapType.wxBITMAP_TYPE_BMP);
        /* turn into mono-битмап */
        gs_bmp4_mono.ЗагрузиФайл(path, BitmapType.wxBITMAP_TYPE_BMP);
        Маска mask4 = new Маска(gs_bmp4_mono, Цвет.wxBLACK);
        gs_bmp4_mono.маска(mask4);

        // path = pathList.FindValidPath(("pat36.bmp"));
        path = "./data/pat36.bmp";
        if ( !path )
            return false;
        gs_bmp36.ЗагрузиФайл(path, BitmapType.wxBITMAP_TYPE_BMP);
        Маска mask36 = new Маска(gs_bmp36, Цвет.wxBLACK);
        gs_bmp36.маска(mask36);

        // path = pathList.FindValidPath(("рисунок.bmp"));
        path = "./data/рисунок.bmp";
        if ( !path )
            return false;
        gs_bmpNoMask.ЗагрузиФайл(path, BitmapType.wxBITMAP_TYPE_BMP);
        gs_bmpWithMask.ЗагрузиФайл(path, BitmapType.wxBITMAP_TYPE_BMP);
        gs_bmpWithColMask.ЗагрузиФайл(path, BitmapType.wxBITMAP_TYPE_BMP);

        // path = pathList.FindValidPath(("маска.bmp"));
        path = "./data/маска.bmp";
        if ( !path )
            return false;
        gs_bmpMask.ЗагрузиФайл(path, BitmapType.wxBITMAP_TYPE_BMP);

        Маска маска = new Маска(gs_bmpMask, Цвет.wxBLACK);
        gs_bmpWithMask.маска(маска);

        маска = new Маска(gs_bmpWithColMask, Цвет.wxWHITE);
        gs_bmpWithColMask.маска(маска);

        return да;
    }

};

// Создай a new application object: this macro will allow wxWidgets to create
// the application object during program execution (it's better than using a
// static object for many reasons) and also declares the accessor function
// wxGetApp() which will return the reference of the right тип (i.e. Drawing and
// not Апп)
цел main()
{
	Drawing.Main();
	return 0;
}




// Define a new frame тип: this is going to be our main frame
class MyFrame : public Frame
{

    // frame ructor
    this( ткст title,  Точка поз,  Размер Размер)
    {
        super(null, wxID_ANY, title, поз, Размер,
                     wxDEFAULT_FRAME_STYLE | wxNO_FULL_REPAINT_ON_RESIZE);
        // set the frame пиктограмма
        пиктограмма = new Пиктограмма("./data/mondrian.png");

        Меню menuFile = new Меню();
        menuFile.Append(File_ShowDefault, "&Default screen\tF1");
        menuFile.Append(File_ShowText, "&Text screen\tF2");
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
        menuFile.Append(File_About, "&About...\tCtrl-A", "Покажи about dialog");
        menuFile.AppendSeparator();
        menuFile.Append(File_Quit, "E&xit\tAlt-X", "Quit this program");

        Меню menuMapMode = new Меню();
        menuMapMode.Append( MapMode_Text, "&TEXT map mode" );
        menuMapMode.Append( MapMode_Lometric, "&LOMETRIC map mode" );
        menuMapMode.Append( MapMode_Twips, "T&WIPS map mode" );
        menuMapMode.Append( MapMode_Points, "&POINTS map mode" );
        menuMapMode.Append( MapMode_Metric, "&METRIC map mode" );

        Меню menuUserScale = new Меню();
        menuUserScale.Append( UserScale_StretchHoriz, "Stretch &horizontally\tCtrl-H" );
        menuUserScale.Append( UserScale_ShrinkHoriz, "Shrin&k horizontally\tCtrl-G" );
        menuUserScale.Append( UserScale_StretchVertic, "Stretch &vertically\tCtrl-V" );
        menuUserScale.Append( UserScale_ShrinkVertic, "&Shrink vertically\tCtrl-W" );
        menuUserScale.AppendSeparator();
        menuUserScale.Append( UserScale_Restore, "&Restore to normal\tCtrl-0" );

        Меню menuAxis = new Меню();
        menuAxis.AppendCheckItem( AxisMirror_Horiz, "Mirror horizontally\tCtrl-M" );
        menuAxis.AppendCheckItem( AxisMirror_Vertic, "Mirror vertically\tCtrl-N" );

        Меню menuLogical = new Меню();
        menuLogical.Append( LogicalOrigin_MoveDown, "Сдвинь &down\tCtrl-D" );
        menuLogical.Append( LogicalOrigin_MoveUp, "Сдвинь &up\tCtrl-U" );
        menuLogical.Append( LogicalOrigin_MoveLeft, "Сдвинь &right\tCtrl-L" );
        menuLogical.Append( LogicalOrigin_MoveRight, "Сдвинь &left\tCtrl-R" );
        menuLogical.AppendSeparator();
        menuLogical.Append( LogicalOrigin_Set, ("Уст to (&100, 100)\tShift-Ctrl-1") );
        menuLogical.Append( LogicalOrigin_Restore, "&Restore to normal\tShift-Ctrl-0" );

        Меню menuColour = new Меню();

        menuColour.Append( Colour_TextForeground, "Text &foreground..." );
        menuColour.Append( Colour_TextBackground, "Text &background..." );
        menuColour.Append( Colour_Background, "Background &цвет..." );

        menuColour.AppendCheckItem( Colour_BackgroundMode, "&Opaque/transparent\tCtrl-B" );
        menuColour.AppendCheckItem( Colour_TextureBackgound, "Draw textured back&ground\tCtrl-T" );

        // now append the freshly created меню to the меню bar...
        MenuBar menuBar = new MenuBar();
        menuBar.Append(menuFile, "&File");
        menuBar.Append(menuMapMode, "&Mode");
        menuBar.Append(menuUserScale, "&Scale");
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
        m_xAxisReversed = false;
        m_yAxisReversed = false;
        m_backgroundMode = FillStyle.wxSOLID;
        m_colourForeground = Цвет.wxRED;
        m_colourBackground = Цвет.wxBLUE;
        m_textureBackground = false;

         m_canvas = new MyCanvas( this );
        m_canvas.УстScrollbars( 10, 10, 100, 240 );

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
    проц OnQuit(Объект отправитель, Событие e)
    {
        // СобытиеКоманда event = cast(СобытиеКоманда) e;
        // да is to сила the frame to close
        Закрой(да);
    }

    проц OnAbout(Объект отправитель, Событие e)
    {
        // СобытиеКоманда event = cast(СобытиеКоманда) e;
        ткст msg;
        msg = ("This is the about dialog of the drawing sample.\n
                    This sample tests various primitive drawing functions\n
                    (without any attempts to prevent flicker).\n
                    Copyright (c) Robert Roebling 1999");


        MessageBox(msg, "About Drawing", Dialog.wxOK | Dialog.wxICON_INFORMATION, this);
    }


    проц OnClip(Объект отправитель, Событие e)
    {
        СобытиеКоманда event = cast(СобытиеКоманда) e;
        m_canvas.Clip(event.IsChecked());
    }


    проц OnGraphicContext(Объект отправитель, Событие e)
    {
        СобытиеКоманда event = cast(СобытиеКоманда) e;
        m_canvas.UseGraphicContext(event.IsChecked());
    }


    проц OnShow(Объект отправитель, Событие e)
    {
        СобытиеКоманда event = cast(СобытиеКоманда) e;
        m_canvas.ToShow(cast(ScreenToShow)(event.ИД() - MenuShow_First));
    }


    проц OnOption(Объект отправитель, Событие e)
    {
        СобытиеКоманда event = cast(СобытиеКоманда) e;
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
                    if ( col !is null )
                    {
                        m_backgroundBrush.цвет(col);
                    }
                }
                break;


            case Colour_BackgroundMode:
                m_backgroundMode = m_backgroundMode == FillStyle.wxSOLID ? FillStyle.wxTRANSPARENT
                                                               : FillStyle.wxSOLID;
                break;

            case Colour_TextureBackgound:
                m_textureBackground = ! m_textureBackground;
                break;

            default:
                // skip Освежи()
                return;
        }

        m_canvas.Освежи();
    }


    Цвет SelectColour()
    {
        Цвет col;
        ColourData data;
        ColourDialog dialog = new ColourDialog(this, data);

        if ( dialog.ShowModal() == wxID_OK )
        {
            col = dialog.colourData().цвет();
        }

        return col;
    }


    проц ПодготовьКР(DC dc)
    {
        dc.УстLogicalOrigin( m_xLogicalOrigin, m_yLogicalOrigin );
        dc.УстAxisOrientation( !m_xAxisReversed, m_yAxisReversed );
        dc.УстUserScale( m_xUserScale, m_yUserScale );
        dc.MapMode( m_mapMode );
    }

    FillStyle         m_backgroundMode;
    бул         m_textureBackground;
    цел         m_mapMode;
    double      m_xUserScale;
    double      m_yUserScale;
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

    super(родитель, wxID_ANY, вхДефПоз, вхДефРазм,
                           wxHSCROLL | wxVSCROLL | wxNO_FULL_REPAINT_ON_RESIZE);


    m_owner = родитель;
    m_show = ScreenToShow.Show_Default;
    // m_smile_bmp = new Битмап(smile_xpm);
    m_smile_bmp = new Битмап("./data/Icons/smile.xpm", BitmapType.wxBITMAP_TYPE_XPM);
    //m_smile_bmp = null;

    m_std_icon = АртПровайдер.ДайПиктограмму( ПАртИД.wxART_INFORMATION );
    m_clip = false;

    m_useContext = false;

// the event tables connect the wxWidgets events with the functions (event
// handlers) which process them.
    EVT_PAINT  (&OnPaint);
    EVT_MOTION (&OnMouseMove);

    }

    проц OnPaint(Объект отправитель, Событие e)
    {
        PaintEvent event = cast(PaintEvent) e;

        PaintDC dc = new PaintDC(this);
        ПодготовьКР(dc);
        m_owner.ПодготовьКР(dc);

        dc.BackgroundMode( m_owner.m_backgroundMode );


        if(m_owner.m_backgroundBrush !is null)
//            MessageBox("m_owner.m_backgroundBrush is null");
//        else
            dc.Background( m_owner.m_backgroundBrush );


//        if ( m_owner.m_colourForeground.Ок() )
        if ( m_owner.m_colourForeground !is null )
            dc.TextForeground( m_owner.m_colourForeground );
//        if ( m_owner.m_colourBackground.Ок() )
        if ( m_owner.m_colourBackground !is null )
            dc.TextBackground( m_owner.m_colourBackground );

        if ( m_owner.m_textureBackground) {
//            if ( ! m_owner.m_backgroundBrush.Ок() ) 
            if ( m_owner.m_backgroundBrush is null ) 
            {
                Цвет clr = new Цвет(0,128,0);
                Кисть b = new Кисть(clr, FillStyle.wxSOLID);
                dc.Background(b);
            }
        }


        if ( m_clip )
            dc.УстClippingRegion(100, 100, 100, 100);



        if ( m_owner.m_textureBackground )
        {
            dc.pen( Pen.wxMEDIUM_GREY_PEN);
            for ( цел i = 0; i < 200; i++ )
                dc.DrawLine(0, i*10, i*10, 0);
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
                DrawText(dc);
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


    проц OnMouseMove(Объект отправитель, Событие e)
    {

        ClientDC dc = new ClientDC(this);
        ПодготовьКР(dc);
        m_owner.ПодготовьКР(dc);
        MouseEvent event = cast(MouseEvent) e;
        Точка поз = event.Позиция();
        long x = dc.DeviceToLogicalX( поз.X );
        long y = dc.DeviceToLogicalY( поз.Y );

        ткст стр = "Current mouse position: " ~ stdrus.вТкст(x) ~ ", " ~ stdrus.вТкст(y );
        m_owner.StatusText = стр;

//        wxUnusedVar(event);

    }


    проц ToShow(ScreenToShow покажи) { m_show = покажи; Освежи(); }

    // set or remove the clipping region
    проц Clip(бул clip) { m_clip = clip; Освежи(); }

    проц UseGraphicContext(бул use) { m_useContext = use; Освежи(); }



    проц DrawTestLines( цел x, цел y, цел ширь, DC dc )
    {
        dc.pen( new Pen( "black", ширь, FillStyle.wxSOLID) );
        dc.brush( Кисть.wxRED_BRUSH );
        dc.DrawText(("Testing строки of ширь " ~ stdrus.вТкст(ширь)), x + 10, y - 10);
        dc.DrawRectangle( x+10, y+10, 100, 190 );

        dc.DrawText(("Solid/dot/short dash/long dash/dot dash"), x + 150, y + 10);
        dc.pen( new Pen( "black", ширь, FillStyle.wxSOLID) );
        dc.DrawLine( x+20, y+20, 100, y+20 );
        dc.pen( new Pen( "black", ширь, FillStyle.wxDOT) );
        dc.DrawLine( x+20, y+30, 100, y+30 );
        dc.pen( new Pen( "black", ширь, FillStyle.wxSHORT_DASH) );
        dc.DrawLine( x+20, y+40, 100, y+40 );
//        dc.pen( new Pen( "black", ширь, FillStyle.wxLONG_DASH) );
//        dc.DrawLine( x+20, y+50, 100, y+50 );
        dc.pen( new Pen( "black", ширь, FillStyle.wxDOT_DASH) );
        dc.DrawLine( x+20, y+60, 100, y+60 );

        dc.DrawText(("Misc hatches"), x + 150, y + 70);
        dc.pen( new Pen( "black", ширь, FillStyle.wxBDIAGONAL_HATCH) );
        dc.DrawLine( x+20, y+70, 100, y+70 );
        dc.pen( new Pen( "black", ширь, FillStyle.wxCROSSDIAG_HATCH) );
        dc.DrawLine( x+20, y+80, 100, y+80 );
        dc.pen( new Pen( "black", ширь, FillStyle.wxFDIAGONAL_HATCH) );
        dc.DrawLine( x+20, y+90, 100, y+90 );
        dc.pen( new Pen( "black", ширь, FillStyle.wxCROSS_HATCH) );
        dc.DrawLine( x+20, y+100, 100, y+100 );
        dc.pen( new Pen( "black", ширь, FillStyle.wxHORIZONTAL_HATCH) );
        dc.DrawLine( x+20, y+110, 100, y+110 );
        dc.pen( new Pen( "black", ширь, FillStyle.wxVERTICAL_HATCH) );
        dc.DrawLine( x+20, y+120, 100, y+120 );

        dc.DrawText(("User dash"), x + 150, y + 140);
        Pen ud = new Pen( "black", ширь, FillStyle.wxUSER_DASH );
        wxDash dash1[6];
        dash1[0] = 8;  // Long dash  <---------+
        dash1[1] = 2;  // Short gap            |
        dash1[2] = 3;  // Short dash           |
        dash1[3] = 2;  // Short gap            |
        dash1[4] = 3;  // Short dash           |
        dash1[5] = 2;  // Short gap and repeat +
        // ud.УстDashes( 6, dash1 );
        dc.pen( ud );
        dc.DrawLine( x+20, y+140, 100, y+140 );
        dash1[0] = 5;  // Make first dash shorter
        // ud.УстDashes( 6, dash1 );
        dc.pen( ud );
        dc.DrawLine( x+20, y+150, 100, y+150 );
        dash1[2] = 5;  // Make second dash longer
        // ud.УстDashes( 6, dash1 );
        dc.pen( ud );
        dc.DrawLine( x+20, y+160, 100, y+160 );
        dash1[4] = 5;  // Make third dash longer
        // ud.УстDashes( 6, dash1 );
        dc.pen( ud );
        dc.DrawLine( x+20, y+170, 100, y+170 );
    }


    проц DrawTestPoly(DC dc)
    {
        Кисть brushHatch = new Кисть( Цвет.wxRED, FillStyle.wxFDIAGONAL_HATCH);
        dc.brush(brushHatch);

        Точка[5] star;
        star[0] = Точка(100, 60);
        star[1] = Точка(60, 150);
        star[2] = Точка(160, 100);
        star[3] = Точка(40, 100);
        star[4] = Точка(140, 150);

        dc.DrawText(("You should see two (irregular) stars below, the left one hatched"), 10, 10);
        dc.DrawText(("except for the central region and the right one entirely hatched"), 10, 30);
        dc.DrawText(("The third star only has a hatched outline"), 10, 50);

        dc.DrawPolygon(star.length, star, 0, 30);
        dc.DrawPolygon(star.length, star, 160, 30, FillStyle.wxWINDING_RULE);

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
        цел[2] count = [5, 5];

//        dc.DrawPolyPolygon( count.length, count, star2, 450, 150);
    }


    проц DrawTestBrushes(DC dc)
    {
        static  wxCoord WIDTH = 200;
        static  wxCoord HEIGHT = 80;

        wxCoord x = 10,
                y = 10;

        dc.brush( new Кисть( Цвет.wxGREEN, FillStyle.wxSOLID) );
        dc.DrawRectangle(x, y, WIDTH, HEIGHT);
        dc.DrawText( "Solid green", x + 10, y + 10);

        y += HEIGHT;
        dc.brush( new Кисть(Цвет.wxRED, FillStyle.wxCROSSDIAG_HATCH) );
        dc.DrawRectangle(x, y, WIDTH, HEIGHT);
        dc.DrawText(("Hatched red"), x + 10, y + 10);

        y += HEIGHT;
        dc.brush( new Кисть(gs_bmpMask));
        dc.DrawRectangle(x, y, WIDTH, HEIGHT);
        dc.DrawText(("Пунктир mono"), x + 10, y + 10);

        y += HEIGHT;
        dc.brush( new Кисть(gs_bmpNoMask));
        dc.DrawRectangle(x, y, WIDTH, HEIGHT);
        dc.DrawText(("Пунктир цвет"), x + 10, y + 10);
    }


    проц DrawText(DC dc)
    {
        // set underlined шрифт for testing
        dc.шрифт( new Шрифт(12, СемействоШрифтов.wxMODERN, СтильШрифта.wxNORMAL, ВесШрифта.wxNORMAL, да) );
        dc.DrawText( "This is текст", 110, 10 );
        dc.DrawRotatedText( "That is текст", 20, 10, -45 );

        // use wxSWISS_FONT and not СемействоШрифтов.wxNORMAL_FONT as the latter can't be rotated
        // under Win9x (it is not TrueType)
        dc.шрифт( Шрифт.wxSWISS_FONT );

        //wxString текст;
        ткст текст;
        dc.BackgroundMode(FillStyle.wxTRANSPARENT);

        for ( цел n = -180; n < 180; n += 30 )
        {
            // текст.Printf(("     %d rotated текст"), n);
            текст = "     %d rotated текст";
            dc.DrawRotatedText(текст , 400, 400, n);
        }

        dc.шрифт( new Шрифт( 18, СемействоШрифтов.wxSWISS, СтильШрифта.wxNORMAL, ВесШрифта.wxNORMAL ) );

        dc.DrawText( "This is Swiss 18pt текст.", 110, 40 );

        цел length;
        цел высь;
        цел descent;
        цел внешнееВступление;
        dc.ДайПротяженностьТекста( "This is Swiss 18pt текст.", length, высь, descent, внешнееВступление, null);
        //текст.Printf( "Dimensions are length %ld, высь %ld, descent %ld", length, высь, descent );
        текст = "Dimensions are length %ld, высь %ld, descent %ld";
        dc.DrawText( текст, 110, 80 );

        //текст.Printf( ("ВысьСим() returns: %d"), dc.ВысьСим() );
        текст = "ВысьСим() returns: %d";
        dc.DrawText( текст, 110, 120 );

        dc.DrawRectangle( 100, 40, 4, высь );

        // test the logical function effect
        wxCoord y = 150;
        dc.LogicalFunction(Logic.wxINVERT);
        dc.DrawText( "There should be no текст below", 110, 150 );
        dc.DrawRectangle( 110, y, 100, высь );

        // twice drawn inverted should result in invisible
        y += высь;
        dc.DrawText( "Invisible текст", 110, y );
        dc.DrawRectangle( 110, y, 100, высь );
        dc.DrawText( "Invisible текст", 110, y );
        dc.DrawRectangle( 110, y, 100, высь );
        dc.LogicalFunction(Logic.wxCOPY);

        y += высь;
        dc.DrawRectangle( 110, y, 100, высь );
        dc.DrawText( "Visible текст", 110, y );
    }


    проц DrawImages(DC dc)
    {
        dc.DrawText(("original рисунок"), 0, 0);
        dc.DrawBitmap(gs_bmpNoMask, 0, 20, 0);
        dc.DrawText(("with цвет маска"), 0, 100);
        dc.DrawBitmap(gs_bmpWithColMask, 0, 120, да);
        dc.DrawText(("the маска рисунок"), 0, 200);
        dc.DrawBitmap(gs_bmpMask, 0, 220, 0);
        dc.DrawText(("masked рисунок"), 0, 300);
        dc.DrawBitmap(gs_bmpWithMask, 0, 320, да);

        цел cx = gs_bmpWithColMask.Ширь(),
            cy = gs_bmpWithColMask.Высь();

        MemoryDC memDC = new MemoryDC();

        memDC.SelectObject(gs_bmpWithColMask);
        for ( size_t n = 0; n < rasterOperations.length; n++ )
        {
            wxCoord x = cast(wxCoord) (120 + 150*(n%4)),
                    y =  cast(wxCoord) (20 + 100*(n/4));

            dc.DrawText(rasterOperations[n].имя, x, y - 20);
            dc.Blit(x, y, cx, cy, memDC, 0, 0, rasterOperations[n].rop, да);
        }
        memDC.SelectObject(Битмап.wxNullBitmap);
    }


    проц DrawWithLogicalOps(DC dc)
    {
        static  wxCoord w = 60;
        static  wxCoord h = 60;

        // reuse the текст цвет here
        dc.pen( new Pen(m_owner.m_colourForeground, 1, FillStyle.wxSOLID));
        dc.brush( Кисть.wxTRANSPARENT_BRUSH );

        size_t n;
        for ( n = 0; n < rasterOperations.length; n++ )
        {
            wxCoord x = cast(wxCoord) (20 + 150*(n%4)),
                    y = cast(wxCoord) (20 + 100*(n/4));

            dc.DrawText(rasterOperations[n].имя, x, y - 20);
            dc.LogicalFunction(rasterOperations[n].rop);
            dc.DrawRectangle(x, y, w, h);
            dc.DrawLine(x, y, x + w, y + h);
            dc.DrawLine(x + w, y, x, y + h);
        }

        // now some filled rectangles
        dc.brush( new Кисть(m_owner.m_colourForeground, FillStyle.wxSOLID));

        for ( n = 0; n < rasterOperations.length; n++ )
        {
            wxCoord x = cast(wxCoord) (20 + 150*(n%4)),
                    y = cast(wxCoord) (500 + 100*(n/4));

            dc.DrawText(rasterOperations[n].имя, x, y - 20);
            dc.LogicalFunction(rasterOperations[n].rop);
            dc.DrawRectangle(x, y, w, h);
        }
    }

/+++++
    проц DrawAlpha(DC dc)
    {

        GCDC dc = new GCDC( this );
        ПодготовьКР( dc );


        double margin = 20 ;
        double ширь = 180 ;
        double radius = 30 ;
        
        dc.pen( new Pen( new Цвет( 128, 0, 0 ),12, FillStyle.wxSOLID));
        dc.brush( new Кисть( new Цвет( 255, 0, 0 ),FillStyle.wxSOLID));
        
        wx.common.Прям r = wx.common.Прям( cast(цел) margin, cast(цел)(margin+ширь*0.66), cast(цел) ширь, cast(цел)ширь) ;

        
        dc.DrawRoundedRectangle( r.X, r.Y, r.Ширь, r.Ширь, radius ) ;
        
        dc.pen( new Pen( new Цвет( 0, 0, 128 ),12, FillStyle.wxSOLID));
        dc.brush( new Кисть( new Цвет( 0, 0, 255 ),FillStyle.wxSOLID));
        
        //r.Offset( ширь * 0.8 , - ширь * 0.66 ) ;
        
        dc.DrawRoundedRectangle( r.X, r.Y, r.Ширь, r.Ширь, radius ) ;
        
        dc.pen( new Pen( new Цвет( 128, 128, 0 ),12, FillStyle.wxSOLID));
        dc.brush( new Кисть( new Цвет( 192, 192, 0 ),FillStyle.wxSOLID));

        //r.Offset( ширь * 0.8 , ширь *0.5 ) ;
        
        dc.DrawRoundedRectangle( r.X, r.Y, r.Ширь, r.Ширь, radius ) ;
        
        dc.pen( Pen.wxTRANSPARENT_PEN ) ;
        dc.brush( new Кисть( new Цвет( 255,255,128 ) ) );
        dc.DrawRoundedRectangle( 0 , cast(цел)(margin + ширь / 2) , cast(цел) ширь * 3 , 100 , radius) ;
        
        dc.TextForeground( new Цвет(255,255,0 ) );
        dc.шрифт( new Шрифт( 40, СемействоШрифтов.wxSWISS, СтильШрифта.wxITALIC, ВесШрифта.wxNORMAL ) );
        dc.DrawText( "Hello!", 120, 80 );
    }
+++++/

    проц DrawRegions(DC dc)
    {
        dc.DrawText(("You should see a red прям partly covered by a cyan one on the left"), 10, 5);
        dc.DrawText(("and 5 smileys from which 4 are partially clipped on the right"),
                    10, 5 + (cast(WindowDC)dc).ВысьСим());
        dc.DrawText(("The second copy should be identical but right part of it should be offset by 10 pixels."),
                    10, 5 + 2*(cast(WindowDC)dc).ВысьСим());

        DrawRegionsHelper(dc, 10, да);
        DrawRegionsHelper(dc, 350, false);
    }



    проц DrawCircles(DC dc)
    {
        цел x = 100,
            y = 100,
            r = 20;

        dc.pen( Pen.wxRED_PEN );
        dc.brush( Кисть.wxGREEN_BRUSH );

        dc.DrawText(("Some circles"), 0, y);
        dc.DrawCircle(x, y, r);
        dc.DrawCircle(x + 2*r, y, r);
        dc.DrawCircle(x + 4*r, y, r);

        y += 2*r;
        dc.DrawText(("And ellipses"), 0, y);
        dc.DrawEllipse(x - r, y, 2*r, r);
        dc.DrawEllipse(x + r, y, 2*r, r);
        dc.DrawEllipse(x + 3*r, y, 2*r, r);

        y += 2*r;
        dc.DrawText(("And arcs"), 0, y);
        dc.DrawArc(x - r, y, x + r, y, x, y);
        dc.DrawArc(x + 4*r, y, x + 2*r, y, x + 3*r, y);
        dc.DrawArc(x + 5*r, y, x + 5*r, y, x + 6*r, y);

        y += 2*r;
        dc.DrawEllipticArc(x - r, y, 2*r, r, 0, 90);
        dc.DrawEllipticArc(x + r, y, 2*r, r, 90, 180);
        dc.DrawEllipticArc(x + 3*r, y, 2*r, r, 180, 270);
        dc.DrawEllipticArc(x + 5*r, y, 2*r, r, 270, 360);
        
        // same as above, just transparent brush
        
        dc.pen( Pen.wxRED_PEN );
        dc.brush( Кисть.wxTRANSPARENT_BRUSH );

        y += 2*r;
        dc.DrawText(("Some circles"), 0, y);
        dc.DrawCircle(x, y, r);
        dc.DrawCircle(x + 2*r, y, r);
        dc.DrawCircle(x + 4*r, y, r);

        y += 2*r;
        dc.DrawText(("And ellipses"), 0, y);
        dc.DrawEllipse(x - r, y, 2*r, r);
        dc.DrawEllipse(x + r, y, 2*r, r);
        dc.DrawEllipse(x + 3*r, y, 2*r, r);

        y += 2*r;
        dc.DrawText(("And arcs"), 0, y);
        dc.DrawArc(x - r, y, x + r, y, x, y);
        dc.DrawArc(x + 4*r, y, x + 2*r, y, x + 3*r, y);
        dc.DrawArc(x + 5*r, y, x + 5*r, y, x + 6*r, y);

        y += 2*r;
        dc.DrawEllipticArc(x - r, y, 2*r, r, 0, 90);
        dc.DrawEllipticArc(x + r, y, 2*r, r, 90, 180);
        dc.DrawEllipticArc(x + 3*r, y, 2*r, r, 180, 270);
        dc.DrawEllipticArc(x + 5*r, y, 2*r, r, 270, 360);
        
    }


    проц DrawSplines(DC dc)
    {

        dc.DrawText(("Some splines"), 10, 5);

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
        цел angle = 0;
        for ( цел i = 0; i < N; i++ )
        {
            angle += angles[ angle_pos ];
            цел r = R * radii[ radius_pos ] / 100;
            pts[ i ].X = center.X + cast(wxCoord)( r * кос( ПИ * angle / 180.0) );
            pts[ i ].Y = center.Y + cast(wxCoord)( r * син( ПИ * angle / 180.0) );

            angle_pos++;
            if ( angle_pos >= angles.length ) angle_pos = 0;

            radius_pos++;
            if ( radius_pos >= radii.length ) radius_pos = 0;
        }

        // background spline drawing
        dc.pen( Pen.wxRED_PEN );
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

            dc.pen( new Pen( "blue", 1, FillStyle.wxDOT) );
            dc.DrawLines(letters[m]);
            dc.pen( new Pen( "black", 4, FillStyle.wxSOLID) );
            dc.DrawSpline(letters[m]);
        }


        dc.DrawText(("Splines not supported."), 10, 5);

    }



    проц DrawDefault(DC dc)
    {
        // mark the origin
        dc.DrawCircle(0, 0, 10);


        // GetPixel and FloodFill not supported by Mac OS X CoreGraphics
        // (FloodFill uses Blit from a non-MemoryDC)
        //flood fill using brush, starting at 1,1 and replacing whatever цвет we find there
        dc.brush( new Кисть(new Цвет(128,128,0), FillStyle.wxSOLID));

        Цвет tmpColour = new Цвет();
        dc.GetPixel(1,1, tmpColour);
        dc.FloodFill(1,1, tmpColour, FloodStyle.wxFLOOD_SURFACE);


        dc.DrawCheckMark(5, 80, 15, 15);
        dc.DrawCheckMark(25, 80, 30, 30);
        dc.DrawCheckMark(60, 80, 60, 60);

        // this is the test for "blitting битмап into DC damages selected brush" bug
        wxCoord rectSize =cast(wxCoord)( m_std_icon.Ширь() + 10);

        wxCoord x = 100;
        dc.pen( Pen.wxTRANSPARENT_PEN);

        dc.brush( Кисть.wxGREEN_BRUSH );
        dc.DrawRectangle(x, 10, rectSize, rectSize);

        dc.DrawBitmap(m_smile_bmp, x + 5, 15, да);
        x += rectSize + 10;
        dc.DrawRectangle(x, 10, rectSize, rectSize);

        dc.DrawIcon(m_std_icon, x + 5, 15);
        x += rectSize + 10;
        dc.DrawRectangle(x, 10, rectSize, rectSize);

        // test for "transparent" битмап drawing (it intersects with the last
        // rectangle above)
        //dc.brush( Кисть.wxTRANSPARENT_BRUSH );

        if (m_smile_bmp.Ок())
            dc.DrawBitmap(m_smile_bmp, x + rectSize - 20, rectSize - 10, да);

        dc.brush( Кисть.wxBLACK_BRUSH );
        dc.DrawRectangle( 0, 160, 1000, 300 );

        // draw строки
        Битмап битмап = new Битмап(20,70);
        MemoryDC memdc = new MemoryDC();
        memdc.SelectObject( битмап );
        memdc.brush( Кисть.wxBLACK_BRUSH );
        memdc.pen( Pen.wxWHITE_PEN );
        memdc.DrawRectangle(0,0,20,70);
        memdc.DrawLine( 10,0,10,70 );

        // to the right
        Pen pen = Pen.wxRED_PEN;
        memdc.pen(pen);
        memdc.DrawLine( 10, 5,10, 5 );
        memdc.DrawLine( 10,10,11,10 );
        memdc.DrawLine( 10,15,12,15 );
        memdc.DrawLine( 10,20,13,20 );

    /*
        memdc.pen( Pen.wxRED_PEN );
        memdc.DrawLine( 12, 5,12, 5 );
        memdc.DrawLine( 12,10,13,10 );
        memdc.DrawLine( 12,15,14,15 );
        memdc.DrawLine( 12,20,15,20 );
    */

        // same to the left
        memdc.DrawLine( 10,25,10,25 );
        memdc.DrawLine( 10,30, 9,30 );
        memdc.DrawLine( 10,35, 8,35 );
        memdc.DrawLine( 10,40, 7,40 );

        // XOR draw строки
        dc.pen( Pen.wxWHITE_PEN );
        memdc.LogicalFunction( Logic.wxINVERT );
        memdc.pen( Pen.wxWHITE_PEN );
        memdc.DrawLine( 10,50,10,50 );
        memdc.DrawLine( 10,55,11,55 );
        memdc.DrawLine( 10,60,12,60 );
        memdc.DrawLine( 10,65,13,65 );

        memdc.DrawLine( 12,50,12,50 );
        memdc.DrawLine( 12,55,13,55 );
        memdc.DrawLine( 12,60,14,60 );
        memdc.DrawLine( 12,65,15,65 );

        memdc.SelectObject( Битмап.wxNullBitmap );
        dc.DrawBitmap( битмап, 10, 170 );
        wxImage рисунок = битмап.ПреобразуйВРисунок();
        рисунок.Rescale( 60,210 );
        битмап = new Битмап(рисунок);
        dc.DrawBitmap( битмап, 50, 170 );

        // test the rectangle outline drawing - there should be one pixel between
        // the прям and the строки
        dc.pen( Pen.wxWHITE_PEN);
        dc.brush( Кисть.wxTRANSPARENT_BRUSH );
        dc.DrawRectangle(150, 170, 49, 29);
        dc.DrawRectangle(200, 170, 49, 29);
        dc.pen( Pen.wxWHITE_PEN );
        dc.DrawLine(250, 210, 250, 170);
        dc.DrawLine(260, 200, 150, 200);

        // test the rectangle filled drawing - there should be one pixel between
        // the прям and the строки
        dc.pen(Pen.wxTRANSPARENT_PEN);
        dc.brush( Кисть.wxWHITE_BRUSH );
        dc.DrawRectangle(300, 170, 49, 29);
        dc.DrawRectangle(350, 170, 49, 29);
        dc.pen( Pen.wxWHITE_PEN );
        dc.DrawLine(400, 170, 400, 210);
        dc.DrawLine(300, 200, 410, 200);

        // a few more tests of this kind
        dc.pen( Pen.wxRED_PEN );
        dc.brush( Кисть.wxWHITE_BRUSH );
        dc.DrawRectangle(300, 220, 1, 1);
        dc.DrawRectangle(310, 220, 2, 2);
        dc.DrawRectangle(320, 220, 3, 3);
        dc.DrawRectangle(330, 220, 4, 4);

        dc.pen(Pen.wxTRANSPARENT_PEN);
        dc.brush( Кисть.wxWHITE_BRUSH );
        dc.DrawRectangle(300, 230, 1, 1);
        dc.DrawRectangle(310, 230, 2, 2);
        dc.DrawRectangle(320, 230, 3, 3);
        dc.DrawRectangle(330, 230, 4, 4);

        // and now for filled прям with outline
        dc.pen( Pen.wxRED_PEN );
        dc.brush( Кисть.wxWHITE_BRUSH );
        dc.DrawRectangle(500, 170, 49, 29);
        dc.DrawRectangle(550, 170, 49, 29);
        dc.pen( Pen.wxWHITE_PEN );
        dc.DrawLine(600, 170, 600, 210);
        dc.DrawLine(500, 200, 610, 200);

        // test the rectangle outline drawing - there should be one pixel between
        // the прям and the строки
        dc.pen( Pen.wxWHITE_PEN );
        dc.brush( Кисть.wxTRANSPARENT_BRUSH );
        dc.DrawRoundedRectangle(150, 270, 49, 29, 6);
        dc.DrawRoundedRectangle(200, 270, 49, 29, 6);
        dc.pen( Pen.wxWHITE_PEN );
        dc.DrawLine(250, 270, 250, 310);
        dc.DrawLine(150, 300, 260, 300);

        // test the rectangle filled drawing - there should be one pixel between
        // the прям and the строки
        dc.pen(Pen.wxTRANSPARENT_PEN);
        dc.brush( Кисть.wxWHITE_BRUSH );
        dc.DrawRoundedRectangle(300, 270, 49, 29, 6);
        dc.DrawRoundedRectangle(350, 270, 49, 29, 6);
        dc.pen( Pen.wxWHITE_PEN );
        dc.DrawLine(400, 270, 400, 310);
        dc.DrawLine(300, 300, 410, 300);

        // Added by JACS to demonstrate bizarre behaviour.
        // With a Размер of 70, we get a missing red RHS,
        // and the высь is too small, so we get yellow
        // showing. With a Размер of 40, it draws as expected:
        // it just shows a white rectangle with red outline.
        цел totalWidth = 70;
        цел totalHeight = 70;
        Битмап bitmap2 = new Битмап(totalWidth, totalHeight);

        MemoryDC memdc2 = new MemoryDC();
        memdc2.SelectObject(bitmap2);

        Цвет clr = new Цвет(255, 255, 0);
        Кисть yellowBrush = new Кисть(clr, FillStyle.wxSOLID);
        memdc2.Background( yellowBrush );
        memdc2.Clear();



        Pen yellowPen = new Pen(clr, 1, FillStyle.wxSOLID);

        // Now draw a white rectangle with red outline. It should
        // entirely eclipse the yellow background.
        memdc2.pen( Pen.wxRED_PEN );
        memdc2.brush(Кисть.wxWHITE_BRUSH);

        memdc2.DrawRectangle(0, 0, totalWidth, totalHeight);

        memdc2.pen( Pen.wxNullPen );
        memdc2.brush( Кисть.wxNullBrush );
        memdc2.SelectObject( Битмап.wxNullBitmap );

        dc.DrawBitmap(bitmap2, 500, 270);

        // Repeat, but draw directly on dc
        // Draw a yellow rectangle filling the битмап

        x = 600; цел y = 270;
        dc.pen(yellowPen);
        dc.brush( yellowBrush );
        dc.DrawRectangle(x, y, totalWidth, totalHeight);

        // Now draw a white rectangle with red outline. It should
        // entirely eclipse the yellow background.
        dc.pen( Pen.wxRED_PEN );
        dc.brush(Кисть.wxWHITE_BRUSH);

        dc.DrawRectangle(x, y, totalWidth, totalHeight);

    }


    проц DrawGradients(DC dc)
    {
        static  цел TEXT_HEIGHT = 15;
        Log tempLog = new Log();
        tempLog.LogMessage("Sorry! This function has not been implemented by wxD.");

/+++++
        // LHS: linear
        Прям r = {10, 10, 50, 50};
        dc.DrawText(("wxRIGHT"), r.X, r.Y);
        r.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillLinear(r, wxWHITE, wxBLUE, wxRIGHT);

        r.Offset(0, r.Высь + 10);
        dc.DrawText(("wxLEFT"), r.X, r.Y);
        r.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillLinear(r, *wxWHITE, *wxBLUE, wxLEFT);

        r.Offset(0, r.Высь + 10);
        dc.DrawText(("wxDOWN"), r.X, r.Y);
        r.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillLinear(r, *wxWHITE, *wxBLUE, wxDOWN);

        r.Offset(0, r.Высь + 10);
        dc.DrawText(("wxUP"), r.X, r.Y);
        r.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillLinear(r, *wxWHITE, *wxBLUE, wxUP);


        // RHS: concentric
        r = new Прям(200, 10, 50, 50);
        dc.DrawText(("Blue inside"), r.X, r.Y);
        r.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillConcentric(r, *wxBLUE, *wxWHITE);

        r.Offset(0, r.Высь + 10);
        dc.DrawText(("White inside"), r.X, r.Y);
        r.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillConcentric(r, *wxWHITE, *wxBLUE);

        r.Offset(0, r.Высь + 10);
        dc.DrawText(("Blue in top left corner"), r.X, r.Y);
        r.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillConcentric(r, *wxBLUE, *wxWHITE, Точка(0, 0));

        r.Offset(0, r.Высь + 10);
        dc.DrawText(("Blue in bottom right corner"), r.X, r.Y);
        r.Offset(0, TEXT_HEIGHT);
        //dc.GradientFillConcentric(r, *wxBLUE, *wxWHITE, Точка(r.Ширь, r.Высь));
+++++/
    }

    проц DrawRegionsHelper(DC dc, wxCoord x, бул firstTime)
    {
        wxCoord y = 100;

        dc.DestroyClippingRegion();
        dc.brush( Кисть.wxWHITE_BRUSH );
        dc.pen( Pen.wxTRANSPARENT_PEN );
        dc.DrawRectangle( x, y, 310, 310 );

        dc.УстClippingRegion( x + 10, y + 10, 100, 270 );

        dc.brush( Кисть.wxRED_BRUSH );
        dc.DrawRectangle( x, y, 310, 310 );

        dc.УстClippingRegion( x + 10, y + 10, 100, 100 );

        dc.brush( Кисть.wxCYAN_BRUSH );
        dc.DrawRectangle( x, y, 310, 310 );

        dc.DestroyClippingRegion();

        Регион region = new Регион(x + 110, y + 20, 100, 270);

  version(__WXMAC__) {} else
  {
        if ( !firstTime )
            region.Offset(10, 10);
  }

        dc.УстClippingRegion(region);

        dc.brush( Кисть.wxGREY_BRUSH );
        dc.DrawRectangle( x, y, 310, 310 );

        if (m_smile_bmp.Ок())
        {
            dc.DrawBitmap( m_smile_bmp, x + 150, y + 150, да );
            dc.DrawBitmap( m_smile_bmp, x + 130, y + 10,  да );
            dc.DrawBitmap( m_smile_bmp, x + 130, y + 280, да );
            dc.DrawBitmap( m_smile_bmp, x + 100, y + 70,  да );
            dc.DrawBitmap( m_smile_bmp, x + 200, y + 70,  да );
        }
    }


private
    {
    MyFrame m_owner;

    ScreenToShow m_show;
    Битмап     m_smile_bmp;
    Пиктограмма       m_std_icon;
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
    // меню элтs
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
