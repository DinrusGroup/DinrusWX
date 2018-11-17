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

		static extern (C) IntPtr wxDropSource_Win_ctor(IntPtr win);
		static extern (C) IntPtr wxDropSource_DataObject_ctor(IntPtr dataObject, IntPtr win);
		static extern (C) проц wxDropSource_dtor(IntPtr сам);
		static extern (C) проц wxDropSource_RegisterVirtual(IntPtr сам, DropSource объ, Virtual_DoDragDrop doDragDrop);
		static extern (C) цел wxDropSource_DoDragDrop(IntPtr сам, цел флаги);
		static extern (C) проц wxDropSource_SetData(IntPtr сам, IntPtr dataObject);
		//! \endcond
		
		//---------------------------------------------------------------------

	alias DropSource wxDropSource;
	public class DropSource : wxObject
	{
		protected DataObject m_dataObject = null;
		
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		public this(Окно win = null);
		public this(DataObject dataObject, Окно win = null);
		override protected проц dtor() ;
		static extern (C) private цел staticDoDoDragDrop(DropSource объ,цел флаги);
		public  DragResult DoDragDrop(цел флаги);
		public DataObject dataObject();
		public проц dataObject(DataObject значение) ;
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		extern (C) {
		alias цел  function(МишеньСброса объ, цел x, цел y, цел def) Virtual_OnDragOver;
		alias бул function(МишеньСброса объ, цел x, цел y) Virtual_OnDrop;
		alias цел  function(МишеньСброса объ, цел x, цел y, цел def) Virtual_OnData3;
		alias бул function(МишеньСброса объ) Virtual_GetData;
		alias проц function(МишеньСброса объ) Virtual_OnLeave;
		alias цел  function(МишеньСброса объ, цел x, цел y, цел def) Virtual_OnEnter;
		}
		//! \endcond
		
		//---------------------------------------------------------------------
		
		//! \cond EXTERN
		static extern (C) IntPtr wxDropTarget_ctor(IntPtr dataObject);
		static extern (C) проц wxDropTarget_dtor(IntPtr сам);
		static extern (C) проц wxDropTarget_RegisterVirtual(IntPtr сам, МишеньСброса объ, Virtual_OnDragOver onDragOver, Virtual_OnDrop onDrop, Virtual_OnData3 onData, Virtual_GetData getData, Virtual_OnLeave onLeave, Virtual_OnEnter onEnter);  
		static extern (C) проц   wxDropTarget_RegisterDisposable(IntPtr сам, Virtual_Dispose onDispose);
		static extern (C) проц   wxDropTarget_SetDataObject(IntPtr сам, IntPtr dataObject);
		static extern (C) цел wxDropTarget_OnEnter(IntPtr сам, цел x, цел y, цел def);
		static extern (C) цел wxDropTarget_OnDragOver(IntPtr сам, цел x, цел y, цел def);
		static extern (C) проц   wxDropTarget_OnLeave(IntPtr сам);
		static extern (C) бул wxDropTarget_OnDrop(IntPtr сам, цел x, цел y);
		static extern (C) бул wxDropTarget_GetData(IntPtr сам);
		//! \endcond
		
		//---------------------------------------------------------------------

	public abstract class МишеньСброса : wxObject
	{
		protected DataObject m_dataObject = null;
		
		public this(DataObject dataObject = null);
		public this(IntPtr wxobj);
		private this(IntPtr wxobj, бул memOwn);
		override protected проц dtor() ;
		static extern (C) private цел staticDoOnDragOver(МишеньСброса объ, цел x, цел y, цел def);
		public  DragResult OnDragOver(цел x, цел y, DragResult def);
		static extern (C) private бул staticOnDrop(МишеньСброса объ, цел x, цел y);
		public  бул OnDrop(цел x, цел y);
		static extern (C) private цел staticDoOnData(МишеньСброса объ, цел x, цел y, цел def);
		public abstract DragResult OnData(цел x, цел y, DragResult def);
		static extern (C) private бул staticGetData(МишеньСброса объ);
		public  бул GetData();
		static extern (C) private цел staticDoOnEnter(МишеньСброса объ, цел x, цел y, цел def);
		public  DragResult OnEnter(цел x, цел y, DragResult def);
		static extern (C) private проц staticOnLeave(МишеньСброса объ);
		public  проц OnLeave();
		public DataObject dataObject() ;
		public проц dataObject(DataObject значение);

	//	public static wxObject Нов(IntPtr ptr);
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) бул wxTextDropTarget_OnDrop(IntPtr сам, цел x, цел y);
		static extern (C) бул wxTextDropTarget_GetData(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	public abstract class TextDropTarget : МишеньСброса
	{
		public this();
		public abstract бул OnDropText(цел x, цел y, ткст текст);
		public override DragResult OnData(цел x, цел y, DragResult def);
		public override бул OnDrop(цел x, цел y);
		public override бул GetData();
	}
	
	//---------------------------------------------------------------------

		//! \cond EXTERN
		static extern (C) бул wxFileDropTarget_OnDrop(IntPtr сам, цел x, цел y);
		static extern (C) бул wxFileDropTarget_GetData(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	public abstract class FileDropTarget : МишеньСброса
	{
		public this();
		public abstract бул OnDropFiles(цел x, цел y, ткст[] filenames);
		public override DragResult OnData(цел x, цел y, DragResult def);
		public override бул OnDrop(цел x, цел y);
		public override бул GetData();
	}

