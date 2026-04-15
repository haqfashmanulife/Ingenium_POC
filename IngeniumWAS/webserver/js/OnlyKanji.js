// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   OnlyKanji.js                                                 *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//* B10010   BMB      New for Aug 1st release                                  *
//* B10294   BMB      Removed edits from middle initial fields                 *
//* B10340   BMB      1 new symbol added to the Kanji range of characters      *
//* P00712   YUC      Add range for double-byte upcase Latin  (Dec 27,2002)    *
//* EN7253   CTS      Add range for double-byte lowercase Latin                *
//* 23774B   CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//* UYCR49   CTS      Added some more exception for only kanji check           *
//* S25242   CTS      Added more exception for only kanji double byte charcter *
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

// These global functions will set error results depending on language selected    

  if (document.getElementById("LocaleID").value == "E")
  {
    this.validate = isKanjiKanaLatin;
  }
  else 
  {
    this.validate = isKanjiKana;
  }
  
//+----------------------------------------------------------------------------
//
//  Class:          KanjiKeyCheck
//
//  Description:    Checks for valid Kanji input characters
//
//-----------------------------------------------------------------------------

function KanjiKeyCheck()
{
  // Define member variables
  this.field = new Field(window.event.target);
  this.inputString = this.field.getValue();
  var inputChr = window.event.keyCode;

  if (!this.validate(inputChr))
  {
    window.event.preventDefault();
    alert(getUserMessage(msgOnlyKanjiChars));
  }
}

//+----------------------------------------------------------------------------
//  Function:       chkKanjiNames
//  Description:    Detects all non-Kanji characters in client names and blanks
//                  out field  
//  Arguments:      An input field object
//-----------------------------------------------------------------------------

function chkKanjiNames()
{
  str1 = document.getElementById("MIR-CLI-ENTR-SUR-NM-T[2]").value;
  str2 = document.getElementById("MIR-CLI-ENTR-GIV-NM-T[2]").value;
  str3 = document.getElementById("MIR-CLI-ENTR-CO-NM-T[2]").value;
  vchars = true;

// check string 1 for bad fields 

  for(i=0; i < str1.length; i++) 
  {
    cd = str1.charCodeAt(i);
    if (!this.validate(cd))
    {
        vchars = false;
        document.getElementById("MIR-CLI-ENTR-SUR-NM-T[2]").value = "*";
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
        document.getElementById("MIR-CLI-ENTR-GIV-NM-T[2]").value = "*";
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
        document.getElementById("MIR-CLI-ENTR-CO-NM-T[2]").value = "*";
        break;
    }
  }

  if (!vchars)
  {
    alert(getUserMessage(msgBadCharsInKanjiName));
  }

}


//+----------------------------------------------------------------------------
//
//  Class:          onlyKanji
//
//  Description:    Checks entire field for valid Kanji characters
//                  If bad chars found, blank out entire field
//
//
//-----------------------------------------------------------------------------

function onlyKanji()
{
  // Define member variables
  this.field = new Field(window.event.target);
  this.inputString = this.field.getValue();
  str = this.inputString;
  vchars = true;


  for(i=0; i < str.length; i++) 
  {
    cd = str.charCodeAt(i);
    if (!this.validate(cd) )
    {
        vchars = false;
        break;
    }
  }
  if ( !vchars ) 
  {
      this.field.setValue("");  
      window.event.preventDefault();
      alert(getUserMessage(msgOnlyKanjiChars));
  }

}


//+----------------------------------------------------------------------------
//  Function:       isKana
//  Description:    Tests to see if a given character code falls within  
//          the unicode range for Kana characters (12350 - 12544) 
//  Arguments:      A single character code
//  Returns:    True if in Kana range, false if not
//-----------------------------------------------------------------------------

function isKana(code) 
{
  if (code > 12351 && code < 12544) 
  {
    return true;
  } 
  else 
  {
    return false;
  }
}


//+----------------------------------------------------------------------------
//  Function:       isKanji
//  Description:    Tests to see if a given character code falls within  
//          the unicode range for Kanji characters 
//          (19968 - 40959) 
//  Arguments:      A single character code
//  Returns:    True if in Kanji range, false if not
//-----------------------------------------------------------------------------

function isKanji(code) 
{
  if (code > 19967 && code < 40960) 
  {
    return true;
  } 
  else 
  {
    return false;
  }
}

//+----------------------------------------------------------------------------
//  Function:       isKanjiKana
//  Description:    Tests to see if a given character code falls within  
//          the unicode range for mulit-byte Kana characters (12350 - 12544) 
//          or the unicode range for all Kanji characters    (19968 - 40959) 
//          or the unicode  value for a double byte space    (12288) 
//          or the unicode  value for kanji iteration        (12293) 
// P00712   YUC      Add range for double-byte upcase Latin  (Dec 27,2002)
// P00712   or the unicode range for double byte upcase latin characters    (65313(FF21) - 65338(FF3A)) 
// EN7253   CTS      Add unicode range for double byte lowercase latin characters (65345(FF41) - 65370(FF5A))
// UYCR49   CTS    unicode range for double byte special chatacters ( comma(65292) full stop(65294) ampersand(65286) hyphen(08208) apostrophe(08217) middledot(12539)) úœ -(64016)  ‡Š ? 12849 ‡‹ - 12850
//  Arguments:      A single character code 
//  Returns:    True if in Katakana or Kanji or Double-byte space, false if not
//-----------------------------------------------------------------------------

function isKanjiKana(code) 
{
  if ((code > 19967 && code < 40960) || (code > 12350 && code < 12544) || (code == 12288) || (code == 12293) || (code > 65312 && code < 65339) || (code > 65344 && code < 65371) || (code == 65292) || (code == 65294) || (code == 65286) || (code == 08208) || (code == 08217) || (code == 12539) || (code == 64016) || (code == 12849) || (code == 12850) || (code > 65295 && code < 65306))
  {
    return true;
  } 
  else 
  {
    return false;
  }
}

//+----------------------------------------------------------------------------
//  Function:       isKanjiKanaLatin
//  Description:    Tests to see if a given character code falls within  
//          the unicode range for mulit-byte Kana characters (12350 - 12544) 
//          or the unicode range for all Kanji characters    (19968 - 40959) 
//          or the unicode  value for a double byte space    (12288) 
//          or the unicode  value for kanji iteration        (12293) 
//          or the unicode  range for latin characters      ( < 128) 
// P00712   YUC      Add range for double-byte upcase Latin  (Dec 27,2002)
// P00712   or the unicode range for double byte upcase latin characters    (65313(FF21) - 65338(FF3A)) 
// EN7253   CTS      Add unicode range for double byte lowercase latin characters (65345(FF41) - 65370(FF5A))
// UYCR49   CTS    unicode range for double byte special chatacters ( comma(65292) full stop(65294) ampersand(65286) hyphen(08208) apostrophe(08217) middledot(12539)) úœ -(64016)  ‡Š ? 12849 ‡‹ - 12850
//  Arguments:      A single character code
//  Returns:    True if in Katakana or Kanji or Double-byte space, false if not
//-----------------------------------------------------------------------------

function isKanjiKanaLatin(code) 
{
  if ((code > 19967 && code < 40960) || (code > 12350 && code < 12544) || (code == 12288) || (code == 12293) || (code < 128) || (code > 65312 && code < 65339) || (code > 65344 && code < 65371) || (code == 65292) || (code == 65294) || (code == 65286) || (code == 08208) || (code == 08217) || (code == 12539) || (code == 64016) || (code == 12849) || (code == 12850) || (code > 65295 && code < 65306))
  {
    return true;
  } 
  else 
  {
    return false;
  }
}
 
