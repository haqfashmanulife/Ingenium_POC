// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:02 PM EDT
//******************************************************************************
//*  Component:   AddRow.jsme>                                                 *
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
//	Functions to unhide (existing) rows in a table when a button is pushed.
//
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//	Function:       onLoadAddRow(tableName, addRowCtlName)
//
//	Description:    Hide empty rows in a given table (except for first one)
//
//	Arguments:	    tableName - name of table whose rows we are going to hide
//	        		addRowCtlName - name of control to disable if we can't
//			        add any more rows.
//
//	Returns:	    Nothing
//
//-----------------------------------------------------------------------------

function onLoadAddRow(tableName, addRowCtlName)
{
	var myTable = document.getElementById(tableName);
	if (myTable == null)
	{
		return;
	}

	var emptyRow = findEmptyRow(myTable);

	// if the first row is empty, leave it unhidden
	if (emptyRow == 0)
	{
		emptyRow = 1;
	}
	
	// if there are no empty rows, disable the add rows control and
	// we're done
	if (emptyRow >= myTable.rows.length)
	{
		var ctl = document.getElementById(addRowCtlName);
		if (ctl != null)
		{
			ctl.disabled = true;
		}
	}

	// Loop through rows collection and hide each row after the last
	// non-empty one. Take care of the mandatory flag for the 
	// hidden rows
	for (i = emptyRow; i < myTable.rows.length; i++)
	{
	    var row = myTable.rows.item(i);
	    changeMandatoryFor(row, "no");
		row.style.display = "none";
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       addRow(tableName, addControl, deleteControl)
//
//	Description:	Unhide the next unhidden row in a table. If we unhide
//		    	    the last row, disable the button (or link) that was
//	    	    	clicked to unhide the row.
//
//	Arguments:	    tableName - name of table whose rows we are going to
//			        unhide
//                  addControl    the control (button) used to add a row
//                  deleteControl    the control (button) used to delete a row
//
//	Returns:	    Nothing
//
//-----------------------------------------------------------------------------

function addRow(tableName, addControl, deleteControl)
{
	var myTable = document.getElementById(tableName);
	if (myTable == null)
	{
		return;
	}

	// Find the first row that is hidden and unhide it
	// We start at 2 because we are assuming there is a heading row and the first
	// row is not hidden.
	for (i = 2; i < myTable.rows.length; i++)
	{
		if (myTable.rows.item(i).style.display == "none")
		{
		    var row = myTable.rows.item(i);
		    changeMandatoryFor(row, "yes");
			row.style.display = "";
			break;
		}
	}

	updateButtonsState(myTable, addControl, deleteControl)
}

//-----------------------------------------------------------------------------
//
//	Function:       deleteRow(tableName, addControl, deleteControl)
//
//	Description:	Hide the last row in the table
//
//	Arguments:	   tableName - name of table whose last row we're going to hide
//                 addControl    the control (button) used to add a row
//                 deleteControl    the control (button) used to delete a row
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------

function deleteRow(tableName, addControl, deleteControl)
{
	var myTable = document.getElementById(tableName);
	if (myTable == null)
	{
		return;
	}
	
	var index = countVisibleRows(myTable) -1;
	
	// This function has to be defined in another script which is specific
	// to the page on which the table is located.

	if (onDeleteRow(tableName, index))
	{
	    var row = myTable.rows.item(index);
	    changeMandatoryFor(row, "no");
	    row.style.display = "none";
	}
    
	updateButtonsState(myTable, addControl, deleteControl)
}


//-----------------------------------------------------------------------------
//
//	Function:       updateButtonsState()
//
//	Description:	Enables or disables the add/remove buttons based on the 
//                  table size and the number of rows sent by the server
//
//	Arguments:	    None
//
//	Returns:	    Nothing
//
//-----------------------------------------------------------------------------

function updateButtonsState(myTable, addControl, deleteControl)
{
	var numVisibleRows = countVisibleRows(myTable);

	if (numVisibleRows == 1)
	{
		// Disable the remove button since the user is not allowed to delete
		// the table header
		document.getElementById(deleteControl).disabled = true;
	}
	else
	{
		document.getElementById(deleteControl).disabled = false;
	}
	    
	if (numVisibleRows == myTable.rows.length)
	{
		document.getElementById(addControl).disabled = true;
	}
	else
	{
		document.getElementById(addControl).disabled = false;
	}
}


//-----------------------------------------------------------------------------
//
//	Function:       countVisibleRows(myTable)
//
//	Description:	Counts the number of visible rows in the table
//
//	Arguments:	    myTable - table to search
//
//	Returns:	    The number of visible rows
//
//-----------------------------------------------------------------------------

function countVisibleRows(myTable)
{
    var tableSize = myTable.rows.length;
	for (var index = 0; index < tableSize; index++)
	{
	    if (myTable.rows.item(index).style.display == "none")
	    {
	        break;
	    }
	}
	return index;
}

//-----------------------------------------------------------------------------
//
//	Function:       findEmptyRow(myTable)
//
//	Description:	Finds the first empty row in a table
//
//	Arguments:	myTable - table to search
//
//	Returns:	Index of first empty row (0 based). Will return a
//			value greater than the number of rows in the table
//			if there are no empty rows.
//
//-----------------------------------------------------------------------------

function findEmptyRow(myTable)
{
	if (myTable == null)
	{
		return;
	}

	var keyFieldIndex = myTable.getAttribute("keyField");
	if (keyFieldIndex != null)
	{
		keyFieldIndex = parseInt(keyFieldIndex, 10);
		if (isNaN(keyFieldIndex))
		{
			keyFieldIndex = -1;
		}
	}
	else
	{
		keyFieldIndex = -1;
	}

	// Find the first emptry row in the table.
	// We start at 1 because we are assuming there is a heading row
	for (i = 1; i < myTable.rows.length; i++)
	{
		var aRow = myTable.rows[i];

		// if there is a keyFieldIndex use it to determine if the row is empty
		if (keyFieldIndex >= 0 && keyFieldIndex < aRow.cells.length)
		{
			if (cleanString(aRow.cells[keyFieldIndex].innerText) == "")
			{
				return i;
			}
		}

		// check all columns to delete empty row
		else
		{
			for (j = 0; j < aRow.cells.length; j++)
			{
				if (cleanString(aRow.cells[j].innerText != ""))
				{
					break;
				}
			}

			if (j >= aRow.cells.length)
			{
				return i;
			}
		}
	}

	// no empty rows found
	return i;
}
