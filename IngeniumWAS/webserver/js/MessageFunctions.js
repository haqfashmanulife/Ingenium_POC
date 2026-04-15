// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:02 PM EDT
//******************************************************************************
//*  Component:   MessageFunctions.js                                          *
//*  Description: JavaScript containing the getMessage method.                 *
//*               Also defines the constants that are used to reference a      *
//*               message in the message array defined for each language.      *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*          1.1      New for release 1.1 of Pathfinder                        *
//*  018766  6.3      Technical Retro-fit                                      *
//*  018840  6.3      Policy Financial Activity Flow                           *
//*  PF 20   6.3      Retrofits for PathFinder 2.0 release                     *
//*  B11064  HIN/CL   Add message for Maximum no of dates selected             *
//*  PF 30   PF3.0    Retrofits for PathFinder 3.0 release                     *
//*  EN5280  CTS      Add two messages for Application Sticker number          *
//*  EN5280           validation                                               *
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

//+----------------------------------------------------------------------------
//
//  Global Constants for indexing and retrieving messages
//
//-----------------------------------------------------------------------------

var msgInvaldDt                  =  0;
var msgValidDtFrmt               =  1;
var msgDy                        =  2;
var msgMoA                       =  3;
var msgMo                        =  4;
var msgYr                        =  5;
var msgInvaldYr                  =  6;
var msgInvaldMo                  =  7;
var msgInvaldDy                  =  8;
var msgInvaldTime                =  9;
var msgInvaldTime4               = 10;
var msgValidSimplNumericFrmt     = 11;
var msgValidCrcyFrmt             = 12;
var msgValidAlpha                = 13;
var msgMandFld                   = 14;
var msgPromptNum                 = 15;
var msgPromptAmt                 = 16;
var msgPromptPct                 = 17;
var msgPromptDt                  = 18;
var msgPromptYr                  = 19;
var msgPromptMo                  = 20;
var msgPromptDy                  = 21;
var msgPromptTime                = 22;
var msgPromptTime4               = 23;
var msgPromptValu                = 24;
var msgPromptEmprrDt             = 25;
var msgPromptAlpha               = 26;
var msgEmprrDtUnknwnEmprr        = 27;
var msgEmprrDtDurIntg            = 28;
var msgEmprrDtDurGreaterThanZero = 29;
var msgEmprrDtDurInvaldForEmprr  = 30;
var msgEmprrDtMoIntg             = 31;
var msgEmprrDtMo1To12            = 32;
var msgEmprrDtDyIntg             = 33;
var msgEmprrDtDyForMoYr          = 34;
var msgEmprrDtMoDyPreceedEmprr   = 35;
var msgEmprrDtMoDyExceedEmprr    = 36;
var msgCloseBrowserSignOn        = 37;
var msgBadControlonLoad          = 38;
var msgBadControlonChange        = 39;
var msgBadControlonChangecustom  = 40;
var msgTruncationError           = 41;
var msgTextAreaInputTooLong      = 42;

//  Constants for user maintained messages
var msgWrngValu                  =  0;
var msgAddlPlanMandInd           =  1;
var msgMirPlanPkgAdbCd           =  2;
var msgTotPctNot100              =  3;
var msgNoValidProd               =  4;
var msgWrngState                 =  5;
var msgTotInitPct                =  6;
var msgTotSubseqPct              =  7;
var msgTotXferToPct              =  8;
var msgPackagingPart1            =  9;
var msgPackagingPart2            =  10;
var msgFaceAmtReqd               =  11;
var msgBillingConfirmDel         =  12;
var msgSpecBillingConfirmDel     =  13;
var msgCvgDelConfirm             =  14;
var msgAgtDelConfirm             =  15;
var msgMonthiversaryNotAllow     =  16;
var msgBadCharInSamakatabu       =  17;
var msgCountryCodeJapan          =  18;
var msgOnlyKatakanaChars         =  19;
var msgBadCharsInKanaName        =  20;
var msgOnlyKanjiChars            =  21;
var msgBadCharsInKanjiName       =  22;
var msgMaxDatesSelect            =  23;
var msgIncorrectApplStckrNo      =  24;
var msgIncorrectApplStckrLen     =  25;

//-----------------------------------------------------------------------------
//
//      Function:       getSystemMessage
//
//      Description:    This function is called when a system maintained message
//                      is required to be displayed to the user, either as an
//                      alert, or as a status line element
//
//      Arguments:      messageIndex
//
//      Returns:        messageText
//
//-----------------------------------------------------------------------------

function getSystemMessage(messageIndex)
{
        return systemMessages[messageIndex];
}

//-----------------------------------------------------------------------------
//
//      Function:       getUserMessage
//
//      Description:    This function is called when a user maintained message
//                      is required to be displayed to the user, either as an
//                      alert, or as a status line element
//
//      Arguments:      messageIndex
//
//      Returns:        messageText
//
//-----------------------------------------------------------------------------

function getUserMessage(messageIndex)
{
        return userMessages[messageIndex];
}

