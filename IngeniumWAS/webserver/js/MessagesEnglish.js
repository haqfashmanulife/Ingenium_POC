// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:02 PM EDT
//******************************************************************************
//*  Component:   MessagesEnglish.js                                           *
//*  Description: English message text file for alerts and status line         *
//*               messages                                                     *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*          1.1      New for release 1.1 of Pathfinder                        *
//*  018766  6.3      Technical Retro-fit                                      *
//*  018840  6.3      Policy Financial Activity Flow                           *
//*  PF 20   2.0      PathFinder 2.0 Retro-fit                                 *
//*                   Add message for Katakana edits on Samakata-bu            *
//*                   Add message for Katakana edits                           *
//*                   Add message for Kanji edits                              *
//*  B11064  HIN/CL   Add message for Maximum no of dates selected             *
//*  PF 30   PF3.0    Retrofits for PathFinder 3.0 release                     *
//*  EN5280           Add message for Application Sticker number validation    *
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
//  Message array used for alerts and status line messages on HTML pages
//  The systemMessage array is for global type message required by all functions
//  such as date validation, time validation, general guidance messages, etc.
//  This array is not to be used for messages for application business rule
//  enforcement.
//
//-----------------------------------------------------------------------------

//      var systemMessages = new Array(38);
//      var systemMessages = new Array(42);
        var systemMessages = new Array(43);

        systemMessages [0] = "Invalid date format or date: ";
        systemMessages [1]= "Valid format: ";
        systemMessages [2]= "DD";
        systemMessages [3]= "MMM";
        systemMessages [4]= "MM";
        systemMessages [5]= "YYYY";
        systemMessages [6]= "Invalid year: ";
        systemMessages [7]= "Invalid month - should be blank or 0-12: ";
        systemMessages [8]= "Invalid day - should be blank or 0-31: ";
        systemMessages [9]= "Invalid time - should be HHMMSS - ";
        systemMessages [10]= "Invalid time - should be HHMM - ";
        systemMessages [11]= "Input must contain only 0 - 9";
        systemMessages [12]= "Input must be in currency format";
        systemMessages [13]= "Input must be alphabetic (a-z, A-Z)";
        systemMessages [14]= "Please fill in the mandatory fields.  ";
        systemMessages [15]= "Please enter a number.";
        systemMessages [16]= "Please enter an amount.";
        systemMessages [17]= "Please enter a percent.";
        systemMessages [18]= "Please enter a date ";
        systemMessages [19]= "Please enter a 4 digit year.";
        systemMessages [20]= "Please enter a month (blank or 0 - 12).";
        systemMessages [21]= "Please enter a day (blank or 0 - 31).";
        systemMessages [22]= "Please enter a time (HHMMSS).";
        systemMessages [23]= "Please enter a time (HHMM).";
        systemMessages [24]= "Please select a value.";
        systemMessages [25]= "Please enter a date in Emperor date format.";
        systemMessages [26]= "Please enter only alphabetic characters (a-z, A-Z).";
        systemMessages [27]= "Invalid Emperor Date - Unknown emperor.";
        systemMessages [28]= "Invalid Emperor Date - Duration must be an integer greater than 0.";
        systemMessages [29]= "Invalid Emperor Date - Duration must be greater than zero.";
        systemMessages [30]= "Invalid Emperor Date - Duration is invalid for Emperor.";
        systemMessages [31]= "Invalid Emperor Date - Month must be an integer.";
        systemMessages [32]= "Invalid Emperor Date - Month must be between 1 and 12.";
        systemMessages [33]= "Invalid Emperor Date - Day must be an integer.";
        systemMessages [34]= "Invalid Emperor Date - Day is invalid for month and year.";
        systemMessages [35]= "Invalid Emperor Date - Month and day preceed start of emperor's reign.";
        systemMessages [36]= "Invalid Emperor Date - Month and day exceed end of emperor's reign.";
        systemMessages [37]= "Please close this browser window and sign on again.";
        systemMessages [38]= "bad control name in onLoadConditionalScaling - ";
        systemMessages [39]= "bad control name in onChangeScaling - ";
        systemMessages [40]= "bad control name in onChangeScalingCustom - ";
        systemMessages [41]= "Value entered must be a multiple of ";
        systemMessages [42]= "The maximum length for this TextArea is: ";

//-----------------------------------------------------------------------------
//
//  Message array used for alerts and status line messages on HTML pages
//  The userMessage array is for messages required by specific application
//  functions that imply some sort of business rule,
//  such as a message that implies the sum must be 100%, etc.
//
//-----------------------------------------------------------------------------

//      var userMessages = new Array(17);
//      var userMessages = new Array(23);
//      var userMessages = new Array(24);
        var userMessages = new Array(26);

        userMessages [0]= "wrong value ";
        userMessages [1]= " for the MIR-ADDL-PLAN-MAND-IND-T indicator";
        userMessages [2]= " for the MIR-PLAN-PKG-ADB-CD-T indicator";
        userMessages [3]= "Total percentage not equal 100%";
        userMessages [4]= "No valid Products can be found for the Issue Location, Date, Form Type and Company entered.  Revise these values and Refresh this page.";
        userMessages [5]= "Wrong state.";
        userMessages [6]= "Total initial percentage allocation not equal 100%";
        userMessages [7]= "Total subsequent percentage allocation not equal 100%";
        userMessages [8]= "Total transfer to percentage allocation not equal 100%";
//      userMessages [9]= "Warning - Product Packaging for the Product";
        userMessages [9]= "Warning - Product Packaging has not been enabled for the Product ";
//      userMessages [10]= "allows for no additional riders.  Rider functions have been disabled.";
        userMessages [10]= ".  Navigation through this entry process expects Product Packaging to be turned on.";
        userMessages [11]= "Amount of Insurance must be entered in the Face Amount field";
        userMessages [12]= "Choosing that Billing Method/Frequency will cause data which is no longer relevant to be deleted - confirm";
        userMessages [13]= "Special billing frequency information will be cleared - confirm";
        userMessages [14]= "Are you sure you want to delete this coverage?";
        userMessages [15]= "Values entered for agent 2 will be reset to blank - confirm";
        userMessages [16]= "Monthiversary Charges can not be selected for reversal";
        userMessages [17]= "Bad character(s) in Samakata-bu: Only UPPER CASE allowed.";
        userMessages [18]= "Only Japan can be selected at this time.";
        userMessages [19]= "Invalid character(s) in field. Only single-byte Katakana allowed.";
        userMessages [20]= "Katakana name field cleared because invalid characters found. Please re-enter.";
        userMessages [21]= "Invalid character(s) in field. Only double-byte Kana or Kanji allowed.";
        userMessages [22]= "Kanji name field cleared because invalid characters found. Please re-enter.";
        userMessages [23]= "Maximum number of dates selected.";
        userMessages [24]= "Incorrect application sticker number";
        userMessages [25]= "Application Sticker Number is either not Numeric or not 11 digits";