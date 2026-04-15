// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:15 PM EDT
//******************************************************************************
//*  Component:   BF9F42.js                                                    *
//*  Description: INGENIUM LINC COMPANY CHECK SCREEN CHANGES                   *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  UY403B  CTS      INGENIUM LINC COMPANY CHECK SCREEN CHANGES               *
//*  125536  CTS      FIX TO DISPLAY THE AUTOMATIC RECORD IN MANUAL SECTION    *
//*  23774A  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
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
//  Uses:  changeMandatoryFor() from ClientLevelEdits.js
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//  Function:       onLoadCustom()
//
//  Description:  Custom onload handler. Hides all empty rows above the 
//                required minimums for each table type
//
//  Arguments:      None
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
    var myTable = "LNCCMANLTable";
    var numRow = getTableSize(myTable);


    for (var index = (numRow); index >= 1; index--)
    {
    //125536 CHANGES STARTS
         //var coid = document.getElementById("MIR-MANL-POL-TYP-CD-T[" + index + "]").value;
         var coid = document.getElementById("MIR-MANL-CO-NM-T[" + index + "]").value;
    //125536 CHANGES ENDS
        // the row should not be hidden
         if (coid != "" )
            {
              break;
            }
            changeRowVisibility(myTable, (index-1), false);            
    }
    
    // Update the status of the add row button
    updateButtonsState(myTable);
    return true;
}
//--------------------------------------------------------------------
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

    changeRowVisibility(tableName, (numUsedRows), true);

    updateButtonsState(tableName);
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
    var rowcnt = 0;
  for (var rowIndex = 1; rowIndex < numRows; rowIndex++)
  {
//125536 CHANGES STARTS
//  var coid1 = document.getElementById("MIR-MANL-POL-TYP-CD-T[" + rowIndex + "]").value;  

  var coid1 = document.getElementById("MIR-MANL-CO-NM-T[" + rowIndex + "]").value;
//125536 CHANGES ENDS
    
      if (coid1 != "")
      {
          rowcnt = rowcnt + 1;
      }
  }
    return rowcnt;
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
    var maxRows = getMaxRows();
    
  //
  // Disable the Add button if we're already at max rows for the table
  //
    if (numUsedRows == (maxRows-1))
    {
	if (tableName == "LNCCMANLTable")
	{
            document.getElementById("Add").disabled = true;
        }    
    }
    else
    {
	if (tableName == "LNCCMANLTable")
	{
            document.getElementById("Add").disabled = false;
        }    
    }
}
//-----------------------------------------------------------------------------
//
//  Function:       getMaxRows()
//
//  Description:  Get Maximum rows allowed 
//                
//
//  Arguments:    Nothing
//
//  Returns:      Maximum row count allowable
//
//-----------------------------------------------------------------------------
function getMaxRows()
{
    var myTable = "LNCCAutoTable";
    var srcTableRow = getTableSize(myTable);  
    
    var maxRowCount = srcTableRow + 10;

    if (maxRowCount > 30)
    {
       var maxRowAllowed = 30;
    }
    else
    {
       var maxRowAllowed = maxRowCount;
    }
    return maxRowAllowed;    

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





