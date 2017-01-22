//-----------------------------------------------------------------------------
// wxD - NotebookSizer.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - NotebookSizer.cs
//
/// The wxNotebookSizer proxy interface.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: NotebookSizer.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.NotebookSizer;
public import wx.common;
public import wx.Sizer;
public import wx.Notebook;

		//! \cond EXTERN
		static extern (C) ЦУк wxNotebookSizer_ctor(ЦУк nb);
		static extern (C) проц wxNotebookSizer_RecalcSizes(ЦУк сам);
		static extern (C) проц wxNotebookSizer_CalcMin(ЦУк сам, inout Размер size);
		static extern (C) ЦУк wxNotebookSizer_GetNotebook(ЦУк сам);
		//! \endcond

		//---------------------------------------------------------------------

	alias NotebookSizer wxNotebookSizer;
	/*deprecated*/ public class NotebookSizer : Sizer
	{
		public this(ЦУк шхобъ)
		{
			super(шхобъ);
		}

		public this(Notebook nb)
		{
			super(wxNotebookSizer_ctor(wxObject.SafePtr(nb)));
		}

		//---------------------------------------------------------------------

		public override проц RecalcSizes()
		{
			wxNotebookSizer_RecalcSizes(шхобъ);
		}

		//---------------------------------------------------------------------

		public override Размер CalcMin()
		{
			Размер size;
			wxNotebookSizer_CalcMin(шхобъ, size);
			return size;
		}

		//---------------------------------------------------------------------

		public Notebook notebook() 
			{
				return cast(Notebook)FindObject(
                                    wxNotebookSizer_GetNotebook(шхобъ)
                                );
			}

		//---------------------------------------------------------------------
	}
