// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:07 PM EDT
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
//	Custom script for ApplicationPolicyAllocationSubsequent.htm 
//
//-----------------------------------------------------------------------------
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  23774A  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*                                                                            *
//******************************************************************************

//-----------------------------------------------------------------------------
//
//	Function:       toggleRebalSection
//
//	Description:    Hide/undhide asset rebal section,
//	                setting mandatory status for MIR-CDI-EFF-DT and
//	                MIR-POL-PAYO-MODE-CD page.  It will display the total
//	                in the field named Total_Pct.
//
//	Arguments:      Nothing
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function toggleRebalSection()
{
	if (inputForm.Asset_Rebal_Q[0].checked)
	{
		ctl = document.getElementById("MIR-CDI-EFF-DT");
		if(ctl)
		{
			ctl.setAttribute("Mandatory","yes");
			changeLabel(ctl);
		}

		ctl = document.getElementById("MIR-POL-PAYO-MODE-CD");
		if(ctl)
		{
			ctl.setAttribute("Mandatory","yes");
			changeLabel(ctl);
		}

		Rebal1.style.display = "Block";
		Rebal2.style.display = "Block";
		Rebal3.style.display = "Block";
		Rebal4.style.display = "Block";
		Rebal5.style.display = "Block";
		Rebal6.style.display = "Block";
		Rebal7.style.display = "Block";       
	}
	else
	{
		ctl = document.getElementById("MIR-CDI-EFF-DT");
		if(ctl)
			ctl.setAttribute("Mandatory","no");

		ctl = document.getElementById("MIR-POL-PAYO-MODE-CD");
		if(ctl)
			ctl.setAttribute("Mandatory","no");

		Rebal1.style.display = "none";
		Rebal2.style.display = "none";
		Rebal3.style.display = "none";
		Rebal4.style.display = "none";
		Rebal5.style.display = "none";
		Rebal6.style.display = "none";
		Rebal7.style.display = "none";       
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       TotalSubsequent
//
//	Description:    Total all of the subsequent percentage fields on the page.  
//	                It will display the total in the field named Total_Subseq_Pct.
//
//	Arguments:      a table
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function TotalSubsequent(aTable)
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
		var val1 = aRow.cells[2].children[0].value;
		var val2 = aRow.cells[5].children[0].value;
		
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

		if (total == 0)
			inputForm.Total_Subseq_Pct.value = "";
		else
			inputForm.Total_Subseq_Pct.value = total;
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       AddToInitial
//
//	Description:    Total all of the initial percentage fields on the page.
//	                It will display the total in the field named Total_Initial_Pct.
//
//	Arguments:      a table
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function AddToInitial(text)
{
	var val = parseInt(text, 10);

	// If the value passed in is a number, add it to the Total_Initial_Pct field.

	if (!isNaN(val))
	{
		// First, we've got to get the current value of the display field

		var currentInitial = parseInt(inputForm.Total_Initial_Pct.value);

		// If the current value of the display field isn't a number, it's probably
		// because this is the first time into this function and the field has no
		// value.  We'll set the value to 0.

		if (isNaN(currentInitial))
			currentInitial = 0;

		// Increment the display field's value.

		inputForm.Total_Initial_Pct.value = currentInitial + val;
	}
}

