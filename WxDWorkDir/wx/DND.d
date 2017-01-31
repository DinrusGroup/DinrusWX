module wx.DND;
public import wx.common;
public import wx.DataObject;
public import wx.Window;

	public enum Drag
	{
		wxDrag_CopyOnly    = 0,
		wxDrag_AllowMove   = 1,
		wxDrag_DefaultMove = 3
	}
	
	//---------------------------------------------------------------------

	public enum DragResult
	{
    		wxDragError,
    		wxDragNone,
    		wxDragCopy,
    		wxDragMove,
    		wxDragLink,
    		wxDragCancel
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias цел function(DropSource объ, цел флаги) Virtual_DoDragDrop;
		}

		static extern (C) ЦУк wxDropSource_Win_ctor(ЦУк окн);
		static extern (C) ЦУк wxDropSource_DataObject_ctor(ЦУк dataObject, ЦУк окн);
		static extern (C) проц wxDropSource_dtor(ЦУк сам);
		static extern (C) проц wxDropSource_RegisterVirtual(ЦУк сам, DropSource объ, Virtual_DoDragDrop doDragDrop);
		static extern (C) цел wxDropSource_DoDragDrop(ЦУк сам, цел флаги);
		static extern (C) проц wxDropSource_SetData(ЦУк сам, ЦУк dataObject);
		//! \endcond
		
		//---------------------------------------------------------------------

	alias DropSource wxDropSource;
	public class DropSource : wxObject
	{
		protected ОбъектДанных m_dataObject = пусто;
		
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}		
			
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
		
		public this(Окно окн = пусто)
		{ 
			this(wxDropSource_Win_ctor(wxObject.SafePtr(окн)), да);
			m_dataObject = пусто;
			
			wxDropSource_RegisterVirtual( шхобъ, this, &staticDoDoDragDrop );
		}

		public this(ОбъектДанных dataObject, Окно окн = пусто)
		{
			this(wxDropSource_DataObject_ctor(wxObject.SafePtr(dataObject), wxObject.SafePtr(окн)), да);
			m_dataObject = dataObject;

			wxDropSource_RegisterVirtual( шхобъ, this, &staticDoDoDragDrop );
		}
		
		//---------------------------------------------------------------------
		override protected проц dtor() { wxDropSource_dtor(шхобъ); }

		//---------------------------------------------------------------------

		static extern (C) private цел staticDoDoDragDrop(DropSource объ,цел флаги)
		{
			return cast(цел)объ.DoDragDrop(флаги);
		}

		public /+virtual+/ DragResult DoDragDrop(цел флаги)
		{
			return cast(DragResult)wxDropSource_DoDragDrop(шхобъ, флаги);
		}
		
		//---------------------------------------------------------------------
		
		public ОбъектДанных dataObject() { return m_dataObject; }
		public проц dataObject(ОбъектДанных значение) { m_dataObject = значение; wxDropSource_SetData(шхобъ, wxObject.SafePtr(значение)); }
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias цел  function(DropTarget объ, цел x, цел y, цел def) Virtual_OnDragOver;
		alias бул function(DropTarget объ, цел x, цел y) Virtual_OnDrop;
		alias цел  function(DropTarget объ, цел x, цел y, цел def) Virtual_OnData3;
		alias бул function(DropTarget объ) Virtual_GetData;
		alias проц function(DropTarget объ) Virtual_OnLeave;
		alias цел  function(DropTarget объ, цел x, цел y, цел def) Virtual_OnEnter;
		}
		//! \endcond
		
		//---------------------------------------------------------------------
		
		//! \cond EXTERN
		static extern (C) ЦУк wxDropTarget_ctor(ЦУк dataObject);
		static extern (C) проц wxDropTarget_dtor(ЦУк сам);
		static extern (C) проц wxDropTarget_RegisterVirtual(ЦУк сам, DropTarget объ, Virtual_OnDragOver onDragOver, Virtual_OnDrop onDrop, Virtual_OnData3 onData, Virtual_GetData getData, Virtual_OnLeave onLeave, Virtual_OnEnter onEnter);  
		static extern (C) проц   wxDropTarget_RegisterDisposable(ЦУк сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxDropTarget_SetDataObject(ЦУк сам, ЦУк dataObject);
		static extern (C) цел wxDropTarget_OnEnter(ЦУк сам, цел x, цел y, цел def);
		static extern (C) цел wxDropTarget_OnDragOver(ЦУк сам, цел x, цел y, цел def);
		static extern (C) проц   wxDropTarget_OnLeave(ЦУк сам);
		static extern (C) бул wxDropTarget_OnDrop(ЦУк сам, цел x, цел y);
		static extern (C) бул wxDropTarget_GetData(ЦУк сам);
		//! \endcond
		
		//---------------------------------------------------------------------

	public abstract class DropTarget : wxObject
	{
		protected ОбъектДанных m_dataObject = пусто;
		
		public this(ОбъектДанных dataObject = пусто)
		{ 
			this(wxDropTarget_ctor(wxObject.SafePtr(dataObject)), да);
			m_dataObject = dataObject;

			wxDropTarget_RegisterVirtual( шхобъ, this,
				&staticDoOnDragOver,
				&staticOnDrop,
				&staticDoOnData,
				&staticGetData,
				&staticOnLeave,
				&staticDoOnEnter);
				
			wxDropTarget_RegisterDisposable(шхобъ, &VirtualDispose);
		}

		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}			
		
		private this(ЦУк шхобъ, бул memOwn)
		{ 
			super(шхобъ);
			this.memOwn = memOwn;
		}
		
		//---------------------------------------------------------------------
		
		override protected проц dtor() { wxDropTarget_dtor(шхобъ); }
		
		//---------------------------------------------------------------------

		static extern (C) private цел staticDoOnDragOver(DropTarget объ, цел x, цел y, цел def)
		{
			return cast(цел)объ.OnDragOver(x, y, cast(DragResult)def);
		}
		public /+virtual+/ DragResult OnDragOver(цел x, цел y, DragResult def)
		{
			return cast(DragResult)wxDropTarget_OnDragOver(шхобъ, x, y, cast(цел)def);
		}
		
		//---------------------------------------------------------------------

		static extern (C) private бул staticOnDrop(DropTarget объ, цел x, цел y)
		{
			return объ.OnDrop(x,y);
		}
		public /+virtual+/ бул OnDrop(цел x, цел y)
		{
			return wxDropTarget_OnDrop(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------

		static extern (C) private цел staticDoOnData(DropTarget объ, цел x, цел y, цел def)
		{
			return cast(цел)объ.OnData(x, y, cast(DragResult) def);
		}
		public abstract DragResult OnData(цел x, цел y, DragResult def);
		
		//---------------------------------------------------------------------

		static extern (C) private бул staticGetData(DropTarget объ)
		{
			return объ.ДайДанные();
		}
		public /+virtual+/ бул ДайДанные()
		{
			return wxDropTarget_GetData(шхобъ);
		}
		
		//---------------------------------------------------------------------

		static extern (C) private цел staticDoOnEnter(DropTarget объ, цел x, цел y, цел def)
		{
			return cast(цел)объ.OnEnter(x, y, cast(DragResult) def);
		}
		public /+virtual+/ DragResult OnEnter(цел x, цел y, DragResult def)
		{
			return cast(DragResult)wxDropTarget_OnEnter(шхобъ, x, y, cast(цел)def);
		}
		
		//---------------------------------------------------------------------

		static extern (C) private проц staticOnLeave(DropTarget объ)
		{
			return объ.OnLeave();
		}
		public /+virtual+/ проц OnLeave()
		{
			wxDropTarget_OnLeave(шхобъ);
		}
		
		//---------------------------------------------------------------------

		public ОбъектДанных dataObject() { return m_dataObject; }
		public проц dataObject(ОбъектДанных значение) { m_dataObject = значение; wxDropTarget_SetDataObject(шхобъ, wxObject.SafePtr(значение)); }

	//	public static wxObject Нов(ЦУк ptr) { return new DropTarget(ptr); }
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) бул wxTextDropTarget_OnDrop(ЦУк сам, цел x, цел y);
		static extern (C) бул wxTextDropTarget_GetData(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------

	public abstract class TextDropTarget : DropTarget
	{
		public this()
			{ super(new ОбъектТекстовыхДанных());}
			
		public abstract бул OnDropText(цел x, цел y, ткст текст);

		//---------------------------------------------------------------------

		public override DragResult OnData(цел x, цел y, DragResult def)
		{
			if (!ДайДанные())
				return DragResult.wxDragNone;
				
			ОбъектТекстовыхДанных dobj = cast(ОбъектТекстовыхДанных)m_dataObject;
		
			return OnDropText(x, y, dobj.Текст) ? def : DragResult.wxDragNone;
		}

		//---------------------------------------------------------------------
        
		public override бул OnDrop(цел x, цел y)
		{
			return wxTextDropTarget_OnDrop(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------

		public override бул ДайДанные()
		{
			return wxTextDropTarget_GetData(шхобъ);
		}
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) бул wxFileDropTarget_OnDrop(ЦУк сам, цел x, цел y);
		static extern (C) бул wxFileDropTarget_GetData(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------

	public abstract class FileDropTarget : DropTarget
	{
		public this()
			{ super(new ОбъектФайловыхДанных());}
 
		public abstract бул OnDropFiles(цел x, цел y, ткст[] filenames);
		
		//---------------------------------------------------------------------

		public override DragResult OnData(цел x, цел y, DragResult def)
		{
			if ( !ДайДанные() )
				return DragResult.wxDragNone;
				
			ОбъектФайловыхДанных dobj = cast(ОбъектФайловыхДанных)m_dataObject;
			
			return OnDropFiles(x, y, dobj.Именаф) ? def : DragResult.wxDragNone;
		}

		//---------------------------------------------------------------------
                
		public override бул OnDrop(цел x, цел y)
		{
			return wxFileDropTarget_OnDrop(шхобъ, x, y);
		}
		
		//---------------------------------------------------------------------

		public override бул ДайДанные()
		{
			return wxFileDropTarget_GetData(шхобъ);
		}
	}

