// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:02 PM EDT
//******************************************************************************
//*  Component:   EmperorDates.js                                              *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
//*  016150  602J     Fixed to display Emperor DOB/DOD for English pages       *
//*  016424  602J     updated for pathfinder 1.1                               *
//*  019830  PF3.0    ReFactor ClientlevelEdits.js                             *
//*  015550  1555     NEW EMPEROR CHANGE                                       *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
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

//+----------------------------------------------------------------------------
//
//  Javascript for handling Japanese Emperor format dates. Uses the following
//  external classes, variables and functions (usually found in clientleveledits.js):
//
//  Classes:
//    Field
//
//  Variables:
//    currentLocale
//
//  Functions:
//              Locale.formatDate()
//              Locale.validateDay()
//    cleanString()
//    setAssociatedEmperorDate()
//    padStringLeft()
//
//
//-----------------------------------------------------------------------------

//+----------------------------------------------------------------------------
//
//  Global variables required for Japanese Emperor Date processing
//
//-----------------------------------------------------------------------------

// number of emperors we know about
//015550 Change the number of emperors to 5
//015550 var emperors = 4;
         var emperors = 5;


//016150 Remove the followings
//016150 // the names of the emperors
//016150 var emperorNames = new Array(emperors);
//016150 emperorNames[0] = "明治";
//016150 emperorNames[1] = "大正";
//016150 emperorNames[2] = "昭和";
//016150 emperorNames[3] = "平成";

//016150 Add the followings
// the names of the emperors
var emperorNamesJapanese = new Array(emperors);
emperorNamesJapanese[0] = "明治";
emperorNamesJapanese[1] = "大正";
emperorNamesJapanese[2] = "昭和";
emperorNamesJapanese[3] = "平成";
//015550 Add the Japanese name of the new emperor
emperorNamesJapanese[4] = "令和";
//015550

var emperorNamesEnglish = new Array(emperors);
emperorNamesEnglish[0] = "Meiji";
emperorNamesEnglish[1] = "Taisho";
emperorNamesEnglish[2] = "Showa";
emperorNamesEnglish[3] = "Heisei";
//015550 Add the English name of the new emperor
emperorNamesEnglish[4] = "Reiwa";
//015550
//016150 Add End here

// associate codes with each emperor (so emperors can be loaded from a table, e.g. Xtab)
var emperorCodes = new Array(emperors);
emperorCodes[0] = "M";
emperorCodes[1] = "T";
emperorCodes[2] = "S";
emperorCodes[3] = "H";
//015550 Add the Code of the new emperor
emperorCodes[4] = "R";
//015550

// the start date of each emperor's reign
var emperorStartDates = new Array(emperors);
emperorStartDates[0] = new Date(1868, 0, 1);    // Note: month is zero based!
emperorStartDates[1] = new Date(1912, 6, 3);
emperorStartDates[2] = new Date(1926, 11, 25);
emperorStartDates[3] = new Date(1989, 0, 8);
//015550 Add start date of each emperor's reign
emperorStartDates[4] = new Date(2019, 4, 1);
//015550

// the duration in years of each emperor's reign
var emperorDurs = new Array(emperors);
emperorDurs[0] = 45;
emperorDurs[1] = 15;
emperorDurs[2] = 64;
//015550 Add the emperor reign duration
//015550 emperorDurs[3] = 999;
emperorDurs[3] = 31;
emperorDurs[4] = 999;
//015550


//+----------------------------------------------------------------------------
//
//  Class:          toEmperorDate(aDate)
//
//  Description:    returns the 4 components of a Japanese emperor format date
//                  given a Date
//
//  Arguments:      aDate - date to be formated
//
//-----------------------------------------------------------------------------

function toEmperorDate(aDate)
{
  // figure out which emperor's reign date falls into
  for (i = emperors - 1; i >= 0; i--)
  {
    if (aDate >= emperorStartDates[i])
    {
      break;
    }
  }

  var ret = new Array(4);
  
  if (i < 0)
  {
    // date is earlier than we can deal with
    ret[0] = "";
    ret[1] = "";
    ret[2] = "";
    ret[3] = "";
  }
  else
  {
    ret[0] = emperorCodes[i];
    ret[1] = aDate.getFullYear() - emperorStartDates[i].getFullYear() + 1;
    ret[2] = aDate.getMonth() + 1;  // getMonth() returns 0-based month
    ret[3] = aDate.getDate();
  }
  
  return ret;
}

//+----------------------------------------------------------------------------
//
//  Class:          toServerDate(emperorDate)
//
//  Description:    returns a string that is a date, formatted in the current
//                  server format, corresponding to a given emperor date.
//
//  Arguments:      emperorDate - a 4 element array containing a VALID
//                  emperor date
//
//-----------------------------------------------------------------------------

function toServerDate(emperorDate)
{
  // get emperor index
  for (i = emperors - 1; i >= 0; i--)
  {
    if (emperorDate[0] == emperorCodes[i])
    {
      break;
    }
  }
  
  var nDur = parseInt(emperorDate[1], 10);
  var nMonth = parseInt(emperorDate[2], 10);
  var nDay = parseInt(emperorDate[3], 10);

  var aDate = new Date(emperorStartDates[i].getFullYear() + nDur - 1, nMonth - 1, nDay);

//19830 remove the reference "currentLocale" that is eliminated in ClientlevelEdits.js
//     return currentLocale.formatDate(aDate);
     return formatDate(aDate);
}

//+----------------------------------------------------------------------------
//
//  Class:          EmperorDateFormat
//
//  Description:    Validates an Emperor format date and sets an associated
//                  server format date.  Emperor dates have 4 components,
//                  emperor, duration, month and day, that are painted as 4
//                  separate controls.
//
//  Arguments:      ctl - any one of the 4 controls that compose the emperor
//                  date
//
//-----------------------------------------------------------------------------

function EmperorDateFormat(ctl)
{
  // get all the components of the emperor date
  var ctls = getEmperorDateComponents(ctl);

  // validate the emperor date
  var dateOk = true;
  if (!validateEmperorDate(ctls))
  {
    dateOk = false;
  }

  // we only change the server date if we have an emperor - otherwise dates before the first known
  // emperor get clobbered
  if (ctls[0] == "")
  {
    return dateOk;
  }

  // is there a server date associated with this emperor date?
  var dateCtlName = ctl.getAttribute("serverDate");
  if (dateCtlName == null)
  {
    return dateOk;
  }

  var dateCtl = document.getElementById(dateCtlName);
  if (dateCtl == null)
  {
    return dateOk;
  }

  if (dateOk)
  {
    dateCtl.value = toServerDate(ctls);
  }
  else
  {
    dateCtl.value = "";
  }

  return dateOk;
}

//+----------------------------------------------------------------------------
//
//  Class:          getEmperorDateComponents(ctl)
//
//  Description:    Given a control that is one component of an Emperor date
//        get its value and the value of the other 3 components
//
//  Arguments:      ctl - any one of the 4 controls that compose the emperor
//                  date
//
//-----------------------------------------------------------------------------
function getEmperorDateComponents(ctl)
{
  var ret = new Array(4);

  // fill ret depending on whether ctl is a div/span or an input/select
  // field
  if (ctl.name == "")
  {
    // assume div/span
    ctls = document.getElementsByName(ctl.id);
    for (i = 0; i < 4; i++)
    {
      ret[i] = ctls[i].innerText;
    }
  }
  else
  {
    // assume input/select
    ctls = document.getElementsByName(ctl.name);
    for (i = 0; i < 4; i++)
    {
      ret[i] = ctls[i].value;
    }
  }

  return ret;
}

//+----------------------------------------------------------------------------
//
//  Class:          validateEmperorDate
//
//  Description:    Validates an Emperor date.
//
//  Arguments:      ctls - a 4 element array containing the values of the 4
//                  components of an emperor date (emperor, duration, month and
//                  year).
//
//-----------------------------------------------------------------------------

function validateEmperorDate(ctls)
{
  if (ctls == null)
  {
    return false;
  }

  if (ctls.length != 4)
  {
    return false;
  }

  // a blank emperor is ok if all the other emperor components are blank
  if (ctls[0] == "")
  {
    if (ctls[1] == "" && ctls[2] == "" && ctls[3] == "")
    {
      return true;
    }
  }

  // get emperor index
  for (i = emperors - 1; i >= 0; i--)
  {
    if (ctls[0] == emperorCodes[i])
    {
      break;
    }
  }
  
  if (i < 0)
  {
  //  msg:    Invalid Emperor Date - Unknown emperor.
    window.alert(getSystemMessage(msgEmprrDtUnknwnEmprr));
    return false;
  }
  
  // edit duration
  var nDur = parseInt(ctls[1], 10);
  if (isNaN(nDur))
  {
  //      msg:    Invalid Emperor Date - Duration must be an integer greater than 0.
    window.alert(getSystemMessage(msgEmprrDtDurIntg));
    return false;
  }
  
  if (nDur <= 0)
  {
  //      msg:    Invalid Emperor Date - Duration must be greater than zero.
    window.alert(getSystemMessage(msgEmprrDtDurGreaterThanZero));
    return false;
  }
  
  if (nDur > emperorDurs[i])
  {
  //      msg:    Invalid Emperor Date - Duration is invalid for Emperor.
    window.alert(getSystemMessage(msgEmprrDtDurInvaldForEmprr));
    return false;
  }
  
  // calculate gregorian year
  var nYear = emperorStartDates[i].getFullYear() + nDur - 1;
  
  // edit month
  var nMonth = parseInt(ctls[2], 10);
  if (isNaN(nMonth))
  {
        //      msg:    Invalid Emperor Date - Month must be an integer.
    window.alert(getSystemMessage(msgEmprrDtMoIntg));
    return false;
  }
  
  if (nMonth < 1 || nMonth > 12)
  {
        //      msg:    Invalid Emperor Date - Month must be between 1 and 12.
    window.alert(getSystemMessage(msgEmprrDtMo1To12));
    return false;
  }
  
  // edit day
  var nDay = parseInt(ctls[3], 10);
  if (isNaN(nDay))
  {
        //      msg:    Invalid Emperor Date - Day must be an integer.
    window.alert(getSystemMessage(msgEmprrDtDyIntg));
    return false;
  }

//19830 remove the reference "currentLocale" that is eliminated in ClientlevelEdits.js
//     if (!currentLocale.validateDay(nDay, nMonth, nYear))
     if (!validateDay(nDay, nMonth, nYear))
  {
  //  msg:    Invalid Emperor Date - Day is invalid for month and year.
    window.alert(getSystemMessage(msgEmprrDtDyForMoYr));
    return false;
  }
  
  aDate = new Date(nYear, nMonth - 1, nDay);

  // check that date is not before start of reign
  if (nDur == 1)
  { 
    if (aDate < emperorStartDates[i])
    {
    //      msg:    Invalid Emperor Date - Month and day preceed start of emperor's reign.
      window.alert(getSystemMessage(msgEmprrDtMoDyPreceedEmprr));
      return false;
    }
  }
  
  // check that date is not after end of reign (last emperor is presumed to still be alive)
  if (nDur == emperorDurs[i] && i < (emperors - 1))
  {
    if (aDate >= emperorStartDates[i + 1])
    {
    //  msg:   Invalid Emperor Date - Month and day exceed end of emperor's reign.
      window.alert(getSystemMessage(msgEmprrDtMoDyExceedEmprr));
      return false;
    }
  }
  
  return true;
}

//+----------------------------------------------------------------------------
//
//  Class:          setEmperorDate(serverDateName)
//
//  Description:    Given a control that is a server style date, set the
//                  associated emperor date
//
//  Arguments:      serverDateName - name of a server style date
//
//-----------------------------------------------------------------------------
function setEmperorDate(serverDateName)
{
  if (serverDateName == null)
  {
    // no name?
    return;
  }

  var serverCtl = document.getElementById(serverDateName);
  if (serverCtl == null)
  {
    // server date doesn't exist (this is possible, e.g. in an output array)
    return;
  }

  var emperorDateName = serverCtl.getAttribute("emperordate");
  if (emperorDateName == null)
  {
    // server date doesn't have an associated emperor date
    return;
  }

  var emperorCtl = document.getElementsByName(emperorDateName);
  if (emperorCtl == null)
  {
    // Emperor date controls doesn't exist?
    return;
  }
  if (emperorCtl.length == 0)
  {
    //Emperor date function is called onload on output htms and getelementsbyName doesnt work thus
    //if the length is null then getElementbyID is used 
     var emperorCtl = document.getElementById(emperorDateName);
  }

  var serverField = new Field(serverCtl);
  var serverDate = cleanString(serverField.getValue());

  // An emperor date for input has 4 separate controls, one for each part of the emperor date.
  // If the date is for input, we can use setAssociatedEmperorDate from ClientLevelEdits.js.
  if (emperorCtl.length == 4)
  {
    setAssociatedEmperorDate(serverDate, serverField);
    return;
  }

  // An emperor date for display only has 1 control and it will be a div or span.

  // check for blank date
  if (serverDate == "" || serverDate == "*")
  {
    emperorCtl.innerText = "";
    return;
  }

//19830 remove the reference "currentLocale" that is eliminated in ClientlevelEdits.js
//     var dateComponents = currentLocale.getDateComponents(serverDate);
     var dateComponents = getDateComponents(serverDate);
  var aDate = new Date(dateComponents[0], dateComponents[1] - 1, dateComponents[2]);
  var emperorDate = toEmperorDate(aDate);

  // date is earlier than the emperors we know about
  if (emperorDate[0] == "")
  {
    emperorCtl.innerText = "";
    return;
  }

  // Get the text for the emperor
  for (i = 0; i < emperors; i++)
  {
    if (emperorDate[0] == emperorCodes[i])
    {
      break;
    }
  }

//016150 Remove the followings
//016150 // The display format is Emperor.YY.MM.DD
//016150    emperorCtl.innerText = emperorNames[i] + "." +
//016150           padStringLeft(emperorDate[1].toString(), "0", 2) + "." +
//016150           padStringLeft(emperorDate[2].toString(), "0", 2) + "." +
//016150           padStringLeft(emperorDate[3].toString(), "0", 2);

//016150 Add the followings
  // The display format is Emperor.YY.MM.DD
//19830 remove the reference "currentLocale" that is eliminated in ClientlevelEdits.js
//     if (currentLocale.currentLanguage == "E")
     if (m_currentLanguage == "E")
  {
    emperorCtl.innerText = emperorNamesEnglish[i] + "." +
             padStringLeft(emperorDate[1].toString(), "0", 2) + "." +
             padStringLeft(emperorDate[2].toString(), "0", 2) + "." +
             padStringLeft(emperorDate[3].toString(), "0", 2);
  }
  else
  {
    emperorCtl.innerText = emperorNamesJapanese[i] + "." +
             padStringLeft(emperorDate[1].toString(), "0", 2) + "." +
             padStringLeft(emperorDate[2].toString(), "0", 2) + "." +
             padStringLeft(emperorDate[3].toString(), "0", 2);
  }
//016150 Add End here
}
