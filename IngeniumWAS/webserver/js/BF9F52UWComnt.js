// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:15 PM EDT
//******************************************************************************
//*  Component:   BF9F52UWComnt.js                                             *
//*  Description: NB UW Multiscreen changes                                    *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  MP310A  CTS      CHANGES DONE FOR NB IMPROVEMENT                          *
//*  109543  CTS      FIX FOR POPULATING THE COMMENT TEXT                      *
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
//  Function:       onLoadCustom()
//
//  Description:  Custom onChange handler. Updates the requirement Comment text box 
//
//  Arguments:      None
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function onChangeCustom()
{
    var myTable = "ReqtTable";
    var numRow = getTableSize(myTable);

    for (var index = 1 ; index <= (numRow - 1); index++)
    {
         var reqt =document.getElementById("MIR-NEW-ISS-REQIR-ID-T[" + (index) + "]").value;     
         var comnt =document.getElementById("MIR-NEW-ISS-REQIR-COMNT-TXT-T[" + (index) + "]").value;  
       if (reqt != "" && comnt == "")
       {
        document.getElementById("MIR-NEW-ISS-REQIR-COMNT-TXT-T[" + (index) + "]").value = document.getElementById("MIR-NEW-ISS-REQIR-ID-T[" + (index) + "]").value;
       }
    }
    
    var myTable = "UWReqtTable";
    var numRow = getTableSize(myTable);

    for (var index = 1 ; index <= (numRow - 1); index++)
    {

         var reqt =document.getElementById("MIR-NEW-UW-REQIR-ID-T[" + (index) + "]").value;
        var comnt =document.getElementById("MIR-NEW-UW-REQIR-COMNT-TXT-T[" + (index) + "]").value;  

       if (reqt != "" && comnt == "" )
       {
        document.getElementById("MIR-NEW-UW-REQIR-COMNT-TXT-T[" + (index) + "]").value = document.getElementById("MIR-NEW-UW-REQIR-ID-T[" + (index) + "]").value;
            
       }
    }
    
    return true;
}
