// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:11 PM EDT
//******************************************************************************
//*  Component:   bf0061.jsme>                                                 *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
//*  23774A   CTS     Changes done for ie retirement project to make it        *
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
//	Custom script for BF0061.htm 
//	Handle the hiding and display of the user password field
//	on the application signon connect screen
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//	Three global variables defined here to capture the initial values of
//	Company id, Currency and Country to be used when changing the values
//	of the corresponding MIR fields, to determine whether or not to
//	display the password field.
//
//-----------------------------------------------------------------------------

var MirCoId;
var MirUserSesnCrcyCd;
var MirUserSesnCtryCd;
var MirUserPswdTxt;

//-----------------------------------------------------------------------------
//
//	Function:       hideDisplayPasswordInit
//
//	Description:    This function will assign the three global variables
//	                the corresponding MIR values
//	                The function is invoked when the page is loaded
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function hideDisplayPasswordInit()
{
	MirCoId = document.getElementById("MIR-CO-ID").value;
	MirUserSesnCrcyCd = document.getElementById("MIR-USER-SESN-CRCY-CD").value;
	MirUserSesnCtryCd = document.getElementById("MIR-USER-SESN-CTRY-CD").value;
	MirUserPswdTxt = document.getElementById("MIR-USER-PSWD-TXT").value;
	if (cleanString(MirUserPswdTxt) == "")
	{
		document.getElementById("MIR-USER-PSWD-TXT").setAttribute("mandatory","no");
		MirUserPswdTxtId.style.display="none";
	}
	else
	{
		document.getElementById("MIR-USER-PSWD-TXT").setAttribute("mandatory","yes");
		MirUserPswdTxtId.style.display="block";
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       hideDisplayPasswordProperty
//
//	Description:    This function will hide and unhide the password field,
//	                depending on whether one or more of the three fields
//	                Company id, Country or Currency is modified from its
//	                original values
//	                the corresponding MIR values
//	                The function is invoked when the page is loaded
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function hideDisplayPasswordProperty()
{
	if (cleanString(MirUserPswdTxt) != "")
	{
		document.getElementById("MIR-USER-PSWD-TXT").setAttribute("mandatory","yes");
		MirUserPswdTxtId.style.display="block";
	}
	else
	if ((MirCoId != document.getElementById("MIR-CO-ID").value)                        ||
	    (MirUserSesnCrcyCd != document.getElementById("MIR-USER-SESN-CRCY-CD").value)  ||
	    (MirUserSesnCtryCd != document.getElementById("MIR-USER-SESN-CTRY-CD").value))
	{
		document.getElementById("MIR-USER-PSWD-TXT").setAttribute("mandatory","yes");
		MirUserPswdTxtId.style.display="block";
	}
	else
	{
		document.getElementById("MIR-USER-PSWD-TXT").setAttribute("mandatory","no");
		MirUserPswdTxtId.style.display="none";
	}
}
