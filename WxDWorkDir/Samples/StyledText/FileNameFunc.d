//-----------------------------------------------------------------------------
// wxD/Samples - FileNameFunc.d
//
// absPath replaces wxFileName.Normalize() and wxFileName.GetFullPath()
// these functions are from: http://www.digitalmars.com/d/archives/digitalmars/D/announce/4363.html
//
// (C) 2006 Joe Zuccarello
// License: Public domain.
//
// $Ид: FileNameFunc.d,v 1.1 2007/08/21 20:55:45 afb Exp $
//-----------------------------------------------------------------------------


module FileNameFunc;

version (Tango)
{
static assert(0);
}
else // Phobos
{
import std.file;
import std.путь;
import std.regexp;
import std.ткст;
}

private static const сим[] wSep = к"\",
                            lSep = "/",
                            rSeps = "[\\\\/]";  // For regexp use

version(DigitalMars)
	version(linux)
		version=Unix;

/**
  * Returns a normalized absolutized путь.
  *
  * If the путь is not absolute, it will be joined with the current working directory.  If it is an
  * absolute путь, nothing will be joined with it.  In either case, the путь will also be checked to
  * see if it is normalized.  If it's not, it will be normalized.
  *
  * Note: This function does not handle UNC paths.
  *
  * Authors: Joe Zuccarello
  *
  * Date: February 15, 2006
  *
  * Returns: A normalized absolutized путь.
  *
  * Version:
  *
  * License: Public domain.
  *
  * Examples:
  * ---------
  * version(Windows)
  * {
  *	// Assume c:\ is the current working directory
  *	absPath(к"file") => "c:\file"
  *	absPath(к"c:\d/src\project") => "c:\d\src\project"
  *	absPath(к".\dir\file\..\dir2\file2") => "c:\dir\dir2\file2"
  * }
  * version(linux)
  * {
  *	// Assume /usr is the current working directory
  *	absPath("d/bin") => "/usr/d/bin"
  *	absPath("/d/lib") => "/d/lib"
  *	absPath("d/src/../file") => "/usr/d/file"
  * }
  * ---------
  */
сим[] absPath(сим[] путь)
out(result)
{
	assert(isNormPath(result));
}
body
{
	бул changed;

	version(Windows)
	{
		// Путь is not absolute
		//if (std.regexp.find(путь, "^[a-zA-Z]*:\\\\") == -1)
		if (isabs(путь) == нет)
		{
			путь = std.путь.join(getcwd(), путь);
			changed = да;
		}
	}
	else version(Unix)
	{
		// Путь is not absolute
		//if (путь[0..1] != к"\" && путь[0..1] != "/")
		if (isabs(путь) == нет)
		{
			путь = std.путь.join(getcwd(), путь);
			changed = да;
		}
	}
	else
	{
		pragma(msg, "Unsupported OS");
		static assert(0);
	}

	// Normalize the путь
	if (isNormPath(путь) == нет)
	{
		путь = normPath(путь);
		changed = да;
	}

	if (changed == да)
	{
		return путь.dup;
	}
	else
	{
		return путь;
	}
}

/**
  * Test whether a путь is normalized.
  *
  * Use this to test whether a путь is normalized.
  *
  * Note: This function does not handle UNC paths.
  *
  * Authors: Joe Zuccarello
  *
  * Date: February 15, 2006
  *
  * Returns: да/нет whether a путь is normalized.
  *
  * Version:
  *
  * License: Public domain.
  *
  * Examples:
  * ---------
  * version(Windows)
  * {
  *	 isNormPath(к"directory1\..\directory2\file\.") => нет
  *	 // This one returns да, because there's no родитель directory to collapse to.
  *	 isNormPath(к"..\directory\file") => да
  * }
  * version(linux)
  * {
  *	 isNormPath("/dir/../file") => нет
  *	 isNormPath("/file") => да
  * }
  * ---------
  */
бул isNormPath(сим[] путь)
{
	RegExp re;

	version(Windows)
	{
	 	// Special cases
		if (путь == "." || путь == ".." || (путь == к"\" || путь == "/") ||
	     std.regexp.find(путь, "^\\.\\." ~ "(" ~ rSeps ~ "\\.\\.)+") != -1 ||
	     std.regexp.find(путь, "^[a-zA-Z]*:" ~ rSeps ~ "$") != -1)
		{
			return да;
		}
		else
		{
			// Look for the following.  If found, then this is not a normalized путь
			if (std.regexp.find(путь, rSeps ~ "$") != -1 ||
			    std.regexp.find(путь, rSeps ~ "\\.\\." ~ "(" ~ rSeps ~ "|$)") != -1 ||
			    std.regexp.find(путь, rSeps ~ "\\." ~ "(" ~ rSeps ~ "|$)") != -1 ||
			    std.regexp.find(путь, "^\\." ~ rSeps) != -1 || std.regexp.find(путь, rSeps ~ "{2,}") != -1)
			{
				return нет;
			}
			else
			{
				return да;
			}
		}
	}
	else version(Unix)
	{
		// Special cases
		if (путь == "." || путь == ".." || (путь == к"\" || путь == "/") ||
		    std.regexp.find(путь, "^\\.\\." ~ "(" ~ rSeps ~ "\\.\\.)+") != -1)
		{
			return да;
		}
		else
		{
			// Look for the following.  If found, then this is not a normalized путь
			if (std.regexp.find(путь, lSep ~ "$") != -1 ||
			    std.regexp.find(путь, lSep ~ "\\.\\." ~ "(" ~ lSep ~ "|$)") != -1 ||
			    std.regexp.find(путь, lSep ~ "\\." ~ "(" ~ lSep ~ "|$)") != -1 ||
			    std.regexp.find(путь, "^\\." ~ lSep) != -1 || std.regexp.find(путь, lSep ~ "{2,}") != -1)
			{
				return нет;
			}
			else
			{
				return да;
			}
		}
	}
	else
	{
		pragma(msg, "Unsupported OS");
		static assert(0);
	}
}

/**
  * Normalizes a путь.
  *
  * This will normalize a путь by collapsing redundant separators and родитель/current directory
  * references.  It will also remove any trailing separators and normalize separators as appropriate
  * for the OS.
  *
  * Inspired by the Python v2.4.2 implementation.
  *
  * Note: This function does not handle UNC paths.
  *
  * Authors: Joe Zuccarello
  *
  * Date: February 15, 2006
  *
  * Returns: A normalized путь.
  *
  * Version:
  *
  * License: Public domain.
  *
  * Examples:
  * ---------
  * normPath("/dir1/../dir2/./file/") => "/dir2/file"
  * normPath("/dir..../file/./") => "/dir..../file"
  * ---------
  */
сим[] normPath(сим[] путь)
out(result)
{
	assert(isNormPath(result));
}
body
{
	цел pcIdx, pcIdx2;
	сим[][] pathComps;  // путь components after splitting
	сим[] result, drive;

	// Normalize the separators for the os
	путь = normSep(путь);

	// Sanity check.  No need to process a separator, curdir or pardir reference.
	if (путь != sep && путь != curdir && путь != pardir)
	{
		// Remove the drive from the путь
		version(Windows)
		{
			цел idx = std.ткст.find(путь, ":");
			drive ~= idx != -1 ? путь[0..(idx + 1)] : "";
			if (idx != -1)
			{
				if ((idx + 1) < путь.length)
				{
					путь = путь[(idx + 1)..$];
				}
				else
				{
					путь = "";
				}
			}
		}

		// Remove repeating separators
		путь = std.ткст.squeeze(путь, sep);

		// If there's an initial separator even after a drive, save it off
		if (путь != "")
		{
			if (путь[0..1] == sep)
			{
				drive ~= sep;
			}
		}

		// Split the путь components
		pathComps = std.ткст.split(путь, sep);

		while (pcIdx < pathComps.length)
		{
			// Current directory
			if (pathComps[pcIdx] == curdir)
			{
				if (pathComps.length == 1)
				{
					pathComps.length = 0;
				}
				else if (pathComps.length > 1)
				{
					// At the beginning
					if (pcIdx == 0)
					{
						pathComps = pathComps[1..$];
					}
					// At the end
					else if ((pcIdx + 1) == pathComps.length)
					{
						pathComps = pathComps[0..pcIdx];
					}
					// In the middle
					else
					{
						pathComps = pathComps[0..pcIdx] ~ pathComps[(pcIdx + 1)..$];
					}
				}
			}
			// Parent directory reference
			else if (pathComps[pcIdx] == pardir)
			{
				if (pathComps.length == 1)
				{
					pcIdx++;
				}
				else if (pathComps.length > 1)
				{
					// At the beginning
					if (pcIdx == 0)
					{
						// We don't know what to do with this, so move on
						pcIdx++;
					}
					// Found a reference but there was a separator before it.  Need
					// to remove this reference.
					else if (pcIdx == 1 && pathComps[(pcIdx - 1)] == "")
					{
						// Delete the reference
						if ((pcIdx + 1) < pathComps.length)
						{
							pathComps = pathComps[0..pcIdx] ~ pathComps[(pcIdx + 1)..$];
							pcIdx--;
						}
						else
						{
							pathComps = pathComps[0..pcIdx];
						}
					}
					else
					{
						if (pathComps[(pcIdx - 1)] != pardir)
						{
							if ((pcIdx + 1) < pathComps.length)
							{
								// Delete the reference and the preceding entry
								pathComps = pathComps[0..(pcIdx - 1)] ~ pathComps[(pcIdx + 1)..$];
								pcIdx--;
							}
							// End of line
							else
							{
								pathComps = pathComps[0..(pcIdx - 1)];
							}
						}
						else
						{
							pcIdx++;
						}
					}
				}
			}
			// Something else
			else
			{
				pcIdx++;
			}
		}

		// Delete any blank chunks out of the array for joining later
		for (цел i = 0; i < pathComps.length; i++)
		{
			if (pathComps[i] == "")
			{
				if (pathComps.length == 1)
				{
					pathComps.length = 0;
				}
				else if (pathComps.length > 1)
				{
					// At the beginning
					if (i == 0)
					{
						pathComps = pathComps[1..$];
					}
					// At the end
					else if ((i + 1) == pathComps.length)
					{
						pathComps = pathComps[0..i];
					}
					// In the middle.  This should already have been taken care of from the logic near
					// the top of this function from using the squeeze and then split, there shouldn't be
					// any blank chunks in the middle.
				}
			}
		}

		result = std.ткст.join(pathComps, sep);
	}
	// Путь was either a separator, curdir or pardir reference
	else
	{
		result = путь;
	}


	if (result == "" && drive == "")
	{
		result = curdir;
	}
	else
	{
		result = drive ~ result;
	}

	return result.dup;
}

/**
  *
  * Normalizes the separators in a путь.
  *
  * Use this to normalize separators as appropriate for the operating system in use.  On Windows,
  * forward slashes * will be converted to backward slashes.  On Linux, the путь will just be
  * returned.
  *
  * Authors: Joe Zuccarello
  *
  * Date: February 15, 2006
  *
  * Returns: Normalized separators for a путь.
  *
  * Version:
  *
  * License: Public domain.
  *
  * Examples:
  * ---------
  * version(Windows)
  * {
  *	normSep(к"c:/directory\file") => "c:\directory\file"
  * }
  * version(linux)
  * {
  *	normSep(к"/dir1\dir2\dir3/file") => "/dir1\dir2\dir3/file"
  * }
  * ---------
  */
сим[] normSep(сим[] путь)
{
	version(Windows)
	{
		// Convert separators
		if (std.regexp.find(путь, lSep) != -1)
		{
			путь = std.ткст.replace(путь, lSep, wSep);

			return путь.dup;
		}
		else
		{
			return путь;
		}
	}
	else version(Unix)
	{
		return путь;
	}
	else
	{
		pragma(msg, "Unsupported OS");
		static assert(0);
	}
}
