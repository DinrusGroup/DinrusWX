module wx.IControlWithItems;
public import wx.ClientData;

	public interface IControlWithItems 
	{
		цел Append(ткст элт);
		
		цел Append(ткст элт, ClientData clientData);
		
		//-----------------------------------------------------------------------------
		
		проц AppendString(ткст элт);
		
		//-----------------------------------------------------------------------------
		
		проц Append(ткст[] strings);
		
		//-----------------------------------------------------------------------------
		
		цел Insert(ткст элт, цел поз);
		
		цел Insert(ткст элт, цел поз, ClientData clientData);
		
		//-----------------------------------------------------------------------------
		
		проц Clear();
		
		//-----------------------------------------------------------------------------
		
		проц Delete(цел n);
		
		//-----------------------------------------------------------------------------
		
		цел Счёт();
		
		//-----------------------------------------------------------------------------
		
		бул Empty();
		
		//-----------------------------------------------------------------------------
		
		ткст GetString(цел n);
		
		//-----------------------------------------------------------------------------
		
		ткст[] GetStrings();
		
		//-----------------------------------------------------------------------------
		
		проц УстString(цел n, ткст s);
		
		//-----------------------------------------------------------------------------
		
		цел FindString(ткст s);
		
		//-----------------------------------------------------------------------------
		
		проц Select(цел n);
		
		цел GetSelection();
		
		//-----------------------------------------------------------------------------
		
		ткст StringSelection();
		
		//-----------------------------------------------------------------------------
		
		проц УстClientObject(цел n, ClientData clientData);
		
		ClientData GetClientObject(цел n);
		
		//-----------------------------------------------------------------------------
		
		бул HasClientObjectData();
		
		//-----------------------------------------------------------------------------
		
		бул HasClientUntypedData();
		
		//-----------------------------------------------------------------------------
		
		бул НаследоватьЦвета();
	}

