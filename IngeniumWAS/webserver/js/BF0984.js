// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:12 PM EDT
//******************************************************************************
//*  Component:   BF0984.jsme>                                                 *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
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
//	Custom script for BF0984.htm 
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
	for (var i = 1; i < 13; i++)
	{
		splitBranch('MIR-BNK-BR-ID-T[' + i + ']');
	}
}


