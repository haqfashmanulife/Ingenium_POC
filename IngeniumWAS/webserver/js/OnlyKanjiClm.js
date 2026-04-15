// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   OnlyKanjiClm.js                                              *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  B11065  HIN/CL   ADD CHECK FOR BANK ACCOUNT HOLDER'S NAME                 *
//*  B11066  HIN/CL   ADD CHECK FOR SAMAKATABU                                 *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
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

// These functions will check various fields  including the Samakata-bu Address  
// Line for invalid characters that have been typed in. 

//+----------------------------------------------------------------------------
//  Function:       chkKanjiNamesClm
//  Description:    Detects all non-Kanji characters in client names and blanks
//                  out field  
//  Arguments:      An input field object
//-----------------------------------------------------------------------------

function chkKanjiNamesClm()
{
  str1 = document.getElementById("MIR-CLRL-INDV-SUR-NM").value;
  str2 = document.getElementById("MIR-CLRL-INDV-GIV-NM").value;
  str3 = document.getElementById("MIR-CLRL-CO-NM").value;
  vchars = true;

// check string 1 for bad fields 

  for(i=0; i < str1.length; i++) 
  {
    cd = str1.charCodeAt(i);
    if (!this.validate(cd))
    {
        vchars = false;
        document.getElementById("MIR-CLRL-INDV-SUR-NM").value = "*";
        break;
    }
  }

// check string 2 for bad fields 

  for(i=0; i < str2.length; i++) 
  {
    cd = str2.charCodeAt(i);
    if (!this.validate(cd))
    {
        vchars = false;
        document.getElementById("MIR-CLRL-INDV-GIV-NM").value = "*";
        break;
    }
  }

// check string 3 for bad fields 

  for(i=0; i < str3.length; i++) 
  {
    cd = str3.charCodeAt(i);
    if (!this.validate(cd))
    {
        vchars = false;
        document.getElementById("MIR-CLRL-CO-NM").value = "*";
        break;
    }
  }

  if (!vchars)
  {
    alert(getUserMessage(msgBadCharsInKanjiName));
  }

}

