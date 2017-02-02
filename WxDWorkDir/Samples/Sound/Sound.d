//-----------------------------------------------------------------------------
// wxD/Samples - Sound.d
//
// A wxD version of the wxWidgets "sound" sample.
//
// Written by Vaclav Slavik
// (c) 2004 Vaclav Salvik
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Sound.d,v 1.5 2008/03/03 15:53:19 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;

import wx.Sound;

ткст WAV_FILE = "doggrowl.wav";

	public class MyFrame : Фрейм
	{
		// IDs for the controls and the меню commands
		enum
		{
			// меню items
			Sound_Quit = MenuIDs.wxID_EXIT,
			Sound_About = MenuIDs.wxID_ABOUT,
			Sound_PlaySync = MenuIDs.wxID_HIGHEST + 1,
			Sound_PlayAsync,
			Sound_PlayAsyncOnStack,
			Sound_PlayLoop,
			Sound_SelectFile
		}

		//---------------------------------------------------------------------

		public this(ткст title)
		{
			super(title);

		    m_sound = пусто;
    		m_soundFile = WAV_FILE;

			// Установи up a меню

			Меню helpMenu = new Меню();
			helpMenu.Append(Sound_About, "&About...\tF1", "Show about dialog");

			Меню fileMenu = new Меню();
			fileMenu.Append(Sound_SelectFile, "&Select WAV file\tCtrl+O", "Select a new wav file to play");
			fileMenu.Append(Sound_Quit, "E&xit\tAlt-X", "Quit this program");

			Меню playMenu = new Меню();
			playMenu.Append(Sound_PlaySync, "Play sound &synchronously\tCtrl+S");
			playMenu.Append(Sound_PlayAsync, "Play sound &asynchronously\tCtrl+A");
			playMenu.Append(Sound_PlayLoop, "&Loop sound\tCtrl+L");

			// now append the freshly created меню to the меню bar...
			MenuBar menuBar = new MenuBar();
			menuBar.Append(fileMenu, "&File");
			menuBar.Append(playMenu, "&Play");
			menuBar.Append(helpMenu, "&Справка");

			// ... and attach this меню bar to the frame
			this.menuBar = menuBar;
			// Установи up the event table

			EVT_MENU(Sound_SelectFile,	&OnSelectFile);
			EVT_MENU(Sound_Quit,    	&OnQuit);
			EVT_MENU(Sound_About,   	&OnAbout);
			EVT_MENU(Sound_PlaySync,    &OnPlaySync);
			EVT_MENU(Sound_PlayAsync,   &OnPlayAsync);
			EVT_MENU(Sound_PlayLoop,    &OnPlayLoop);

			m_tc = new TextCtrl(this, wxID_ANY, "",
								  wxDefaultPosition, wxDefaultSize,
								  TextCtrl.wxTE_MULTILINE|TextCtrl.wxTE_READONLY);
			NotifyUsingFile(m_soundFile);
		}

		private:
			Sound     m_sound;
			ткст    m_soundFile;
			TextCtrl  m_tc;

		//---------------------------------------------------------------------

		проц NotifyUsingFile(ткст имя)
		{
			ткст msg;
			msg = "Using sound file: " ~ имя ~ "\n";
			m_tc.AppendText(msg);
		}

		//---------------------------------------------------------------------

		public проц OnSelectFile(Объект sender, Событие e)
		{
			ФайлДиалог dlg = new ФайлДиалог (this, "Choose a sound file",
							 "", "", "WAV files (*.wav)|*.wav", ФайлДиалог.wxOPEN|ФайлДиалог.wxCHANGE_DIR);
			if ( dlg.ShowModal() == wxID_OK )
			{
				m_soundFile = dlg.Путь;
				if (m_sound) delete m_sound;
				m_sound = пусто;
				NotifyUsingFile(m_soundFile);
			}
		}

		//---------------------------------------------------------------------

		public проц OnQuit(Объект sender, Событие e)
		{
			// да is to force the frame to close
			Закрой(да);
		}

		//---------------------------------------------------------------------

		public проц OnPlaySync(Объект sender, Событие e)
		{
			BusyCursor busy = new BusyCursor;
			if (!m_sound)
				m_sound = new Sound(m_soundFile);
			if (m_sound.IsOk())
				m_sound.Play(wxSOUND_SYNC);
			delete busy;
		}

		//---------------------------------------------------------------------

		public проц OnPlayAsync(Объект sender, Событие e)
		{
			BusyCursor busy = new BusyCursor;
			if (!m_sound)
				m_sound = new Sound(m_soundFile);
			if (m_sound.IsOk())
				m_sound.Play(wxSOUND_ASYNC);
			delete busy;
		}

		//---------------------------------------------------------------------

		public проц OnPlayLoop(Объект sender, Событие e)
		{
			BusyCursor busy = new BusyCursor;
			if (!m_sound)
				m_sound = new Sound(m_soundFile);
			if (m_sound.IsOk())
				m_sound.Play(wxSOUND_ASYNC | wxSOUND_LOOP);
			delete busy;
		}

		//---------------------------------------------------------------------

		public проц OnAbout(Объект sender, Событие e)
		{
			ткст msg = "This is the About dialog of the sound sample.\nWelcome to " ~ wxVERSION_STRING;
			MessageBox(this, msg, "About", Диалог.wxOK | Диалог.wxICON_INFORMATION);
		}

		//---------------------------------------------------------------------
	}



	public class MyApp : Прил
	{
		//---------------------------------------------------------------------

		public override бул ПриИниц()
		{
			// create the main application окно
			MyFrame frame = new MyFrame("wxWidgets Sound Sample");

			// and show it (the frames, unlike simple controls, are not shown when
			// created initially)
			frame.Show(да);

			// success
    		return да;
		}

		//---------------------------------------------------------------------
	}

цел main()
{
	MyApp прил = new MyApp();
	прил.Пуск();
	return 0;
}
