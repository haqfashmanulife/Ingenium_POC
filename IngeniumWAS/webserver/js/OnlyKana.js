// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   OnlyKana.js                                                  *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//* B10010   BMB      New for Aug 1st release                                  *
//* B10140   BMB      Added check for Bank Acct Holders name                   *
//* B10010   BMB      Removed Kanji functions                                  *
//* B10294   BMB      Removed edits from middle initial fields                 *
//* P00251   EKM      Add Kana checking for Bank Account Holder Names          *
//* ABU228   CTS      Add Kana checking for Bank Account Holder Name in        *
//*                   Payee Information Detail Update Screen in Death Claims   *
//* 23774B   CTS      Changes done for ie retirement project to make it        *
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
//
//  Class:          KanaKeyCheck
//
//  Description:    Checks for valid Katakana input characters
//
//-----------------------------------------------------------------------------

function KanaKeyCheck()
{
  // Define member variables
  this.field = new Field(window.event.target);
  this.inputString = this.field.getValue();
  var inputChr = window.event.keyCode;

  if (!isKanaLatin(inputChr))
  {
    window.event.preventDefault();
    alert(getUserMessage(msgOnlyKatakanaChars));
  }
}

//+----------------------------------------------------------------------------
//  Function:       chkSamakatabu
//  Description:    Removes all non-kana characters from Samakata-bu
//  Arguments:      An input field object
//-----------------------------------------------------------------------------
// note - for testing in Canada, check for upper case Latin chars
//-----------------------------------------------------------------------------

function chkSamakatabu() 
{
  str = document.getElementById("MIR-CLI-ADDR-ADDL-TXT-T[1]").value;
  vchars = true;
  str2 = "";

  for(i=0; i < str.length; i++) 
  {
    cd = str.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        break;
    }
  }

  if (!vchars)
  {
    document.getElementById("MIR-CLI-ADDR-ADDL-TXT-T[1]").value = "*";
    alert(getUserMessage(msgBadCharInSamakatabu));
  }

}

//+----------------------------------------------------------------------------
//  Function:       chkKanaNames
//  Description:    Detects all non-kana characters in client names and blanks 
//                  out field  
//  Arguments:      An input field object
//-----------------------------------------------------------------------------

function chkKanaNames() 
{
  str1 = document.getElementById("MIR-CLI-ENTR-SUR-NM-T[1]").value;
  str2 = document.getElementById("MIR-CLI-ENTR-GIV-NM-T[1]").value;
  str3 = document.getElementById("MIR-CLI-ENTR-CO-NM-T[1]").value;
  vchars = true;

// check string 1 for bad fields 

  for(i=0; i < str1.length; i++) 
  {
    cd = str1.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-CLI-ENTR-SUR-NM-T[1]").value = "*";
        break;
    }
  }

// check string 2 for bad fields 

  for(i=0; i < str2.length; i++) 
  {
    cd = str2.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-CLI-ENTR-GIV-NM-T[1]").value = "*";
        break;
    }
  }

// check string 3 for bad fields 

  for(i=0; i < str3.length; i++) 
  {
    cd = str3.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-CLI-ENTR-CO-NM-T[1]").value = "*";
        break;
    }
  }

  if (!vchars)
  {
    alert(getUserMessage(msgBadCharsInKanaName));
  }

}

//+----------------------------------------------------------------------------
//  Function:       chkBnkAcctName
//  Description:    Removes all non-kana characters from Bank Account holders name
//  Arguments:      An input field object
//-----------------------------------------------------------------------------
// note - for testing in Canada, check for upper case Latin chars
//-----------------------------------------------------------------------------

function chkBnkAcctName() 
{
  str = document.getElementById("MIR-BNK-ACCT-HLDR-NM").value;
  vchars = true;
  str2 = "";

  for(i=0; i < str.length; i++) 
  {
    cd = str.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        break;
    }
  }

  if (!vchars)
  {
    document.getElementById("MIR-BNK-ACCT-HLDR-NM").value = "*";
    alert(getUserMessage(msgBadCharsInKanaName));
  }

}

//+----------------------------------------------------------------------------
//  Function:       chkBnkHldrKanaNames
//  Description:    Detects non-kana characters in Bank Account Holder names
//                  and blanks out field when in error
//  Arguments:      An input field object
//-----------------------------------------------------------------------------

function chkBnkKanaNames() 
{
  str1 = document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[1]").value;
  str2 = document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[2]").value;
  str3 = document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[3]").value;
  str4 = document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[4]").value;
  str5 = document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[5]").value;
  str6 = document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[6]").value;
  str7 = document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[7]").value;
  str8 = document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[8]").value;
  str9 = document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[9]").value;
  
  vchars = true;

// check bankholder name 1 for non-kana characters 

  for(i=0; i < str1.length; i++) 
  {
    cd = str1.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[1]").value = "*";
        break;
    }
  }

// check bankholder name 2 for non-kana characters

  for(i=0; i < str2.length; i++) 
  {
    cd = str2.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[2]").value = "*";
        break;
    }
  }

// check bankholder name 3 for non-kana characters

  for(i=0; i < str3.length; i++) 
  {
    cd = str3.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[3]").value = "*";
        break;
    }
  }

// check bankholder name 4 for non-kana characters

  for(i=0; i < str4.length; i++) 
  {
    cd = str4.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[4]").value = "*";
        break;
    }
  }

// check bankholder name 5 for non-kana characters

  for(i=0; i < str5.length; i++) 
  {
    cd = str5.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[5]").value = "*";
        break;
    }
  }

// check bankholder name 6 for non-kana characters

  for(i=0; i < str6.length; i++) 
  {
    cd = str6.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[6]").value = "*";
        break;
    }
  }

// check bankholder name 7 for non-kana characters

  for(i=0; i < str7.length; i++) 
  {
    cd = str7.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[7]").value = "*";
        break;
    }
  }

// check bankholder name 8 for non-kana characters

  for(i=0; i < str8.length; i++) 
  {
    cd = str8.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[8]").value = "*";
        break;
    }
  }

// check bankholder name 9 for non-kana characters

  for(i=0; i < str9.length; i++) 
  {
    cd = str9.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-BNK-ACCT-HLDR-NM-T[9]").value = "*";
        break;
    }
  }
  
  if (!vchars)
  {
    alert(getUserMessage(msgBadCharsInKanaName));
  }

}
//+----------------------------------------------------------------------------
//
//  Class:          onlyKatakana
//
//  Description:    Checks entire field for valid Katakana characters
//                  If bad chars found, blank out entire field
//
//
//-----------------------------------------------------------------------------

function onlyKatakana()
{
  // Define member variables
  this.field = new Field(window.event.target);
  this.inputString = this.field.getValue();
  str = this.inputString;
  vchars = true;

  for(i=0; i < str.length; i++) 
  {
    cd = str.charCodeAt(i);
    if (!isKanaLatin(cd) ) 
    {
        vchars = false;
        break;
    }
  }
  if ( !vchars ) 
  {
      this.field.setValue("");  
      window.event.preventDefault();
      alert(getUserMessage(msgOnlyKatakanaChars));
  }

}

//+----------------------------------------------------------------------------
//  Function:       isLatin
//  Description:    Tests to see if a given character code falls within  
//          the unicode range for all Latin characters ( < 128) 
//          the range for upper case Latin characters ( < 97) 
//  Arguments:      A single character code
//  Returns:    True if in Latin range, false if not
//-----------------------------------------------------------------------------
// note - for testing in Canada, check for upper case Latin chars
//-----------------------------------------------------------------------------

function isLatin(code) 
{
  if (code < 128) 
  {
    return true;
  } 
  else 
  {
    return false;
  }
}


//+----------------------------------------------------------------------------
//  Function:       isKanaLatin
//  Description:    Tests to see if a given character code falls within  
//          the unicode range for single-byte Kana characters (65380 - 65440) 
//          or the unicode range for all Latin characters ( < 128) 
//  Arguments:      A single character code
//  Returns:    True if in HWKatakana or Latin range, false if not
//-----------------------------------------------------------------------------

function isKanaLatin(code) 
{
  if ((code > 65380 && code < 65440) || (code < 128))
  {
    return true;
  } 
  else 
  {
    return false;
  }
}
//+----------------------------------------------------------------------------
//  Function:       isHWKatakana
//  Description:    Tests to see if a given character code falls within  
//          the unicode range for HWKatakana characters 
//          (65381  - 65439) 
//  Arguments:      A single character code
//  Returns:    True if in HWKatakana range, false if not
//-----------------------------------------------------------------------------

function isHWKatakana(code) 
{
  if (code > 65380 && code < 65440) 
  {
    return true;
  } 
  else 
  {
    return false;
  }
}
//+----------------------------------------------------------------------------
//  Function:       chkKanaBnkHldrName
//  Description:    Detects all non-kana characters in Account holder name field 
//                  in Payee Information Detail Screen
//  Arguments:      An input field object
//-----------------------------------------------------------------------------

function chkKanaBnkHldrName(message1) 
{
  str1 = document.getElementById("MIR-DCRL-ACCT-HLDR-NM").value;
  
  vchars = true;

// check string 1 for bad fields 

  for(i=0; i < str1.length; i++) 
  {
    cd = str1.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        document.getElementById("MIR-DCRL-ACCT-HLDR-NM").value = "*";
        break;
    }
  }
  if (!vchars)
  {
    alert(message1);
  }  
 }
