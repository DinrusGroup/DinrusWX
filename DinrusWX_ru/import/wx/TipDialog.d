module wx.TipDialog;
public import wx.common;
public import wx.Dialog;

	//! \cond EXTERN
	static extern (C) IntPtr wxCreateFileTipProvider_func(ткст filename, цел currentTip);
	static extern (C) бул wxShowTip_func(IntPtr родитель, IntPtr tipProvider, бул showAtStartup);
	static extern (C) цел wxTipProvider_GetCurrentTip();
	//! \endcond

    alias TipProvider wxTipProvider;
    public class TipProvider
    {
	public static IntPtr CreateFileTipProvider(ткст filename, цел currentTip);
	public static бул ShowTip(Окно родитель, IntPtr tipProvider);
	public static бул ShowTip(Окно родитель, IntPtr tipProvider, бул showAtStartup);
	static цел CurrentTip() ;
    }
