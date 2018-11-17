module wx.DbGrid;
public import wx.common;
public import wx.Grid;
import dcollections.ArrayList;

	alias Column wxColumn;
	public class Column
	{
		private ткст dbcolumnname;
		private ткст newcolumnname;
		private цел ширь;

		//-----------------------------------------------------------------------------

		public this();
		public ткст dbColumnName() ;
		public проц dbColumnName(ткст значение);
		public ткст newColumnName() ;
		public проц newColumnName(ткст значение) ;
		public цел Ширь();
		public проц Ширь(цел значение) ;
	}
	//-----------------------------------------------------------------------------

	alias ColumnMapping wxColumnMapping;
	public class ColumnMapping
	{
		private Column[] cols;
		private цел DEFAULT_COLUMN_WIDTH = 75;

		public this();
		public проц Добавь(ткст dbcolumnname, ткст newcolumnname);
		public проц Добавь(ткст dbcolumnname, ткст newcolumnname, цел ширь);
		public бцел length() ;
		public Column opIndex(цел index);
		public Column Search(ткст dbcolumnname);
		public Column SearchDbColumnName(ткст newcolumnname);
		public Column[] Cols();
		public цел DefaultColumnWidth();
		public проц DefaultColumnWidth(цел значение) ;
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

		public this(IntPtr wxobj);
		public this(Окно родитель, цел ид);
		public this(Окно родитель, цел ид, Точка поз);
		public this(Окно родитель, цел ид, Точка поз, Размер разм);
		public this(Окно родитель, цел ид, Точка поз, Размер разм, цел стиль);
		public this(Окно родитель, цел ид, Точка поз, Размер разм, цел стиль, ткст имя);
		public this(Окно родитель);
		public this(Окно родитель, Точка поз);
		public this(Окно родитель, Точка поз, Размер разм);
		public this(Окно родитель, Точка поз, Размер разм, цел стиль);
		public this(Окно родитель, Точка поз, Размер разм, цел стиль, ткст имя);

		//public DataУст dataУст() ;
		//public проц dataУст(DataУст значение) ;

		public ColumnMapping columnMapping() ;
		public проц columnMapping(ColumnMapping значение) ;
		public цел DefaultColumnWidth();
		public проц DefaultColumnWidth(цел значение) ;
		public проц AddColumnMapping(ткст dbcolumnname, ткст newcolumnname);
		public проц AddColumnMapping(ткст dbcolumnname, ткст newcolumnname, цел ширь);
		public DbGridMsg CreateGridFromDataУст(ткст tablename);
		public DbGridMsg CreateGridFromColumnMapping(ткст tablename);
		public проц AddRow();

		//public DataRow GetRow(цел чис);
		//private проц OnGridCellChange(Объект отправитель, Событие e);


	}
