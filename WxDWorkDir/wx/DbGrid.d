
module wx.DbGrid;
public import wx.common;
public import wx.Grid;

	alias Column wxColumn;
	public class Column
	{
		private ткст dbcolumnname;
		private ткст newcolumnname;
		private цел ширина;

		//-----------------------------------------------------------------------------

		public this() {}

		//-----------------------------------------------------------------------------

		public ткст dbColumnName() { return dbcolumnname; }
		public проц dbColumnName(ткст значение) { dbcolumnname = значение; }

		//-----------------------------------------------------------------------------

		public ткст newColumnName() { return newcolumnname; }
		public проц newColumnName(ткст значение) { newcolumnname = значение; }

		//-----------------------------------------------------------------------------

		public цел Ширина() { return ширина; }
		public проц Ширина(цел значение) { ширина = значение; }
	}

	//-----------------------------------------------------------------------------

	alias ColumnMapping wxColumnMapping;
	public class ColumnMapping
	{
		private Column[] cols;

		private цел DEFAULT_COLUMN_WIDTH = 75;

		//-----------------------------------------------------------------------------

		public this()
		{
			cols = new ArrayList();
		}

		//-----------------------------------------------------------------------------

		public проц Добавь(ткст dbcolumnname, ткст newcolumnname)
		{
			Добавь(dbcolumnname, newcolumnname, DEFAULT_COLUMN_WIDTH);
		}

		public проц Добавь(ткст dbcolumnname, ткст newcolumnname, цел ширина)
		{
			Column col = new Column();
			col.dbColumnName = dbcolumnname;
			col.newColumnName = newcolumnname;
			col.Ширина = ширина;
			cols =~ col;
		}

		//-----------------------------------------------------------------------------

		public бцел length() { return cols.length; }

		//-----------------------------------------------------------------------------

		public Column opIndex(цел индекс)
		{
			return cols[индекс];
		}

		//-----------------------------------------------------------------------------

		public Column Search(ткст dbcolumnname)
		{
			Column result = пусто;
			foreach (Column col;cols) 
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

		public Column SearchDbColumnName(ткст newcolumnname)
		{
			Column result = пусто;
			foreach (Column col;cols) 
			{
				if (col.newColumnName.Equals(newcolumnname))
				{
					result =  col;
					break;
				}
			}
			return result;
		}		
		
		//-----------------------------------------------------------------------------
		
		public Column[] Cols() { return cols; }

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
		private DataSet myDataSet = пусто;
		private ColumnMapping colmap = пусто;
		
		private ткст tablename;
		
		private бул datasetorcolmap = нет; // if нет, then dataset mapping else column mapping
		
		//-----------------------------------------------------------------------------
		
		public this(ЦУк шхобъ)
			{ super(шхобъ);}

		public this(Окно родитель, цел ид)
			{ this(родитель, ид, wxDefaultPosition, wxDefaultSize, wxWANTS_CHARS, "grid"); }

		public this(Окно родитель, цел ид, Точка поз)
			{ this(родитель, ид, поз, wxDefaultSize, wxWANTS_CHARS, "grid"); }

		public this(Окно родитель, цел ид, Точка поз, Размер size)
			{ this(родитель, ид, поз, size, wxWANTS_CHARS, "grid"); }

		public this(Окно родитель, цел ид, Точка поз, Размер size, цел стиль)
			{ this(родитель, ид, поз, size, стиль, "grid"); }

		public this(Окно родитель, цел ид, Точка поз, Размер size, цел стиль, ткст имя)
		{
			super(родитель, ид, поз, size, стиль, имя);
			myDataSet = new DataSet();
			colmap = new ColumnMapping();

			EVT_GRID_CELL_CHANGE(new EventListener(OnGridCellChange));
		}
		
		//---------------------------------------------------------------------
		// ctors with сам created ид
		
		public this(Окно родитель)
			{ this(родитель, Окно.UniqueID, wxDefaultPosition, wxDefaultSize, wxWANTS_CHARS, "grid"); }

		public this(Окно родитель, Точка поз)
			{ this(родитель, Окно.UniqueID, поз, wxDefaultSize, wxWANTS_CHARS, "grid"); }

		public this(Окно родитель, Точка поз, Размер size)
			{ this(родитель, Окно.UniqueID, поз, size, wxWANTS_CHARS, "grid"); }

		public this(Окно родитель, Точка поз, Размер size, цел стиль)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, "grid"); }

		public this(Окно родитель, Точка поз, Размер size, цел стиль, ткст имя)
			{ this(родитель, Окно.UniqueID, поз, size, стиль, имя);}
		
		//-----------------------------------------------------------------------------

		public DataSet dataSet() { return myDataSet; }
		public проц dataSet(DataSet значение) { myDataSet = значение; }
		
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
		
		public проц AddColumnMapping(ткст dbcolumnname, ткст newcolumnname, цел ширина)
		{
			colmap.Добавь(dbcolumnname, newcolumnname, ширина);
		}

		//-----------------------------------------------------------------------------
		
		// Create the grid, map columnnames
		// grid columns equal dataset columns
		public DbGridMsg CreateGridFromDataSet(ткст tablename)
		{
			if (dataSet != пусто) 
			{
				// No tables;dataset
				if (dataSet.Tables.Счёт == 0)
				{
					return DbGridMsg.NO_TABLE_ERROR;
				}
				
				// No columns;dataset
				if (dataSet.Tables[tablename].Columns.Счёт == 0)
				{
					return DbGridMsg.NO_COLUMN_ERROR;
				}
				
				datasetorcolmap = нет;
				
				this.tablename = tablename;
				цел к = 0;
				цел c = 0;
				DataTable table = dataSet.Tables[tablename];
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
					Column icol = colmap.Search(col.Caption);
					
					ткст ncolname=col.Caption;
					
					if (icol != пусто)
					{
						if (icol.newColumnName.Length > 0)
						{
							ncolname = icol.newColumnName;
						}

						SetColumnWidth(c, icol.Ширина);
					}
						
					SetColLabelValue(c, ncolname);
					c++;
				}	
				
				// Fill grid
				foreach (DataRow row;table.Rows) 
				{
					c = 0;					
					foreach (DataColumn col;table.Columns) 
					{
						SetCellValue(к, c, row[col].ToString());
						c++;
					}
					к++;
				}
			}			

			return DbGridMsg.OK;
		}
		
		//-----------------------------------------------------------------------------
		
		// Create the grid, map columnnames
		// grid columns equal ColumnMapping columns
		public DbGridMsg CreateGridFromColumnMapping(ткст tablename)
		{
			if (dataSet != пусто) 
			{
				// No tables;dataset
				if (dataSet.Tables.Счёт == 0)
				{
					return DbGridMsg.NO_TABLE_ERROR;
				}
				
				// No columns;dataset
				if (dataSet.Tables[tablename].Columns.Счёт == 0)
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
				цел к = 0;
				цел c = 0;
				DataTable table = dataSet.Tables[tablename];
				цел numcols = colmap.Счёт;
				
				if ( !CreateGrid(table.Rows.Счёт, numcols) )
				{
					return DbGridMsg.GRID_CREATION_ERROR;
				}
				
				RowLabelSize = 0; 
				
				// Grid column names = colmap newColumnName
				foreach (Column icol;colmap.Cols) 
				{					
					SetColumnWidth(c, icol.Ширина);
						
					SetColLabelValue(c, icol.newColumnName);
					c++;
				}	
				
				// Fill grid
				foreach (DataRow row;table.Rows) 
				{
					c = 0;		
					foreach (Column col;colmap.Cols) 
					{					
						SetCellValue(к, c, row[col.dbColumnName].ToString());
						c++;
					}
					к++;
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
			DataRow nrow = myDataSet.Tables[tablename].NewRow();
			myDataSet.Tables[tablename].Rows.Добавь(nrow);
		}
		
		//-----------------------------------------------------------------------------
		
		// Returns the currently selected row
		public DataRow GetRow(цел num)
		{
			DataRow dr = пусто;
			
			try
			{			
				dr = myDataSet.Tables[tablename].Rows[num];
			}
			catch (Exception e)
			{
				dr = пусто;
			}
			
			return dr;
		}
		
		//-----------------------------------------------------------------------------		
		
		// Cell change ?? Change the corresponding dataset also
		private проц OnGridCellChange(Объект sender, Событие e)
		{
			GridEvent ge = cast(GridEvent)e;
			ткст s = GetColLabelValue(ge.Col);		
			DataRow row = myDataSet.Tables[tablename].Rows[ge.Row];			
			row[s] = GetCellValue(ge.Row, ge.Col);
		}
		
		//-----------------------------------------------------------------------------
	}
