// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:05 PM EDT
//******************************************************************************
//*  Component:   AppBillingBankBranch                                         *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  016423  602J      New for release 602J                                    *
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
//	Custom script for Billing copied from BF1222.js
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//	Function:       splitBranchall 
//
//	Description:    onload requires split of all branches
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function splitBranchall()
{
	for (var i = 1; i < 10; i++)
	{
		splitBranch('MIR-BNK-BR-ID-T[' + i + ']');
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       updateBranchall 
//
//	Description:    onsubmit/onblur requires update of all branches
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function updateBranchall()
{
	for (var i = 1; i < 10; i++)
	{
		branch="MIR-BNK-BR-ID-T[" + i + "]";
		jpnbranch="Branch-T[" + i + "]";
		jpnsubbranch="SubBranch-T[" + i + "]";
		var ctl = document.getElementById('Branch-T[' + i + ']');
		ctl.setAttribute("branch",branch);
		ctl.setAttribute("jpnbranch",jpnbranch);
		ctl.setAttribute("jpnsubbranch",jpnsubbranch);
		updateBranch('Branch-T[' + i + ']');
	}
}
