//-----------------------------------------------------------------------------
// wxD/Samples - Grid.d
//
// wxD "grid" sample.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// Modified by BERO <berobero@users.sourceforge.net>
// (C) 2004 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: Grid.d,v 1.10 2008/03/03 20:12:13 afb Exp $
//-----------------------------------------------------------------------------

import wx.wx;
private import stdrus;

	public class GridFrame : Frame
	{
		enum Cmd  
		{
			ID_TOGGLEROWLABELS = 100,
			ID_TOGGLECOLLABELS,
			ID_TOGGLEEDIT,
			ID_TOGGLEROWSIZING,
			ID_TOGGLECOLSIZING,
			ID_TOGGLEGRIDSIZING,
			ID_TOGGLEGRIDLINES,
			ID_AUTOSIZECOLS,
			ID_CELLOVERFLOW,
			ID_RESIZECELL,
			ID_SETLABELCOLOUR,
			ID_SETLABELTEXTCOLOUR,
			ID_SETLABEL_FONT,
			ID_ROWLABELALIGN,
			ID_ROWLABELHORIZALIGN,
			ID_ROWLABELVERTALIGN,
			ID_COLLABELALIGN,
			ID_COLLABELHORIZALIGN,
			ID_COLLABELVERTALIGN,
			ID_GRIDLINECOLOUR,
			ID_INSERTROW,
			ID_INSERTCOL,
			ID_DELETEROW,
			ID_DELETECOL,
			ID_CLEARGRID,
			ID_CHANGESEL,
			ID_SELCELLS,
			ID_SELROWS,
			ID_SELCOLS,
			ID_SET_CELL_FG_COLOUR,
			ID_SET_CELL_BG_COLOUR,
			ID_ABOUT,
			ID_VTABLE,
			ID_BUGS_TABLE,
			ID_SMALL_GRID,
			ID_SELECT_UNSELECT,
			ID_SELECT_ALL,
			ID_SELECT_ROW,
			ID_SELECT_COL,
			ID_SELECT_CELL,
			ID_DESELECT_ALL,
			ID_DESELECT_ROW,
			ID_DESELECT_COL,
			ID_DESELECT_CELL,
			
			ID_SET_HIGHLIGHT_WIDTH,
			ID_SET_RO_HIGHLIGHT_WIDTH,

			ID_TESTFUNC,
			ID_EXIT
		}
		
		//-----------------------------------------------------------------------------
		
		private Grid grid;
		private TextCtrl logWin;
		private ткст logBuf;
		
		public бул m_addToSel = false;
		
		public static long s_sizeGrid = 10000;
		
		//-----------------------------------------------------------------------------
		
		public this()
		{
			super( null, -1, "wxWidgets grid class demo", вхДефПоз, вхДефРазм );
			пиктограмма = new Пиктограмма( "./data/mondrian.png" );
			
			цел gridW = 600;
			цел gridH = 300;
			цел logW = gridW;
			цел logH = 100;
			
			Меню fileMenu = new Меню();
			fileMenu.Append( Cmd.ID_VTABLE, "&Virtual table test\tCtrl-V" );
			fileMenu.Append( Cmd.ID_BUGS_TABLE, "&Bugs table test\tCtrl-B" );
			fileMenu.Append( Cmd.ID_SMALL_GRID, "&Small Grid test\tCtrl-S" );
			fileMenu.AppendSeparator();
			fileMenu.Append( Cmd.ID_EXIT, "E&xit\tAlt-X" );

			Меню viewMenu = new Меню();
			viewMenu.AppendCheckItem( Cmd.ID_TOGGLEROWLABELS,  "&Row labels", "" );
			viewMenu.AppendCheckItem( Cmd.ID_TOGGLECOLLABELS,  "&Col labels", "" );
			viewMenu.AppendCheckItem( Cmd.ID_TOGGLEEDIT,  "&Editable", "" );
			viewMenu.AppendCheckItem( Cmd.ID_TOGGLEROWSIZING, "Ro&w drag-resize", "" );
			viewMenu.AppendCheckItem( Cmd.ID_TOGGLECOLSIZING, "C&ol drag-resize", "" );
			viewMenu.AppendCheckItem( Cmd.ID_TOGGLEGRIDSIZING, "&Grid drag-resize", "" );
			viewMenu.AppendCheckItem( Cmd.ID_TOGGLEGRIDLINES, "&Grid Lines", "" );
			viewMenu.Append( Cmd.ID_SET_HIGHLIGHT_WIDTH, "&Уст Cell Highlight Ширь...", "" );
			viewMenu.Append( Cmd.ID_SET_RO_HIGHLIGHT_WIDTH, "&Уст Cell RO Highlight Ширь...", "" );
			viewMenu.Append( Cmd.ID_AUTOSIZECOLS, "&Auto-Размер cols" );
			viewMenu.AppendCheckItem( Cmd.ID_CELLOVERFLOW, "&Overflow cells", "" );
			viewMenu.AppendCheckItem( Cmd.ID_RESIZECELL, "&Resize cell (7,1)", "" );

			Меню rowLabelMenu = new Меню();

			viewMenu.Append( Cmd.ID_ROWLABELALIGN, "R&ow ярлык alignment", rowLabelMenu, "Change alignment of row labels" );

			rowLabelMenu.Append( Cmd.ID_ROWLABELHORIZALIGN, "&Horizontal" );
			rowLabelMenu.Append( Cmd.ID_ROWLABELVERTALIGN, "&Vertical" );

			Меню colLabelMenu = new Меню();

			viewMenu.Append( Cmd.ID_COLLABELALIGN, "Col l&abel alignment", colLabelMenu, "Change alignment of col labels" );

			colLabelMenu.Append( Cmd.ID_COLLABELHORIZALIGN, "&Horizontal" );
			colLabelMenu.Append( Cmd.ID_COLLABELVERTALIGN, "&Vertical" );

			Меню colMenu = new Меню();
			colMenu.Append( Cmd.ID_SETLABELCOLOUR, "Уст &ярлык цвет..." );
			colMenu.Append( Cmd.ID_SETLABELTEXTCOLOUR, "Уст ярлык &текст цвет..." );
			colMenu.Append( Cmd.ID_SETLABEL_FONT, "Уст ярлык fo&nt..." );
			colMenu.Append( Cmd.ID_GRIDLINECOLOUR, "&Grid line цвет..." );
			colMenu.Append( Cmd.ID_SET_CELL_FG_COLOUR, "Уст cell &foreground цвет..." );
			colMenu.Append( Cmd.ID_SET_CELL_BG_COLOUR, "Уст cell &background цвет..." );

			Меню editMenu = new Меню();
			editMenu.Append( Cmd.ID_INSERTROW, "Insert &row" );
			editMenu.Append( Cmd.ID_INSERTCOL, "Insert &column" );
			editMenu.Append( Cmd.ID_DELETEROW, "Delete selected ro&ws" );
			editMenu.Append( Cmd.ID_DELETECOL, "Delete selected co&ls" );
			editMenu.Append( Cmd.ID_CLEARGRID, "Cl&ear grid cell contents" );

			Меню selectMenu = new Меню();
			selectMenu.AppendCheckItem( Cmd.ID_SELECT_UNSELECT, "Добавь new cells to the selection",
				"When off, old selection is deselected before selecting the new cells" );
			selectMenu.Append( Cmd.ID_SELECT_ALL, "Select all" );
			selectMenu.Append( Cmd.ID_SELECT_ROW, "Select row 2" );
			selectMenu.Append( Cmd.ID_SELECT_COL, "Select col 2" );
			selectMenu.Append( Cmd.ID_SELECT_CELL, "Select cell (3, 1)" );
			selectMenu.Append( Cmd.ID_DESELECT_ALL, "Deselect all" );
			selectMenu.Append( Cmd.ID_DESELECT_ROW, "Deselect row 2" );
			selectMenu.Append( Cmd.ID_DESELECT_COL, "Deselect col 2" );
			selectMenu.Append( Cmd.ID_DESELECT_CELL, "Deselect cell (3, 1)" );
			
			Меню selectionMenu = new Меню();
			selectMenu.Append( Cmd.ID_CHANGESEL, "Change &selection mode", selectionMenu, "Change selection mode" );

			selectionMenu.Append( Cmd.ID_SELCELLS, "Select &Cells" );
			selectionMenu.Append( Cmd.ID_SELROWS, "Select &Rows" );
			selectionMenu.Append( Cmd.ID_SELCOLS, "Select C&ols" );


			Меню helpMenu = new Меню();
			helpMenu.Append( Cmd.ID_ABOUT, "&About wxGrid demo" );

			MenuBar menuBar = new MenuBar();
			menuBar.Append( fileMenu, "&File" );
			menuBar.Append( viewMenu, "&View" );
			menuBar.Append( colMenu,  "&Colours" );
			menuBar.Append( editMenu, "&Edit" );
			menuBar.Append( selectMenu, "&Select" );
			menuBar.Append( helpMenu, "&Help" );

			this.menuBar = menuBar ;	
			
			grid = new Grid( this, -1, Точка( 0, 0 ), Размер( 400, 300 ) );
			
			logWin = new TextCtrl( this, -1, "", Точка( 0, gridH + 20 ), Размер( logW, logH ), TextCtrl.wxTE_MULTILINE );
			
			Log.УстActiveTarget( logWin ); 
			
			grid.CreateGrid( 0, 0 );
			grid.AppendRows( 100 );
			grid.AppendCols( 100 );
			
			цел ir = grid.NumberRows;
			grid.DeleteRows( 0, ir );
			grid.AppendRows( ir );
			
			grid.УстRowSize( 0, 60 );
			grid.УстCellValue( 0, 0, "Ctrl+Home\nwill go to\nthis cell" );
			
			grid.УстCellValue( 0, 1, "A long piece of текст to demonstrate wrapping." );
			grid.УстCellRenderer( 0 , 1, new GridCellAutoWrapStringRenderer() );
			grid.УстCellEditor( 0,  1 , new GridCellAutoWrapStringEditor() );

			grid.УстCellValue( 0, 2, "Blah" );
			grid.УстCellValue( 0, 3, "Read only" );
			grid.УстReadOnly( 0, 3 );

			grid.УстCellValue( 0, 4, "Can veto edit this cell" );

			grid.УстCellValue( 0, 5, "Press\nCtrl+arrow\nto skip over\ncells" );

			grid.УстRowSize( 99, 60 );
			grid.УстCellValue( 99, 99, "Ctrl+End\nwill go to\nthis cell" );
			grid.УстCellValue( 1, 0, "This default cell will overflow into neighboring cells, but not if you turn overflow off." );

			grid.УстCellTextColour( 1, 2, Цвет.wxRED );
			grid.УстCellBackgroundColour( 1, 2, Цвет.wxGREEN );

			grid.УстCellValue( 1, 4, "I'm in the middle" );

			grid.УстCellValue( 2, 2, "red" );

			grid.УстCellTextColour( 2, 2, Цвет.wxRED );
			grid.УстCellValue( 3, 3, "green on grey" );
			grid.УстCellTextColour( 3, 3, Цвет.wxGREEN );
			grid.УстCellBackgroundColour( 3, 3, Цвет.wxLIGHT_GREY );

			grid.УстCellValue( 4, 4, "a weird looking cell" );
			grid.УстCellAlignment( 4, 4, Alignment.wxALIGN_CENTRE, Alignment.wxALIGN_CENTRE );
			grid.УстCellRenderer( 4, 4, new MyGridCellRenderer() );

			grid.УстCellValue( 3, 0, "0" );
			grid.УстCellRenderer( 3, 0, new GridCellBoolRenderer() );
			grid.УстCellEditor( 3, 0, new GridCellBoolEditor() );	
			
			GridCellAttr attr = new GridCellAttr();
			attr.ЦветТекста = Цвет.wxBLUE;
			grid.УстColAttr( 5, attr );
			attr = new GridCellAttr();	
			attr.ЦветФона = Цвет.wxRED;
			grid.УстRowAttr( 5, attr );

			grid.УстCellValue( 2, 4, "a wider column" );
			grid.УстColSize( 4, 120 );
			grid.УстColMinimalWidth( 4, 120 );

			grid.УстCellTextColour( 5, 8, Цвет.wxGREEN );
			grid.УстCellValue( 5, 8, "Bg from row attr\nText col from cell attr" );
			grid.УстCellValue( 5, 5, "Bg from row attr Text col from col attr and this текст is so long that it covers over many many empty cells but is broken by one that isn't" );

			grid.УстColFormatFloat( 6 );
			grid.УстCellValue( 0, 6, "3.1415" );
			grid.УстCellValue( 1, 6, "1415" );
			grid.УстCellValue( 2, 6, "12345.67890" );

			grid.УстColFormatFloat( 7, 6, 2 );
			grid.УстCellValue( 0, 7, "3.1415" );
			grid.УстCellValue( 1, 7, "1415" );
			grid.УстCellValue( 2, 7, "12345.67890" );

			ткст[] choices =
			[
				"Please select a choice",
				"This takes two cells",
				"Another choice"
			];
			
			grid.УстCellEditor( 4, 0, new GridCellChoiceEditor( choices ) );
			grid.УстCellSize( 4, 0, 1, 2 );
			grid.УстCellValue( 4, 0, choices[0] );
			grid.УстCellOverflow( 4, 0, false );

			grid.УстCellSize( 7, 1, 3, 4 );
			grid.УстCellAlignment( 7, 1, Alignment.wxALIGN_CENTRE, Alignment.wxALIGN_CENTRE );
			grid.УстCellValue( 7, 1, "Big box!" );

			БоксСайзер topSizer = new БоксСайзер( Ориентация.wxVERTICAL );
			topSizer.Добавь( grid, 1, Stretch.wxEXPAND );

			topSizer.Добавь( logWin, 0, Stretch.wxEXPAND );

			АвтоРаскладка = да;
			this.сайзер = topSizer ;

			topSizer.Встрой( this );
			topSizer.УстРазмПодсказ( this );

			Центр();
			УстDefaults();			
			
			EVT_MENU( Cmd.ID_TOGGLEROWLABELS,  & ToggleRowLabels ) ;
			EVT_MENU( Cmd.ID_TOGGLECOLLABELS,  & ToggleColLabels ) ;
			EVT_MENU( Cmd.ID_TOGGLEEDIT, & ToggleEditing ) ;
			EVT_MENU( Cmd.ID_TOGGLEROWSIZING, & ToggleRowSizing ) ;
			EVT_MENU( Cmd.ID_TOGGLECOLSIZING, & ToggleColSizing ) ;
			EVT_MENU( Cmd.ID_TOGGLEGRIDSIZING, & ToggleGridSizing ) ;
			EVT_MENU( Cmd.ID_TOGGLEGRIDLINES, & ToggleGridLines ) ;
			EVT_MENU( Cmd.ID_AUTOSIZECOLS, & AutoSizeCols ) ;
			EVT_MENU( Cmd.ID_CELLOVERFLOW, & CellOverflow ) ;
			EVT_MENU( Cmd.ID_RESIZECELL, & ResizeCell ) ;
			EVT_MENU( Cmd.ID_SETLABELCOLOUR, & УстLabelColour ) ;
			EVT_MENU( Cmd.ID_SETLABELTEXTCOLOUR, & УстLabelTextColour ) ;
			EVT_MENU( Cmd.ID_SETLABEL_FONT, & УстLabelFont ) ;
			EVT_MENU( Cmd.ID_ROWLABELHORIZALIGN, & УстRowLabelHorizAlignment ) ;
			EVT_MENU( Cmd.ID_ROWLABELVERTALIGN, & УстRowLabelVertAlignment ) ;
			EVT_MENU( Cmd.ID_COLLABELHORIZALIGN, & УстColLabelHorizAlignment ) ;
			EVT_MENU( Cmd.ID_COLLABELVERTALIGN, & УстColLabelVertAlignment ) ;
			EVT_MENU( Cmd.ID_GRIDLINECOLOUR, & УстGridLineColour ) ;
			EVT_MENU( Cmd.ID_INSERTROW, & InsertRow ) ;
			EVT_MENU( Cmd.ID_INSERTCOL, & InsertCol ) ;
			EVT_MENU( Cmd.ID_DELETEROW, & DeleteSelectedRows ) ;
			EVT_MENU( Cmd.ID_DELETECOL, & DeleteSelectedCols ) ;
			EVT_MENU( Cmd.ID_CLEARGRID, & ClearGrid ) ;
			EVT_MENU( Cmd.ID_SELCELLS,  & SelectCells ) ;
			EVT_MENU( Cmd.ID_SELROWS,  & SelectRows ) ;
			EVT_MENU( Cmd.ID_SELCOLS,  & SelectCols ) ;
			
			EVT_MENU( Cmd.ID_SET_CELL_FG_COLOUR, & УстCellFgColour ) ;
			EVT_MENU( Cmd.ID_SET_CELL_BG_COLOUR, & УстCellBgColour ) ;
			
			EVT_MENU( Cmd.ID_ABOUT, & About ) ;
			EVT_MENU( Cmd.ID_EXIT, & OnQuit ) ;
			EVT_MENU( Cmd.ID_VTABLE, & OnVTable) ;
			EVT_MENU( Cmd.ID_BUGS_TABLE, & OnBugsTable) ;
			EVT_MENU( Cmd.ID_SMALL_GRID, & OnSmallGrid) ;
			
			EVT_MENU( Cmd.ID_DESELECT_CELL, & DeselectCell) ;
			EVT_MENU( Cmd.ID_DESELECT_COL, & DeselectCol) ;
			EVT_MENU( Cmd.ID_DESELECT_ROW, & DeselectRow) ;
			EVT_MENU( Cmd.ID_DESELECT_ALL, & DeselectAll) ;
			EVT_MENU( Cmd.ID_SELECT_CELL, & SelectCell) ;
			EVT_MENU( Cmd.ID_SELECT_COL, & SelectCol) ;
			EVT_MENU( Cmd.ID_SELECT_ROW, & SelectRow) ;
			EVT_MENU( Cmd.ID_SELECT_ALL, & SelectAll) ;
			EVT_MENU( Cmd.ID_SELECT_UNSELECT, & OnAddToSelectToggle) ;
			
			EVT_MENU( Cmd.ID_SET_HIGHLIGHT_WIDTH, & OnУстHighlightWidth) ;
			EVT_MENU( Cmd.ID_SET_RO_HIGHLIGHT_WIDTH, & OnУстROHighlightWidth) ;
			
			EVT_GRID_LABEL_LEFT_CLICK( & OnLabelLeftClick ) ;
			EVT_GRID_CELL_LEFT_CLICK( & OnCellLeftClick ) ;
			EVT_GRID_ROW_SIZE( & OnRowSize ) ;
			EVT_GRID_COL_SIZE( & OnColSize ) ;
			EVT_GRID_SELECT_CELL( & OnSelectCell ) ;
			EVT_GRID_RANGE_SELECT( & OnRangeSelected ) ;
			EVT_GRID_CELL_CHANGE( & OnCellValueChanged ) ;
			
			EVT_GRID_EDITOR_SHOWN( & OnEditorShown ) ;
			EVT_GRID_EDITOR_HIDDEN( & OnEditorHidden ) ;			
			
		}
		
		public проц УстDefaults()
		{
			menuBar.Check( Cmd.ID_TOGGLEROWLABELS, да );
			menuBar.Check( Cmd.ID_TOGGLECOLLABELS, да );
			menuBar.Check( Cmd.ID_TOGGLEEDIT, да );
			menuBar.Check( Cmd.ID_TOGGLEROWSIZING, да );
			menuBar.Check( Cmd.ID_TOGGLECOLSIZING, да );
			menuBar.Check( Cmd.ID_TOGGLEGRIDSIZING, да );
			menuBar.Check( Cmd.ID_TOGGLEGRIDLINES, да );
			menuBar.Check( Cmd.ID_CELLOVERFLOW, да );
		}
		
		public проц ToggleRowLabels( Объект отправитель, Событие e )
		{
			if ( menuBar.IsChecked( Cmd.ID_TOGGLEROWLABELS ) )
			{
				grid.RowLabelSize = grid.DefaultRowLabelSize;
			}
			else
			{
				grid.RowLabelSize = 0;
			}
		}
		
		public проц ToggleColLabels( Объект отправитель, Событие e )
		{
			if ( menuBar.IsChecked( Cmd.ID_TOGGLECOLLABELS ) )
			{
				grid.ColLabelSize = grid.DefaultColLabelSize;
			}
			else
			{
				grid.ColLabelSize = 0;
			}			
		}
		
		public проц ToggleEditing( Объект отправитель, Событие e )
		{
			grid.IsEditable = menuBar.IsChecked( Cmd. ID_TOGGLEEDIT );
		}

		public проц ToggleRowSizing( Объект отправитель, Событие e )
		{
			grid.DragRowSizeEnabled = menuBar.IsChecked( Cmd.ID_TOGGLEROWSIZING );			
		}

		public проц ToggleColSizing( Объект отправитель, Событие e )
		{
			grid.DragColSizeEnabled = menuBar.IsChecked( Cmd.ID_TOGGLECOLSIZING );
			
		}

		public проц ToggleGridSizing( Объект отправитель, Событие e )
		{
			grid.DragGridSizeEnabled = menuBar.IsChecked( Cmd.ID_TOGGLEGRIDSIZING );			
		}

		public проц ToggleGridLines( Объект отправитель, Событие e )
		{
			grid.GridLinesEnabled = menuBar.IsChecked( Cmd.ID_TOGGLEGRIDLINES );			
		}

		public проц AutoSizeCols( Объект отправитель, Событие e )
		{
			grid.AutoSizeColumns();
			grid.Освежи();			
		}

		public проц CellOverflow( Объект отправитель, Событие e )
		{
			СобытиеКоманда ce = cast(СобытиеКоманда) e;
			grid.DefaultCellOverflow = ce.IsChecked;
			grid.Освежи();
		}

		public проц ResizeCell( Объект отправитель, Событие e )
		{
			СобытиеКоманда ce = cast(СобытиеКоманда) e;
			
			if ( ce.IsChecked )
				grid.УстCellSize( 7, 1, 5, 5 );
			else
				grid.УстCellSize( 7, 1, 1, 5 );
				
			grid.Освежи();
		}

		public проц УстLabelColour( Объект отправитель, Событие e )
		{
			ColourDialog dlg = new ColourDialog(this);
			if ( dlg.ShowModal() == wxID_OK )
			{
				ColourData retData = dlg.colourData;
				Цвет цвет = retData.цвет;

				grid.LabelBackgroundColour = цвет;
			}			
		}
		
		public проц УстLabelTextColour( Объект отправитель, Событие e )
		{
			ColourDialog dlg = new ColourDialog(this);
			if ( dlg.ShowModal() == wxID_OK )
			{
				ColourData retData = dlg.colourData;
				Цвет цвет = retData.цвет;

				grid.LabelTextColour = цвет;
			}				
		}		
		
		public проц УстLabelFont( Объект отправитель, Событие e )
		{
			FontData data = new FontData();
			data.InitialFont = grid.LabelFont;
			
			FontDialog fd = new FontDialog(this, data);
			
			if ( fd.ShowModal() == wxID_OK )
			{			
				Шрифт шрифт = fd.fontData.ChosenFont;
				if ( шрифт.Ок )
				{
					grid.LabelFont = шрифт;
				}
			}
			
		}		

		public проц УстRowLabelHorizAlignment( Объект отправитель, Событие e )
		{
			цел horiz, vert;
			grid.GetRowLabelAlignment( horiz, vert );

			switch ( horiz )
			{
				case Alignment.wxALIGN_LEFT:
					horiz = Alignment.wxALIGN_CENTRE;
				break;

				case Alignment.wxALIGN_CENTRE:
					horiz = Alignment.wxALIGN_RIGHT;
				break;

				case Alignment.wxALIGN_RIGHT:
					horiz = Alignment.wxALIGN_LEFT;
				break;
			}

			grid.УстRowLabelAlignment( horiz, -1 );			
		}		

		public проц УстRowLabelVertAlignment( Объект отправитель, Событие e )
		{
			цел horiz, vert;
			grid.GetRowLabelAlignment( horiz, vert );

			switch ( vert )
			{
				case Alignment.wxALIGN_TOP:
					vert = Alignment.wxALIGN_CENTRE;
				break;

				case Alignment.wxALIGN_CENTRE:
					vert = Alignment.wxALIGN_BOTTOM;
				break;

				case Alignment.wxALIGN_BOTTOM:
					vert = Alignment.wxALIGN_TOP;
				break;
			}

			grid.УстRowLabelAlignment( -1, vert );			
		}		

		public проц УстColLabelHorizAlignment( Объект отправитель, Событие e )
		{
			цел horiz, vert;
			grid.GetColLabelAlignment( horiz, vert );

			switch ( horiz )
			{
				case Alignment.wxALIGN_LEFT:
					horiz = Alignment.wxALIGN_CENTRE;
				break;

				case Alignment.wxALIGN_CENTRE:
					horiz = Alignment.wxALIGN_RIGHT;
				break;

				case Alignment.wxALIGN_RIGHT:
					horiz = Alignment.wxALIGN_LEFT;
				break;
			}

			grid.УстColLabelAlignment( horiz, -1 );			
		}		

		public проц УстColLabelVertAlignment( Объект отправитель, Событие e )
		{
			цел horiz, vert;
			grid.GetColLabelAlignment( horiz, vert );

			switch ( vert )
			{
				case Alignment.wxALIGN_TOP:
					vert = Alignment.wxALIGN_CENTRE;
				break;

				case Alignment.wxALIGN_CENTRE:
					vert = Alignment.wxALIGN_BOTTOM;
				break;

				case Alignment.wxALIGN_BOTTOM:
				vert = Alignment.wxALIGN_TOP;
				break;
			}

			grid.УстColLabelAlignment( -1, vert );			
		}		

		public проц УстGridLineColour( Объект отправитель, Событие e )
		{
			ColourDialog dlg = new ColourDialog(this);
			if ( dlg.ShowModal() == wxID_OK )
			{
				ColourData retData = dlg.colourData;
				Цвет цвет = retData.цвет;

				grid.GridLineColour = цвет;
			}							
		}		
		
		public проц InsertRow( Объект отправитель, Событие e )
		{
			grid.InsertRows( grid.GridCursorRow, 1 );			
		}		

		public проц InsertCol( Объект отправитель, Событие e )
		{
			grid.InsertCols( grid.GridCursorCol, 1 );
		}		

		public проц DeleteSelectedRows( Объект отправитель, Событие e )
		{
			if ( grid.IsSelection )
			{
				grid.BeginBatch();
				for ( цел n = 0; n < grid.NumberRows; )
					if ( grid.IsInSelection( n , 0 ) )
						grid.DeleteRows( n, 1 );
					else
						n++;
				grid.EndBatch();
			}			
		}		

		public проц DeleteSelectedCols( Объект отправитель, Событие e )
		{
			if ( grid.IsSelection )
			{
				grid.BeginBatch();
				for ( цел n = 0; n < grid.NumberCols; )
					if ( grid.IsInSelection( 0 , n ) )
						grid.DeleteCols( n, 1 );
					else
						n++;
				grid.EndBatch();
			}			
		}		
		
		public проц ClearGrid( Объект отправитель, Событие e )
		{
			grid.ClearGrid();
		}		
		
		public проц SelectCells( Объект отправитель, Событие e )
		{
			grid.SelectionMode = GridSelectionMode.wxGridSelectCells;
		}		
		
		public проц SelectRows( Объект отправитель, Событие e )
		{
			grid.SelectionMode = GridSelectionMode.wxGridSelectRows;
		}		

		public проц SelectCols( Объект отправитель, Событие e )
		{
			grid.SelectionMode = GridSelectionMode.wxGridSelectColumns;
		}		

		public проц УстCellFgColour( Объект отправитель, Событие e )
		{
			ColourDialog dlg = new ColourDialog(this);
			if ( dlg.ShowModal() == wxID_OK )
			{
				ColourData retData = dlg.colourData;
				Цвет цвет = retData.цвет;

				if ( цвет.Ок() )
				{
					grid.DefaultCellTextColour = цвет;
					grid.Освежи();
				}
			}										
		}		

		public проц УстCellBgColour( Объект отправитель, Событие e )
		{
			ColourDialog dlg = new ColourDialog(this);
			if ( dlg.ShowModal() == wxID_OK )
			{
				ColourData retData = dlg.colourData;
				Цвет цвет = retData.цвет;

				if ( цвет.Ок() )
				{
					grid.DefaultCellBackgroundColour = цвет;
					Прямоугольник r = Прямоугольник( 0, 0, grid.Размер.Ширь, grid.Размер.Высь );
					grid.Освежи( да, r);
				}
			}													
		}		
	
		public проц About( Объект отправитель, Событие e )
		{
			MessageBox( "\n\nwxGrid demo \n\n" ~
				"Ported to wxD \nby BERO\n" ,
				"About",
				Dialog.wxOK );			
		}		

		public проц OnQuit( Объект отправитель, Событие e )
		{
			Закрой( да );
		}		

		public проц OnVTable( Объект отправитель, Событие e )
		{
			s_sizeGrid = GetNumberFromUser( "Размер of the table to create",
                                     "Размер: ",
                                     "wxGridDemo question",
                                     s_sizeGrid,
                                     0, 32000, this);
				
			if ( s_sizeGrid != -1 )
			{
				BigGridFrame win = new BigGridFrame( s_sizeGrid );
				win.Покажи( да );
			}
		}		
		
		public проц OnBugsTable( Объект отправитель, Событие e )
		{
			BugsGridFrame frame = new BugsGridFrame();
			frame.Покажи( да );
		}		
		
		public проц OnSmallGrid( Объект отправитель, Событие e )
		{
			Frame frame = new Frame( null, -1, "A Small Grid", вхДефПоз, Размер( 640, 480 ) );
			Panel panel = new Panel( frame, -1 );
			Grid agrid = new Grid( panel, -1, Точка( 10, 10 ), Размер( 400, 400 ), wxWANTS_CHARS | wxSIMPLE_BORDER );
			agrid.CreateGrid( 3, 3 );
			frame.Покажи( да );
		}		
		
		public проц DeselectCell( Объект отправитель, Событие e )
		{
			grid.DeselectCell( 3, 1 );
		}		

		public проц DeselectCol( Объект отправитель, Событие e )
		{
			grid.DeselectCol( 2 );
		}		
		
		public проц DeselectRow( Объект отправитель, Событие e )
		{
			grid.DeselectRow( 2 );
		}		
	
		public проц DeselectAll( Объект отправитель, Событие e )
		{
			grid.ClearSelection();
		}		

		public проц SelectCell( Объект отправитель, Событие e )
		{
			grid.SelectBlock( 3, 1, 3, 1, m_addToSel );
		}		
		
		public проц SelectCol( Объект отправитель, Событие e )
		{
			grid.SelectCol( 2, m_addToSel );
		}		
		
		public проц SelectRow( Объект отправитель, Событие e )
		{
			grid.SelectRow( 2, m_addToSel );
		}		

		public проц SelectAll( Объект отправитель, Событие e )
		{
			grid.SelectAll();
		}		
		
		public проц OnAddToSelectToggle( Объект отправитель, Событие e )
		{
			СобытиеКоманда ce = cast(СобытиеКоманда) e;
			m_addToSel = ce.IsChecked;
		}		

		public проц OnУстHighlightWidth( Объект отправитель, Событие e )
		{
			ткст[] choices = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" ];

			SingleChoiceDialog dlg = new SingleChoiceDialog(this, "Choose the thickness of the highlight pen:",
				"Pen Ширь", choices);

			цел current = grid.CellHighlightPenWidth;
			dlg.Selection = current;
			if ( dlg.ShowModal() == wxID_OK ) 
			{
				grid.CellHighlightPenWidth = dlg.Selection;
			}			
		}		

		public проц OnУстROHighlightWidth( Объект отправитель, Событие e )
		{
			ткст[] choices = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" ];

			SingleChoiceDialog dlg = new SingleChoiceDialog(this, "Choose the thickness of the highlight pen:",
				"Pen Ширь", choices);

			цел current = grid.CellHighlightROPenWidth;
			dlg.Selection = current ;
			if ( dlg.ShowModal() == wxID_OK ) 
			{
				grid.CellHighlightROPenWidth = dlg.Selection;
			}			
		}		
		
		public проц OnLabelLeftClick( Объект отправитель, Событие e )
		{
			GridEvent ge = cast(GridEvent) e;
			
			if ( ge.Row != -1 )
			{
				logBuf = "Лево click on row ярлык " ~ .вТкст(ge.Row);
			}
			else if ( ge.Col != -1 )
			{
				logBuf = "Лево click on col ярлык " ~ .вТкст(ge.Col);
			}
			else
			{
				logBuf = "Лево click on corner ярлык";
			}

			if ( ge.ShiftDown ) logBuf ~= " (shift down)";
			if ( ge.ControlDown ) logBuf ~= " (control down)";
			Log.LogMessage( logBuf );

			// you must call event skip if you want default grid processing
			
			ge.Skip();			
		}		
		
		public проц OnCellLeftClick( Объект отправитель, Событие e )
		{
			GridEvent ge = cast(GridEvent) e;
			logBuf = "Лево click at row " ~ .вТкст(ge.Row) ~ " col " ~ .вТкст(ge.Col);
			Log.LogMessage( logBuf );

			// you must call event skip if you want default grid processing
			// (cell highlighting etc.)
			
			ge.Skip();			
		}		

		public проц OnRowSize( Объект отправитель, Событие e )
		{
			GridSizeEvent ge = cast(GridSizeEvent) e;
			logBuf = "Resized row " ~ .вТкст(ge.RowOrCol);
			Log.LogMessage( logBuf );

			ge.Skip();			
		}		
		
		public проц OnColSize( Объект отправитель, Событие e )
		{
			GridSizeEvent ge = cast(GridSizeEvent) e;
			logBuf = "Resized col " ~ .вТкст(ge.RowOrCol);
			Log.LogMessage( logBuf );

			ge.Skip();			
		}		

		public проц OnSelectCell( Объект отправитель, Событие e )
		{
			GridEvent ge = cast(GridEvent) e;
			if ( ge.Selecting )
				logBuf = "Selected ";
			else
				logBuf = "Deselected ";
				
			logBuf ~= "cell at row " ~ .вТкст(ge.Row) ~
				" col " ~ .вТкст(ge.Col) ~
				" ( ControlDown: " ~ ( ge.ControlDown ? "T":"F" ) ~
				", ShiftDown: " ~ (ge.ShiftDown ? "T":"F") ~
				", AltDown: " ~ (ge.AltDown ? "T":"F") ~
				", MetaDown: " ~ (ge.MetaDown ? "T":"F") ~ " )";
				
			Log.LogMessage( logBuf );

			// you must call Skip() if you want the default processing
			// to occur in wxGrid
			ge.Skip();			
		}		
		
		public проц OnRangeSelected( Объект отправитель, Событие e )
		{
			GridRangeSelectEvent ge = cast(GridRangeSelectEvent) e;
			
			if ( ge.Selecting )
				logBuf = "Selected ";
			else
				logBuf = "Deselected ";
				
			logBuf ~= "cells from row " ~ .вТкст(ge.TopRow) ~
				" col " ~ .вТкст(ge.LeftCol) ~
				" to row " ~ .вТкст(ge.BottomRow) ~
				" col " ~ .вТкст(ge.RightCol) ~
				" ( ControlDown: " ~ (ge.ControlDown ? "T":"F") ~
				", ShiftDown: " ~ (ge.ShiftDown ? "T":"F") ~
				", AltDown: " ~ (ge.AltDown ? "T":"F") ~
				", MetaDown: " ~ (ge.MetaDown ? "T":"F") ~ " )";
				
			Log.LogMessage( logBuf );

			ge.Skip();			
		}		

		public проц OnCellValueChanged( Объект отправитель, Событие e )
		{
			GridEvent ge = cast(GridEvent) e;
			
			logBuf = "Value changed for cell at" ~
				" row " ~ .вТкст(ge.Row) ~
				" col " ~ .вТкст(ge.Col);

				Log.LogMessage( logBuf );

			ge.Skip();			
		}		

		public проц OnEditorShown( Объект отправитель, Событие e )
		{
			GridEvent ge = cast(GridEvent) e;
			if ( ( ge.Col == 4 ) &&
				( ge.Row == 0 ) &&
				( MessageBox( "Are you sure you wish to edit this cell",
						"Checking", Dialog.wxYES_NO ) == Dialog.wxNO ) ) 
			{

				ge.Veto();
				return;
			}
			
			Log.LogMessage( "Cell editor shown." );

			ge.Skip();
		}		

		public проц OnEditorHidden( Объект отправитель, Событие e )
		{
			GridEvent ge = cast(GridEvent) e;
			if ( ( ge.Col == 4 ) &&
				( ge.Row == 0 ) &&
				( MessageBox( "Are you sure you wish to finish editing this cell",
						"Checking", Dialog.wxYES_NO ) == Dialog.wxNO ) ) 
			{

				ge.Veto();
				return;
			}

			Log.LogMessage( "Cell editor hidden." );

			ge.Skip();			
		}				
	}
	
	//---------------------------------------------------------------------
	
	public class BugsGridFrame : Frame
	{
		public enum Columns
		{
			Col_Id,
			Col_Summary,
			Col_Severity, 
			Col_Priority,
			Col_Platform,
			Col_Opened,
			Col_Max
		}
		
		const public ткст[] severities =
		[
			"wishlist",
			"minor",
			"normal",
			"major",
			"critical"
		];
		
		public this()
		{
			super( null, -1, "Bugs table", вхДефПоз, Размер( 500, 300 ) );
			Grid grid = new Grid( this, -1, вхДефПоз );
			GridTableBase table = new BugsGridTable();
			table.УстAttrProvider( new MyGridCellAttrProvider() );
			grid.УстTable(table, да);

			GridCellAttr attrRO    = new GridCellAttr();
			GridCellAttr attrRange = new GridCellAttr();
			GridCellAttr attrCombo = new GridCellAttr();

			attrRO.ReadOnly  = да;
			attrRange.Editor = new GridCellNumberEditor( 1, 5 );
			attrCombo.Editor = new GridCellChoiceEditor( severities );

			grid.УстColAttr(Columns.Col_Id,       attrRO);
			grid.УстColAttr(Columns.Col_Priority, attrRange);
			grid.УстColAttr(Columns.Col_Severity, attrCombo);

			grid.УстMargins(0, 0);

			grid.Встрой();
			РазмерКлиента = grid.Размер;			
		}
	}
	
	//---------------------------------------------------------------------
	
	public class BugsGridTable : GridTableBase
	{
		public enum Columns
		{
			Col_Id,
			Col_Summary,
			Col_Severity,
			Col_Priority,
			Col_Platform,
			Col_Opened,
			Col_Max
		}	
		
		public enum Severity
		{
			Sev_Wish,
			Sev_Minor,
			Sev_Normal,
			Sev_Major,
			Sev_Critical,
			Sev_Max
		}
		
		public class BugsGridData
		{
			public цел ид;
			public ткст summary;
			public Severity severity;
			public цел prio;
			public ткст platform;
			public бул opened;
			
            public this(цел ид, ткст summary, Severity severity, 
                                цел prio, ткст platform, бул opened)
			{
				this.ид = ид;
				this.summary = summary;
				this.severity = severity;
				this.prio = prio;
				this.platform = platform;
				this.opened = opened;
			}
		}
		
		public static ткст[] severities =
		[
			"wishlist",
			"minor",
			"normal",
			"major",
			"critical"
		];
		
		public static ткст[] headers =
		[
			"Ид",
			"Summary",
			"Severity",
			"Priority",
			"Platform",
			"Opened?"
		];
		
		public static BugsGridData[4]  gs_dataBugsGrid;
		
		public this() 
		{
			super();
			gs_dataBugsGrid[0] = new BugsGridData( 18, "foo doesn't work", Severity.Sev_Major, 1, "wxMSW", да );
			gs_dataBugsGrid[1] = new BugsGridData( 27, "bar crashes", Severity.Sev_Critical, 1, "all", false );
			gs_dataBugsGrid[2] = new BugsGridData( 45, "printing is slow", Severity.Sev_Minor, 3, "wxMSW", да );
			gs_dataBugsGrid[3] = new BugsGridData( 68, "Прямоугольник() fails", Severity.Sev_Normal, 1, "wxMSW", false );
		}
		
		public override цел GetNumberRows()
		{
			return gs_dataBugsGrid.length;
		}
		
		public override цел GetNumberCols()
		{
			return Columns.Col_Max;
		}
		
		public override бул IsEmptyCell( цел row, цел col )
		{
			return false;
		}
		
		public override ткст GetValue( цел row, цел col )
		{
			BugsGridData gd = gs_dataBugsGrid[row];
			
			switch( col )
			{
				case Columns.Col_Id:
				case Columns.Col_Priority:
				case Columns.Col_Opened:
					Log.LogError( "unexpected column" );
				break;

				case Columns.Col_Severity:
					return severities[gd.severity];

				case Columns.Col_Summary:
					return gd.summary;

				case Columns.Col_Platform:
					return gd.platform;
			}

			return "";				
		}
		
		public override проц УстValue( цел row, цел col, ткст значение)
		{
			BugsGridData gd = gs_dataBugsGrid[row];

			switch ( col )
			{
				case Columns.Col_Id:
				case Columns.Col_Priority:
				case Columns.Col_Opened:
					Log.LogError( "unexpected column" );
				break;

				case Columns.Col_Severity:
				{
					цел n;
					for ( n = 0; n < severities.length; n++ )
					{
						if ( severities[n] == значение )
						{
							gd.severity = cast(Severity)n;
							break;
						} 
					}

					if ( n == severities.length )
					{
						Log.LogWarning( "Invalid severity значение '{0}'.", значение );
						gd.severity = Severity.Sev_Normal;
					}
				}
				break;

				case Columns.Col_Summary:
					gd.summary = значение;
				break;

				case Columns.Col_Platform:
					gd.platform = значение;
				break;
			}			
		}
		
		public override ткст GetColLabelValue( цел col )
		{
			return headers[col];
		}
		
		public override ткст GetTypeName( цел row, цел col )
		{
			switch ( col )
			{
				case Columns.Col_Id:
					return "long";
				
				case Columns.Col_Priority:
					return "long";

				case Columns.Col_Severity:
					return "ткст:80";

				case Columns.Col_Summary:
					return "ткст:80";

				case Columns.Col_Platform:
					return "choice:all,MSW,GTK,other";

				case Columns.Col_Opened:
					return "бул";
			}

			return "";			
		}
		
		public override бул CanGetValueAs( цел row, цел col, ткст typeName )
		{
			if ( typeName == "ткст" )
			{
				return да;
			}
			else if ( typeName == "бул" )
			{
				return col == Columns.Col_Opened;
			}
			else if ( typeName == "long" )
			{
				return col == Columns.Col_Id || col == Columns.Col_Priority || col == Columns.Col_Severity;
			}
			else
			{
				return false;
			}			
		}
		
		public override бул CanУстValueAs( цел row, цел col, ткст typeName )
		{
			return CanGetValueAs(row, col, typeName);
		}

		public override цел GetValueAsLong( цел row, цел col )
		{
			BugsGridData gd = gs_dataBugsGrid[row];
			
			switch ( col )
			{
				case Columns.Col_Id:
					return gd.ид;

				case Columns.Col_Priority:
					return gd.prio;

				case Columns.Col_Severity:
					return gd.severity;

				default:
					Log.LogError( "unexpected column" );
					return -1;
			}			
		}
		
		public override бул GetValueAsBool( цел row, цел col )
		{
			if ( col == Columns.Col_Opened )
			{
				return gs_dataBugsGrid[row].opened;
			}
			else 
			{
				Log.LogError( "unexpected column" );

				return false;
			}			
		} 

		public override проц УстValueAsLong( цел row, цел col, цел значение )
		{
			BugsGridData gd = gs_dataBugsGrid[row];
			

			switch ( col )
			{
				case Columns.Col_Priority:
					gd.prio = значение;
				break;

				default:
					Log.LogError( "unexpected column" );
				break;
			}			
		}
		
		public override проц УстValueAsBool( цел row, цел col, бул значение )
		{
			if ( col == Columns.Col_Opened )
			{
				gs_dataBugsGrid[row].opened = значение;
			}
			else
			{
				Log.LogError( "unexpected column" );
			}			
		}
	} 
	 
	//---------------------------------------------------------------------
	
	public class MyGridCellAttrProvider : GridCellAttrProvider
	{
		private GridCellAttr m_attrForOddRows;
		
		public this()
		{
			m_attrForOddRows = new GridCellAttr();
			m_attrForOddRows.ЦветФона = Цвет.wxLIGHT_GREY;
		}
		
		public override GridCellAttr ДайАтр( цел row, цел col, GridCellAttr.AttrKind kind)
		{
		
			GridCellAttr attr = super.ДайАтр(row, col, kind);

			if ( ( row % 2 ) > 0 )
			{
				if ( attr is null )
				{
					attr = m_attrForOddRows;
					attr.IncRef();
				}
				else
				{
					if ( !attr.ЕстьЦветФона )
					{
						GridCellAttr attrNew = attr.Clone();
						attr.DecRef();
						attr = attrNew;
						attr.ЦветФона = Цвет.wxLIGHT_GREY;
					}
				}
			}

			return attr;			
		}
	}
	
	//---------------------------------------------------------------------
	
	public class MyGridCellRenderer : GridCellStringRenderer
	{
		public this()
			
			{ super(); };
		public override проц Draw(Grid grid, GridCellAttr attr, DC dc, Прямоугольник прям, цел row, цел col, бул isSelected)
		{
			Draw(grid, attr, dc, прям, row, col, isSelected);
			
			dc.pen = Pen.wxGREEN_PEN;
			dc.brush = Кисть.wxTRANSPARENT_BRUSH;
			dc.DrawEllipse( прям.X, прям.Y, прям.Ширь, прям.Высь );
		}
	}
	
	//---------------------------------------------------------------------
	
	public class BigGridFrame : Frame
	{
		private Grid m_grid;
		private BigGridTable m_table;
		
		public this(long sizeGrid)
		{
			super(null, -1, "Plugin Virtual Table", вхДефПоз, Размер( 500, 450 ) );
			m_grid = new Grid( this, -1, вхДефПоз, вхДефРазм );
			m_table = new BigGridTable( sizeGrid );
			 
			m_grid.УстTable( m_table, да );
		}
	}
	
	//---------------------------------------------------------------------
	
	public class BigGridTable : GridTableBase
	{
		private long m_sizeGrid;
		
		public this( long sizeGrid)
		{
			super();
			m_sizeGrid = sizeGrid;
		}
		
		public override цел GetNumberRows()
		{
			return m_sizeGrid;
		}
		
		public override цел GetNumberCols()
		{
			return m_sizeGrid;
		}
		
		public override ткст GetValue( цел row, цел col )
		{
			ткст ret = "(" ~ .вТкст(row) ~ ", " ~ .вТкст(col) ~ ")";
			return ret;
		}
		
		public override проц УстValue( цел row, цел col, ткст val )
		{
		}
		
		public override бул IsEmptyCell( цел row, цел col )
		{
			return false;
		}
	}
	
	//---------------------------------------------------------------------

	public class GridApp : Апп
	{
		public override бул ПоИниц()
		{
			GridFrame frame = new GridFrame();
			frame.Покажи( да );

			return да;
		}

		//---------------------------------------------------------------------

		
		static проц Main()
		{
			GridApp app = new GridApp();
			app.Пуск();
		}
	}	

проц main()
{
	GridApp.Main();
}
