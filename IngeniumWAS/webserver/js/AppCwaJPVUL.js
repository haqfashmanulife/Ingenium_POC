// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:06 PM EDT
//******************************************************************************
//*  Component:   AppCwaJPVUL.js                                               *
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
//	Functions for the AppCwaJPVUL.htm and VulCwaConfirm pages
//
//	Uses:  getCheckedRadioValue() from ClientLevelEdits.js
//
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//	Function:       onLoadCustom()
//
//	Description:	Custom onload handler. 
//					Shows or hides the Cash With App fields.
//
//	Arguments:		None
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
	showCashWithAppFields();
}

//-----------------------------------------------------------------------------
//
//	Function:		onClickCashWithApp([ctl])
//
//	Description:	Show or hide the Cash With App Fields.
//
//	Arguments:		none required
//
//  OPTIONAL:		ctl - Cash With App radio control
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function onClickCashWithApp(ctl)
{
	showCashWithAppFields(ctl);
}

//-----------------------------------------------------------------------------
//
//	Function:		onClickNOC([ctl])
//
//	Description:	Show or hide the Payment NOC fields.
//
//	Arguments:		none required
//
//  OPTIONAL:		ctl - NOC radio control
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function onClickNOC(ctl)
{
	showNetOfCommissionFields(ctl);
}


//-----------------------------------------------------------------------------
//
//	Function:       showCashWithAppFields(show)
//
//	Description:	Determine which sections of the screen to display, based on
//					the Cash With App choice.
//
//	Arguments:		none required
//
//  OPTIONAL:		ctl - Cash With App radio control
//						- if not passed, the function will find the control itself
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function showCashWithAppFields(ctl)
{
	if ((arguments.length < 1) ||
		null == ctl)
	{
		ctl = document.getElementsByName("cashYesNo");  // This represents the entire radio group...

		if (null == ctl)
		{
			return;
		}

		ctlValue = getCheckedRadioValue(ctl);
	}
	else
	{
		ctlValue = ctl.value;			// ...whereas this is a single radio button.
	}

	//
	// If answer to "Was Payment Submitted with this Application?" is "Yes"
	// show the Source of Initial Payment and Is Payment NOC fields.
	//
	if ("Y" == ctlValue)
	{
		cashWithAppFields.style.display               = "";
    document.getElementById("MIR-DV-ENTR-CSH-AMT").setAttribute("mandatory", "yes");
    document.getElementById("MIR-DV-PRCES-DT").setAttribute("mandatory", "yes");
	}
	//
	// Otherwise reset data, and hide section.
	//
	else
	{
		cashWithAppFields.style.display                = "none";

    document.getElementById("MIR-DV-PRCES-DT").setAttribute("mandatory", "no");
		document.getElementById("MIR-DV-PRCES-DT").value          = document.getElementById("MIR-DV-PRCES-DT").defaultValue;

    document.getElementById("MIR-DV-ENTR-CSH-AMT").setAttribute("mandatory", "no");
		document.getElementById("MIR-DV-ENTR-CSH-AMT").value      = document.getElementById("MIR-DV-ENTR-CSH-AMT").defaultValue;

		document.getElementById("MIR-SUPRES-CNFRM-IND").checked   = document.getElementById("MIR-SUPRES-CNFRM-IND").defaultChecked;

		document.getElementById("MIR-CF-REG-FND-SRC-CD").value    = document.getElementById("MIR-CF-REG-FND-SRC-CD").defaultValue;

		radioGrp = document.getElementsByName("NOCInOut");
		for (var i = 0; i < radioGrp.length; i++)
		{
			radioGrp[i].checked = radioGrp[i].defaultChecked;
		}

	}

	//
	// Whenever the Cash With App choice is changed, we'll double check
	// to ensure the Is Payment NOC selection is respected as well.
	//
	onClickNOC();
}


//-----------------------------------------------------------------------------
//
//	Function:       showNetOfCommissionFields(show)
//
//	Description:	Determine which sections of the screen to display, based on
//					the Is Payment Net of Commission (NOC) choice.
//
//	Arguments:		none required
//
//  OPTIONAL:		ctl - NOC radio control
//						- if not passed, the function will find the control itself
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function showNetOfCommissionFields(ctl)
{
	if ((arguments.length < 1) ||
		null == ctl)
	{
		ctl = document.getElementsByName("NOCInOut");  // This represents the entire radio group...

		if (null == ctl)
		{
			return;
		}

		ctlValue = getCheckedRadioValue(ctl);
	}
	else
	{
		ctlValue = ctl.value;			// ...whereas this is a single radio button.
	}

	//
	// If Cash With App section is visible and Payment Net of Commision
	// is "Y", show SFBI section
	//
	if ((""  == cashWithAppFields.style.display) &&
		("Y" == ctlValue))
	{
		NOCTable.style.display                         = "";
    document.getElementById("MIR-AGT-ID").setAttribute("mandatory", "yes");
    document.getElementById("MIR-DV-POL-RCOMM-AMT").setAttribute("mandatory", "yes");
	}
	//
	// Otherwise reset data, and hide section.
	//
	else
	{
		NOCTable.style.display                         = "none";

    document.getElementById("MIR-AGT-ID").setAttribute("mandatory", "no");

    document.getElementById("MIR-DV-POL-RCOMM-AMT").setAttribute("mandatory", "no");
		document.getElementById("MIR-DV-POL-RCOMM-AMT").value     = document.getElementById("MIR-DV-POL-RCOMM-AMT").defaultValue;
	}
}


