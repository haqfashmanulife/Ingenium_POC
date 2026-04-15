// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:09 PM EDT
//******************************************************************************
//*  Component:   AppSignatures.js                                             *
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
//	Functions for the AppSignatures.htm page
//
//-----------------------------------------------------------------------------
//
//	Functions for the AppPolicyDataVUL.htm page
//
//	Uses:  getCheckedRadioValue(radioGrp) 			from ClientLevelEdits.js
//  	   setCheckedRadioValue(radioGrp, choice)	from ClientLevelEdits.js
//

//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Maximum number of data rows in splits table
//-----------------------------------------------------------------------------
var maxSplits = document.getElementById("SplitCommissionTable").getAttribute("genrows");

//-----------------------------------------------------------------------------
// Column number for the split percentage
//-----------------------------------------------------------------------------
var colSplitPercentage = 2;


//-----------------------------------------------------------------------------
//
//	Function:		onLoadCustom()
//
//	Description:	Custom function executed when the page loads
//
//	Arguments:		None
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
	showHideSigsReceivedInfo();
    showHideSplitCommissionInfo();
	showHideAgentId();
}

//-----------------------------------------------------------------------------
//
//	Function:		onClickSigsReceived([ctl])
//
//	Description:	Show or hide the Application Signed fields.
//
//	Arguments:		none required
//
//  OPTIONAL:		ctl - Signatures Received radio control
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------
function onClickSigsReceived(ctl)
{
	showHideSigsReceivedInfo(ctl);
}

//-----------------------------------------------------------------------------
//
//	Function:		onClickSplitCommissions([ctl])
//
//	Description:	Show or hide the Split Commission fields.
//
//	Arguments:		none required
//
//  OPTIONAL:		ctl - Split Commissions radio control
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------
function onClickSplitCommissions(ctl)
{
	showHideSplitCommissionInfo(ctl);
}


//-----------------------------------------------------------------------------
//
//	Function:		showHideSigsReceivedInfo([ctl])
//
//	Description:	Shows or hides the Application Signed Date and the Signed
//					At information.
//
//	Arguments:		None required
//
//	OPTIONAL: 		ctl - Have All Other Signatures Been Received radio control
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function showHideSigsReceivedInfo(ctl)
{
	if ((arguments.length < 1) ||
		(null == ctl))
	{
		ctl = document.getElementById("signaturesReceived");	// This represents the entire radio group...
	
		if (null == ctl)
		{
			return;
		}
	
		ctlValue = getCheckedRadioValue(ctl);
	}
	else
	{
		ctlValue = ctl.value;						// ...whereas this is a single radio button.
	}
	
	//
	// If answer to "Have all other signatures been received?" is "Yes"
	// show the Date Signed At and Location Signed At sections.
	//
	if ("Y" == ctlValue)
	{
		document.getElementById("dateSignedSection").style.display     = "";
    document.getElementById("MIR-POL-APP-SIGN-DT").setAttribute("mandatory", "yes");
	}
	//
	// Otherwise reset data, and hide section.
	//
	else
	{
		document.getElementById("dateSignedSection").style.display     = "none"
		document.getElementById("MIR-POL-APP-SIGN-DT").value           = ""
    document.getElementById("MIR-POL-APP-SIGN-DT").setAttribute("mandatory", "no");
	}
}

//-----------------------------------------------------------------------------
//
//	Function:		showHideSplitCommissionInfo([ctl])
//
//	Description:	Shows or hides the Split Commission Info
//
//	Arguments:		None required
//
//	OPTIONAL: 		ctl - Are There Split Commissions radio control
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function showHideSplitCommissionInfo(ctl)
{

	if ((arguments.length < 1) ||
		(null == ctl))
	{
		ctl = document.getElementsByName("AgentSplitCommission");	// This represents the entire radio group...

		if (null == ctl)
		{
			return;
		}

		ctlValue = getCheckedRadioValue(ctl);
	}
	else
	{
		ctlValue = ctl.value;						// ...whereas this is a single radio button.
	}

	//
	// If answer to "Are there split commissions on this application?" is "Yes"
	// show percentage column header, percentage field on line 1, and
	// show rows 2 thru maxSplits (the end of the table).
	//
	if ("Y" == ctlValue)
	{
		document.getElementById("SplitCommissionTable").rows[0].cells[colSplitPercentage].style.display = "";
		document.getElementById("SplitCommissionTable").rows[1].cells[colSplitPercentage].style.display = "";
		document.getElementById("MIR-POL-AGT-SHR-PCT-T[1]").style.display = "";

		for (var index = 2; index <= maxSplits; index++)
		{
			document.getElementById("SplitCommissionTable").rows[index].cells[colSplitPercentage].style.display = "";
			document.getElementById("MIR-DV-AGT-CLI-NM-T[" + index + "]").style.display   = "";
			document.getElementById("MIR-AGT-ID-T[" + index + "]").style.display          = "";
			document.getElementById("MIR-POL-AGT-SHR-PCT-T[" + index + "]").style.display = "";
			document.getElementById("AgentSearchLink-T[" + index + "]").style.display     = "";
		}
	}
	//
	// Otherwise if data will be lost, ask user to confirm.
	// Then reset data, hide percentage column header and percentage in column 1,
	// and hide rows 2 thru maxSplits (the end of the table).
	//
	else
	{
		var bHide = true;		// Assume user will agree to clear data

		if (thereIsData())
		{
			//
			// Ask user if they're sure they want to lose data
			//
			// msg: Values entered for agents 2 and 3 will be reset to blank - confirm
			if (confirm(getUserMessage(msgAgtDelConfirm)) != true)
			{
				// user doesn't want to lose the data
				bHide = false;
				window.event.preventDefault();
				setCheckedRadioValue(document.getElementsByName("AgentSplitCommission"), "Y");
			}
		}

		if (bHide)
		{
			document.getElementById("SplitCommissionTable").rows[0].cells[colSplitPercentage].style.display = "none";
			document.getElementById("SplitCommissionTable").rows[1].cells[colSplitPercentage].style.display = "none";
			document.getElementById("MIR-POL-AGT-SHR-PCT-T[1]").style.display = "none";

			for (var index = 2; index <= maxSplits; index++)
			{
				document.getElementById("SplitCommissionTable").rows[index].cells[colSplitPercentage].style.display = "none";
				document.getElementById("MIR-DV-AGT-CLI-NM-T[" + index + "]").style.display   = "none";
				document.getElementById("MIR-AGT-ID-T[" + index + "]").style.display          = "none";
				document.getElementById("MIR-POL-AGT-SHR-PCT-T[" + index + "]").style.display = "none";
				document.getElementById("AgentSearchLink-T[" + index + "]").style.display     = "none";

				document.getElementById("MIR-DV-AGT-CLI-NM-T[" + index + "]").innerText = "";
				document.getElementById("MIR-AGT-ID-T[" + index + "]").value            = "";
				document.getElementById("MIR-POL-AGT-SHR-PCT-T[" + index + "]").value   = "";
			}
		}
	}
}

//-----------------------------------------------------------------------------
//
//	Function:		hideAgentId()
//
//	Description:	Shows or Hides the Table of Agent ID Values based on the
//					presence or absence of MIR-DV-AGT-NM.
//
//	Arguments:		None
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function showHideAgentId()
{
	if ((null != document.getElementById("MIR-DV-AGT-NM")) &&
		(""   != document.getElementById("MIR-DV-AGT-NM").innerText))
	{
		document.getElementById("agentIdTable").style.display = "";
	}
	else
	{
		document.getElementById("agentIdTable").style.display = "none";
	}
}



//-----------------------------------------------------------------------------
//
//	Function:		thereIsData()
//
//	Description:	Determines if there is currently data in rows of the table
//					which are about to be hidden.
//
//	Arguments:		None
//
//	Returns:		true or false
//
//-----------------------------------------------------------------------------

function thereIsData()
{
	//
	// Determine if any of the rows we may be about to remove contain data
	//
	for (var index = 2; index <= maxSplits; index++)
	{
		if ((cleanString(document.getElementById("MIR-DV-AGT-CLI-NM-T[" + index + "]").innerText)!= "") ||
			(cleanString(document.getElementById("MIR-AGT-ID-T[" + index + "]").value)           != "") ||
			((cleanString(document.getElementById("MIR-POL-AGT-SHR-PCT-T[" + index + "]").value) != "") &&
			 (cleanString(document.getElementById("MIR-POL-AGT-SHR-PCT-T[" + index + "]").value) != "0.00%")))
		{
			return true;
		}
	}
	return false;
}

