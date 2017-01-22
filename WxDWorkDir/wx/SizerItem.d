//-----------------------------------------------------------------------------
// wxD - SizerItem.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - SizerItem.cs
//
/// The wxSizerItem wrapper class.
//
// Written by Bryan Bulten (bryan@bulten.ca)
// (C) 2003 Bryan Bulten
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: SizerItem.d,v 1.8 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.SizerItem;
public import wx.common;
public import wx.Window;

		//! \cond EXTERN
        static extern (C) ЦУк wxSizerItem_ctorSpace(цел ширина, цел высота, цел proportion, цел flag, цел border, ЦУк userData);
        static extern (C) ЦУк wxSizerItem_ctorWindow(ЦУк окно, цел proportion, цел flag, цел border, ЦУк userData);
        static extern (C) ЦУк wxSizerItem_ctorSizer(ЦУк sizer, цел proportion, цел flag, цел border, ЦУк userData);
        static extern (C) ЦУк wxSizerItem_ctor();
        static extern (C) проц   wxSizerItem_DeleteWindows(ЦУк сам);
        static extern (C) проц   wxSizerItem_DetachSizer(ЦУк сам);
        static extern (C) проц   wxSizerItem_GetSize(ЦУк сам, inout Размер size);
        static extern (C) проц   wxSizerItem_CalcMin(ЦУк сам, inout Размер min);
        static extern (C) проц   wxSizerItem_SetDimension(ЦУк сам, inout Точка поз, inout Размер size);
        static extern (C) проц   wxSizerItem_GetMinSize(ЦУк сам, inout Размер size);
        static extern (C) проц   wxSizerItem_SetInitSize(ЦУк сам, цел x, цел y);
        static extern (C) проц   wxSizerItem_SetRatio(ЦУк сам, цел ширина, цел высота);
        static extern (C) проц   wxSizerItem_SetRatioFloat(ЦУк сам, float ratio);
        static extern (C) float  wxSizerItem_GetRatioFloat(ЦУк сам);
        static extern (C) бул   wxSizerItem_IsWindow(ЦУк сам);
        static extern (C) бул   wxSizerItem_IsSizer(ЦУк сам);
        static extern (C) бул   wxSizerItem_IsSpacer(ЦУк сам);
        static extern (C) проц   wxSizerItem_SetProportion(ЦУк сам, цел proportion);
        static extern (C) цел    wxSizerItem_GetProportion(ЦУк сам);
        static extern (C) проц   wxSizerItem_SetFlag(ЦУк сам, цел flag);
        static extern (C) цел    wxSizerItem_GetFlag(ЦУк сам);
        static extern (C) проц   wxSizerItem_SetBorder(ЦУк сам, цел border);
        static extern (C) цел    wxSizerItem_GetBorder(ЦУк сам);
        //static extern (C) ЦУк wxSizerItem_GetWindow(ЦУк сам);
       // static extern (C) проц   wxSizerItem_SetWindow(ЦУк сам, ЦУк окно);
      //  static extern (C) ЦУк wxSizerItem_GetSizer(ЦУк сам);
      //  static extern (C) проц   wxSizerItem_SetSizer(ЦУк сам, ЦУк sizer);
        static extern (C) проц   wxSizerItem_GetSpacer(ЦУк сам, inout Размер size);
       // static extern (C) проц   wxSizerItem_SetSpacer(ЦУк сам, inout Размер size);
        static extern (C) проц   wxSizerItem_Show(ЦУк сам, бул show);
        static extern (C) бул   wxSizerItem_IsShown(ЦУк сам);
        static extern (C) ЦУк wxSizerItem_GetUserData(ЦУк сам);
        static extern (C) проц   wxSizerItem_GetPosition(ЦУк сам, inout Точка поз);
		//! \endcond

        //-----------------------------------------------------------------------------

    alias SizerItem wxSizerItem;
    public class SizerItem : wxObject
    {
        public this(цел ширина, цел высота, цел proportion, цел flag, цел border, wxObject userData)
            { this(wxSizerItem_ctorSpace(ширина, высота, proportion, flag, border, wxObject.SafePtr(userData))); }

        public this(Окно окно, цел proportion, цел flag, цел border, wxObject userData)
            { this(wxSizerItem_ctorWindow(wxObject.SafePtr(окно), proportion, flag, border, wxObject.SafePtr(userData))); }

        public this(Sizer sizer, цел proportion, цел flag, цел border, wxObject userData)
            { this(wxSizerItem_ctorSizer(wxObject.SafePtr(sizer), proportion, flag, border, wxObject.SafePtr(userData))); }

        public this()
            { this(wxSizerItem_ctor()); }

        public this(ЦУк шхобъ)
            { super(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц DeleteWindows()
        {
            wxSizerItem_DeleteWindows(шхобъ);
        }

        public проц DetachSizer()
        {
            wxSizerItem_DetachSizer(шхобъ);
        }

        //-----------------------------------------------------------------------------

        public Размер size() { 
                Размер size;
                wxSizerItem_GetSize(шхобъ, size);
                return size; 
            }

        //-----------------------------------------------------------------------------

        public Размер CalcMin()
        { 
            Размер min;
            wxSizerItem_CalcMin(шхобъ, min);
            return min;
        }

        //-----------------------------------------------------------------------------

        public проц SetDimension(Точка поз, Размер size)
        {
            wxSizerItem_SetDimension(шхобъ, поз, size);
        }

        //-----------------------------------------------------------------------------

        public Размер MinSize() { 
                Размер size;
                wxSizerItem_GetMinSize(шхобъ, size);
                return size;
            }

        //-----------------------------------------------------------------------------

        public проц SetInitSize(цел x, цел y)
        {
            wxSizerItem_SetInitSize(шхобъ, x, y);
        }

        //-----------------------------------------------------------------------------

        public проц SetRatio(Размер size)
            { SetRatio(size.Ширина, size.Высота); }
       
        public проц SetRatio(цел ширина, цел высота)
        {
            wxSizerItem_SetRatio(шхобъ, ширина, высота);
        }

        public проц Ratio(float значение) { wxSizerItem_SetRatioFloat(шхобъ, значение); }
        public float Ratio() { return wxSizerItem_GetRatioFloat(шхобъ); }

        //-----------------------------------------------------------------------------

        public бул IsWindow() { return wxSizerItem_IsWindow(шхобъ); }

        public бул IsSizer() { return wxSizerItem_IsSizer(шхобъ); }

        public бул IsSpacer() { return wxSizerItem_IsSpacer(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц Proportion(цел значение) { wxSizerItem_SetProportion(шхобъ, значение); }
        public цел Proportion() { return wxSizerItem_GetProportion(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц Flag(цел значение) { wxSizerItem_SetFlag(шхобъ, значение); }
        public цел Flag() { return wxSizerItem_GetFlag(шхобъ); }

        //-----------------------------------------------------------------------------

        public проц Border(цел значение) { wxSizerItem_SetBorder(шхобъ, значение); }
        public цел Border() { return wxSizerItem_GetBorder(шхобъ); }

        //-----------------------------------------------------------------------------
/+
        public Окно окно() { return cast(Окно)FindObject(wxSizerItem_GetWindow(шхобъ)); }
        public проц окно(Окно значение) { wxSizerItem_SetWindow(шхобъ, wxObject.SafePtr(значение)); }
+/
        //-----------------------------------------------------------------------------
/+
        public Sizer sizer() { return cast(Sizer)FindObject(wxSizerItem_GetSizer(шхобъ)); }
        public проц sizer(Sizer значение) { wxSizerItem_SetSizer(шхобъ, wxObject.SafePtr(значение)); }
+/
        //-----------------------------------------------------------------------------

        public Размер Spacer() { 
                Размер spacer;
                wxSizerItem_GetSpacer(шхобъ, spacer);
                return spacer;
            }
	/+		
        public проц Spacer(Размер значение) { wxSizerItem_SetSpacer(шхобъ, значение); }
+/
        //-----------------------------------------------------------------------------

        public проц Show(бул show)
        {
            wxSizerItem_Show(шхобъ, show);
        }

        public бул IsShown() { return wxSizerItem_IsShown(шхобъ); }

        //-----------------------------------------------------------------------------

        public wxObject UserData() { return FindObject(wxSizerItem_GetUserData(шхобъ)); }

        //-----------------------------------------------------------------------------

        public Точка Положение() {
                Точка поз;
                wxSizerItem_GetPosition(шхобъ, поз);
                return поз;
            }
    }

