// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   OnlyKanaClm.js                                                  *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//* HCL111   HIN/CL   Disease and Surgery tables                               *
//* B11062   HIN/CL   FIX SMALL AND LARGE KANA SEARCH                          *
//* B11065   HIN/CL   ADD SAMAKATABU CHECK                                     *
//* B11066   HIN/CL   ADD BANK ACCOUNT HOLDER NAME CHECK                       *
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
//  Function:       ConvertKana
//  Description:    Detects all "small" kana characters & converts each to their 
//                  "big" character equivalent
//  Arguments:      An input field object
//-----------------------------------------------------------------------------

function ConvertKana() 
{
  str1 = document.getElementById("MIR-LANG-DESC-1-TXT").value;
  str2 = "";
  str3 = "";
  
// check input string for characters to convert based on their Unicode value

  for(i=0; i < str1.length; i++) 
  {
  
// obtain Unicode value
      cd1 = str1.charCodeAt(i);

      switch(cd1)
      {
        case 65383: 
          cd1 = 65393;
          break;
        case 65384: 
          cd1 = 65394;
          break;
        case 65385: 
          cd1 = 65395;
          break;
        case 65386: 
          cd1 = 65396;
          break;
        case 65387: 
          cd1 = 65397;
          break;
        case 65388: 
          cd1 = 65428;
          break;
        case 65389: 
          cd1 = 65429;
          break;
        case 65390: 
          cd1 = 65430;
          break;
        case 65391: 
          cd1 = 65410;
          break;
        case 45: 
          cd1 = 65392;
          break;
      }
      str2 = String.fromCharCode(cd1);
      str3 = str3 + str2;
  }
  document.getElementById("MIR-LANG-DESC-1-TXT").value = str3;

}

//-----------------------------------------------------------------------------
//
//	Function:       onSubmitCustom
//
//	Description:	Called before standard onSubmit function when form is
//			going to be submitted. 
//
//	Arguments:	none
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------


function onSubmitCustom()
{
  var TheField = window.document.getElementById("MIR-LANG-DESC-1-TXT"); 
  var str1 = TheField.value;
  var vchars = true;

// check string 1 for bad fields 

  for(i=0; i < str1.length; i++) 
  {
    cd = str1.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        break;
    }
  }

  if (!vchars)
  {
    alert(getUserMessage(msgOnlyKatakanaChars));
    TheField.focus();
    TheField.select();
  }
  else
  {
    ConvertKana();
    return onSubmit();
  }
     
}

//+----------------------------------------------------------------------------
//  Function:       chkSamakatabuClm
//  Description:    Removes all non-kana characters from Samakata-bu
//  Arguments:      An input field object
//-----------------------------------------------------------------------------
// note - for testing in Canada, check for upper case Latin chars
//-----------------------------------------------------------------------------

function chkSamakatabuClm(samaField) 
{
  str = document.getElementById(samaField).value;
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
    document.getElementById(samaField).value = "*";
    alert(getUserMessage(msgBadCharInSamakatabu));
  }

}

//+----------------------------------------------------------------------------
//  Function:       chkBnkHldrKanaNamesClm
//  Description:    Detects non-kana characters in Bank Account Holder names
//                  and blanks out field when in error
//  Arguments:      An input field object
//-----------------------------------------------------------------------------

function chkBnkKanaNamesClm() 
{
  var str1 = document.getElementById("MIR-CLRL-ACCT-HLDR-NM").value;
  vchars = true;
  var str2 = "";

// check bankholder name 1 for non-kana characters 

  for(i=0; i < str1.length; i++) 
  {
    cd = str1.charCodeAt(i);
    if (!isKanaLatin(cd)) 
    {
        vchars = false;
        break;
    }
  }

  if (!vchars)
  {
    document.getElementById("MIR-CLRL-ACCT-HLDR-NM").value = "*";
    alert(getUserMessage(msgBadCharsInKanaName));
  }

}


