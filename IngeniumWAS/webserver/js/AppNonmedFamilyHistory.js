// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:07 PM EDT
//******************************************************************************
//*  Component:   AppNonmedFamilyHistory.js                                    *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  016423  602J     New for release 602J                                     *
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
//	Functions for the AppNonmedFamilyHistory.htm page
//
//	Uses:  getCheckedRadioValue() from ClientLevelEdits.js
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//	Function:       onLoadCustom()
//
//	Description:	Custom onload handler. Shows or hides sections of the
//                  screen depending on current radio button choices.
//
//	Arguments:	    None
//
//	Returns:	    Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
	//
	// Show or hide Family History Information
	//
	showHideFamilyHistory();
}

//-----------------------------------------------------------------------------
//
//	Function:       showHideFamilyHistory( [ctl] )
//
//	Description:	Shows or hides the Family History section of the screen,
//					based on the current selection of the MIR-HIST-UNKNWN-IND
//					(Does the applicant know their Family History?) radio button.
//
//					The current selection is either passed in as the control the
//					user clicked on, or it is determined by looping through the
//					radio group.
//
//                  If the current selection's value is "N", the section is shown,
//					otherwise it is hidden.
//
//					NOTE: THIS INDICATOR'S VALUE REPRESENTS THE INVERSE OF THE
//						  QUESTION BEING ASKED THE USER, i.e.: WHEN THE USER
//						  RESPONDS "Yes" TO THE QUESTION "Does the applicant
//						  know their Family History?", THE VALUE OF THE CONTROL
//						  IS SET TO "N".  THE INDICATOR'S VALUE ACTUALLY REPRESENTS
//						  WHETHER OR NOT THE FAMILY'S HISTORY IS *UNKNOWN*.
//
//	Arguments:	    None required
//
//  OPTIONAL:		ctl - the radio button clicked on
//
//	Returns:	    Nothing
//
//-----------------------------------------------------------------------------

function showHideFamilyHistory(ctl)
{
	var familyHistoryUnknown = "";

	if (arguments.length > 0)		// We were passed a radio control
	{
		familyHistoryUnknown = ctl.value;
	}
	else
	{
		familyHistoryUnknown = getCheckedRadioValue(document.getElementsByName("MIR-HIST-UNKNWN-IND"));
	}

	var field = document.getElementById("familyHistoryFields");

	if ((null != familyHistoryUnknown) &&
		("N"  == familyHistoryUnknown))
	{
		field.style.display = "";
	}
	else
	{
		field.style.display = "none";
	}
}




