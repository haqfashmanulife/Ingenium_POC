// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:15 PM EDT
//******************************************************************************
//*  Component:   BF9232.js       			                       *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  HNB001  HIN/AI   NEW BUSINESS SCREENS                                     *
//*  P01136  Cecil    Add function chkAcctHldraName   Sep 19, 2003             *
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
//     Function:          onChangeAcct()
//
//     Description:     Determine whether to di
//
//     Arguments:          none required
//
//     Returns:     Nothing
//
//-----------------------------------------------------------------------------

function onChangeAcct()
{
     // If the user's account holder type  will cause us to hide and erase data

         var dvAcctHldrCd = document.getElementById("MIR-ACCT-HLDR-TYP-CD").value;

          if ("1" == dvAcctHldrCd)          // Account Holder Type = Owner
          {
               AcctSection.style.display               = "none";
               document.getElementById("MIR-BNK-ACCT-HLDR-NM").setAttribute("mandatory", "no");
          }
          else
          {
               AcctSection.style.display 		     = "";
               document.getElementById("MIR-BNK-ACCT-HLDR-NM").setAttribute("mandatory", "yes");
          }

}

//-----------------------------------------------------------------------------
//
//     Function:     onLoadCustom()
//
//     Description:     Custom function executed when the page loads
//
//     Arguments:     None
//
//     Returns:     Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
     onChangeAcct();
}

//-----------------------------------------------------------------------------
//
//     Function:     onSubmitCustom()
//
//     Description:    Make sure blank is sent for the name
//                     if account holder type is owner
//
//     Arguments:     None
//
//     Returns:     Nothing
//
//-----------------------------------------------------------------------------

function onSubmitCustom()
{
          var dvAcctHldrCd = document.getElementById("MIR-ACCT-HLDR-TYP-CD").value;

          if ("1" == dvAcctHldrCd)          // Account Holder Type = Owner
          {
               document.getElementById("MIR-BNK-ACCT-HLDR-NM").value = "";
          }
}

//+----------------------------------------------------------------------------
//  Function:       chkAcctHldraName
//  Description:    Detects all non-kana characters in bank account holder names 
//                  and blanks out field  
//  Arguments:      An input field object
//-----------------------------------------------------------------------------

function chkAcctHldraName() 
{
  str1 = document.getElementById("MIR-BNK-ACCT-HLDR-NM").value;
  vchars = true;

// check string 1 for bad fields 

  for(i=0; i < str1.length; i++) 
  {
    cd = str1.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-BNK-ACCT-HLDR-NM").value = "*";
        break;
    }
  }

  if (!vchars)
  {
    alert(getUserMessage(msgBadCharsInKanaName));
  }

}

