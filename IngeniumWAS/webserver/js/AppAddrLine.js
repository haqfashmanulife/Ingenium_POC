// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:03 PM EDT
//******************************************************************************
//*  Component:   AppAddrLine.js                                                  *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//* 016110   6.0.2J   New for release 6.0.2J                                   *
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

// These 4 functions will move the address information from the selection box to
// the address field.  When one of the values in the selection box is selected
// (onchange event), the value will be added to the corresponding address field.

//----------------------------------------------------------------------------
//
//	Function:	AddrKJLine1
//
//	Description:	Selects an Entry from the selection box and populates
//                      the address line 1 (Kanji)
//
//	Arguments:	None
//
//	Returns:	Nothing
//
//----------------------------------------------------------------------------

function AddrKJLine1()
{
	document.getElementById("MIR-CLI-ADDR-LN-1-TXT-T[1]").value = document.getElementById("MIR-PSTL-ADDR-LN-1-TXT").options[document.getElementById("MIR-PSTL-ADDR-LN-1-TXT").selectedIndex].text

}

//----------------------------------------------------------------------------
//
//	Function:	AddrKJLine2
//
//	Description:	Selects an Entry from the selection box and populates
//                      the address line 2 (Kanji)
//
//	Arguments:	None
//
//	Returns:	Nothing
//
//----------------------------------------------------------------------------

function AddrKJLine2()
{
	document.getElementById("MIR-CLI-ADDR-LN-2-TXT-T[1]").value = document.getElementById("MIR-PSTL-ADDR-LN-2-TXT").options[document.getElementById("MIR-PSTL-ADDR-LN-2-TXT").selectedIndex].text

}
