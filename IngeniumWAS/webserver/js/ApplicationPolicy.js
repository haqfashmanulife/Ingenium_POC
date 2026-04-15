// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:07 PM EDT
//******************************************************************************
//*  Component:   ApplicationPolicy.js                                         *
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
//	Custom script for ApplicationPolicy.htm 
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//	Function:       onLoadCustom
//
//	Description:    Process specific code upon loading this page
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
	updateAdbAttributes();
	updateWpAttributes();
}

//-----------------------------------------------------------------------------
//
//	Function:       updateAdbAttributes
//
//	Description:    Set mandatory / protected status on ADB Amount field
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function updateAdbAttributes()
{
	for (i=1; i<6; i++)
	{
		adbCtl = document.getElementById("MIR-CVG-AD-FACE-AMT-T[" + i + "]");
		if(adbCtl)  // note Table rows and associated fields may be deleted if blank
		{
			indCtl= document.getElementById("MIR-PLAN-PKG-ADB-CD-T[" + i + "]");
			if(indCtl)
			{
				indicator = indCtl.value;
				switch(indicator)
				{
					case 'M': // set to mandatory
						adbCtl.setAttribute("Mandatory","yes");
						break;  
					case 'N': // protect field
						adbCtl.setAttribute("Mandatory","no")
						adbCtl.tabindex="";
						adbCtl.readOnly=true;
						adbCtl.disabled=true;
						break;
					case 'O' :    
					default:  // Optional field
						adbCtl.setAttribute("Mandatory","no")
						break; 
				}
			}
		}
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       updateWpAttributes 
//
//	Description:    Set mandatory / protected status on waiver field
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------
// 
function updateWpAttributes()
{
	for (i=1; i<6; i++)
	{
		wpCtl = document.getElementById("MIR-CVG-WP-IND-T[" + i + "]");
		if(wpCtl) // note Table rows and associated fields may be deleted if blank
		{
			indCtl= document.getElementById("MIR-PLAN-PKG-WP-CD-T[" + i + "]");
			if(indCtl)
			{
				indicator = indCtl.value;
				switch(indicator)
				{
					case 'M':  // waiver is mandatory - set to checked
						wpCtl.checked=true;
						wpCtl.readOnly=true;
						wpCtl.disabled=true;
						break;  
					case 'N':  // protect field
						wpCtl.tabindex=""; 
						wpCtl.setAttribute("Mandatory","no")
						wpCtl.readOnly=true;
						break;
					case 'O' :                       
					default:   // leave it
						wpCtl.setAttribute("Mandatory","no")
						break; 
				}
			}
		}
	}
}

