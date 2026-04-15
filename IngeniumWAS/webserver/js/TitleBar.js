//******************************************************************************
//*  All right, title and interest in and to the software                      *
//*  (the "Software") and the accompanying documentation or                    *
//*  materials (the "Documentation"), including all proprietary                *
//*  rights, therein including all patent rights, trade secrets,               *
//*  trademarks and copyrights, shall remain the exclusive                     *
//*  property of Electronic Data Systems LLC.                                  *
//*  No interest, licence or any right respecting the Software                 *
//*  and the Documentation, other than expressly granted in                    *
//*  the Software Licence Agreement, is granted by implication                 *
//*  or otherwise.                                                             *
//*                                                                            *
//*  (C) Copyright 2000-2008 Electronic Data Systems LLC.                      *
//*  All rights reserved.                                                      *
//*                                                                            *
//*  Each Party agrees to (a) comply with all applicable laws                  *
//*  regarding export or re-export of the Confidential                         *
//*  Information, technical data, or derivatives of such items;                *
//*  and (b) not to export or re-export any such items to a                    *
//*  destination or end user for which applicable law, including               *
//*  Canadian or U.S. law, requires an export license or other                 *
//*  approval without first having obtained such license or                    *
//*  approval.                                                                 *
//******************************************************************************
//*  Component:   TitleBar.js                                                  *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
//*          6.2      The menu is now refreshed when the user changes the      *
//*                   language                                                 *
//*  023123  PF30     Changed resource references to be relative               *
//*  EN9512  PF4.0.2  PathFinder Upgrade                                       * 
//*  23774B   CTS     Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *                                                                              *
//*                                                                            *
//******************************************************************************
 

//+----------------------------------------------------------------------------
//
//  Javascript for handling titlebar functionality.
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//	Function:       onLoad
//
//	Description:    When we load, hide "HideMenu" link if there is no menu.
//
//	Arguments:      lang - language to use for gif's
//			showMenuText - alt text for Show Menu
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function onLoad(lang, showMenuTxt)
{
	// if we aren't in the index.htm page, we don't have a menu and the
	// menu button shouldn't be available
	myFrameset = parent.parent.window.document.getElementById("topmostFrameSet");
	if (myFrameset == null)
	{
		document.getElementById("menuimg").style.display = "none";
	}
	else
	// make sure hide/show button matches our current status (default
	// status is Hide menu but if menu was hidden on previous page we
	// should say Show menu)
	if (myFrameset.cols == "0,*")
	{
		ctl = document.getElementById("menuimg");
		if (ctl != null)
		{
                        // 023123 - added .. to beginning of path
			ctl.src = "../" + lang + "/images/showmenu.gif";
			ctl.alt = showMenuTxt;
		}
	}
}

//-----------------------------------------------------------------------------
//
//     Function:       onClick
//
//     Description:    Validate content frame if clicked on the language selection box.
//
//     Arguments:      the language control on the title bar
//
//     Returns:        Nothing
//
//-----------------------------------------------------------------------------

function onClick()
{
	frame = getFrame("ContentFrame");
	doc = getDocument(frame);

	// validate the field to see if we can proceed
	if (doc.m_validationStage == "1")
	{
		if (frame.validateField(doc.m_fieldToBeValidated) == false)
		{
			return false;
		}
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       onChange
//
//	Description:    Process a change to the selection in the language selection box.
//
//	Arguments:      the language control on the title bar
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function onChange(ctl)
{
	 doc = getDocument(getFrame("ContentFrame"));
	doc.getElementById("LocaleID").value = ctl.value;
	
	if (doc.getElementById("inputForm").onsubmit())
	{
		doc.getElementById("inputForm").submit();

		// We have to check to see if the menu frame exists because the 
		// pages in the signon flow do not have a menu

		topMostFrameset = parent.parent.window.document.getElementById("topmostFrameSet");
		if (topMostFrameset != null)
		{
			menuDoc = getDocument(getFrame("menuserverFrame"));
			menuDoc.location.href = "../servlet/menuserver?language=" + ctl.value;
		}
		else
		{
			// check to see if the menu frame is under the page created by "new" button
			// on title bar

			topMostFrameset = parent.window.document.getElementById("topmostFrameSet");
			if (topMostFrameset != null)
			{
				menuDoc = getDocument(getFrame("menuserverFrame"));
				menuDoc.location.href = "../servlet/menuserver?language=" + ctl.value;
			}
		}
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       onMenu
//
//	Description:    Process a click on the Hide/Show menu link.
//
//	Arguments:      ctl - the menu control on the title bar
//			lang - language to use for gifs
//			showMenuText - alt text for Show Menu
//			hideMenuText - alt text for Hide Menu
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function onMenu(ctl, lang, showMenuTxt, hideMenuTxt)
{
	// toggle menuserver frame off and on and show correct image
	myFrameset = parent.parent.window.document.getElementById("topmostFrameSet");
	if (myFrameset == null)
	{
		myFrameset = parent.window.document.getElementById("topmostFrameSet");
	}
	if (myFrameset.cols == "0,*")
	{
		myFrameset.cols = "20%,80%";
                // 023123 - added .. to beginning of path
		ctl.src = "../" + lang + "/images/hidemenu.gif";
		ctl.alt = hideMenuTxt;
	}
	else
	{
		myFrameset.cols = "0,*";
                // 023123 - added .. to beginning of path
		ctl.src = "../" + lang + "/images/showmenu.gif";
		ctl.alt = showMenuTxt;
	}
}
