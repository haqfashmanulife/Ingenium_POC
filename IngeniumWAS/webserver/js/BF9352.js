// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:15 PM EDT
//******************************************************************************
//*  Component:   BF9352.js                                                    *
//*  Description: Used by Claim Additional Questions to add rows to Question   *
//*               table                                                        *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  EN0395  CTS   Initial version                                             *
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
//
//  Uses:  changeMandatoryFor() from ClientLevelEdits.js
//         convertToMIRNumber() from ClientLevelEdits.js
//         cleanString()        from ClientLevelEdits.js
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//
//  Function:       onLoadCQT()
//
//  Description:  Custom onload handler. Hides all empty rows above the 
//                required minimums for each table type
//
//  Arguments:      None
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function onLoadCQT()
{
    var myTable = "QstnTable";
    var numRow = getTableSize(myTable);
    for (var index = (numRow - 1); index > 3; index--)
    {
        var qstnId = document.getElementById("MIR-QSTN-ID-T[" + (index+1) + "]").value;
         // if the row has been added and we come back to this page 
        // the row should not be hidden
        //if (qstnId != "")
        //    {
                // the row is newly added, leave it visible
        //        continue;
         //   }
            
            // Hide all the rows that are not sent by the server
	if (qstnId == " ")
	{
            changeRowVisibility(myTable, index, false);
	}
	else
	{
		continue;
	}
    }
    
    // Update the status of the add questions button
    updateButtonsState(myTable);  
    return true;
}
//-----------------------------------------------------------------------------
//
//  Function:       getTableSize(tableName)
//
//  Description:  Returns the table's size
//
//  Arguments:    tableName - name of the table we are working on
//
//  Returns:      the number of rows in the table
//
//-----------------------------------------------------------------------------

function getTableSize(tableName)
{
    var myTable = getTable(tableName);
    // Substract one for the table header
  return myTable.rows.length - 1;
}

//-----------------------------------------------------------------------------
//
//  Function:       getTable(tableName)
//
//  Description:  Returns a reference to the table
//
//  Arguments:    tableName - name of the table we are working on
//
//  Returns:      a reference to the table
//
//-----------------------------------------------------------------------------

function getTable(tableName)
{
    return document.getElementById(tableName);
}
//-----------------------------------------------------------------------------
//
//  Function:       changeRowVisibility(tableName,index,Makevisible)
//
//  Description:  Changes the visibility of a specified row to visible or
//                not
//
//  Arguments:    tableName - name of the table we are working on
//                index - the row's index
//                makeVisible - true or false
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function changeRowVisibility(tableName, index, makeVisibile)
{
    var myTable = getTable(tableName);
    var row = myTable.rows.item(index+1);
    
    // Special care has to be taken for the mandatory fields.
    if (makeVisibile)
    {    
        row.style.display = "";
        changeMandatoryFor(row, "yes");
    }
    else
    { 
        changeMandatoryFor(row, "no");
        row.style.display = "none";
    }
}


//-----------------------------------------------------------------------------
//
//  Function:       addRow(tableName)
//
//  Description:  adds a new row at the end of the requested table 
//
//  Arguments:    tableName - name of the table we are working on
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function addRow(tableName)
{
  var numUsedRows = countUsedRows(tableName);

    // This code is execute only if there are still hidden rows

    changeRowVisibility(tableName, numUsedRows, true);
    changeRowVisibility(tableName, numUsedRows + 1, true);
    changeRowVisibility(tableName, numUsedRows + 2, true);
    changeRowVisibility(tableName, numUsedRows + 3, true);
    changeRowVisibility(tableName, numUsedRows + 4, true);
    updateButtonsState(tableName);
}

//-----------------------------------------------------------------------------
//
//  Function:       clrRow(tableName, index)
//
//  Description:  clears the row contents 
//
//  Arguments:    tableName - name of the table we are working on
//                index - the row to clear N.B. this will be based on
//                        actual dataentry rows starting at row 1
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function clrRow(tableName, index)
{
  if (tableName == "DiseaseTable")
  {
      document.getElementById("MIR-DIS-MAJ-CD-T[" + index + "]").innerText     = "";
      document.getElementById("MIR-DIS-MINR-DESC-T[" + index + "]").innerText  = "";
  } 
  
  if (tableName == "DiseaseCause")
  {
      document.getElementById("MIR-CLMA-CAUS-MAJ-CD").innerText     = "";
      document.getElementById("MIR-CLMA-DIS-CAUS-DESC").innerText   = "";
  } 
}

//-----------------------------------------------------------------------------
//
//  Function:       countUsedRows(tableName)
//
//  Description:  counts how many of the table's rows are used already
//
//  Arguments:    tableName - name of the table we are working on
//
//  Returns:      the number of used rows in the table
//
//-----------------------------------------------------------------------------

function countUsedRows(tableName)
{
    var numRows = getTableSize(tableName);
    
  for (var rowIndex = 0; rowIndex < numRows; rowIndex++)
  {
      if (!isRowVisible(tableName, rowIndex))
      {
          break;
      }
  }
    return rowIndex;
}

//-----------------------------------------------------------------------------
//
//  Function:       updateButtonsState(tableName)
//
//  Description:  Enables or disables the add button based on the 
//                table size and the number of rows sent by the server
//
//  Arguments:    tableName - name of the table we are working on
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function updateButtonsState(tableName)
{
    var myTable = getTable(tableName);
    var numUsedRows = countUsedRows(tableName);
    
  //
  // Disable the Add button if we're already at max rows for the table
  //
    if (numUsedRows == getTableSize(tableName))
    {  
	if (tableName == "QstnTable")
	{
            document.getElementById("addQstnButton").disabled = true;
        }     
    }
    else
    {    
	if (tableName == "QstnTable")
	{
            document.getElementById("addQstnButton").disabled = false;
        }    
    
    }
}

//-----------------------------------------------------------------------------
//
//  Function:       isRowVisible(tableName, index)
//
//  Description:  Tests the visibility of a row
//
//  Arguments:    tableName - name of the table we are working on
//                index the row's index
//
//  Returns:      true if the row is visible, false otherwise
//
//-----------------------------------------------------------------------------

function isRowVisible(tableName, index)
{
    var myTable = getTable(tableName);
    return  myTable.rows.item(index+1).style.display != "none";
}





