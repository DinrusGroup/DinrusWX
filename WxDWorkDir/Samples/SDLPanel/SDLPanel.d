//-----------------------------------------------------------------------------
// wxD/Samples - SDL.d
//
// A wxD version of the wx/SDL tutorial.
// http://code.technoplaza.net/wx-sdl/
//
// wx-sdl tutorial v1.0
// Copyright (C) 2005 John David Ratliff
//
// wx-sdl is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// wx-sdl is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with wx-sdl; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
//
// $Ид: SDLPanel.d,v 1.2 2007/04/18 19:27:17 afb Exp $
//-----------------------------------------------------------------------------

private import std.stdio;
private import std.ткст;

import wx.wx;

import wx.MemoryDC;
import wx.Image;

import sdl.sdl;

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
    проц onPaint(Объект sender, Событие event)
    {
     // can't draw if the screen doesn't exist yet
    if (screen == пусто) {
        return;
    }
    
    // lock the surface if necessary
    if (SDL_MUSTLOCK(screen)) {
        if (SDL_LockSurface(screen) < 0) {
            return;
        }
    }
    
    // create a битмап from our pixel данные
    wxBitmap bmp = new wxBitmap(new Рисунок(screen.w, screen.h, 
                    cast(ббайт *)(screen.pixels), да));
    
    // unlock the screen
    if (SDL_MUSTLOCK(screen)) {
        SDL_UnlockSurface(screen);
    }
    
    // paint the screen
    auto wxBufferedPaintDC dc = new wxBufferedPaintDC(this, bmp);
	}
    
    /**
     * Called to erase the background.
     *
     * @param event The triggering wxEraseEvent (unused).
     */
    проц onEraseBackground(Объект sender, Событие event) {}
    
    /**
     * Called to update the panel.
     *
     * @param event The triggering wxIdleEvent (unused).
     */
    проц onIdle(Объект sender, Событие event)
    {
    // create the SDL_Surface
    createScreen();
    
    // Lock surface if needed
    if (SDL_MUSTLOCK(screen)) {
        if (SDL_LockSurface(screen) < 0) {
            return;
        }
    }
    
    // Ask SDL for the time in milliseconds
    цел tick = SDL_GetTicks();
    
    for (цел y = 0; y < 480; y++) {
        for (цел x = 0; x < 640; x++) {
            бцел color = (y * y) + (x * x) + tick;
            ббайт *pixels = cast(ббайт *)(screen.pixels) + 
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
        SDL_UnlockSurface(screen);
    }
    
    // refresh the panel
    Refresh(нет);
    
    // throttle to keep from flooding the event queue
    wxMilliSleep(33);
    }
    
    /**
     * Creates the SDL_Surface used by this SDLPanel.
     */
    проц createScreen()
    {
    if (screen == пусто) {
        Размер size = size();
        
        screen = SDL_CreateRGBSurface(SDL_SWSURFACE, size.Ширина, size.Высота, 
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
    screen = пусто;
    
    // ensure the size of the wxPanel
    wxSize size = wxSize(640, 480);
    
    MinSize = size;
    MaxSize = size;

    EVT_PAINT(&onPaint);
    EVT_ERASE_BACKGROUND(&onEraseBackground);
    EVT_IDLE(&onIdle);
	}
    
    /**
     * Destructs this SDLPanel.
     */
    ~this()
    {
    if (screen != пусто) {
        SDL_FreeSurface(screen);
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
    проц onFileExit(Объект sender, Событие event) { Закрой(); }
    
    /**
     * Called when about from the справка меню is selected.
     *
     * @param event The associated wxCommandEvent (unused).
     */
    проц onHelpAbout(Объект sender, Событие event)
    {
    MessageBox("wx-sdl tutorial\nCopyright (C) 2005 John Ratliff",
                 "about wx-sdl tutorial", Диалог.wxOK | Диалог.wxICON_INFORMATION);
    }
    
public:
    /**
     * Creates a new SDLFrame.
     */
//    this(Точка поз=wxDefaultPosition, Размер size=wxDefaultSize)
    this()
    {
    Точка поз=wxDefaultPosition;
    Размер size=wxDefaultSize;
 
         // Create the SDLFrame
    Create(пусто, ID_FRAME, "Frame Title", поз,
           size, wxCAPTION | wxSYSTEM_MENU | 
           wxMINIMIZE_BOX | wxCLOSE_BOX, "");

    // create the main menubar
    wxMenuBar mb = new wxMenuBar;
    
    // create the file меню
    wxMenu fileMenu = new wxMenu;
    fileMenu.Append(IDM_FILE_EXIT, "E&xit");
    
    // add the file меню to the меню bar
    mb.Append(fileMenu, "&File");
    
    // create the справка меню
    wxMenu helpMenu = new wxMenu;
    helpMenu.Append(IDM_HELP_ABOUT, "About");
    
    // add the справка меню to the меню bar
    mb.Append(helpMenu, "&Справка");
    
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
     * Called to инициализуй this SDLApp.
     *
     * @return да if initialization succeeded; нет otherwise.
     */
    public override бул ПриИниц()
    {
     // create the SDLFrame
    frame = new SDLFrame;
    frame.ClientSize = Размер(640, 480);
    frame.Centre();
    frame.Show();
    
    // initialization should always succeed
    return да;
    }
   
    /**
     * Called to run this SDLApp.
     *
     * @return The status code (0 if good, non-0 if bad).
     */
    public override цел ПриПуске()
    {
        // инициализуй SDL
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        fwritefln(stderr, "unable to init SDL: ", std.ткст.toString(SDL_GetError()));
        
        return -1;
    }
    
version (__WXMAC__) {} else {
    // Setup video mode, but don't create a окно
    SDL_SetVideoMode(0, 0, 0, SDL_SWSURFACE);
}
    
    // generate an initial idle event to start things
    wxIdleEvent event = new wxIdleEvent;
    event.ОбъСоб = frame.getPanel();
    frame.getPanel().AddPendingEvent(event);
 
    // start the main loop
    return super.ПриПуске();
    }
    
    /**
     * Called when this SDLApp is ready to exit.
     *
     * @return The exit code.
     */
    public override цел ПриВыходе()
    {
    // cleanup SDL
    SDL_Quit();
    
    // return the standard exit code
    return super.ПриВыходе();
	}

	static проц Main(сим[][] args)
	{
		SDLApp прил = new SDLApp();
		прил.Пуск(args);
	}

}

цел main(сим[][] args)
{
	SDLApp.Main(args);
	return 0;
}
