// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:15 PM EDT
//******************************************************************************
//*  Component:   BF9252NC.js                                                  *
//*  Description: Used by Master Claim Updates to add rows to various          *
//*               screen tables                                                *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  HCL103  HIN/EC   Initial version                                          *
//*  M280P2  CTS      CHANGES DONE FOR ARM III                                 *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*  R16993  CTS      Fix done for Incident INC05572197 to fix the "Remove"    *
//*                   button functionality. Changes are done in function clrrow*
//*                   to change the attribute from .innertext to .value        *
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
    var myTable = "DiseaseTable";
    var numRow = getTableSize(myTable);

    for (var index = (numRow - 1); index > 1; index--)
    {
        var disCode = document.getElementById("MIR-DIS-MAJ-CD-T[" + (index+1) + "]").value;
            
        // if the row has been added and we come back to this page 
        // the row should not be hidden
        if (disCode != "")
            {
                // the row is newly added, leave it visible
                break;
            }
            
            // Hide all the rows that are not sent by the server
            changeRowVisibility(myTable, index, false);
    }
    
    // Update the status of the add row button
    updateButtonsState(myTable);
    
    var myTable = "HospTable";
    var numRow = getTableSize(myTable);

    for (var index = (numRow - 1); index > 1; index--)
    {
        var disCode = document.getElementById("MIR-HOSP-STRT-DT-T[" + (index+1) + "]").value;
        var disCode2 = document.getElementById("MIR-HOSP-END-DT-T[" + (index+1) + "]").value;
        var disCode3 = document.getElementById("MIR-HOSP-STAT-CD-T[" + (index+1) + "]").value;
            
        // if the row has been added and we come back to this page 
        // the row should not be hidden
        if (disCode != "" || disCode2 != "" || disCode3 != "")
            {
                // the row is newly added, leave it visible
                continue;
            }
            
            // Hide all the rows that are not sent by the server
            changeRowVisibility(myTable, index, false);
    }
    
    // Update the status of the add and remove buttons
    updateButtonsState(myTable);
    
    var myTable = "SurgeryTable";
    var numRow = getTableSize(myTable);

    for (var index = (numRow - 1); index > 0; index--)
    {
        var disCode = document.getElementById("MIR-SURGY-STRT-DT-T[" + (index+1) + "]").value;
        var disCode2 = document.getElementById("MIR-SURGY-END-DT-T[" + (index+1) + "]").value;
        var disCode3 = document.getElementById("MIR-SURGY-MINR-DESC-T[" + (index+1) + "]").value;
        var disCode4 = document.getElementById("MIR-SURGY-MEDC-SUBTYP-CD-T[" + (index+1) + "]").value;
            
        // if the row has been added and we come back to this page 
        // the row should not be hidden
        if (disCode != "" || disCode2 != "" || disCode3 != "" || disCode4 != "")
            {
                // the row is newly added, leave it visible
                continue;
            }
            
            // Hide all the rows that are not sent by the server
            changeRowVisibility(myTable, index, false);
    }
    
    // Update the status of the add and remove buttons
    updateButtonsState(myTable);

//---------------------
//---M280P2 CHANGES STARTS HERE
//---------------------
    var myTable = "AssociatedDisease";
    var numRow = getTableSize(myTable);

    for (var index = (numRow - 1); index > 1; index--)
    {
        var disCode = document.getElementById("MIR-ASSOC-DIS-MAJ-CD-T[" + (index+1) + "]").value;
        var disCode2 = document.getElementById("MIR-ASSOC-DIS-MINR-DESC-TXT-T[" + (index+1) + "]").value;
        var disCode3 = document.getElementById("MIR-ASSOC-DIS-STRT-DT-T[" + (index+1) + "]").value;
        var disCode4 = document.getElementById("MIR-ASSOC-DIS-END-DT-T[" + (index+1) + "]").value;
            
        // if the row has been added and we come back to this page 
        // the row should not be hidden
        if (disCode != "" || disCode2 != "" || disCode3 != "" || disCode4 != "")
            {
                // the row is newly added, leave it visible
                continue;
            }
            
            // Hide all the rows that are not sent by the server
            changeRowVisibility(myTable, index, false);
    }
    
    // Update the status of the add and remove buttons
    updateButtonsState(myTable);   
    
    var myTable = "HometreatmentTable";
    var numRow = getTableSize(myTable);

    for (var index = (numRow - 1); index > 1; index--)
    {
        var disCode = document.getElementById("MIR-HOME-TRTMNT-STRT-DT-T[" + (index+1) + "]").value;
        var disCode2 = document.getElementById("MIR-HOME-TRTMNT-END-DT-T[" + (index+1) + "]").value;
            
        // if the row has been added and we come back to this page 
        // the row should not be hidden
        if (disCode != "" || disCode2 != "")
            {
                // the row is newly added, leave it visible
                continue;
            }
            
            // Hide all the rows that are not sent by the server
            changeRowVisibility(myTable, index, false);
    }
    
    // Update the status of the add and remove buttons
    updateButtonsState(myTable); 
//---------------------
//---M280P2 CHANGES ENDS HERE
//---------------------    
// M281P2 CHANGES STARTS HERE

    var myTable = "PalliativeTable";
    var numRow = getTableSize(myTable);

    for (var index = (numRow - 1); index > 0; index--)
    {
        var disCode = document.getElementById("MIR-PALLIATIVE-STRT-DT-T[" + (index+1) + "]").value;
        var disCode2 = document.getElementById("MIR-PALLIATIVE-END-DT-T[" + (index+1) + "]").value;
            
        // if the row has been added and we come back to this page 
        // the row should not be hidden
        if (disCode != "" || disCode2 != "" || disCode3 != "" || disCode4 != "")
            {
                // the row is newly added, leave it visible
                continue;
            }
            
            // Hide all the rows that are not sent by the server
            changeRowVisibility(myTable, index, false);
    }
    
    // Update the status of the add and remove buttons
    updateButtonsState(myTable); 
    
// M281P2 CHANGES ENDS HERE
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
      document.getElementById("MIR-DIS-MAJ-CD-T[" + index + "]").value = "";
      document.getElementById("MIR-DIS-MINR-DESC-T[" + index + "]").value  = "";
  } 
  
  if (tableName == "DiseaseCause")
  {
      document.getElementById("MIR-CLMA-CAUS-MAJ-CD").value     = "";
      document.getElementById("MIR-CLMA-DIS-CAUS-DESC").value   = "";
  }
//---------------------
//---M280P2 CHANGES STARTS HERE
//---------------------  
  if (tableName == "AssociatedDisease")
  {
      document.getElementById("MIR-ASSOC-DIS-MAJ-CD-T[" + index + "]").value         = "";
      document.getElementById("MIR-ASSOC-DIS-MINR-DESC-TXT-T[" + index + "]").value  = "";
      document.getElementById("MIR-ASSOC-DIS-STRT-DT-T[" + index + "]").value        = "";
      document.getElementById("MIR-ASSOC-DIS-END-DT-T[" + index + "]").value         = "";        
  } 
//---------------------
//---M280P2 CHANGES ENDS HERE
//--------------------- 
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
	if (tableName == "DiseaseTable")
	{
            document.getElementById("addDisRowButton").disabled = true;
        }    
	if (tableName == "HospTable")
	{
            document.getElementById("addHospRowButton").disabled = true;
        }    
	if (tableName == "SurgeryTable")
	{
            document.getElementById("addSurgRowButton").disabled = true;
        } 
//---------------------
//---M280P2 CHANGES STARTS HERE
//---------------------        
	if (tableName == "AssociatedDisease")
	{
            document.getElementById("addAssocDisRowButton").disabled = true;
        } 
	if (tableName == "HometreatmentTable")
	{
            document.getElementById("addTrtmntRowButton").disabled = true;
        } 
//---------------------
//---M280P2 CHANGES ENDS HERE
//---------------------

// M281P2 CHANGES STARTS HERE
      
	if (tableName == "PalliativeTable")
	{
            document.getElementById("addPalliativeRowButton").disabled = true;
        } 

// M281P2 CHANGES ENDS HERE
    }
    else
    {
	if (tableName == "DiseaseTable")
	{
            document.getElementById("addDisRowButton").disabled = false;
        }    
	if (tableName == "HospTable")
	{
            document.getElementById("addHospRowButton").disabled = false;
        }    
	if (tableName == "SurgeryTable")
	{
            document.getElementById("addSurgRowButton").disabled = false;
        } 
//---------------------
//---M280P2 CHANGES STARTS HERE
//---------------------        
	if (tableName == "AssociatedDisease")
	{
            document.getElementById("addAssocDisRowButton").disabled = false;
        } 
	if (tableName == "HometreatmentTable")
	{
            document.getElementById("addTrtmntRowButton").disabled = false;
        }  
//---------------------
//---M280P2 CHANGES ENDS HERE
// M281P2 CHANGES STARTS HERE
    
	if (tableName == "PalliativeTable")
	{
            document.getElementById("addPalliativeRowButton").disabled = false;
        } 

// M281P2 CHANGES ENDS HERE
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





