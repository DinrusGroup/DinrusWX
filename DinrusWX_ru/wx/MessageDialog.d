//-----------------------------------------------------------------------------
// wxD - MessageDialog.d
// (C) 2005 bero <berobero@users.sourceforge.net>
// based on
// wx.NET - MessageDialog.cs
//
/// The wxMessageDialog wrapper class.
//
// Written by Jason Perkins (jason@379.com)
// (C) 2003 by 379, Inc.
// Licensed under the wxWidgets license, see LICENSE.txt for details.
//
// $Ид: MessageDialog.d,v 1.9 2006/11/17 15:21:00 afb Exp $
//-----------------------------------------------------------------------------

module wx.MessageDialog;
public import wx.common;
public import wx.Dialog;

// The MessageDialog class implements the interface for wxWidgets'
// wxMessageDialog class and wxMessageBox.

//! \cond EXTERN

// MessageBox function
static extern (C) цел    wxMsgBox(ЦелУкз родитель, ткст msg, ткст cap, бцел стиль, inout Точка поз);

// Message dialog methods
static extern (C) ЦелУкз wxMessageDialog_ctor(ЦелУкз родитель, ткст message, ткст caption, бцел стиль, inout Точка поз);
static extern (C) цел    wxMessageDialog_ShowModal(ЦелУкз сам);

//! \endcond

alias MessageDialog wxMessageDialog;
public class MessageDialog : Dialog
{
    public const ткст wxMessageBoxCaptionStr = "Message";
    //---------------------------------------------------------------------

    private this(ЦелУкз wxobj)
    {
        super(wxobj);
    }

    public this(Окно родитель, ткст msg, ткст caption=wxMessageBoxCaptionStr, цел стиль=wxOK | wxCENTRE, Точка поз = вхДефПоз)
    {
        this(wxMessageDialog_ctor(wxObject.SafePtr(родитель), msg, caption, cast(бцел)стиль, поз));
    }

    //---------------------------------------------------------------------

    public override цел ShowModal()
    {
        return wxMessageDialog_ShowModal(wxobj);
    }

    //---------------------------------------------------------------------

}

static extern(C) цел wxMessageBox_func(ткст msg, ткст cap, цел стиль, ЦелУкз родитель,цел x, цел y);

static цел MessageBox(ткст msg,ткст caption=MessageDialog.wxMessageBoxCaptionStr,цел стиль=Dialog.wxOK | Dialog.wxCENTRE, Окно родитель=null, цел x=-1, цел y=-1)
{
    return wxMessageBox_func(msg,caption,стиль,wxObject.SafePtr(родитель),x,y);
}

/* wx.NET compat */
static цел MessageBox(Окно родитель,ткст msg,ткст caption=MessageDialog.wxMessageBoxCaptionStr,цел стиль=Dialog.wxOK | Dialog.wxCENTRE, Точка поз=Dialog.вхДефПоз)
{
    return wxMessageBox_func(msg,caption,стиль,wxObject.SafePtr(родитель),поз.X,поз.Y);
}
