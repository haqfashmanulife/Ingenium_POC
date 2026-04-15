// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:15 PM EDT
//******************************************************************************
//*  Component:   BF9252NC-I.js                                                *
//*  Description: Initalizer for BF9252NC-I.htm                                *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//* P02101    PF 3.0  Fix Calendar functions                                   *
//* EN000207  GW      fix Calendar functions (added clearCal function)         *
//* M253O1   CTS      Another function for Chemotherapy calender               *
//* 23774A   CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
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
// (C) COPYRIGHT 2003 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED
//******************************************************************************
 
//+----------------------------------------------------------------------------
//
//  Function:       BF9252NC-I.js   
//
//  Description:                                                                 
//
//  Arguments:                           
//
//  Returns:                       
//
//  Dependency: Requires Calendar.js.
//
//-----------------------------------------------------------------------------
var calop;
var calch;

function initCal()
{
    calop = new calendarA("calop", "OutPCal", "MIR-OUTP-STRT-DT");
    serverStartDate = getServerStartDate();
    calop.setStartDate(new Date(serverStartDate));
    calop.loadDates();
    calop.show();
    return true;
}
    
function initCal2()

{        
    calch = new calendarA("calch", "ChemoCal", "MIR-CHEMOTHERAPY-DT");
    serverStartDate = getServerStartDate();
    calch.setStartDate(new Date(serverStartDate));
    calch.loadDates();
    calch.show();
    return true;    
    
}

//+----------------------------------------------------------------------------
//
//  Function:      clearCal   
//
//  Description:                                                                 
//
//  Arguments:                           
//
//  Returns:                       
//
//  Dependency: Requires Calendar.js.
//
//-----------------------------------------------------------------------------
var calop;
var calch;

function clearCal()
{
    calop = new calendarA("calop", "OutPCal", "MIR-OUTP-STRT-DT");
    serverStartDate = getServerStartDate();
    calop.setStartDate(new Date(serverStartDate));
    calop.ClearCalDates();
    calop.show();
    return true;

}
    
function clearCal2()

{        
    calch = new calendarA("calch", "ChemoCal", "MIR-CHEMOTHERAPY-DT");
    serverStartDate = getServerStartDate();
    calch.setStartDate(new Date(serverStartDate));
    calch.ClearCalDates();
    calch.show();
    return true;    
    
}

//+----------------------------------------------------------------------------
//
//  Function:       GetServerStartDate
//
//  Description:    Get the processing date from the system and subtract 5 month  
//                  (this is the current default)                                        
//
//  Arguments:                           
//
//  Returns:        Value of the start date in Js date format             
//
//-----------------------------------------------------------------------------

function getServerStartDate()
{

//  Get the INGENIUM session process date

    var serverDateCtl = m_contentDocument.getElementById("LSIR-PRCES-DT");

//  Convert the INGENIUM date field to an standard ISO date
//  The INGENIUM date can be in different formats, based on the country.
//  This code is taken from ClientLevelEdit.js
 
    var serverDateField;

    var dateComponents = getDateComponents(serverDateCtl.value);
    var sep = "-";
    serverDateField = dateComponents[0] + sep + padStringLeft(dateComponents[1].toString(),"0",2) + sep + padStringLeft(dateComponents[2].toString(), "0",2);
    
//  From the ISO date ("YYYY-MM-DD") extract the correct months, day, year and subtract 5 months
//  Currently the display is 5 months.  If this changes, then the value has to change.

    var serverDate; 

    var serverYear = serverDateField.substring(0,4);
    var serverMonth = serverDateField.substring(5,7);
    var serverDay = serverDateField.substring(8,10);

    serverDate = new Date(serverYear,serverMonth,1);
    serverDate.setMonth(serverDate.getMonth() - 5);

    return serverDate;
}
