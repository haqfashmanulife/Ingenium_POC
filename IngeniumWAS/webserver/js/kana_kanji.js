// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:16 PM EDT
//******************************************************************************
//*  Component:   kana_kanji.js                                                *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//* 01AD05   BMB      New for Aug 1st release                                  *
//* B00188   BMB      Remove upper case edits for english locale               *
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

// These functions will check the Samakata-bu Address Line for invalid 
// characters that have been typed in. 

//+----------------------------------------------------------------------------
//
//  Class:          KanaKeyCheck
//
//  Description:    Checks for valid Katakana input characters
//
//  Member Funcs:   validate()
//  (internal)        validates the input string as having katakana characters
//
//-----------------------------------------------------------------------------
// note - for testing in Canada, check for Latin chars and HW Katakana 
//-----------------------------------------------------------------------------

function KanaKeyCheck()
{
  // Define member variables
  this.field = new Field(window.event.target);
  this.inputString = this.field.getValue();

  // Define either english or japanese member functions

  if (document.getElementById("LocaleID").value == "E")
  {
    this.validate = validate_LatinKeyCheck;
  }
  else 
  {
    this.validate = validate_KanaKeyCheck;
  }
 
  // The actual call to validate
  this.validate();
}

function validate_LatinKeyCheck()
{
  var inputChr = window.event.keyCode;

  if ( !isLatin(inputChr)  &&  !isHWKatakana(inputChr)  )
  {
    window.event.preventDefault();
    alert(getUserMessage(msgBadCharInSamakatabu));
  }
}

function validate_KanaKeyCheck()
{
  var inputChr = window.event.keyCode;

  if ( !isHWKatakana(inputChr) )
  {
    window.event.preventDefault();
    alert(getUserMessage(msgBadCharInSamakatabu));
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
//  Function:       isLatin
//  Description:    Tests to see if a given character code falls within  
//          the unicode range for all Latin characters ( < 128) 
//          the range for upper case Latin characters ( < 97) 
//  Arguments:      A single character code
//  Returns:    True if in Latin range, false if not
//-----------------------------------------------------------------------------
// note - all English Latin chars are less than 128
//      - on codepage 932, all Katakana/Latin chars are less than 256
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


