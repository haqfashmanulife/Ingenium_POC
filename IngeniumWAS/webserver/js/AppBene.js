// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:04 PM EDT
//******************************************************************************
//*  Component:   AppBene.js                                                   *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  016423  602J     New for release 602J                                     *
//*  01AUG01 WBP      Add Special Button Bar Processing                        *
//*  23774A  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*                                                                            *
//******************************************************************************
 
//******************************************************************************
// THE SOFTWARE COMPRISING THIS SYSTEM IS THE PROPERTY OF INSURANCE SOFTWARE
// SOLUTIONS CORP. OR ITS LICENSORS.
//
// ALL COPYRIGHT, PATENT, TRADE SECRET, AND OTHER INTELLECTUAL PROPERTY RIGHTS
// IN THE SOFTWARE COMPRISING THIS SYSTEM ARE, AND SHALL REMAIN, THE VALUABLE
// PROPERTY OF INSURANCE SOFTWARE SOLUTIONS CORP. OR ITS LICENSORS.
//
// USE, DISCLOSURE, OR REPRODUCTION OF THIS SOFTWARE IS STRICTLY PROHIBITED,
// EXCEPT UNDER WRITTEN LICENSE FROM INSURANCE SOFTWARE SOLUTIONS CORP. OR ITS
// LICENSORS.
//
// (C) COPYRIGHT 1999 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED
//******************************************************************************


//-----------------------------------------------------------------------------
//
//	Functions for the AppBene.htm page
//
//	Uses:
//
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//	Function:       onLoadCustom()
//
//	Description:	Custom onload handler.
//			1. Hides the table header if there are no rows in the
//			table
//
//	Arguments:	None
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------
//
  function onLoadCustom()
  {
 
	var beneTable = document.getElementById("beneTable");
	if (beneTable.rows.length == 1)
	{
		// Just the header came down so hide it
		beneTable.style.display = "none";
	}
  }
//	var controlField = document.getElementsByName("beneInOut");
//
//	if(controlField[1].checked)
//		showBeneFields(false);
//
//	if(controlField[0].checked)
//		showBeneFields(true);
//}
//
//-----------------------------------------------------------------------------
//
//	Function:       showBeneFields(show)
//
//	Description:	Show or hides fields on the page.
//
//	Arguments:	show true if the fields are to be shown
//				false oterwise
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------

function showBeneFields(show)
{
	var beneDiv = document.getElementById("beneFields");

	if (show)
	{
		beneDiv.style.display = "";
    document.getElementById("MIR-BNFY-REL-INSRD-CD").setAttribute("mandatory", "yes");
    document.getElementById("MIR-BNFY-NM").setAttribute("mandatory", "yes");
	}
	else
	{
		beneDiv.style.display = "none";
    document.getElementById("MIR-BNFY-REL-INSRD-CD").setAttribute("mandatory", "no");
    document.getElementById("MIR-BNFY-NM").setAttribute("mandatory", "no");
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       AppOnClickedActionButtonCheckForSelection(message, action)
//
//	Description:	Custom Button Bar handler.
//			1. Checks the value of the beneInOut field to determine
//			   which type of onClickedAction to take
//
//	Arguments:	message and action 
//                      - these are passed on to the
//                        onClickedActionButtonCheckForSelection function. See
//                        the description for this function in ButtonBar.js
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------
//
  function AppOnClickedActionButtonCheckForSelection(message, action)
  {
  	var controlField = getDocument(getFrame("ContentFrame")).getElementsByName("beneInOut");

	if(controlField[0].checked)
	{
		// beneInOut is yes so we need to make sure that a client was selected
		onClickedActionButtonCheckForSelection(message, action);
	}
        else
	{
		// beneInOut is not yes so we don't care if they selected a client
		onClickedActionButton(action);
	}
  }

