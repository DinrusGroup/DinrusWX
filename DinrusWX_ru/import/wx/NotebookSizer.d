module wx.NotebookSizer;
public import wx.common;
public import wx.Sizer;
public import wx.Notebook;

		//! \cond EXTERN
		static extern (C) IntPtr wxNotebookSizer_ctor(IntPtr nb);
		static extern (C) проц wxNotebookSizer_RecalcSizes(IntPtr сам);
		static extern (C) проц wxNotebookSizer_CalcMin(IntPtr сам, inout Размер разм);
		static extern (C) IntPtr wxNotebookSizer_GetNotebook(IntPtr сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias NotebookSizer wxNotebookSizer;
	/*deprecated*/ public class NotebookSizer : Сайзер
	{
		public this(IntPtr wxobj);
		public this(Notebook nb);
		public override проц ПересчётРазмеров();
		public override Размер ВычислиМин();
		public Notebook notebook() ;
	}
