// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:14 PM EDT
//******************************************************************************
//*  Component:   BF1690-O.js>                                                 *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
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
//	Functions for BF1690-O
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//	Function:       onLoadCustom()
//
//	Description:	If there is a match between MIR-CLI-ID and one of the
//			cli ids in the cli id table, check the box beside the
//			cli id in the table.
//
//	Arguments:	none
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
	var ctl = document.getElementById("MIR-CLI-ID");
	if (ctl == null)
	{
		return;
	}

	if (ctl.value == "")
	{
		return;
	}

	var cliId = ctl.value;
	var i = 1;
	while (true)
	{
		ctl = document.getElementById("MIR-CLI-ID-T[" + i + "]");

		// end of table - we're done
		if (ctl == null)
		{
			break;
		}

		// if there's a match, check checkbox and we're done
		if (ctl.innerText == cliId)
		{
			ctl = document.getElementById("SELECT-T[" + i + "]");
			if (ctl != null)
			{
				ctl.checked = true;
			}
			break;
		}

		i++;
	}
}
