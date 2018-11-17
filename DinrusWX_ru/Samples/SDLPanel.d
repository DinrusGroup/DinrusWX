//private import stdrus, cidrus, win;
import wx.wx;
import wx.MemoryDC;
import wx.Image;
import lib.sdl;

/*******************************************************************************
// Global Declarations
*******************************************************************************/

enum {
    ID_FRAME = 10000,
    ID_PANEL,
    IDM_FILE_EXIT,
    IDM_HELP_ABOUT = MenuIDs.wxID_ABOUT
}

/*******************************************************************************
// SDLPanel Class
*******************************************************************************/

public class SDLPanel : wxPanel
{
private:
    SDL_Surface *screen;

    /**
     * Called to paint the panel.
     *
     * @param event The triggering wxPaintEvent (unused).
     */
    проц onPaint(Объект отправитель, Событие event)
    {
     // can't draw if the screen doesn't exist yet
    if (screen == null) {
        return;
    }
    
    // lock the surface if necessary
    if (SDL_MUSTLOCK(screen)) {
        if (сдлБлокируйПоверхность(screen) < 0) {
            return;
        }
    }
    
    // create a битмап from our pixel data
    wxBitmap bmp = new wxBitmap(new Рисунок(screen.w, screen.h, 
                    cast(ubyte *)(screen.pixels), да));
    
    // unlock the screen
    if (SDL_MUSTLOCK(screen)) {
        сдлРазблокируйПоверхность(screen);
    }
    
    // paint the screen
    scope wxBufferedPaintDC dc = new wxBufferedPaintDC(this, bmp);
	}
    
    /**
     * Called to erase the background.
     *
     * @param event The triggering wxEraseEvent (unused).
     */
    проц onEraseBackground(Объект отправитель, Событие event) {}
    
    /**
     * Called to update the panel.
     *
     * @param event The triggering wxIdleEvent (unused).
     */
    проц onIdle(Объект отправитель, Событие event)
    {
    // create the SDL_Surface
    createScreen();
    
    // Lock surface if needed
    if (SDL_MUSTLOCK(screen)) {
        if (сдлБлокируйПоверхность(screen) < 0) {
            return;
        }
    }
    
    // Ask SDL for the time in milliseconds
    цел tick = сдлДайТики();
    
    for (цел y = 0; y < 480; y++) {
        for (цел x = 0; x < 640; x++) {
            бцел color = (y * y) + (x * x) + tick;
            ubyte *pixels = cast(ubyte *)(screen.pixels) + 
                              (y * screen.pitch) +
                              (x * screen.format.BytesPerPixel);

            version (BigEndian)
            {
                pixels[0] = color & 0xFF;
                pixels[1] = (color >> 8) & 0xFF;
                pixels[2] = (color >> 16) & 0xFF;
            }
            else
            {
                pixels[0] = (color >> 16) & 0xFF;
                pixels[1] = (color >> 8) & 0xFF;
                pixels[2] = color & 0xFF;
            }
        }
    }
    
    // Unlock if needed
    if (SDL_MUSTLOCK(screen)) {
        сдлРазблокируйПоверхность(screen);
    }
    
    // освежи the panel
    Освежи(false);
    
    // throttle to keep from flooding the event queue
    wxMilliSleep(33);
    }
    
    /**
     * Creates the SDL_Surface used by this SDLPanel.
     */
    проц createScreen()
    {
    if (screen == null) {
        Размер Размер = Размер();
        
        screen = сдлСоздайКЗСПоверхность(SDL_SWSURFACE, Размер.Ширь, Размер.Высь, 
                                      24, 0, 0, 0, 0);     
    }
    }
   
public:
    /**
     * Creates a new SDLPanel.
     *
     * @param родитель The wxWindow родитель.
     */
    this(wxWindow родитель)
    {
    super(родитель, ID_PANEL);
    screen = null;
    
    // ensure the Размер of the wxPanel
    wxSize Размер = wxSize(640, 480);
    
    МинРазм = Размер;
    МаксРазм = Размер;

    EVT_PAINT(&onPaint);
    EVT_ERASE_BACKGROUND(&onEraseBackground);
    EVT_IDLE(&onIdle);
	}
    
    /**
     * Destructs this SDLPanel.
     */
    ~this()
    {
    if (screen != null) {
        сдлОсвободиПоверхность(screen);
    }
 	}
}

/*******************************************************************************
// SDLFrame Class
*******************************************************************************/

public class SDLFrame : wxFrame
{
private:
    SDLPanel panel;
    
    /**
     * Called when exit from the file меню is selected.
     *
     * @param event The associated wxCommandEvent (unused).
     */
    проц onFileExit(Объект отправитель, Событие event) { Закрой(); }
    
    /**
     * Called when about from the help меню is selected.
     *
     * @param event The associated wxCommandEvent (unused).
     */
    проц onHelpAbout(Объект отправитель, Событие event)
    {
    MessageBox("wx-sdl tutorial\nCopyright (C) 2005 John Ratliff",
                 "about wx-sdl tutorial", Dialog.wxOK | Dialog.wxICON_INFORMATION);
    }
    
public:
    /**
     * Creates a new SDLFrame.
     */
//    this(Точка поз=вхДефПоз, Размер Размер=вхДефРазм)
    this()
    {
    Точка поз=вхДефПоз;
    Размер Размер=вхДефРазм;
 
         // Создай the SDLFrame
    Создай(null, ID_FRAME, "Frame Титул", поз,
           Размер, wxCAPTION | wxSYSTEM_MENU | 
           wxMINIMIZE_BOX | wxCLOSE_BOX, "");

    // create the main menubar
    wxMenuBar mb = new wxMenuBar;
    
    // create the file меню
    wxMenu fileMenu = new wxMenu;
    fileMenu.Append(IDM_FILE_EXIT, "E&xit");
    
    // add the file меню to the меню bar
    mb.Append(fileMenu, "&File");
    
    // create the help меню
    wxMenu helpMenu = new wxMenu;
    helpMenu.Append(IDM_HELP_ABOUT, "About");
    
    // add the help меню to the меню bar
    mb.Append(helpMenu, "&Help");
    
    // add the меню bar to the SDLFrame
    this.menuBar = mb;
    
    // create the SDLPanel
    panel = new SDLPanel(this);

    EVT_MENU(IDM_FILE_EXIT, &onFileExit);
    EVT_MENU(IDM_HELP_ABOUT, &onHelpAbout);
    }
    
    /**
     * Gets the SDLPanel within this SDLFrame.
     *
     * @return The SDLPanel.
     */
    SDLPanel getPanel() { return panel; }
}

/*******************************************************************************
// SDLApp Class
*******************************************************************************/

public class SDLApp : wxApp
{
private:
    SDLFrame frame;
    
public:
    /**
     * Called to initialize this SDLApp.
     *
     * @return да if initialization succeeded; false otherwise.
     */
    public override бул ПоИниц()
    {
     // create the SDLFrame
    frame = new SDLFrame;
    frame.РазмерКлиента = Размер(640, 480);
    frame.Центр();
    frame.Покажи();
    
    // initialization should always succeed
    return да;
    }
   
    /**
     * Called to run this SDLApp.
     *
     * @return The status code (0 if good, non-0 if bad).
     */
    public override цел ПоПуску()
    {
        // initialize SDL
    if (сдлВкл(SDL_INIT_VIDEO) < 0) {
        //ошибка(фм("unable to init SDL: ", stdrus.вТкст(сдлДайОш())));
        
        return -1;
    }
    
version (__WXMAC__) {} else {
    // Устup video mode, but don't create a окно
    сдлУстановиВидеоРежим(0, 0, 0, SDL_SWSURFACE);
}
    
    // generate an initial idle event to start things
    wxIdleEvent event = new wxIdleEvent;
    event.EventObject = frame.getPanel();
    frame.getPanel().AddPendingEvent(event);
 
    // start the main loop
    return super.ПоПуску();
    }
    
    /**
     * Called when this SDLApp is ready to exit.
     *
     * @return The exit code.
     */
    public override цел ПоВыходу()
    {
    // cleanup SDL
    сдлВыход();
    
    // return the standard exit code
    return super.ПоВыходу();
	}

	static проц Main(char[][] арги)
	{
		SDLApp app = new SDLApp();
		app.Пуск(арги);
	}

}

цел main(char[][] арги)
{
	SDLApp.Main(арги);
	return 0;
}
