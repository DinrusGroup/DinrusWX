
module wx.wxVersion;
public import wx.common;


		//! \cond EXTERN
		static extern (C) цел wxVersion_MAJOR_VERSION();
		static extern (C) цел wxVersion_MINOR_VERSION();
		static extern (C) цел wxVersion_RELEASE_NUMBER();
		static extern (C) цел wxVersion_SUBRELEASE_NUMBER();
		static extern (C) IntPtr wxVersion_VERSION_STRING();
		static extern (C) цел wxVersion_ABI_VERSION();
		//! \endcond

public цел wxMAJOR_VERSION();
public цел wxMINOR_VERSION() ;
public цел wxRELEASE_NUMBER() ;
public цел wxSUBRELEASE_NUMBER() ;
public ткст wxVERSION_STRING();
public цел wxABI_VERSION();

