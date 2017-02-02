//-----------------------------------------------------------------------------
// wxD/Samples - SashWindow.cs
//
// wxD "SashWindow" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SashWindow.d,v 1.9 2006/11/17 15:20:58 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import std.string;

	//---------------------------------------------------------------------	

	public class SashWindowFrame : Фрейм
	{
		public this( ткст title, Точка поз, Размер size )
		{
			super( title, поз, size );
			MainPanel mp = new MainPanel( this );

			TextCtrl textCtrl = new TextCtrl(this, -1, "", wxDefaultPosition, wxDefaultSize, 
				TextCtrl.wxTE_MULTILINE | TextCtrl.wxTE_READONLY | TextCtrl.wxSUNKEN_BORDER );

			Log.SetActiveTarget( textCtrl );

			BoxSizer bSizer = new BoxSizer( Ориентация.wxVERTICAL );
			bSizer.Добавь( mp, 1, Stretch.wxGROW );
			bSizer.Добавь( textCtrl, 0, Stretch.wxGROW );

			sizer = bSizer;
		}
	}

	//---------------------------------------------------------------------

	public class MainPanel : Panel
	{
		enum Cmd 
		{
			ID_WINDOW_TOP,
			ID_WINDOW_LEFT1,
			ID_WINDOW_LEFT2,
			ID_WINDOW_BOTTOM
		}

		//---------------------------------------------------------------------

		public SashLayoutWindow topWindow;
		public SashLayoutWindow bottomWindow;
		public SashLayoutWindow leftWindow1;
		public SashLayoutWindow leftWindow2;

		public Panel remainingSpace;

		public LayoutAlgorithm la;

		//---------------------------------------------------------------------

		public this(Окно родитель)
		{
			super( родитель );

			la = new LayoutAlgorithm();
			remainingSpace = new Panel( this, -1, wxDefaultPosition, wxDefaultSize, wxSUNKEN_BORDER );
			StaticText st = new StaticText( remainingSpace, -1, "I'm the remaining space Panel" );

			topWindow = new SashLayoutWindow( this, Cmd.ID_WINDOW_TOP, 
				wxDefaultPosition, Размер( 200, 30 ), 
				wxNO_BORDER | SashWindow.wxSW_3D );
			topWindow.DefaultSize = Размер( 1000, 30 );
			topWindow.Ориентация = LayoutOrientation.wxLAYOUT_HORIZONTAL;
			topWindow.Alignment = LayoutAlignment.wxLAYOUT_TOP;
			topWindow.ЦветЗП = new Цвет( 255, 0, 0 );
			topWindow.SetSashVisible( SashEdgePosition.wxSASH_BOTTOM, да );
			StaticText st1 = new StaticText( topWindow, -1, "I'm the top SashLayoutWindow" );

			bottomWindow = new SashLayoutWindow( this, Cmd.ID_WINDOW_BOTTOM, 
				wxDefaultPosition, Размер( 200, 30 ), 
				wxNO_BORDER | SashWindow.wxSW_3D );
			bottomWindow.DefaultSize = Размер( 1000, 30 );
			bottomWindow.Ориентация = LayoutOrientation.wxLAYOUT_HORIZONTAL;
			bottomWindow.Alignment = LayoutAlignment.wxLAYOUT_BOTTOM;
			bottomWindow.ЦветЗП = new Цвет( 0, 0, 255 );
			bottomWindow.SetSashVisible( SashEdgePosition.wxSASH_TOP, да );
			StaticText st2 = new StaticText( bottomWindow, -1, "I'm the bottom SashLayoutWindow" );

			leftWindow1 = new SashLayoutWindow( this, Cmd.ID_WINDOW_LEFT1, 
				wxDefaultPosition, Размер( 200, 30 ), 
				wxNO_BORDER | SashWindow.wxSW_3D );
			leftWindow1.DefaultSize = Размер( 120, 1000 );
			leftWindow1.Ориентация = LayoutOrientation.wxLAYOUT_VERTICAL;
			leftWindow1.Alignment = LayoutAlignment.wxLAYOUT_LEFT;
			leftWindow1.ЦветЗП = new Цвет( 0, 255, 0 );
			leftWindow1.SetSashVisible( SashEdgePosition.wxSASH_RIGHT, да );
			leftWindow1.ExtraBorderSize = 10;
			TextCtrl leftWindow1tc = new TextCtrl( leftWindow1, -1, 
				"I'm a child of leftWindow1", wxDefaultPosition, 
				wxDefaultSize, TextCtrl.wxTE_MULTILINE | wxSUNKEN_BORDER );

			leftWindow2 = new SashLayoutWindow( this, Cmd.ID_WINDOW_LEFT2, 
				wxDefaultPosition, Размер( 200, 30 ), 
				wxNO_BORDER | SashWindow.wxSW_3D );
			leftWindow2.DefaultSize = Размер( 120, 1000 );
			leftWindow2.Ориентация = LayoutOrientation.wxLAYOUT_VERTICAL;
			leftWindow2.Alignment = LayoutAlignment.wxLAYOUT_LEFT;
			leftWindow2.ЦветЗП = new Цвет( 0, 255, 255 );
			leftWindow2.SetSashVisible( SashEdgePosition.wxSASH_RIGHT, да );
			leftWindow2.ExtraBorderSize = 15;
			TextCtrl leftWindow2tc = new TextCtrl( leftWindow2, -1, 
				"I'm a child of leftWindow2", wxDefaultPosition, 
				wxDefaultSize, TextCtrl.wxTE_MULTILINE | wxSUNKEN_BORDER );

			EVT_SASH_DRAGGED_RANGE( Cmd.ID_WINDOW_TOP, Cmd.ID_WINDOW_BOTTOM, & OnSashDraggedRange ) ;
			
			Resized_Add(& OnSize );
		}

		//---------------------------------------------------------------------

		public проц OnSashDraggedRange( Объект sender, Событие e )
		{
			SashEvent se = cast(SashEvent) e;

			Log.LogMessage("OnSashDraggedRange:" );
			Log.LogMessage("DragStatus: " ~ .toString(cast(цел)se.DragStatus) );
			Log.LogMessage("Событие ИД: " ~ .toString(cast(цел)se.ИД) );

			if ( se.DragStatus == SashDragStatus.wxSASH_STATUS_OUT_OF_RANGE )
				return;

			цел eventID = e.ИД;

			switch ( eventID )
			{
				case Cmd.ID_WINDOW_TOP:
					topWindow.DefaultSize = Размер( 1000, se.DragRect.Высота );
				break;

				case Cmd.ID_WINDOW_LEFT1:
					leftWindow1.DefaultSize = Размер( se.DragRect.Ширина, 1000 );
				break;

				case Cmd.ID_WINDOW_LEFT2:
					leftWindow2.DefaultSize = Размер( se.DragRect.Ширина, 1000 );
				break;

				case Cmd.ID_WINDOW_BOTTOM:
					bottomWindow.DefaultSize = Размер( 1000, se.DragRect.Высота );
				break;
			}

			la.LayoutWindow( this, remainingSpace );
			remainingSpace.Refresh();
		}

		//---------------------------------------------------------------------

		public проц OnSize( Объект sender, Событие e )
		{
			Log.LogMessage("OnSize" );
			la.LayoutWindow( this, remainingSpace );
		}
	}

	//---------------------------------------------------------------------

	public class SashWindowApp : Прил
	{
		public override бул ПриИниц()
		{
			SashWindowFrame frame = new SashWindowFrame( "SashWindow wxWidgets Sample", Точка( 10, 100), Размер(650,340) );
			frame.Show( да );

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			SashWindowApp прил = new SashWindowApp();
			прил.Пуск();
		}

		//---------------------------------------------------------------------
	}

проц main()
{
	SashWindowApp.Main();
}
