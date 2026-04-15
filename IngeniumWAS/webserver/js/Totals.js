// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   Totals.jsme>                                                 *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
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

// This function will search through the table passed in and sum up the values in
// cells 1 and 4 of each row.  The field Total_Pct will be set to the total of these 
// cells.

function Total(aTable)
{
	var numOfRows = aTable.rows.length;
	var total=0; 

	// Do row 1 to last row; row zero is supposed to be heading

	for (var i = 1; i < numOfRows; i++)
	{
		var aRow = aTable.rows[i];
		var val1 = aRow.cells[1].children[0].value;
		var val2 = aRow.cells[4].children[0].value;
		
		val1 = parseInt(val1, 10);
		val2 = parseInt(val2, 10);
	
		var val = 0;
		
		// If either of the values came back as a number, then add it to 
		// the running total.

		if (!isNaN(val1))
			total += val1;

		if (!isNaN(val2))
			total += val2; 

		// If the total is 0, then display a blank in the field.

		if (total == 0)
			inputForm.Total_Pct.value = "";
		else
			inputForm.Total_Pct.value = total;
	}
}
