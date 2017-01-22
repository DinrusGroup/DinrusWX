//-----------------------------------------------------------------------------
// wxD/Samples - Dnd.d
//
// wxD "Dnd" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2003 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Dnd.d,v 1.10 2008/03/03 20:11:15 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import std.ткст;

    public class DNDText : TextDropTarget
    {
        private ListBox myOwner;
		
	//---------------------------------------------------------------------

        public this(ListBox myOwner)
        {
            super();
            this.myOwner = myOwner;
        } 
		 
	//---------------------------------------------------------------------

        public override бул OnDropText(цел x, цел y, ткст текст)
        {
            myOwner.Append(текст);
            return да;
        }
    }

	//---------------------------------------------------------------------

    public class DNDFile : FileDropTarget
    {
        private ListBox myOwner;
		
		//---------------------------------------------------------------------

        public this(ListBox myOwner)
        {
            super();
            this.myOwner = myOwner;
        } 
		
		//---------------------------------------------------------------------

        public override бул OnDropFiles(цел x, цел y, ткст[] filenames)
        {
	    	ткст str = .toString(filenames.length) ~ " files dropped";
		myOwner.Append(str);

	    	for ( цел i = 0; i < filenames.length; i++ )
	    	{
	    		myOwner.Append(filenames[i]);
	    	}
   
		return да;
        }
    }
	
	//---------------------------------------------------------------------	
		
    public class DndFrame : Frame
    {
        enum Cmd { Menu_Drag, Menu_DragMoveDef, Menu_DragMoveAllow, Menu_About, Menu_Quit,
			Menu_Clear, Menu_Help, Menu_Copy, Menu_Paste}

        private ListBox m_ctrlText = пусто;
	private ListBox m_ctrlFile = пусто;
		
	private TextCtrl m_ctrlLog = пусто;
		
	private Log m_pLog = пусто;
	private Log m_pLogPrev = пусто;
		
	private бул m_moveByDefault = нет;
	private бул m_moveAllow = да;
	
	public ткст m_strText;
	
        //---------------------------------------------------------------------

        public this(ткст title, Точка поз, Размер size)
        {
            super(title, поз, size);
            // Установи the окно иконка and status bar

            иконка = new Icon("../Dnd/mondrian.png");

            CreateStatusBar();
            StatusText = "Welcome to the Dnd Sample!";						
			
            // Установи up a меню

            Меню fileMenu = new Меню();
	    fileMenu.Append(Cmd.Menu_Drag, "&Test drag...");
	    fileMenu.AppendCheckItem(Cmd.Menu_DragMoveDef, "&Move by default", "");
	    fileMenu.AppendCheckItem(Cmd.Menu_DragMoveAllow, "&Allow moving", "");
	    fileMenu.AppendSeparator();
	    fileMenu.Append(Cmd.Menu_Quit, "E&xit\tCtrl-Q");
			
	    Меню logMenu = new Меню();
	    logMenu.Append(Cmd.Menu_Clear, "Очисть\tCtrl-L");

            Меню helpMenu = new Меню();
	    helpMenu.Append(Cmd.Menu_Help, "&Справка");
	    helpMenu.AppendSeparator();
            helpMenu.Append(Cmd.Menu_About, "&About"); 
			
	    Меню clipMenu = new Меню();
	    clipMenu.Append(Cmd.Menu_Copy, "&Копируй текст\tCtrl-C");
	    clipMenu.Append(Cmd.Menu_Paste, "&Вставь текст\tCtrl-V");

            MenuBar menuBar = new MenuBar();
            menuBar.Append(fileMenu, "&File");
	    menuBar.Append(logMenu, "&Log");
	    menuBar.Append(clipMenu, "&БуферОбмена");
            menuBar.Append(helpMenu, "&Справка");

            this.menuBar = menuBar;
			
	    Точка apos = Точка(0, 0);
	    Размер asize = Размер(300, 200); 
	    Размер bsize = Размер(600,100);
	    
	    ткст[]  strFile = ["Drop files here!"];
	    ткст[]  strText = ["Drop текст on me"];
			
	    m_ctrlFile = new ListBox(this, -1, wxDefaultPosition, asize, strFile, ListBox.wxLB_HSCROLL | ListBox.wxLB_ALWAYS_SB);
			
	    m_ctrlText = new ListBox(this, -1, wxDefaultPosition, asize, strText, ListBox.wxLB_HSCROLL | ListBox.wxLB_ALWAYS_SB);
			
	    m_ctrlLog = new TextCtrl(this, -1, "", wxDefaultPosition, bsize, TextCtrl.wxTE_MULTILINE | TextCtrl.wxTE_READONLY | TextCtrl.wxSUNKEN_BORDER );
			
	    Log.SetActiveTarget(m_ctrlLog);  
	    Log.AddTraceMask("focus");
	    
	    m_ctrlFile.dropTarget = new DNDFile(m_ctrlFile);
	    m_ctrlText.dropTarget = new DNDText(m_ctrlText);	

	    BoxSizer main_sizer = new BoxSizer( Ориентация.wxVERTICAL );
	    BoxSizer h_sizer = new BoxSizer( Ориентация.wxHORIZONTAL );									
			
	    h_sizer.Добавь(m_ctrlFile, 1, Direction.wxALL, 5 );			
	    h_sizer.Добавь(m_ctrlText, 1, Direction.wxALL, 5 );
	    main_sizer.Добавь(h_sizer,  0, Direction.wxALL, 0);
	    main_sizer.Добавь(m_ctrlLog, 1, Direction.wxALL, 5);		
	    main_sizer.Добавь(new BoxSizer(Ориентация.wxHORIZONTAL), 1, Direction.wxALL, 5);
	    
	    AutoLayout = да;
	    SetSizer( main_sizer, да );
			
            main_sizer.Fit( this );
            main_sizer.SetSizeHints( this );		
			
	    menuBar.Check( Cmd.Menu_DragMoveAllow, да );
			
            // Установи up the event table

            EVT_MENU(Cmd.Menu_Quit,    &OnQuit);
            EVT_MENU(Cmd.Menu_About,   &OnAbout);
	    EVT_MENU(Cmd.Menu_Drag, &OnDrag);		
	    EVT_MENU(Cmd.Menu_DragMoveDef, &OnDragMoveByDefault);	
	    EVT_MENU(Cmd.Menu_DragMoveAllow, &OnDragMoveAllow);	
	    EVT_MENU(Cmd.Menu_Help, &OnHelp);		
	    EVT_MENU(Cmd.Menu_Clear, &OnLogClear);	
	    EVT_MENU(Cmd.Menu_Copy, &OnCopy);			
	    EVT_MENU(Cmd.Menu_Paste, &OnPaste);
	    
	    EVT_SIZE(&OnSize);
			
	    EVT_PAINT(&OnPaint);
	    
	    EVT_UPDATE_UI(Cmd.Menu_DragMoveDef, &OnUpdateUIMoveByDefault);
	    EVT_UPDATE_UI(Cmd.Menu_Paste, &OnUpdateUIPasteText);
			
	    EVT_LEFT_DOWN(&OnLeftDown);
	    EVT_RIGHT_DOWN(&OnRightDown);
			
	    Log.LogMessage("DnD sample started..");
			
	    m_strText = "wxD drag & drop works :-)";
        }

        //---------------------------------------------------------------------

        public проц OnQuit(Объект sender, Событие e)
        {
            Закрой();
        }

        //---------------------------------------------------------------------


        public проц OnAbout(Объект sender, Событие e)
        {
            ткст msg = "This is the About dialog of the dnd sample.";
            MessageBox(this, msg, "About Dnd", Dialog.wxOK | Dialog.wxICON_INFORMATION);
        }

        //---------------------------------------------------------------------
		
	public проц OnSize(Объект sender, Событие e)
	{
		Refresh();
			
		e.Пропусти();
	}
		
	//---------------------------------------------------------------------
		
	public проц OnPaint(Объект sender, Событие e)
	{
		Размер cs = ClientSize;
		
		PaintDC dc = new PaintDC(this);
			
		dc.шрифт = new Шрифт( 24, FontFamily.wxDECORATIVE, FontStyle.wxNORMAL, FontWeight.wxNORMAL, нет, "charter");
		dc.РисуйТекст("Drag текст from here!", 100, cs.Высота - 50);
            
		dc.Dispose();
	}
		
	//---------------------------------------------------------------------
		
	public проц OnUpdateUIMoveByDefault(Объект sender, Событие e)
	{
		UpdateUIEvent ue = cast(UpdateUIEvent) e;
		ue.Enabled = m_moveAllow;
	}
		
	//---------------------------------------------------------------------
	
	public проц OnUpdateUIPasteText(Объект sender, Событие e)
	{
		UpdateUIEvent ue = cast(UpdateUIEvent) e;
		ue.Enabled = БуферОбмена.TheClipboard.Поддерживается(new ФорматДанных(ИдФорматаДанных.wxDF_TEXT));
	}
		
	//---------------------------------------------------------------------
		
	public проц OnDrag(Объект sender, Событие e)
	{
		ткст strText = GetTextFromUser(
			"After you enter текст in this dialog, press any mouse\n" 
			"button in the bottom (empty) part of the frame and \n" 
			"drag it anywhere - you will be in fact dragging the\n" 
			"текст Объект containing this текст",
         		"Please enter some текст", m_strText, this);		

		if ( strText.length > 0) 
		{
			m_strText = пусто;
			m_strText = strText;
		}
	}
		
	//---------------------------------------------------------------------
		
	public проц OnDragMoveByDefault(Объект sender, Событие e)
	{
		CommandEvent ce = cast(CommandEvent) e;
		m_moveByDefault = ce.IsChecked;
	}
		
	//---------------------------------------------------------------------
		
	public проц OnDragMoveAllow(Объект sender, Событие e)
	{
		CommandEvent ce = cast(CommandEvent) e;
		m_moveAllow = ce.IsChecked;		
	}
		
	//---------------------------------------------------------------------
		
	public проц OnHelp(Объект sender, Событие e)
	{
		MessageDialog md = new MessageDialog(this, 
			"This small program demonstrates drag & drop support in wxD. The program окно\n" 
			"consists of 3 parts: the bottom pane is for debug messages, so that you can see what's\n" 
                        "going on inside. The top part is split into 2 listboxes, the left one accepts files\n" 
                        "and the right one accepts текст.\n" 
                        "\n" 
                        "To test wxDropTarget: open wordpad (write.exe), select some текст in it and drag it to\n" 
                        "the right listbox (you'll notice the usual visual feedback, i.e. the cursor will change).\n" 
                        "Also, try dragging some files (you can select several at once) from Windows Explorer (or \n" 
                        "File Manager) to the left pane. Hold down Ctrl/Shift keys when you drop текст (doesn't \n" 
                        "work with files) and see what changes.\n" 
                        "\n" 
                        "To test wxDropSource: just press any mouse button on the empty zone of the окно and drag\n"
                        "it to wordpad or any other droptarget accepting текст (and of course you can just drag it\n" 
                        "to the right pane). Due to a lot of trace messages, the cursor might take some time to \n" 
                        "change, don't release the mouse button until it does. You can change the ткст being\n" 
                        "dragged in in \"File|Test drag...\" dialog.\n",
                        "wxDnD Справка");			
			
		md.ShowModal();
	}
		
	//---------------------------------------------------------------------
		
	public проц OnLogClear(Объект sender, Событие e)
	{
		m_ctrlLog.Очисть();
		m_ctrlText.Очисть();
		m_ctrlFile.Очисть();
	}
		
	//---------------------------------------------------------------------
		
	public проц OnLeftDown(Объект sender, Событие e)
	{
		if (m_strText.length > 0)
			{
				ОбъектТекстовыхДанных textData = new ОбъектТекстовыхДанных( m_strText );
				
				if (textData is пусто) 
				{
					return;
				}
				
				DropSource source = new DropSource(textData, this);
																
				цел флаги = Drag.wxDrag_CopyOnly;
				if ( m_moveByDefault )
					флаги |= Drag.wxDrag_DefaultMove;
				else if ( m_moveAllow )
					флаги |= Drag.wxDrag_AllowMove;
					
				ткст result = "";
				
				switch ( source.DoDragDrop(флаги) )
				{
					case DragResult.wxDragError:	result = "Error!";  break;
					case DragResult.wxDragNone:     result = "Nothing"; break;
					case DragResult.wxDragCopy:   	result = "Copied";  break;
					case DragResult.wxDragMove:     result = "Moved";   break;
					case DragResult.wxDragCancel:	result = "Cancelled"; break;
					default:                        result = "Huh?";     break;					
				}
				
				StatusText = "Drag result: " ~ result;	
			}		
		}
		
		//---------------------------------------------------------------------
		
		public проц OnRightDown(Объект sender, Событие e)
		{
			MouseEvent me = cast(MouseEvent) e;
		
			Меню меню = new Меню("Dnd sample меню");
			
			меню.Append(Cmd.Menu_Drag, "&Test drag");
			меню.AppendSeparator();
			меню.Append(Cmd.Menu_About, "&About");
			
			Точка поз = me.Положение;
			PopupMenu( меню, поз);
		}
		
		//---------------------------------------------------------------------		
		
		public проц OnCopy(Объект sender, Событие e)
		{
			if ( !БуферОбмена.TheClipboard.Открой() )
			{
				Log.LogError("Can't open clipboard.");
				return;
			}
			
			if ( !БуферОбмена.TheClipboard.ДобавьДанные(new ОбъектТекстовыхДанных(m_strText)) )
			{
				Log.LogError("Can't copy данные to the clipboard");
			}
			else
			{
				Log.LogMessage("Текст '%s' put on the clipboard", m_strText);
			}
			
			БуферОбмена.TheClipboard.Закрой();
		}
		
		//---------------------------------------------------------------------
		
		public проц OnPaste(Объект sender, Событие e)
		{
			if ( !БуферОбмена.TheClipboard.Открой() )
			{
				Log.LogError("Can't open clipboard.");
				return;
			}
			
			if ( !БуферОбмена.TheClipboard.Поддерживается(new ФорматДанных(ИдФорматаДанных.wxDF_TEXT)) )
			{
				Log.LogWarning("No текст данные on clipboard");
				БуферОбмена.TheClipboard.Закрой();
				return;
			}
			
			ОбъектТекстовыхДанных текст = new ОбъектТекстовыхДанных();
			if ( !БуферОбмена.TheClipboard.ДайДанные(текст) )
			{
				Log.LogError("Can't paste данные from the clipboard");
			}
			else
			{
				Log.LogMessage("Текст '%s' pasted from the clipboard", текст.Текст);
			}
			
			БуферОбмена.TheClipboard.Закрой();
		}
    }   
	
	//---------------------------------------------------------------------	

    public class Dnd : Прил
    {
        //---------------------------------------------------------------------

        public override бул ПриИниц()
        {
            DndFrame frame = new DndFrame("Dnd wxWidgets Прил", Точка(10, 100), Размер(650,340));
            frame.Show(да);

            return да;
        }

        //---------------------------------------------------------------------

        
            static проц Main()
            {
                Dnd прил = new Dnd();
                прил.Пуск();
            }

        //---------------------------------------------------------------------
    }


проц main()
{
	Dnd.Main();
}
