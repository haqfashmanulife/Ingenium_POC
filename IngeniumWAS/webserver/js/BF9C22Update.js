//***************************************************************************************
//*  Component:   BF9C22Update.js                                                       *
//*  Description:                                                                       *
//*                                                                                     *
//***************************************************************************************
//*  Chg#    Release  Author  Description                                               *
//*  23774A  10APR22  CTS      Changes done for ie retirement project to make it        *
//*                            compatible for microsoft edge. Changes in html include   *
//*                            adding "id" attribute for all input fields and changes in*
//*                            java scripts to modify certain functions/commands which  *
//*                            are no longer compatilble with edge.                     *
//*                                                                                     *
//***************************************************************************************
//-----------------------------------------------------------------------------
//
//  Custom scripts for BF.htm   
//
//-----------------------------------------------------------------------------
//
//  Function:       UwgResultCheck 
//
//  Description:    Determine whether the field 'exclusion information' must be
//                  enabled or disabled depending upon the underwriting Result.
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function UwgResultCheck()
{
     if (document.getElementById("MIR-UWG-RSLT-CD").value == "C")
	{
          document.getElementById("MIR-EXCL-INFO-TXT").disabled = false;
	}
     else
	{
          document.getElementById("MIR-EXCL-INFO-TXT").value="";
          document.getElementById("MIR-EXCL-INFO-TXT").disabled = true;
	}
     return;
}
