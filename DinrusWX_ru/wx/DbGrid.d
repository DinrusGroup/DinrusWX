//-----------------------------------------------------------------------------
// wxD - DbGrid.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - DbGrid
//
/// The DbGrid class.
//
// Written by Alexander Olk (xenomorph2@onlinehome.de)
// (C) 2003 by Alexander Olk
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: DbGrid.d,v 1.9 2006/11/17 15:20:59 afb Exp $
//-----------------------------------------------------------------------------

module wx.DbGrid;
public import wx.common;
public import wx.Grid;


struct СписокМассивов /* for .NET compatibility */
{
	Объект[] массив;

	проц Добавь(Объект o)
	{
		массив ~= o;
	}
	проц Удали(Объект o)
	{
		бцел i;
		for(i=0;i<массив.length;i++) {
			if (массив[i] is o) break;
		}
		if (i==массив.length) return;
		for(i++;i<массив.length;i++) {
			массив[i-1] = массив[i];
		}
		массив.length = массив.length-1;
	}
}

	alias Колонка wxColumn;
	public class Колонка
	{
		private ткст dbcolumnname;
		private ткст newcolumnname;
		private цел ширь;

		//-----------------------------------------------------------------------------

		public this() {}

		//-----------------------------------------------------------------------------

		public ткст dbColumnName() { return dbcolumnname; }
		public проц dbColumnName(ткст значение) { dbcolumnname = значение; }

		//-----------------------------------------------------------------------------

		public ткст newColumnName() { return newcolumnname; }
		public проц newColumnName(ткст значение) { newcolumnname = значение; }

		//-----------------------------------------------------------------------------

		public цел Ширь() { return ширь; }
		public проц Ширь(цел значение) { ширь = значение; }
	}

	//-----------------------------------------------------------------------------

	alias ColumnMapping wxColumnMapping;
	public class ColumnMapping
	{
		private Колонка[] cols;
		private СписокМассивов *см;

		private цел DEFAULT_COLUMN_WIDTH = 75;

		//-----------------------------------------------------------------------------

		public this()
		{
			см = new СписокМассивов();
			cols = cast(Колонка[]) см.массив;
		}

		//-----------------------------------------------------------------------------

		public проц Добавь(ткст dbcolumnname, ткст newcolumnname)
		{
			Добавь(dbcolumnname, newcolumnname, DEFAULT_COLUMN_WIDTH);
		}

		public проц Добавь(ткст dbcolumnname, ткст newcolumnname, цел ширь)
		{
			Колонка col = new Колонка();
			col.dbColumnName = dbcolumnname;
			col.newColumnName = newcolumnname;
			col.Ширь = ширь;
			см.Добавь(col);
			cols = cast(Колонка[]) см.массив;
		}

		//-----------------------------------------------------------------------------

		public бцел length() { return cols.length; }

		//-----------------------------------------------------------------------------

		public Колонка opIndex(цел index)
		{
			return cols[index];
		}

		//-----------------------------------------------------------------------------

		public Колонка Search(ткст dbcolumnname)
		{
			Колонка result = null;
			foreach (Колонка col;cols)
			{
				if (col.dbColumnName == dbcolumnname)
				{
					result =  col;
					break;
				}
			}
			return result;
		}

		//-----------------------------------------------------------------------------

		public Колонка SearchDbColumnName(ткст newcolumnname)
		{
			Колонка result = null;
			foreach (Колонка col;cols)
			{
				if (col.newColumnName() == newcolumnname)
				{
					result =  col;
					break;
				}
			}
			return result;
		}

		//-----------------------------------------------------------------------------

		public Колонка[] Cols() { return cols; }

		//-----------------------------------------------------------------------------

		public цел DefaultColumnWidth() { return DEFAULT_COLUMN_WIDTH; }
		public проц DefaultColumnWidth(цел значение) { DEFAULT_COLUMN_WIDTH = значение; }
	}

	//-----------------------------------------------------------------------------

	public enum DbGridMsg
	{
		OK = 1,
		GRID_CREATION_ERROR,
		NO_TABLE_ERROR,
		NO_COLUMN_ERROR,
		NO_COLUMN_MAPPING_ERROR
	}

	//-----------------------------------------------------------------------------

	alias DbGrid wxDbGrid;
	public class DbGrid : Grid
	{
		//private DataУст myDataУст = null;
		private ColumnMapping colmap = null;

		private ткст tablename;

		private бул datasetorcolmap = false; // if false, then dataset mapping else column mapping

		//-----------------------------------------------------------------------------

		public this(ЦелУкз wxobj)
			{ super(wxobj);}

		public this(Окно родитель, цел ид)
			{ this(родитель, ид, вхДефПоз, вхДефРазм, wxWANTS_CHARS, "grid"); }

		public this(Окно родитель, цел ид, Точка поз)
			{ this(родитель, ид, поз, вхДефРазм, wxWANTS_CHARS, "grid"); }

		public this(Окно родитель, цел ид, Точка поз, Размер Размер)
			{ this(родитель, ид, поз, Размер, wxWANTS_CHARS, "grid"); }

		public this(Окно родитель, цел ид, Точка поз, Размер Размер, цел стиль)
			{ this(родитель, ид, поз, Размер, стиль, "grid"); }

		public this(Окно родитель, цел ид, Точка поз, Размер Размер, цел стиль, ткст имя)
		{
			super(родитель, ид, поз, Размер, стиль, имя);
			//myDataУст = new DataУст();
			colmap = new ColumnMapping();

			EVT_GRID_CELL_CHANGE(new ДатчикСобытий(OnGridCellChange));
		}

		//---------------------------------------------------------------------
		// ctors with сам created ид

		public this(Окно родитель)
			{ this(родитель, Окно.УникИД, вхДефПоз, вхДефРазм, wxWANTS_CHARS, "grid"); }

		public this(Окно родитель, Точка поз)
			{ this(родитель, Окно.УникИД, поз, вхДефРазм, wxWANTS_CHARS, "grid"); }

		public this(Окно родитель, Точка поз, Размер Размер)
			{ this(родитель, Окно.УникИД, поз, Размер, wxWANTS_CHARS, "grid"); }

		public this(Окно родитель, Точка поз, Размер Размер, цел стиль)
			{ this(родитель, Окно.УникИД, поз, Размер, стиль, "grid"); }

		public this(Окно родитель, Точка поз, Размер Размер, цел стиль, ткст имя)
			{ this(родитель, Окно.УникИД, поз, Размер, стиль, имя);}

		//-----------------------------------------------------------------------------

		//public DataУст dataУст() { return myDataУст; }
		//public проц dataУст(DataУст значение) { myDataУст = значение; }

		//-----------------------------------------------------------------------------

		public ColumnMapping columnMapping() { return colmap; }
		public проц columnMapping(ColumnMapping значение) { colmap = значение; }

		//-----------------------------------------------------------------------------

		public цел DefaultColumnWidth() { return colmap.DefaultColumnWidth; }
		public проц DefaultColumnWidth(цел значение) { colmap.DefaultColumnWidth = значение; }

		//-----------------------------------------------------------------------------

		public проц AddColumnMapping(ткст dbcolumnname, ткст newcolumnname)
		{
			colmap.Добавь(dbcolumnname, newcolumnname);
		}

		//-----------------------------------------------------------------------------

		public проц AddColumnMapping(ткст dbcolumnname, ткст newcolumnname, цел ширь)
		{
			colmap.Добавь(dbcolumnname, newcolumnname, ширь);
		}

		//-----------------------------------------------------------------------------

		// Создай the grid, map columnnames
		// grid columns equal dataset columns
		public DbGridMsg CreateGridFromDataУст(ткст tablename)
		{
			if (dataУст != null)
			{
				// No tables;dataset
				if (dataУст.Tables.Счёт == 0)
				{
					return DbGridMsg.NO_TABLE_ERROR;
				}

				// No columns;dataset
				if (dataУст.Tables[tablename].Columns.Счёт == 0)
				{
					return DbGridMsg.NO_COLUMN_ERROR;
				}

				datasetorcolmap = false;

				this.tablename = tablename;
				цел r = 0;
				цел c = 0;
				DataTable table = dataУст.Tables[tablename];
				цел numcols = table.Columns.Счёт;

				if ( !CreateGrid(table.Rows.Счёт, numcols) )
				{
					return DbGridMsg.GRID_CREATION_ERROR;
				}

				RowLabelSize = 0;

				// If a mapping имя exists use mapping имя
				// else use dataset column caption
				foreach (DataColumn col;table.Columns)
				{
					Колонка icol = colmap.Search(col.Caption);

					ткст ncolname=col.Caption;

					if (icol != null)
					{
						if (icol.newColumnName.Length > 0)
						{
							ncolname = icol.newColumnName;
						}

						УстColumnWidth(c, icol.Ширь);
					}

					УстColLabelValue(c, ncolname);
					c++;
				}

				// Fill grid
				foreach (DataRow row;table.Rows)
				{
					c = 0;
					foreach (DataColumn col;table.Columns)
					{
						УстCellValue(r, c, row[col].ToString());
						c++;
					}
					r++;
				}
			}

			return DbGridMsg.OK;
		}

		//-----------------------------------------------------------------------------

		// Создай the grid, map columnnames
		// grid columns equal ColumnMapping columns
		public DbGridMsg CreateGridFromColumnMapping(ткст tablename)
		{
			if (dataУст != null)
			{
				// No tables;dataset
				if (dataУст.Tables.Счёт == 0)
				{
					return DbGridMsg.NO_TABLE_ERROR;
				}

				// No columns;dataset
				if (dataУст.Tables[tablename].Columns.Счёт == 0)
				{
					return DbGridMsg.NO_COLUMN_ERROR;
				}

				// No columns;colmap
				if ( colmap.Счёт == 0 )
				{
					return DbGridMsg.NO_COLUMN_MAPPING_ERROR;
				}

				datasetorcolmap = да;

				this.tablename = tablename;
				цел r = 0;
				цел c = 0;
				DataTable table = dataУст.Tables[tablename];
				цел numcols = colmap.Счёт;

				if ( !CreateGrid(table.Rows.Счёт, numcols) )
				{
					return DbGridMsg.GRID_CREATION_ERROR;
				}

				RowLabelSize = 0;

				// Grid column names = colmap newColumnName
				foreach (Колонка icol;colmap.Cols)
				{
					УстColumnWidth(c, icol.Ширь);

					УстColLabelValue(c, icol.newColumnName);
					c++;
				}

				// Fill grid
				foreach (DataRow row;table.Rows)
				{
					c = 0;
					foreach (Колонка col;colmap.Cols)
					{
						УстCellValue(r, c, row[col.dbColumnName].ToString());
						c++;
					}
					r++;
				}
			}

			return DbGridMsg.OK;
		}

		//-----------------------------------------------------------------------------

		// currently this only works manually
		// you have to call it from the application
		// it will add a new row to the grid and the datatable;the dataset
		public проц AddRow()
		{
			AppendRows(1, да);
			DataRow nrow = myDataУст.Tables[tablename].NewRow();
			myDataУст.Tables[tablename].Rows.Добавь(nrow);
		}

		//-----------------------------------------------------------------------------

		// Returns the currently selected row
		public DataRow GetRow(цел чис)
		{
			DataRow dr = null;

			try
			{
				dr = myDataУст.Tables[tablename].Rows[чис];
			}
			catch (Exception e)
			{
				dr = null;
			}

			return dr;
		}

		//-----------------------------------------------------------------------------

		// Cell change ?? Change the corresponding dataset also
		private проц OnGridCellChange(Объект отправитель, Событие e)
		{
			GridEvent ge = cast(GridEvent)e;
			ткст s = GetColLabelValue(ge.Col);
			DataRow row = myDataУст.Tables[tablename].Rows[ge.Row];
			row[s] = GetCellValue(ge.Row, ge.Col);
		}

		//-----------------------------------------------------------------------------
	}
