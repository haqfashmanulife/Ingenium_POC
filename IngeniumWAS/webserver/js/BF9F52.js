// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:15 PM EDT
//******************************************************************************
//*  Component:   BF9F52.js                                                    *
//*  Description: NB UW Multiscreen changes                                    *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  MP310A  CTS      CHANGES DONE FOR NB IMPROVEMENT                          *
//*  109540  CTS      CHANGES DONE FOR THE REQUIREMNT SECTION                  *
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
    var myTable = "ReqtTable";
    var numRow = getTableSize(myTable);

    for (var index = (numRow - 1); index > 2; index--)
    {
          var reqtcat = document.getElementById("MIR-NEW-ISS-REQIR-CAT-CD-T[" + (index) + "]").value;
         var polid= document.getElementById("MIR-NEW-ISS-POL-ID-T[" + (index) + "]").value;
         var reqt = document.getElementById("MIR-NEW-ISS-REQIR-ID-T[" + (index) + "]").value;
        var Comment = document.getElementById("MIR-NEW-ISS-REQIR-COMNT-TXT-T[" + (index) + "]").value;
            
        // if the row has been added and we come back to this page 
        // the row should not be hidden
        if (reqtcat != "" || polid != "" || reqt != "" || Comment != "")
            {
                // the row is newly added, leave it visible
                break;
            }
            
            // Hide all the rows that are not sent by the server
            changeRowVisibility(myTable, index, false);
    }
    
    // Update the status of the add row button
    updateButtonsState(myTable);
//--------------------------------------------------------------------
    
    var myTable = "UWReqtTable";
    var numRow = getTableSize(myTable);

    for (var index = (numRow - 1); index > 5; index--)
    {
        var reqtcat= document.getElementById("MIR-NEW-UW-REQIR-CAT-CD-T[" + index + "]").value;
        var reqt = document.getElementById("MIR-NEW-UW-REQIR-ID-T[" + index + "]").value;
        var Comment= document.getElementById("MIR-NEW-UW-REQIR-COMNT-TXT-T[" + index + "]").value;
            
        // if the row has been added and we come back to this page 
        // the row should not be hidden
        if (reqtcat != "" || reqt != "" || Comment != "")
            {
                // the row is newly added, leave it visible
                continue;
            }
            
            // Hide all the rows that are not sent by the server
            changeRowVisibility(myTable, index, false);
    }
    
    // Update the status of the add and remove buttons
    updateButtonsState(myTable);
    return true;
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
	if (tableName == "ReqtTable")
	{
            document.getElementById("AddReqt").disabled = true;
        }    
	if (tableName == "UWReqtTable")
	{
            document.getElementById("AddUWReqt").disabled = true;
        }    
    }
    else
    {
	if (tableName == "ReqtTable")
	{
            document.getElementById("AddReqt").disabled = false;
        }    
	if (tableName == "UWReqtTable")
	{
            document.getElementById("AddUWReqt").disabled = false;
        }    
    }
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





