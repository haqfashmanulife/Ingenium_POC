// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:16 PM EDT
//******************************************************************************
//*  Component:   BF9872-I.js                                                    *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                               * 
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *                                                                           *
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
//	Functions for the BF9872-I.htm page
//
//	Uses:
//
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//	Function:       onLoadCustom()
//
//	Description:	Custom onload handler.
//			1. Hides the Multiplier section of the page if 
//                         there are no rows in the Multiplier table
//                      2. Hides the Benefit Category section of the page if
//                         there are no rows in  the Benefit Category table
//
//	Arguments:	None
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------
//
  function onLoadCustom()
  {
	var multTable = document.getElementById("multTable");
	var benCatTable = document.getElementById("benCatTable");
	if (multTable.rows.length == 1)
	{
            // Just the header came down so hide the Multiplier section
	    multSection.style.display = "none";
	}
	if (benCatTable.rows.length == 1)
	{
	    // Just the header came down so hide the Benefit Category section
	    benCatSection.style.display = "none";
	}
  }


