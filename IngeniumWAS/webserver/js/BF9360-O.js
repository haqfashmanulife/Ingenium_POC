// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//*********************************************************************************************
//*  Component:   BF9360-O.js                                                                 *
//*  Description:                                                                             *
//*                                                                                           *
//*********************************************************************************************
//*  Chg#    Release  Author  Description                                                     *
//*                                                                                           *
//*  MFFFU7  03Oct05  AC      New script to disable the non-SA selection button               *
//*  TVI15A  10SEP12  CTS     CHANGES TO ENABLE THE SELECTION BUTTON FOR TRAD                 *
//*  TVI15A                   SEG FUND                                                        *
//*  23774B  10APR22  CTS     Changes done for ie retirement project to make it               *
//*                           compatible for microsoft edge. Changes in html include          *
//*                           adding "id" attribute for all input fields and changes in       *
//*                           java scripts to modify certain functions/commands which         *
//*                           are no longer compatilble with edge.                            *
//*********************************************************************************************
//-----------------------------------------------------------------------------
//
//  Custom scripts for BF9360-O.htm   
//
//-----------------------------------------------------------------------------
//
//  Function:       onLoadCustom()
//
//  Description:  Custom onload handler to disable the non-SA selection button
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function onLoadCustom()
{
  var cvgTable = document.getElementById("cvgTable");
   
  for (i=1; i<100; i++)
  {
    rowcvgs = cvgTable.rows.item(i);
    SelectCtl = document.getElementById("SELECT-T[" + i + "]");
    var ctl= document.getElementById("MIR-CVG-INS-TYP-CD-T[" + i + "]").value;
    if (ctl != "F" && ctl != "T") 
    {
          SelectCtl.disabled = true;
    }
  }
}
