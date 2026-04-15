// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:08 PM EDT
//******************************************************************************
//*  Component:   AppNonmedInsuranceHistory.js                                 *
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
//	Functions for the AppNonmedInsuranceHistory.htm page
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
	// Show or hide Life Insurance Inforce / Pending Information
	//
	showHideLifeInforcePending();

	//
	// Show or hide Refused / Substandard Insurance Information
	//
	showHideRefusedSubstandard();
}



//-----------------------------------------------------------------------------
//
//	Function:       showHideLifeInforcePending( [ctl] )
//
//	Description:	Shows or hides the Life Insurance Inforce / Pending Information
//					section of the screen, based on the current selection of
//					the MIR-OINS-INFC-PEND-IND (Does the applicant have any
//					existing or pending life insurance?) radio button.
//
//					The current selection is either passed in as the control the
//					user clicked on, or it is determined by looping through the
//					radio group.
//
//                  If the current selection's value is "Y", the section is shown,
//					otherwise it is hidden.
//
//	Arguments:	    None required
//
//  OPTIONAL:		ctl - the radio button clicked on
//
//	Returns:	    Nothing
//
//-----------------------------------------------------------------------------

function showHideLifeInforcePending(ctl)
{
	var hasLifeInforcePending = "";

	if (arguments.length > 0)		// We were passed a radio control
	{
		hasLifeInforcePending = ctl.value;
	}
	else
	{
		hasLifeInforcePending = getCheckedRadioValue(document.getElementsByName("MIR-OINS-INFC-PEND-IND"));
	}

	var field = document.getElementById("lifeInsuranceInforcePendingFields");

	if ((null != hasLifeInforcePending) &&
		("Y"  == hasLifeInforcePending))
	{
		field.style.display = "";
	}
	else
	{
		field.style.display = "none";
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       showHideRefusedSubstandard( [ctl] )
//
//	Description:	Shows or hides the Year Insured Refused or Offered With
//					Extra Premium" and "Refused / Substandard Insurance Information"
//					sections of the screen, based on the current selection of
//					the MIR-CLI-INS-REFUS-IND (Has the applicant been refused 
//					for insurance or offered insurance with an extra premium
//					within the last 6 months?) radio button.
//
//					The current selection is either passed in as the control the
//					user clicked on, or it is determined by looping through the
//					radio group.
//
//                  If the current selection's value is "Y", the sections are shown,
//					otherwise they are hidden.
//
//	Arguments:	    None required
//
//	Returns:	    Nothing
//
//-----------------------------------------------------------------------------

function showHideRefusedSubstandard(ctl)
{
	var hasBeenRefused = "";

	if (arguments.length > 0)		// We were passed a radio control
	{
		hasBeenRefused = ctl.value;
	}
	else
	{
		hasBeenRefused = getCheckedRadioValue(document.getElementsByName("MIR-CLI-INS-REFUS-IND"));
	}
	
	
	var field          = document.getElementById("yearRefusedOrSubstandardLabel");
	var field2         = document.getElementById("yearRefusedOrSubstandardField");
	var field3         = document.getElementById("refusedSubstandardInsuranceFields");

	if ((null != hasBeenRefused) &&
		("Y"  == hasBeenRefused))
	{
		field.style.display  = "";
		field2.style.display = "";
		field3.style.display = "";
	}
	else
	{
		field.style.display  = "none";
		field2.style.display = "none";
		field3.style.display = "none";
	}
}


