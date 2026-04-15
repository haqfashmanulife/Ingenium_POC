// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:16 PM EDT
//******************************************************************************
//*  Component:   BF9331-I.js                                                  *
//*  Description: Used by Claim Payment to hide Payee selection box on rows    *
//*               where the benefit descision indicates the Payee cannot       *
//*               yet be selected.                                             *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  HCL109  HIN/EC   CLAIM PAYMENT                                            *
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
// Global variables
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//  Function:       onLoadCustom()
//
//  Description:  Custom onload handler. Disables all Payee selection boxes
//                for rows where the benefit decision indicates a selection
//                would be inappropriate
//
//  Arguments:      None
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
    var myTable = "Decisions";
    var numRow = getTableSize(myTable);
    for (var i = 1; i < (numRow +1); i++)
    {
       DecObj = document.getElementById("MIR-BNFT-DECSN-CD-2-T["+i + "]");
       if (DecObj == null){break};
       // If the decision code is present then get it's value
       var DecCode = document.getElementById("MIR-BNFT-DECSN-CD-2-T["+i + "]").innerText;
       // If not one of the decision code that can have a Payee assigned
       // hide the selection box
       switch (DecCode)
       {
           case "U":
               break;
           case "F":
               break;
           case "W":
               break;
           case "SP":
               break;
           case "SR":
               break;
           case "SW":
               break;
           default:
               document.getElementById("MIR-CLRL-SEQ-NUM-2-T[" + i + "]").disabled = true;
               break;
       }        
    }
    return true;
}

//-----------------------------------------------------------------------------
//
//  Function:       onSubmitCustom()
//
//  Description:  Custom submit handler. Enables all Payee selection boxes
//                for rows where the benefit decision indicates a selection
//                would be inappropriate. This is needed so that the data
//                is passed into the MIR from previously disabled selection
//                boxes.
//
//  Arguments:      None
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function onSubmitCustom()
{
    var myTable = "Decisions";
    var numRow = getTableSize(myTable);
    for (var i = 1; i < (numRow +1); i++)
    {
       DecObj = document.getElementById("MIR-BNFT-DECSN-CD-2-T["+i + "]");
       if (DecObj == null){break};
       // If the decision code is present then get it's value
       var DecCode = document.getElementById("MIR-BNFT-DECSN-CD-2-T["+i + "]").innerText;
       // If not one of the decision code that can have a Payee assigned
       // hide the selection box
       switch (DecCode)
       {
           case "U":
               break;
           case "F":
               break;
           case "W":
               break;
           case "SP":
               break;
           case "SR":
               break;
           case "SW":
               break;
           default:
               document.getElementById("MIR-CLRL-SEQ-NUM-2-T[" + i + "]").disabled = false;
               break;
       }        
    }
    return true;
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
  return myTable.rows.length;
}






