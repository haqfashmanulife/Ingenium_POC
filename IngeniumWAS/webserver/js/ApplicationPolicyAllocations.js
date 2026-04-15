// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:07 PM EDT
//******************************************************************************
//*  Component:   ApplicationPolicyAllocations.js                              *
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
//	Custom script for ApplicationPolicyAllocation.htm 
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//	Function:       Total
//
//	Description:    Total all of the percentage fields on the this
//	                page.  It will display the total in the field named
//	                Total_Pct.
//
//	Arguments:      a table
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function Total(aTable)
{
	var numOfRows = aTable.rows.length;	// Get number of rows in the table
	var total=0; 				// Used to keep a running total of the percentages

	// Loop through each row in the table.  We start at row 1 since row 0 is supposed to 
	// contain the heading.

	for (var i = 1; i < numOfRows; i++)
	{
		// The input box in each cell is a child of the cell.  We're assuming that there
		// is only one input box in each cell so we can hard-code children(0)

		var aRow = aTable.rows[i];
		var val1 = aRow.cells[1].children[0].value;
		var val2 = aRow.cells[3].children[0].value;
		
		// Parse the value of the input fields

		val1 = parseInt(val1, 10);
		val2 = parseInt(val2, 10);

		// If the fields come back as NaN, then they aren't numbers.   Don't add them
		// to the total.

		if (!isNaN(val1))
			total += val1;

		if (!isNaN(val2))
			total += val2; 

		// Display the total of all the percentage fields in the proper output field

		inputForm.Total_Pct.value = total;
	}
}
