//******************************************************************************
//*  All right, title and interest in and to the software                      *
//*  (the "Software") and the accompanying documentation or                    *
//*  materials (the "Documentation"), including all proprietary                *
//*  rights, therein including all patent rights, trade secrets,               *
//*  trademarks and copyrights, shall remain the exclusive                     *
//*  property of Hewlett-Packard Development Company, L.P.                     *
//*  No interest, license or any right respecting the Software                 *
//*  and the Documentation, other than expressly granted in                    *
//*  the Software License Agreement, is granted by implication                 *
//*  or otherwise.                                                             *
//*                                                                            *
//*  (C) Copyright 2000-2010 Hewlett-Packard Development Company, L.P.         *
//*  All rights reserved.                                                      *
//*                                                                            *
//*  Each Party agrees to (a) comply with all applicable laws                  *
//*  regarding export or re-export of the Confidential                         *
//*  Information, technical data, or derivatives of such items;                *
//*  and (b) not to export or re-export any such items to a                    *
//*  destination or end user for which applicable law, including               *
//*  Canadian or U.S. law, requires an export license or other                 *
//*  approval without first having obtained such license or                    *
//*  approval.                                                                 *
//******************************************************************************
//*	Component:	ClientLevelEdits.js                                    *
//*	Description:	Javascript for generic functions that apply to most    *
//*			pages.                                                 *
//*	Note:		DO NOT MODIFY THIS CODE.  If there is a requirement to *
//*			override the methods in this file, please add required *
//*			code or method to the GlobalUserMethods.js file.       *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  045331  4.1      Automating Refresh Button                                *
//*          3.0      Re-factor codes to improve efficiency                    *
//*          1.3      Rewrote findFirstLastTabs to improve efficiency          *
//*                   Adjust field sizes for currency fields where precision   *
//*                   is scaled down                                           *
//*          1.2.1    Added support for currency scaling                       *
//*          1.2      Added support for inline frames (IFrames)                *
//*          1.0      New for release 1.0 of Pathfinder                        *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//******************************************************************************

// This variable represents the content frame window
var m_contentWindow = getContentWindow();

// This variable represents the document for the content frame
var m_contentDocument = getDocument(m_contentWindow);

// m_isIFrame will be true if this file is included in an iframe document or
// false if not.
var m_isIFrame = m_contentDocument == getDocument(window) ? false : true;

// define global variables for field formatting

var m_currentLanguage = "E";				// Define the language code
var m_dateMIRFormatCode = "A";				// Define the date format code
var m_dateMIRSeparator = "";				// Define date format constants
var m_dateMIRSuppressInd = false;			// Define date format constants
var m_dateISOInd = false;					// Define date format constants
var m_currencyDecSeparator = ".";			// Define currency constants
var m_currency1000Separator = ",";			// Define currency constants
var m_currencySymbol = "";	 				// Define currency constants
var m_currencyPos = "L"; 					// Define currency constants
var m_currencySignPos = "L";				// Define currency constants
var m_currencyScale = 2;					// Define default currency precision
var m_dateMonthsAbbr = "JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC";	// Define the months abbreviations string
var m_currencyRegExpFormattingChars = "";	// Define the regular expressions used to format currencies

// Arrays containing the position of the day, month, and year for different date formats
// The element at pos 0 in the array gives the number position of the year part in the string, 
// 1 month and 2 day.
var m_dateMIRFormatSequence = [2, 1, 0];		// DDMMYYYY

// set locale variables based on INGENIUM settings
setLocale();

// make Enter key default to pressing the Next button
document.onkeypress=processEnterKey;

// make key down default to pressing the Tab key
document.onkeydown=processTabKey;

// make click default to pressing the mouse click 
document.onclick=processClick;

if (m_isIFrame == true)
{
	// If we're on an IFrame then we have a different submit function
	document.getElementById("inputForm").onsubmit = onSubmitIFrame;
}

// flag to prevent multiple submits (e.g. clicking twice on submit buttons, IE "feature"
// on forms with single fields, etc.
var m_submitted = false;

// index of the first control that needs editing when tabbing. -1 if manual editing not required
var m_firstTabControlElement = null;

// index of the last control that needs editing when tabbing. -1 if manual editing not required
var m_lastTabControlElement = null;

// find out which is the first and last tab positions on the page
findFirstLastTabs();

// Array with the maximum number of days in a given month
var m_maxDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

// the code represents the key be pressed
var m_keyCode;

// the field saved to be validated, the validation will be done when field validation state is VALIDATION.VALIDATE
var m_fieldToBeValidated;

//a "three" state to record the state of the field validation
// READY - ready to remember which field to validate
//	       upon onblur(thisField), the state changes from VALIDATION.READY to VALIDATION.VALIDATE;
//	       then upon onfocus(nextField), nextField sees that state is VALIDATION.VALIDATE, so
//	       validate thisField
// VALIDATE - do the validation usually validateField is called again by the onfocus field,
//	          passing in argument m_fieldToBeValidated
// FAILED - This state indicates that a previous validation failed and a dialog box must be displayed.

var VALIDATION = {
		READY:"0",
		VALIDATE:"1",
		FAILED:"2"
};

var m_validationStage = VALIDATION.READY;  

//+----------------------------------------------------------------------------
//Function:	padStringLeft(aString, chr, length)
//
//Description:	Pads an input string with the chr to length.
//
//Arguments:	aString - the input string.
//			chr - the character to be padded to the input string.
//			length - the length of the output string.
//
//Returns:	A string of length long, with the padded character to the
//			left of the input string.
//-----------------------------------------------------------------------------

function padStringLeft(aString, chr, length)
{
return getPadString(aString, chr, length) + aString;
}

//+----------------------------------------------------------------------------
//Function:	padStringRight(aString, chr, length)
//
//Description:	Pad an input string with the chr to length.
//
//Arguments:	aString - the input string.
//			chr - the character to be padded to the input string.
//			length - the length of the output string.
//
//Returns:	A string of length long, with the padded character to the
//			right of the input string.
//-----------------------------------------------------------------------------

function padStringRight(aString, chr, length)
{
return aString + getPadString(aString, chr, length);
}

//+----------------------------------------------------------------------------
//	Function:	isDigit (c)
//
//	Description:	Check to see if the argument is digit or not
//
//	Arguments:	a charactor to be checked
//
//	Returns:	Return true if the argument is digit
//-----------------------------------------------------------------------------

function isDigit (c)
{
	return ((c >= "0") && (c <= "9"));
}

//+----------------------------------------------------------------------------
//	Function:	isInteger (STRING s [, BOOLEAN emptyOK])
//
//	Description:	Check to see if all characters in string s are numbers or not.
// 			Accepts non-signed integers only. Does not accept floating 
// 			point, exponential notation, etc.
//
// 			We don't use parseInt because that would accept a string
// 			with trailing non-numeric characters.
//
// 			By default, returns defaultEmptyOK if s is empty.
// 			There is an optional second argument called emptyOK.
// 			emptyOK is used to override for a single function call
// 			     the default behavior which is specified globally by
// 			     defaultEmptyOK.
// 			If emptyOK is false (or any value other than true), 
// 			     the function will return false if s is empty.
// 			If emptyOK is true, the function will return true if s is empty.
//
// 			EXAMPLE FUNCTION CALL:     RESULT:
// 			isInteger ("5")            true 
// 			isInteger ("")             defaultEmptyOK
// 			isInteger ("-5")           false
// 			isInteger ("", true)       true
// 			isInteger ("", false)      false
// 			isInteger ("5", false)     true
//
//	Arguments:	a String to be checked
//
//	Returns:	Return true if all characters in string s are numbers
//-----------------------------------------------------------------------------

function isInteger (s) {
	var defaultEmptyOK = false;

	if ((s == null) || (s.length == 0)) {
		if (arguments.length == 1) { 
			return false;
		} else { 
			return (arguments[1] == true);
		}
	}

	// Search through string's characters one by one
	// until we find a non-numeric character.
	// When we do, return false; if we don't, return true.

	for (var i = 0; i < s.length; i++) {   
		// Check that current character is number.
		if (!isDigit(s.charAt(i))) { 
			return false;
		}
	}

	// All characters are numbers.
	return true;
}

//+----------------------------------------------------------------------------
//	Function:	getContentWindow()
//
//	Description:	Returns the document representing the content frame. 
//			If there is no content frame then the current window will 
//			be returned.
//
//	Arguments:	None
//
//	Returns:	the content frame window
//-----------------------------------------------------------------------------

function getContentWindow()
{
	var contentWindow = getFrameWindow("ContentFrame");

	if (contentWindow != null)
	{
		return contentWindow;
	}
	else
	{
		return window;
	}
}

//+----------------------------------------------------------------------------
//	Function:	getFrameWindow(frameName)
//
//	Description:	Returns the document representing the frame by passing
//			in the frame name.
//
//	Arguments:	the frame name
//
//	Returns:	specified frame window
//-----------------------------------------------------------------------------

function getFrameWindow(frameName)
{
	// See if there's a pageserverFrame. If not then we're probably on the
	// signon screen.
	var pageServerFrame = top.frames.frames["pageserverFrame"];

	if (pageServerFrame == null)
	{
		// If the window is created using the new window button, the pageserverframe
		// won't have a parent.
		pageServerFrame = top.frames["pageserverFrame"];

		if (pageServerFrame == null)
		{
			return null;
		}
	}

	var framesetWindow = null;
	try
	{
		framesetWindow = pageServerFrame.frames[frameName];
	}
	catch(exception)
	{
		return null;
	}

	// Chrome returns an iFrame object, IE returns a Window object. If the object
	// contains a contentWindow property, it's an iFrame object and we need to 
	// return its contentWindow

	if (framesetWindow.contentWindow) {
		return framesetWindow.contentWindow;
	}

	return framesetWindow;
}

//+----------------------------------------------------------------------------
//	Function:	getButtonWindowDocument()
//
//	Description:	Returns the document representing the button bar frame. 
//			If there is no button bar frame then null will be
//			returned.
//
//	Arguments:	None
//
//	Returns:	the document representing the button bar frame
//-----------------------------------------------------------------------------

function getButtonWindowDocument()
{
	var buttonWindow = getFrameWindow("ButtonFrame");

	if (buttonWindow != null)
	{
		return buttonWindow.document;
	}
	else
	{
		return null;
	}
}


//+----------------------------------------------------------------------------
//	Function:	validateYear
//
//	Description:	Validates a year
//
//	Arguments:	theYear a string potentially containing a 4 digits year
//
//	Returns:	true if the year string meets the validation criteria, false
//	otherwise
//-----------------------------------------------------------------------------

function validateYear(theYear)
{
	var year = parseInt(theYear, 10);

	if (isNaN(year) || year < 1800 || year > 2200)
	{
		return false;
	}
	return true;
}

//+----------------------------------------------------------------------------
//	Function:	validateMonth
//
//	Description:	Validates a month
//
//	Arguments:	theMonth an integer with the month number to check
//
//	Returns:	true if the month is valid, false otherwise
//-----------------------------------------------------------------------------

function validateMonth(theMonth)
{
	if (isNaN(theMonth) || theMonth < 1 || theMonth > 12)
	{
		return false;
	}
	return true;
}

//+----------------------------------------------------------------------------
//	Function:	findFirstLastTabs
//
//	Description:	Finds the first and the last tabs in the document
//				we need to remember these fields so that when we tab
//				off the content frame, we will force these fields to validate
//-----------------------------------------------------------------------------

function findFirstLastTabs()
{
	var elements = document.getElementById("inputForm").querySelectorAll("input, select, a");
	var elementCount = elements.length;

	var i;
	var element = null;

	// Loop through each control on the input form and find the first control to which the user can tab.
	for (i = 0; i < elementCount; i++)
	{
		element = elements[i];
		if (isTabbable(element))
		{
			if (element.nodeName != "A") {
				// We've found the first tabbable element so save a reference to it
				m_firstTabControlElement = element;
			}

			break;
		}
	}

	// Now do the same for the last tabbable control on the form, similar to what we did above but
	// working from the back of the page.
	for (i = elementCount - 1; i >= 0; i--)
	{
		element = elements[i];
		if (isTabbable(element))
		{
			if (element.nodeName != "A") {
				m_lastTabControlElement = element;
			}

			break;
		}
	}
}

//+----------------------------------------------------------------------------
//	Function:	isTabbable
//
//	Description:	Returns true if the field can be tabbed into; false otherwise
//
//	Arguments:	the field to evaluate
//
//	Returns:	true or false
//-----------------------------------------------------------------------------

function isTabbable(control)
{
	// You can't tab to hidden, tabIndex = -1 or disabled controls
	if ((control.getAttribute("type") == "hidden") ||
		(control.getAttribute("tabIndex") == "-1") ||
		(control.getAttribute("disabled") == true))
	{
		return false;
	}

	return true;
}

//+----------------------------------------------------------------------------
//	Class:		setLocale
//
//	Description:	set locale variables based on INGENIUM settings.
//
//	Arguments:	None
//-----------------------------------------------------------------------------

function setLocale()
{
	// override defaults with values from Ingenium server (if the Ingenium server values are
	// valid)

	setUILanguage(m_contentDocument.getElementById("LSIR-USER-LANG-CD").innerText);
	setDateMIRFormatCode(m_contentDocument.getElementById("MIR-CTRY-DT-FRMT-CD").innerText);
	setDateMonthsAbbr(m_contentDocument.getElementById("LSIR-MOS-ABBR-TXT").innerText);
	setDateMIRSeparator(m_contentDocument.getElementById("MIR-CTRY-DT-SPRT-CD").innerText);
	setDateMIRSuppressInd(m_contentDocument.getElementById("MIR-CTRY-LEAD-ZERO-IND").innerText);
	setCurrencyDecSeparator(m_contentDocument.getElementById("MIR-CRCY-DCML-SPRT-CD").innerText);
	setCurrency1000Separator(m_contentDocument.getElementById("MIR-CRCY-THOU-SPRT-CD").innerText);
	setCurrencySymbol(m_contentDocument.getElementById("MIR-CRCY-SYMBL-CD").innerText);
	setCurrencySignPos(m_contentDocument.getElementById("MIR-CRCY-NEG-PLACE-CD").innerText);
	setCurrencyPos(m_contentDocument.getElementById("MIR-CRCY-PLACE-CD").innerText);
	setDateISOInd(m_contentDocument.getElementById("MIR-DV-ISO-DT-FRMT-IND").innerText);
	setCurrencyScale(m_contentDocument.getElementById("MIR-CRCY-SCALE-QTY").innerText);
	setCurrencyRegExpFormattingChars();
}

//+----------------------------------------------------------------------------
//	Function:	dateMIRFormatParseRule
//
//	Description:	Rules used to validate a date type, which is in one of
//			the date type A, B, C or D. By default, taking the rule
//			for type B.
//
//	Arguments:	theDate a String represents the date to be validated
//
//	Returns:	true if the date is the correct date type, false otherwise
//-----------------------------------------------------------------------------

function dateMIRFormatParseRule(theDate)
{
	if (m_dateMIRFormatCode == "A")
	{
		return dateMIRFormatParseRule_A(theDate);
	}
	else
	{
		return dateMIRFormatParseRule_Common(theDate);
	}
}

//+----------------------------------------------------------------------------
//	Function:	dateMIRFormatParseRule_A
//
//	Description:	Rules used to validate a date type A, which is in
//			format "DDMMMYYY"
//
//	Arguments:	theDate a String represents the date to be validated
//
//	Returns:	true if the date is type A date, false otherwise
//-----------------------------------------------------------------------------

function dateMIRFormatParseRule_A(theDate)
{
	if (theDate.length == 9)
	{
		var yyyy = theDate.substr(5, 4);
		var mm;
		var month = theDate.substr(2, 3).toUpperCase();
		
		for (var i = 1; i <= 12; i++)
		{
			if (month == m_dateMonthsAbbr.substr((i-1)*3, 3))
			{
				mm = i; 
				break;
			}
		}
		
		var dd = theDate.substr(0, 2);
		if (validateYear(yyyy) && isInteger(yyyy) == true && 
			validateMonth(mm) && 
			validateDay(dd, mm, yyyy) && isInteger(dd)==true)
		{ 
			return true;
		}
	}
	return false;
}

//+----------------------------------------------------------------------------
//	Function:	dateMIRFormatParseRule_Common
//
//	Description:	Common rules used to validate date type B, C or D, which 
//			is in format "DDMMYYYY", "MMDDYYYY" or "YYYYMMDD"
//
//	Arguments:	theDate a String represents the date to be validated
//
//	Returns:	true if the date is type B, C or D date, false otherwise
//-----------------------------------------------------------------------------

function dateMIRFormatParseRule_Common(theDate)
{
	var dateTokens = theDate.split(m_dateMIRSeparator);
	if (dateTokens.length == 3)
	{
		var year = dateTokens[m_dateMIRFormatSequence[0]];
		if ((year.length != 4) || (isInteger(year) == false))
		{
			return false;
		}
		var yyyy = parseInt(year, 10);
		var month = dateTokens[m_dateMIRFormatSequence[1]];
		if (!m_dateMIRSuppressInd)
		{
			if ((month.length != 2) || (isInteger(month) == false))
			{
				return false;
			}
		}
		else
		{
			if ((month.length > 2) || (month.length == 0) || (isInteger(month) == false))
			{
				return false;
			}
		}
		var mm = parseInt(month, 10);
		var day = dateTokens[m_dateMIRFormatSequence[2]];
		if (!m_dateMIRSuppressInd)
		{
			if ((day.length != 2) || (isInteger(day) == false))
			{
				return false;
			}
		}
		else
		{
			if ((day.length > 2) || (day.length == 0) || (isInteger(day) == false))
			{
				return false;
			}
		}
		var dd = parseInt(day, 10);
		if (validateYear(yyyy) && validateMonth(mm) && validateDay(dd, mm, yyyy))
		{ 
			return true;
		}
	}
	return false;
}

//+----------------------------------------------------------------------------
//	Function:	getDateComponents
//
//	Description:	Parses date into year, month and day, and return the 
//			components.
//			The string passed in must be a valid date (A,B,C or D)  
//			in the appropriate format - make sure you've edited the  
//			date before calling them.
//			By default, taking parsing rules for date type B.
//
//	Arguments:	theDate a String represents the date to be parsed
//
//	Returns:	An array contains date components
//-----------------------------------------------------------------------------

function getDateComponents(theDate)
{
	if (m_dateMIRFormatCode == "A")
	{
		return getDateComponents_A(theDate);
	}
	else
	{
		return getDateComponents_Common(theDate);
	}
}

//+----------------------------------------------------------------------------
//	Function:	getDateComponents_A
//
//	Description:	Parses type A date into year, month and day, and return the 
//			components.
//			The string passed in must be a valid date in the 
//			appropriate format - make sure you've edited the date 
//			before calling them.
//
//	Arguments:	theDate a String represents the date to be parsed
//
//	Returns:	An array contains date components
//-----------------------------------------------------------------------------

function getDateComponents_A(theDate) {
	var ret = new Array(3);
	ret[0] = theDate.substr(5, 4);
	var month = theDate.substr(2, 3).toUpperCase();
	for (var i = 1; i <= 12; i++) {
		if (month == m_dateMonthsAbbr.substr((i-1)*3, 3)) {
			ret[1] = i; 
			break;
		}
	}
	
	ret[2] = theDate.substr(0, 2);
	return ret;
}

//+----------------------------------------------------------------------------
//	Function:	getDateComponents_Common
//
//	Description:	Parses type B, C or D date into year, month and day, and 
//			return the components.
//			The string passed in must be a valid date in the 
//			appropriate format - make sure you've edited the date 
//			before calling them.
//
//	Arguments:	theDate a String represents the date to be parsed
//
//	Returns:	An array contains date components
//-----------------------------------------------------------------------------

function getDateComponents_Common(theDate)
{
	var ret = new Array(3);
	var dateTokens = theDate.split(m_dateMIRSeparator);
	ret[0] = parseInt(dateTokens[m_dateMIRFormatSequence[0]], 10);
	ret[1] = parseInt(dateTokens[m_dateMIRFormatSequence[1]], 10);
	ret[2] = parseInt(dateTokens[m_dateMIRFormatSequence[2]], 10);
	return ret;
}

//+----------------------------------------------------------------------------
//	Function:	dateFormatRule
//
//	Description:	Formats a date type, which is in one of the date 
//			type A, B, C or D.
//			By default, taking the format rules for date type B.
//
//	Arguments:	theDate a String represents the date to be formatted
//
//	Returns:	The Date string that be formatted
//-----------------------------------------------------------------------------

function dateFormatRule(theDate)
{
	if (m_dateMIRFormatCode != null)
	{
		switch (m_dateMIRFormatCode)
		{
			case "A":
				return dateFormatRule_A(theDate);
			case "B":
				return dateFormatRule_B(theDate);
			case "C":
				return dateFormatRule_C(theDate);
			case "D":
				return dateFormatRule_D(theDate);
			default:
		}
	}

	// by default, formatting date using rules for type B

	return dateFormatRule_B(theDate);
}

//+----------------------------------------------------------------------------
//	Function:	dateFormatRule_A
//
//	Description:	Formats the type A date.
//
//	Arguments:	theDate a String represents the date to be formatted
//
//	Returns:	The Date string that be formatted
//-----------------------------------------------------------------------------

function dateFormatRule_A(theDate)
{
	if (isNaN(theDate.getDate()) || isNaN(theDate.getMonth()) || isNaN(theDate.getFullYear())) 
	{
		return ""; 
	}
	else 
	{
		return (padStringLeft(theDate.getDate().toString(), "0", 2) 
			+ m_dateMonthsAbbr.substr((theDate.getMonth())*3, 3) 
			+ theDate.getFullYear());
	}
}

//+----------------------------------------------------------------------------
//	Function:	dateFormatRule_B
//
//	Description:	Formats the type B date.
//
//	Arguments:	theDate a String represents the date to be formatted
//
//	Returns:	The Date string that be formatted
//-----------------------------------------------------------------------------

function dateFormatRule_B(theDate)
{
	if (isNaN(theDate.getDate()) || isNaN(theDate.getMonth()) || isNaN(theDate.getFullYear())) 
	{
		return "";
	}
	else 
	{
		return (padStringLeft(theDate.getDate().toString(), "0", 2) 
			+ m_dateMIRSeparator 
			+ padStringLeft((parseInt(theDate.getMonth(), 10) + 1).toString(), "0", 2) 
			+ m_dateMIRSeparator 
			+ theDate.getFullYear());
	}
}

//+----------------------------------------------------------------------------
//	Function:	dateFormatRule_C
//
//	Description:	Formats the type C date.
//
//	Arguments:	theDate a String represents the date to be formatted
//
//	Returns:	The Date string that be formatted
//-----------------------------------------------------------------------------

function dateFormatRule_C(theDate)
{
	if (isNaN(theDate.getDate()) || isNaN(theDate.getMonth()) || isNaN(theDate.getFullYear())) 
	{
		return ""; 
	}
	else 
	{
		return (padStringLeft((parseInt(theDate.getMonth(), 10) + 1).toString(), "0", 2) 
			+ m_dateMIRSeparator 
			+ padStringLeft(theDate.getDate().toString(), "0", 2) 
			+ m_dateMIRSeparator 
			+ theDate.getFullYear());
	}
}

//+----------------------------------------------------------------------------
//	Function:	dateFormatRule_D
//
//	Description:	Formats the type D date.
//
//	Arguments:	theDate a String represents the date to be formatted
//
//	Returns:	The Date string that be formatted
//-----------------------------------------------------------------------------

function dateFormatRule_D(theDate)
{
	if (isNaN(theDate.getDate()) || isNaN(theDate.getMonth()) || isNaN(theDate.getFullYear())) 
	{
		return ""; 
	}
	else 
	{
		return (theDate.getFullYear() 
			+ m_dateMIRSeparator 
			+ padStringLeft((parseInt(theDate.getMonth(), 10) + 1).toString(), "0", 2) 
			+ m_dateMIRSeparator 
			+ padStringLeft(theDate.getDate().toString(), "0", 2));
	}
}

//+----------------------------------------------------------------------------
//	Function:	getValidDateFormatMessage
//
//	Description:	Builds a string with the valid date format message based
//					on the current date format code. The sequence in which the
//					day, month or year are displayed and the separator used
//					are controlled by date format code and the values retrieved
//					from SIR fields for separator.
//
//	Arguments:	None
//
//	Returns:	The message string
//-----------------------------------------------------------------------------

function getValidDateFormatMessage()
{
	var month;

	// Special case for the A format
	if (m_dateMIRFormatCode == "A")
	{
		// msg: MMM
		month = getSystemMessage(msgMoA);
	}
	else
	{
		// msg: MM
		month = getSystemMessage(msgMo);
	}

	var texts = new Array(3);

	// Build the array with strings in the order provided by the date format
	// sequence, Year is at position 0, month at 1 and day at 2
	// msg: YYYY
	texts[m_dateMIRFormatSequence[0]] = getSystemMessage(msgYr);
	texts[m_dateMIRFormatSequence[1]] = month;
	// msg: DD
	texts[m_dateMIRFormatSequence[2]] = getSystemMessage(msgDy);

	var retVal = "";

	// Construct the message string
	for (var i = 0; i < 3; i++)
	{
		retVal += texts[i];
		if (i < 2)
		{
			retVal += m_dateMIRSeparator;
		}
	}
	return retVal;
}

//+----------------------------------------------------------------------------
//	Function:	validateDay
//
//	Description:	Validates a day in a month/year
//
//	Arguments:	theDay a string with the day to be validated
//				theMonth month to provide context for the validation
//				theYear year to provide context for the validation
//
//	Returns:	true if the day is valid, false otherwise
//-----------------------------------------------------------------------------

function validateDay(theDay, theMonth, theYear)
{

	var year = parseInt(theYear, 10);
	var day = parseInt(theDay, 10);

	if(isNaN(day) || isNaN(year))
	{
		return false;
	}

	// Must test for leap year and adjust m_maxDay[1] to 29 days for February
	if (isLeapYear(year))
	{
		m_maxDay[1] = 29;
	}
	else	
	{
		// Revert to 28 since the array is declared global
		m_maxDay[1] = 28;
	}
	
	// Assume that the month has been previously validated to be in [1, 12]
	// and substract 1 since the array index is 0 based	
	if (day <= 0 || day > m_maxDay[theMonth-1])
	{
		return false;
	}
	return true;
}

//+----------------------------------------------------------------------------
//	Function:	isLeapYear
//
//	Description:	Tests whether a year is leap or not
//
//	Arguments:	year an integer with the year to be tested
//
//	Returns:	true if a year is a leap year, false otherwise
//-----------------------------------------------------------------------------

function isLeapYear(year)
{
	if ((year % 400) == 0)
	{
		return true;
	}

	if ((year % 100) == 0)
	{
		return false;
	}

	return ((year % 4) == 0);
}

//+-----------------------------------------------------------------------------
//	Function:	setUILanguage
//
//	Description:	Sets the UI language to the language passed by the caller
//
//	Arguments:	aLanguage the new language. Valid languages are F, E, J and S. 
//			All other values for the aLanguage parameter will default to english
//
//	Returns:	Nothing
//-----------------------------------------------------------------------------

function setUILanguage(aLanguage)
{
	if ((aLanguage == "F") || (aLanguage == "S") || (aLanguage == "J") || (aLanguage == "E"))
	{
		m_currentLanguage = aLanguage;
	}
}

//+----------------------------------------------------------------------------
//	Function:	setDateMIRFormatCode
//
//	Description:	Sets date format code and format sequence used in 
//			working with dates.
//
//	Arguments:	dateMIRFormatCode the new format code. Should be one of
//			A, B, C or D
//
//	Returns:	None
//-----------------------------------------------------------------------------

function setDateMIRFormatCode(dateMIRFormatCode)
{
	// Arrays containing the possition of the day, month, and year for differrent date formats
	// The element at pos 0 in the array gives the number position of the year part in the string, 1 month and 2 day.
	//					(Y, M, D)       	   0 1  2
	var dateMIRFormatSequence_A =  [2, 1, 0];		// DDMMMYYY
	var dateMIRFormatSequence_B =  [2, 1, 0];		// DDMMYYYY
	var dateMIRFormatSequence_C =  [2, 0, 1];		// MMDDYYYY
	var dateMIRFormatSequence_D =  [0, 1, 2];		// YYYYMMDD


	if (dateMIRFormatCode != null)
	{
		m_dateMIRFormatCode = dateMIRFormatCode;
		switch (dateMIRFormatCode)
		{
			case "A":
				m_dateMIRFormatSequence = dateMIRFormatSequence_A;
				break;
			case "B":
				m_dateMIRFormatSequence = dateMIRFormatSequence_B;
				break;
			case "C":
				m_dateMIRFormatSequence = dateMIRFormatSequence_C;
				break;
			case "D":
				m_dateMIRFormatSequence = dateMIRFormatSequence_D;
				break;
			default:
				m_dateMIRFormatCode = "";
		}
	}
}

//+----------------------------------------------------------------------------
//	Function:	setDateMonthsAbbr
//
//	Description:	Sets the months abbreviations string received from the server.
//
//	Arguments:	monthsAbbr a string with the month abbreviations received
//				from the server. The string should look something like
//				JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC. The string's length
//				is assumed to be 36. Otherwise the parsing rule won't
//				work.
//
//	Returns:	None
//-----------------------------------------------------------------------------

function setDateMonthsAbbr(monthsAbbr)
{
	if ((monthsAbbr != null) && (monthsAbbr != "") && (monthsAbbr.length == 36))
	{
		m_dateMonthsAbbr = monthsAbbr;
	}
	else
	{
		m_dateMonthsAbbr = "JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC";
	}
}

//+----------------------------------------------------------------------------
//	Function:	setDateMIRSeparator
//
//	Description:	Sets the separator character for dates.
//
//	Arguments:	sep the new separator. It is expected that the separator
//				is one character long or for B, C and D and empty for A.
//
//	Returns:	None
//-----------------------------------------------------------------------------

function setDateMIRSeparator(sep)
{
	if (sep != null)
	{
		m_dateMIRSeparator = sep;
	}
}

//+----------------------------------------------------------------------------
//	Function:	setDateMIRSuppressInd
//
//	Description:	Sets the zero suppression indicator for dates
//
//	Arguments:	aInd the new indicator. Its values are true or false
//
//	Returns:	None
//-----------------------------------------------------------------------------

function setDateMIRSuppressInd(aInd)
{
	if ((aInd != null) && (aInd != ""))
	{
		if (aInd == "Y")
		{
			m_dateMIRSuppressInd = true;
		}
		else
		{
			m_dateMIRSuppressInd = false;
		}
	}
}

//+----------------------------------------------------------------------------
//	Function:	setCurrencyDecSeparator
//
//	Description:	Sets the currency decimal separator.
//
//	Arguments:	decSep the new decimals separator. Should not be empty.
//
//	Returns:	None
//-----------------------------------------------------------------------------

function setCurrencyDecSeparator(decSep)
{
	if ((decSep != null) && (decSep != ""))
	{
		m_currencyDecSeparator = decSep;
	}
}

//+----------------------------------------------------------------------------
//	Function:	setCurrency1000Separator
//
//	Description	Sets the thousands separator
//
//	Arguments:	thouSep the new thousands separator. Should not be empty.
//
//	Returns:	None
//-----------------------------------------------------------------------------

function setCurrency1000Separator(thouSep)
{
	if ((thouSep != null) && (thouSep != ""))
	{
		m_currency1000Separator = thouSep;
	}
	else if(thouSep == "") 
	{
		// problem where a blank is being stripped before we get this far so reset it
		m_currency1000Separator = " ";
	}
}

//+----------------------------------------------------------------------------
//	Function:	setCurrencySymbol
//
//	Description:	Sets the new currency symbol.
//
//	Arguments:	crcySymbol the new currency symbol. Should not be empty.
//
//	Returns:	None
//-----------------------------------------------------------------------------

function setCurrencySymbol(crcySymbol)
{
	if (crcySymbol != null)
	{
		m_currencySymbol = crcySymbol;
	}
}

//+----------------------------------------------------------------------------
//	Function:	setCurrencyPos
//
//	Description:	Sets the currency symbol position.
//
//	Arguments:	crcyPos the new currency symbol position. Should not be empty.
//
//	Returns:	None
//-----------------------------------------------------------------------------

function setCurrencyPos(crcyPos)
{
	if (crcyPos != null)
	{
		newVal = crcyPos.toUpperCase();

		// we only support L(eft) and R(ight)
		if ((newVal == "L") || (newVal == "R"))
		{
			m_currencyPos = newVal;
		}
	}
}

//+----------------------------------------------------------------------------
//	Function:	setCurrencyScale
//
//	Description:	Sets the currency scale used for formatting currency values.
//
//	Arguments:	crcyScale: the new currency scale value. Should not be empty.
//
//	Returns:	None
//-----------------------------------------------------------------------------

function setCurrencyScale(crcyScale)
{
	if ((crcyScale != null) && (crcyScale != ""))
	{
		var crcyScaleValue = parseInt(crcyScale, 10);

		if (isNaN(crcyScaleValue))
		{
			return;
		}
		m_currencyScale = crcyScaleValue;
	}
}

//+----------------------------------------------------------------------------
//	Function:	setDateISOInd
//
//	Description:	Sets the ISO date indicator - used to determine whether or
//				not date needs to be converted to ISO before sent to the host
//
//	Arguments:	aInd - the new indicator. Its values are true or false
//
//	Returns:	None
//-----------------------------------------------------------------------------

function setDateISOInd(aInd)
{
	m_dateISOInd = false;

	if (aInd == "Y")
	{
		m_dateISOInd = true;
	}
}

//+----------------------------------------------------------------------------
//	Function:	setCurrencySignPos
//
//	Description:	Sets the negative sign's position
//
//	Arguments:	negPos - the negative sign position string
//
//	Returns:	None
//-----------------------------------------------------------------------------

function setCurrencySignPos(negPos)
{
	if (negPos != null)
	{
		// we only support L(eft), R(ight) and B(racketed with parens)

		newVal = negPos.toUpperCase();

		if ((newVal == "L") || (newVal == "R") || (newVal == "B"))
		{
			m_currencySignPos = newVal;
		}
	}
}

//+----------------------------------------------------------------------------
//	Function:	setCurrencyRegExpFormattingChars
//
//	Description:	Sets the regular expressions used to format currencies
//
//	Arguments:	None
//
//	Returns:	None
//-----------------------------------------------------------------------------

function setCurrencyRegExpFormattingChars()
{
	// regular expression for percent symbol, possible negative signs, positive sign
	// and time separator
	sRegExp = "%|-|\\(|\\)|\\+|:";

	// If the currency symbol is the dollar symbol then it must be escaped since the 
	// dollar symbol is a special character in regexp.

	if (m_currencySymbol == "$") {
		sRegExp = sRegExp + "|\\$";
	} else if (m_currencySymbol != "") {
		sRegExp = sRegExp + "|\\" + m_currencySymbol;
	}

	// add thousands separator to regular expression
	sRegExp = sRegExp + "|\\" + m_currency1000Separator;

	m_currencyRegExpFormattingChars = new RegExp(sRegExp, "g");
}

//+----------------------------------------------------------------------------
//	Function:	formatDate(aDate)
//
//	Description:	Format a Date variable according to the current server
//				format rule
//
//	Arguments:	aDate - a Date variable
//
//	Returns:		Formatted date.
//-----------------------------------------------------------------------------

function formatDate(aDate)
{
	return dateFormatRule(aDate);
}

//+----------------------------------------------------------------------------
//	Function:	clearStatus()
//
//	Description:	Clears the status bar
//-----------------------------------------------------------------------------

function clearStatus()
{
	window.status = "";
}

//+----------------------------------------------------------------------------
//	Function:	cleanString(aString)
//
//	Description:	Removes leading and trailing spaces in a string.
//
//	Arguments:	the input string to be stripped.
//
//	Returns:	A string without leading and trailing spaces. A null
//				string will be changed to an empty string.
//-----------------------------------------------------------------------------

function cleanString(aString)
{
	if (aString == null)
	{
		return "";
	}

	spaceRegExp = /^\s{1,}|\s{1,}$/g;
	return aString.replace(spaceRegExp, "");
}

//+----------------------------------------------------------------------------
//	Function:	getPadString(aString, chr, length)
//
//	Description:	Get the String to be appended to.
//
//	Arguments:	aString - the input string.
//				chr - the character to be padded to the input string.
//				length - the length of the output string.
//
//	Returns:	A string of required padded character.
//-----------------------------------------------------------------------------

function getPadString(aString, chr, length)
{
	var s = "";
	if (length > aString.length)
	{
		var times = length - aString.length;
		for (var i = 0; i < times; i++)
		{
			s += chr;
		}
	}
	return s;
}

//-----------------------------------------------------------------------------
//Constants that define the different types of fields we support.
//-----------------------------------------------------------------------------

var STYPES = {
		Alphabetic:"Alphabetic",
		Currency:"Currency",
		Date:"Date",
		Day:"Day",
		Digit:"Digit",
		Hidden:"Hidden",
		ListIndicator:"ListIndicator",
		ListRadio:"ListRadio",
		Month:"Month",
		Number:"Number",
		Percent:"Percent",
		Selection:"Selection",
		Text:"Text",
		TextArea:"TextArea",
		Time:"Time",
		Year:"Year",
		EmperorDate:"EmperorDate",
		YesNo:"YesNo",
		YesNoUnanswered:"YesNoUnanswered"
}

//-----------------------------------------------------------------------------
// The Field object captures the characteristics of the field that fired an 
// event. Usually an instance of this "class" is created in a function that 
// handles an event like onblur or onkeypress.
//
// Arguments: theField the source field (actually the HTML tag)
//-----------------------------------------------------------------------------

function Field(theField) {
	this.field = theField;
	
	this.sType = this.getAttributeValue("SType");
}

Field.prototype.getName = function(){
	return this.getAttributeValue("name");
}

Field.prototype.getMaxLength =  function() {
	// Retrieves the maximum allowed length for a field
	
	var maxLength = this.getAttributeValue("eLength");
	if (null != maxLength) {
		// make sure we get a number back
		var ret = parseInt(maxLength, 10);
		if (isNaN(ret))	{
			return 0;
		}

		// if the field is a currency, adjust field size according to the scaling rules

		var decimals = this.getDecimals();
		if (this.getType() == STYPES.Currency) {
			if (this.getAttributeValue("Decimals") == null) {
				if (decimals == 0) {
					ret = ret - 2;
				} else {
					if (decimals == 1) {
						ret = ret - 1;
					}
				}
			}
		}

		// if there could be a decimal separator, increase the length by one
		if (decimals != 0) {
			ret = ret + 1;
		}
		
		return ret;
	}

	// assume values for certain types of fields
	if (this.isYear()) {
		return 4;
	}

	if (this.isMonth())	{
		return 2;
	}

	if (this.isDay()) {
		return 2;
	}

	if (this.isTime()) {
		return 6;
	}

	return 0;
}

Field.prototype.getAttributeValue = function(attributeName) {
	return this.field.getAttribute(attributeName);
}

Field.prototype.setAttributeValue = function(attribute) {
	this.field.setAttribute(anAttribute);
}

Field.prototype.setValue = function(newValue) {
	if (!this.isDisplayOnly())	{
		return this.field.value = newValue;
	} else {
		this.field.innerText = newValue;
	}
}

Field.prototype.getValue = function() {
	if (this.isDisplayOnly()) {
		return this.getInnerText();
	} else {
		return this.field.value;
	}
}

Field.prototype.getInnerText = function() {
	return this.field.innerText;
}

Field.prototype.getId = function() {
	return this.field.getAttribute("id");
}

Field.prototype.isMandatory = function() {
	if (this.getAttributeValue("mandatory") == "yes") {
		return true;
	}
	
	return false;
}

Field.prototype.getType = function() {
	return this.sType;
}

Field.prototype.isDisplayOnly = function() {
	var displayOnly = this.getAttributeValue("DisplayOnly");
	if (displayOnly != null && displayOnly == "yes") {
		return true;
	}
	
	return false;
}

Field.prototype.isCurrency = function() {
	return this.sType == STYPES.Currency;
}

Field.prototype.isText = function() {
	return this.sType == STYPES.Text;
}

Field.prototype.isTextArea = function() {
	return this.sType == STYPES.TextArea;
}

Field.prototype.isDate = function() {
	return this.sType == STYPES.Date;
}

Field.prototype.isDay = function() {
	return this.sType == STYPES.Day;
}

Field.prototype.isMonth = function() {
	return this.sType == STYPES.Month;
}

Field.prototype.isYear = function() {
	return this.sType == STYPES.Year;
}

Field.prototype.isTime = function() {
	return this.sType == STYPES.Time;
}

Field.prototype.isDigit = function() {
	return this.sType == STYPES.Digit;
}

Field.prototype.isEmperorDate = function() {
	return this.sType == STYPES.EmperorDate;
}

Field.prototype.isYesNo = function() {
	return this.sType == STYPES.YesNo;
}

Field.prototype.isYesNoUa = function() {
	return this.sType == STYPES.YesNoUnanswered;
}

Field.prototype.isNumber = function() {
	return this.sType == STYPES.Number;
}

Field.prototype.isSelectionBox = function() {
	return this.sType == STYPES.Selection;
}

Field.prototype.isPercent = function() {
	return this.sType == STYPES.Percent;
}

Field.prototype.isAlphabetic = function() {
	return this.sType == STYPES.Alphabetic;
}

Field.prototype.isSigned = function() {
	// Should the numeric field should allow negative numbers
	if (this.getAttributeValue("Signed") == "yes") {
		return true;
	}
	
	return false;
}

Field.prototype.getDecimals = function() {
	var decimals = this.field.getAttribute("Decimals");
	if (null != decimals) {
		// make sure we get a number back
		var ret = parseInt(decimals, 10);
		if (isNaN(ret)) {
			return 0;
		} else {
			return ret;
		}
	}

	if (this.getType() == STYPES.Currency) {
		return m_currencyScale;
	}
	
	return 0;
}

//-----------------------------------------------------------------------------
// Return the value of the field after formatting it the way the INGENIUM
// server wants to receive it.  For example, dates are converted to the
// appropriate INGENIUM date format.  If the field doesn't have a valid 
// value then null is returned.
//-----------------------------------------------------------------------------

Field.prototype.getServerValue = function() {
	if (this.isValid() == false) {
		return null;
	}
	
	switch(this.getType()) {
	case STYPES.EmperorDate:
	case STYPES.Date:
		return getServerDateValue(this);

	case STYPES.Currency:
	case STYPES.Number:
	case STYPES.Percent:
		return getServerNumberValue(this);

	case STYPES.Year:
		if (isValidYear(this) == false) {
			return null;
		}

		return getServerNumberValue(this);

	case STYPES.Month:
		if (isValidMonth(this) == false) {
			return null;
		}

		return getServerNumberValue(this);

	case STYPES.Day:
		if (isValidDay(this) == false) {
			return null;
		}

		return getServerNumberValue(this);

	case STYPES.YesNo:
	case STYPES.YesNoUnanswered:
		// YesNo and YesNoUa fields have multiple input elements with
		// the same name. We need to check each one to find the one that's
		// checked and use its value.

		var value = "";
		
		var controls = document.getElementsByName(field.getName());
		
		for (var count = 0; count < controls.length; ++count) {
			var control = controls[count];
			if (control.checked == true) {
				value = control.value;
				break;
			}
		}

		return value;

	default:
		if (this.field.type == "checkbox") {
			if (this.field.checked) {
				return "Y";
			} else {
				return "N";
			} 
		}

		return this.getValue();
	}
}

//-----------------------------------------------------------------------------
// Is the value of the field valid for the type of field?  Returns true if
// the value is valid or false if not.
//-----------------------------------------------------------------------------

Field.prototype.isValid = function() {
	switch(this.getType()) {
	case STYPES.Date:
		return isValidDate(this);
	case STYPES.Year:
		return isValidYear(this);
	case STYPES.Month:
		return isValidMonth(this);
	case STYPES.Day:
		return isValidDay(this);
	case STYPES.Time:
		return isValidTime(this);
	case STYPES.EmperorDate:
		return isValidEmperorDate(this);
	default:
		return true;
	}
}

//+----------------------------------------------------------------------------
//	Class:		TextAreaLengthCheck
//
//	Description:	Check for maxLength allowed for textArea
//-----------------------------------------------------------------------------

function TextAreaLengthCheck()
{
	// create this field
	var thisField = new Field(window.event.target);

	var inputString = thisField.getValue();
	var maxLength = thisField.getAttributeValue("maxLength");

	if (inputString.length >= maxLength)
	{
		// msg: TextArea Input too long
		window.event.preventDefault();
		window.status = getSystemMessage(msgTextAreaInputTooLong) + maxLength;
	}
	else
	{
		window.status = "";
	}
}

//+----------------------------------------------------------------------------
//	Class:		AlphaKeyCheck
//
//	Description:	Check for valid alpha input character; a-z, A-Z is allowed
//-----------------------------------------------------------------------------

function AlphaKeyCheck()
{
	// Check for invalid character
	var inputChr = window.event.keyCode;

	// A = 65, Z = 90, a = 07, z = 122
	if ((inputChr >= 65 && inputChr <= 90) || (inputChr >= 97 && inputChr <= 122))
	{
		window.status = "";
	}
	else
	{
		// msg: Input must be alphabetic (a-z, A-Z)
		window.event.preventDefault();
		window.status = getSystemMessage(msgValidAlpha);
	}
}

//+----------------------------------------------------------------------------
//	Class:		SimpleNumericKeyCheck
//
//	Description:	Check for valid currency input character; only 0-9 is allowed
//-----------------------------------------------------------------------------

function SimpleNumericKeyCheck()
{
	// Check for invalid character
	var inputChr = window.event.keyCode;
	
	if ((inputChr < 48) || (inputChr > 57))
	{
		// msg: Input must contain only 0 - 9
		window.event.preventDefault();
		window.status = getSystemMessage(msgValidSimplNumericFrmt);
	}
	else
	{
		window.status = "";
	}
}

//+----------------------------------------------------------------------------
//	Class:		NumberKeyCheck (shared by both currency and numeric)
//
//	Description:	Checks for valid numeric/currency input characters with decimal
//				places and sign option
//
//	Attributes:	decimals=n
//				n is the number of decimal place
//				signed=boolean
//				indicate whether the numeric is signed or not
//-----------------------------------------------------------------------------

function NumberKeyCheck()
{
	// create this field
	var thisField = new Field(window.event.target);

	var inputString = thisField.getValue();
	var decimals = thisField.getDecimals();
	var signed = thisField.isSigned();
	var inputChr = window.event.keyCode;
	var separator = m_currencyDecSeparator.charCodeAt(0);

	// strip out formatting characters before calculating number of characters that have been entered
	var len = inputString.replace(m_currencyRegExpFormattingChars, "").length;

	var selectionLen = document.activeElement.selectionStart - document.activeElement.selectionEnd;

	// Check total length only if user is in "cursor mode";
	// if there is a selection, should allow key press to overwrite the selection
	var maxLength = thisField.getMaxLength();

	// if elength == decimals, we should allow one extra char to be entered
	if (maxLength == (decimals+1))
	{
		maxLength++;
	}

	if ((selectionLen == 0) && (len >= maxLength))
	{
		window.event.preventDefault();
	}

	var decimalLength = 0;

	if (decimals > 0)
	{
		decimalLength = decimals + 1;
	}

	// Check for number of digits to the left of the decimal point
	if ((len == (thisField.getMaxLength() - decimalLength)) 
		&& (inputChr != separator) 
		&& (selectionLen == 0))
	{
		// if there isn't already a decimal point, that's all they can enter now
		if (inputString.indexOf(m_currencyDecSeparator) == -1)
		{
			window.event.preventDefault();
		}
	}

	if (signed && decimals > 0)
	{
		if ((inputChr < 48 || inputChr > 57) 
			&& (inputChr != separator && inputChr != 43 && inputChr != 45))
		{
			window.event.preventDefault();
		}
	}
	else if (!signed && decimals > 0)
	{
		if ((inputChr < 48 || inputChr > 57) && inputChr != separator)
		{
			window.event.preventDefault();
		}
	}
	else if (signed && decimals == 0)
	{
		if ((inputChr < 48 || inputChr > 57) 
			&& (inputChr != 43 && inputChr != 45))
		{
			window.event.preventDefault();
		}
	}
	else
	{
		if (inputChr < 48 || inputChr > 57)
		{
			window.event.preventDefault();
		}
	}
}

//+----------------------------------------------------------------------------
//  Class:		NumberFormat
//
//  Description:	Format a number/currency/percent input string
//
//  Input:		aField - number to format as a Field object
//-----------------------------------------------------------------------------

function NumberFormat(aField)
{
	var work = cleanString(aField.getValue());

	// Are we negative?
	regexp = new RegExp("\\-|\\(|\\)");
	isNegative = work.search(regexp);

	// Strip out the formatting
	work = work.replace(m_currencyRegExpFormattingChars, "");

	// Strip out leading zeros
	regExpLeadingZeros = /^0*/g;
	work = work.replace(regExpLeadingZeros, "");
	
	// format for decimals
	var decimals = aField.getDecimals();
	if (decimals != 0)
	{
		var decPos = work.indexOf(m_currencyDecSeparator);
		if (decPos == -1)
		{
			// no separator entered, so need to pad
			var padded = m_currencyDecSeparator;
			for (var i = 0; i < decimals; i++)
			{
				padded += "0";
			}

			var firstIndex = work.length - (aField.getMaxLength() - padded.length);
			if (firstIndex < 0)
			{
				work = work + padded;
			}
			else
			{
				work = work.substr(firstIndex) + padded;
			}
		}
		else
		{
			var decPortion = work.substr(decPos);

			// if there is another decimal point, get rid of it (and everything after it)
			var dec2Pos = decPortion.indexOf(m_currencyDecSeparator, 1);
			if (dec2Pos > 0)
			{
				decPortion = decPortion.substr(0, dec2Pos);
			}

			var intPortion = work.substr(0, decPos);
			decPortion = padStringRight(decPortion, "0", parseInt(decimals, 10) + 1)
			decPortion = decPortion.substr(0, parseInt(decimals, 10) + 1);
			var diff = aField.getMaxLength() - decPortion.length;
			if (intPortion.length > diff)
			{
				intPortion = intPortion.substring(intPortion.length - parseInt(diff, 10));
			}
			work = intPortion + decPortion;
		}
	}
	else
	{
		// strip off any decimals that might have been entered
		var decPos = work.indexOf(m_currencyDecSeparator);
		if (decPos >= 0)
		{
			work = work.substr(0, decPos);		
		}
	}

	// add back a zero if necessary
	if (work == "")
	{
		work = "0";
	}
	else if (work.lastIndexOf(m_currencyDecSeparator) == 0)
	{
		work = "0" + work;
	}

	// Add 1000's separators

	var decPos = work.lastIndexOf(m_currencyDecSeparator);
	var intPortion = work;
	var decPortion = "";

	if (decPos != -1)
	{
		decPortion = work.substr(decPos);
		intPortion = work.substr(0, decPos);
	}

	var pos = intPortion.length - 3;

	while (pos > 0)
	{
		intPortion = intPortion.substr(0, pos) 
				+ m_currency1000Separator 
				+ intPortion.substr(pos);
		pos = pos - 3;
	}

	work = intPortion + decPortion;

	// Format for currency symbol
	if (aField.isCurrency())
	{
		// add currency symbol in the appropriate spot
		if (m_currencyPos == "L")
		{
			work = m_currencySymbol + work;
		}
		else if (m_currencyPos == "R")
		{
			work = work + m_currencySymbol;
		}
	}
	else if (aField.isPercent())
	{
		// Format for percent symbol
		work = work + "%";
	}

	// Format for negative sign
	if (aField.isSigned() && isNegative >= 0)
	{
		if (m_currencySignPos == "L")
		{
			work = "-" + work;
		}
		else if (m_currencySignPos == "R")
		{
			work = work + "-";
		}
		else if (m_currencySignPos == "B")
		{
			work = "(" + work + ")";
		}
	}

	return work;
}

//+----------------------------------------------------------------------------
//  	Class:		DateFormat
//
//	Description:	Used to validate a date against the format requested by the
//				server.
//-----------------------------------------------------------------------------

function DateFormat()
{
	// Define the process field variable
	var thisField = null;

	// Define member variables
	var numArgs = arguments.length;

	if (numArgs == 0)
	{
		thisField = new Field(window.event.target);
	}
	else
	{
		thisField = new Field(arguments[0]);
	}
	
	// Spaces at the beginning of a date string are causing problems on the server
	// so cleanString is used to clean them up.	
	var inputString = cleanString(thisField.getValue());

	// A * character is accepted
	if (inputString == "*")
	{
		setAssociatedEmperorDate(inputString, thisField);	
		thisField.setValue(inputString);
		return true;
	}

	// Validate whatever the user typed
	if (inputString != "")
	{	
		if (!dateMIRFormatParseRule(inputString))
		{
			window.getSelection().removeAllRanges();

			// msg: Valid format: DDMMMYYYY
			window.status = getSystemMessage(msgValidDtFrmt) +
							getValidDateFormatMessage();

			// msg: Invalid date format or date: XXXXXXXXX
			window.alert(getSystemMessage(msgInvaldDt) + inputString);
			setAssociatedEmperorDate("*", thisField);
			return false;
		}
	}

	setAssociatedEmperorDate(inputString, thisField);	
	
	// Set the value back in the field because the cleanString call above may have eliminate the
	// blanks from the date typed by the user.
	thisField.setValue(inputString.toUpperCase());
	return true;
}


//-----------------------------------------------------------------------------
// Get a date value in the servers required format.
//-----------------------------------------------------------------------------

function getServerDateValue(dateField) {
	var dateString = cleanString(dateField.getValue());

	if (m_dateISOInd == false) {
		return dateString;
	}

	if (dateString == "" || dateString == "*") {
		return dateString
	}

	var dateComponents = getDateComponents(dateString);

	return dateComponents[0] + "-" + 
		padStringLeft(dateComponents[1].toString(), "0", 2) + "-" + 
		padStringLeft(dateComponents[2].toString(), "0", 2);
}

//-----------------------------------------------------------------------------
// Get a number value in the servers required format.  
//-----------------------------------------------------------------------------

function getServerNumberValue(numberField) {
	var work = numberField.getValue();
	var maxLength = numberField.getMaxLength();
	
	// are we negative?

	var regexp = new RegExp("\\-|\\(|\\)");

	isNegative = work.search(regexp);

	// strip out all the formatting characters

	work = work.replace(m_currencyRegExpFormattingChars, "");

	// convert the decimal separator to Period

	work = work.replace(m_currencyDecSeparator, ".");

	// if the length of this string is greater than the maxLength and there's a leading zero
	// then we need to strip out the leading zero
	
	if (work.length > maxLength && work.indexOf("0") == 0) {
		work = work.substr(1);
	}

	// pad with leading zeros

	if (isNegative >= 0) {
		return "-" + padStringLeft(work, "0", maxLength - 1);
	} else {
		return padStringLeft(work, "0", maxLength);
	}
}

//-----------------------------------------------------------------------------
// Does the Field object passed in contain a valid date?
// Returns true or false
//-----------------------------------------------------------------------------

function isValidDate(dateField) {
	if (dateField.getType() != STYPES.Date) {
		return false;
	}
	
	// Spaces at the beginning of a date string are causing problems on the server
	// so cleanString is used to clean them up.
	
	var inputString = cleanString(dateField.getValue());

	// A * character is accepted on INGENIUM
	
	if (inputString == "*")	{
		return true;
	}

	// Validate whatever the user typed
	
	if (inputString != "") {	
		return dateMIRFormatParseRule(inputString);
	}
	
	// An empty date will be considered valid
	
	return true;
}

//-----------------------------------------------------------------------------
//Does the Field object passed in contain a valid Emperor date?
//Returns true or false
//-----------------------------------------------------------------------------

function isValidEmperor(dateField) {
	if (dateField.getType() != STYPES.EmperorDate) {
		return false;
	}

	// get all the components of the emperor date
	var ctls = getEmperorDateComponents(ctl);
	if (ctls == null) {
		return false;
	}

	if (ctls.length != 4) {
		return false;
	}

	// a blank emperor is ok if all the other emperor components are blank
	if (ctls[0] == "") {
		if (ctls[1] == "" && ctls[2] == "" && ctls[3] == "") {
			return true;
		}
	}

	var i;

	// get emperor index
	for (i = emperors - 1; i >= 0; i--) {
		if (ctls[0] == emperorCodes[i]) {
			break;
		}
	}

	if (i < 0) {
		// Unknown emperor.
		return false;
	}

	// edit duration
	var nDur = parseInt(ctls[1], 10);
	if (isNaN(nDur))    {
		return false;
	}

	if (nDur <= 0)  {
		return false;
	}

	if (nDur > emperorDurs[i]) {
		// Duration is invalid for Emperor.
		return false;
	}

	// calculate gregorian year
	var nYear = emperorStartDates[i].getFullYear() + nDur - 1;

	// edit month
	var nMonth = parseInt(ctls[2], 10);
	if (isNaN(nMonth)) {
		return false;
	}

	if (nMonth < 1 || nMonth > 12) {
		return false;
	}

	// edit day
	var nDay = parseInt(ctls[3], 10);
	if (isNaN(nDay)) {
		return false;
	}

	if (validateDay(nDay, nMonth, nYear) == false) {
		// Day is invalid for month and year.
		return false;
	}

	aDate = new Date(nYear, nMonth - 1, nDay);

	// check that date is not before start of reign
	if (nDur == 1) {
		if (aDate < emperorStartDates[i]) {
			//  Month and day preceed start of emperor's reign.
			return false;
		}
	}

	// check that date is not after end of reign (last emperor is presumed to still be alive)
	if (nDur == emperorDurs[i] && i < (emperors - 1)) {
		if (aDate >= emperorStartDates[i + 1]) {
			//  Month and day exceed end of emperor's reign.
			return false;
		}
	}

	return true
}

//-----------------------------------------------------------------------------
// Does the Field object passed in contain a valid year?
// Returns true or false
//-----------------------------------------------------------------------------

function isValidYear(yearField) {
	if (yearField.getType() != STYPES.Year) {
		return false;
	}

	var inputString = cleanString(yearField.getValue());
	if (inputString == "") {	
		return true;
	}

	var nYear = parseInt(inputString, 10);

	if (isNaN(nYear)) {
		return false;
	}

	// range checking
	if (nYear != 0) {
		if ((nYear < 1800) || (nYear > 2100)) {
			return false;
		}
	}

	return true;
}

//-----------------------------------------------------------------------------
// Does the Field object passed in contain a valid month?
// Returns true or false
//-----------------------------------------------------------------------------

function isValidMonth(monthField) {
	if (monthField.getType() != STYPES.Month) {
		return false;
	}

	var inputString = cleanString(monthField.getValue());
	if (inputString == "") {	
		return true;
	}

	var month = parseInt(inputString, 10);
	if (isNaN(month)) {
		return false;
	}

	if (month < 0 || month > 12) {
		return false;
	}

	return true;
}

//-----------------------------------------------------------------------------
// Does the Field object passed in contain a valid day?
// Returns true or false
//-----------------------------------------------------------------------------

function isValidDay(dayField) {
	if (dayField.getType() != STYPES.Day) {
		return false;
	}

	var inputString = cleanString(dayField.getValue());
	if (inputString == "") {	
		return true;
	}

	var day = parseInt(inputString, 10);
	if (isNaN(day)) {
		return false;
	}

	if (day < 0 || day > 31) {
		return false;
	}

	return true;
}

//-----------------------------------------------------------------------------
// Does the Field object passed in contain a valid time?
// Returns true or false
//-----------------------------------------------------------------------------

function isValidTime(timeField) {
	if (timeField.getType() != STYPES.Time) {
		return false;
	}

	var time = cleanString(thisField.getValue());
	if (time == "") {	
		return true;
	}

	// parse into hours, minutes and seconds

	var hours = 0;
	var minutes = 0;
	var seconds = 0;

	var components = time.split(":");

	if (components.length == 1) {
		// no colons in input, parse based on position

		hours = parseInt(time.substr(0, 2), 10);
		if (time.length > 2) {
			minutes = parseInt(time.substr(2, 2), 10);
		}
		
		if (time.length > 4) {
			seconds = parseInt(time.substr(4), 10);
		}
	} else {
		if (components.length > 2) {
			seconds = parseInt(components[3], 10);
		}

		minutes = parseInt(components[2], 10);

		hours = parseInt(components[1], 10);
	}

	if (isNaN(hours) || isNaN(minutes) || isNaN(seconds) ) {
		return false;
	}

	if (hours < 0 || hours > 23) {
		return false;
	}

	if (minutes < 0 || minutes > 59) {
		return false;
	}

	if (seconds < 0 || seconds > 59) {
		return false;
	}

	return true;
}

//+----------------------------------------------------------------------------
//	Class:		setAssociatedEmperorDate(value, field)
//
//	Description:	sets the fields of an emperor date associated with a date
//				field
//
//	Arguments:	value - date as a string in input format (date should be
//				validated already)
//				field - field that has (or might have) an associated
//				emperor date.
//-----------------------------------------------------------------------------

function setAssociatedEmperorDate(value, field)
{
	// is there an associated emperor date?
	var dateCtlName = field.getAttributeValue("emperorDate");
	if (dateCtlName == null)
	{
		return;
	}

	var dateCtl = document.getElementsByName(dateCtlName);
	if (dateCtl == null)
	{
		return;
	}

	// is date being blanked out
	if (value == "*" || value == "")
	{
		dateCtl[0].value = "";
		dateCtl[1].value = "";
		dateCtl[2].value = "";
		dateCtl[3].value = "";
		return;
	}
	
	// set the associated emperor date field
	var dateComponents = getDateComponents(value);
	var aDate = new Date(dateComponents[0], dateComponents[1] - 1, dateComponents[2]);
	var emperorDate = toEmperorDate(aDate);
		
	// the following code assumes the 4 components of the emperor date have the 
	// same name (allowing us to access them as an array).
	dateCtl[0].value = emperorDate[0];
	dateCtl[1].value = emperorDate[1];
	dateCtl[2].value = emperorDate[2];
	dateCtl[3].value = emperorDate[3];
}

//+----------------------------------------------------------------------------
//	Class:		YearFormat
//
//	Description:	Validates and formats a year object
//-----------------------------------------------------------------------------

function YearFormat()
{
	// Define the process field variable
	var thisField = null;

	// Define member variables
	var numArgs = arguments.length;
	if (numArgs == 0)
	{
		thisField = new Field(window.event.target);
	}
	else
	{
		thisField = new Field(arguments[0]);
	}

	var inputString = cleanString(thisField.getValue());

	if(inputString == "")
	{	
		return true;
	}

	var nYear = parseInt(inputString, 10);

	// should be numeric, but just in case
	if (isNaN(nYear))
	{
		// msg: Invalid year: 9999
		window.alert(getSystemMessage(msgInvaldYr) + inputString);
		return false;
	}

	// range checking
	if (nYear != 0)
	{
		if ((nYear < 1800) || (nYear > 2100))
		{
			// msg: Invalid year: 9999
			window.alert(getSystemMessage(msgInvaldYr) + inputString);
			return false;
		}
	}

	return true;
}

//+----------------------------------------------------------------------------
//  	Class:		MonthFormat
//
//	Description:	Validates and formats a month object
//-----------------------------------------------------------------------------

function MonthFormat()
{
	// Define the process field variable
	var thisField = null;

	//Define member variables
	var numArgs = arguments.length;
	if (numArgs == 0)
	{
		thisField = new Field(window.event.target);
	}
	else
	{
		thisField = new Field(arguments[0]);
	}

	var inputString = cleanString(thisField.getValue());

	if(inputString == "")
	{	
		return true;
	}

	var nMonth = parseInt(inputString, 10);

	// should be numeric, but just in case
	if (isNaN(nMonth))
	{
		// msg: Invalid month - should be blank or 0-12:
		window.alert(getSystemMessage(msgInvaldMo) + inputString);
		return false;
	}

	// range checking
	if (nMonth < 0 || nMonth > 12)
	{
		// msg: Invalid month - should be blank or 0-12:
		window.alert(getSystemMessage(msgInvaldMo) + inputString);
		return false;
	}

	// Remove leading zeros
	var fieldName = thisField.getName();
	document.getElementById(fieldName).value = nMonth.toString();

	return true;
}

//+----------------------------------------------------------------------------
//	Class:		DayFormat
//
//	Description:	Validates and formats a day object
//-----------------------------------------------------------------------------

function DayFormat()
{
	// Define the process field variable
	var thisField = null;

	//Define member variables
	var numArgs = arguments.length;

	if (numArgs == 0)
	{
		thisField = new Field(window.event.target);
	}
	else
	{
		thisField = new Field(arguments[0]);
	}

	var inputString = cleanString(thisField.getValue());

	if (inputString == "")
	{	
		return true;
	}

	var nDay = parseInt(inputString, 10);

	// should be numeric, but just in case
	if (isNaN(nDay))
	{
		// msg: Invalid day - should be blank or 0-31:
		window.alert(getSystemMessage(msgInvaldDy) + inputString);
		return false;
	}

	// range checking
	if (nDay < 0 || nDay > 31)
	{
		// msg: Invalid day - should be blank or 0-31:
		window.alert(getSystemMessage(msgInvaldDy) + inputString);
		return false;
	}

	// Remove leading zeros
	var fieldName = thisField.getName();
	document.getElementById(fieldName).value = nDay.toString();

	return true;
}

//+----------------------------------------------------------------------------
//	Class:		TimeFormat
//
//	Description:	Validates and formats a Time object
//-----------------------------------------------------------------------------

function TimeFormat()
{
	// Define the process field variable
	var thisField = null;

	//Define member variables
	var numArgs = arguments.length;

	if (numArgs == 0)
	{
		thisField = new Field(window.event.target);
	}
	else
	{
		thisField = new Field(arguments[0]);
	}

	var inputString = cleanString(thisField.getValue());

	if(inputString == "")
	{	
		return true;
	}

	var work = inputString;

	// parse into hours, minutes and seconds
	var hours = 0;
	var mins = 0;
	var secs = 0;
	var nColon = work.search(/:/);

	// first character is a colon
	if (nColon == 0)
	{
		// strip off the leading colon
		work = work.substr(1);
	}
	else if (nColon > 0)
	{
		// there is a colon somewhere in the input - hours will be characters before colon

		hours = parseInt(work.substring(0, nColon), 10);

		// strip off everything up to and including colon
		work = work.substr(nColon + 1);
	}
	else
	{
		// no colons in input, parse based on position

		hours = parseInt(work.substr(0, 2), 10);
		
		if (work.length > 2)
		{
			mins = parseInt(work.substr(2, 2), 10);
		}
		
		if (work.length > 4)
		{
			secs = parseInt(work.substr(4), 10);
		}
		
		// we're done, clear work variable
		work = "";
	}

	// check for a second colon - if found, minutes will be everything before colon
	nColon = work.search(/:/);
	if (nColon == 0)
	{
		// strip off the leading colon
		work = work.substr(1);
	}
	else if (nColon > 0)
	{
		mins = parseInt(work.substring(0, nColon), 10);
		work = work.substr(nColon + 1);
	}
	else
	{
		// no more colons - extract minutes
		if (work != "")
		{
			mins = parseInt(work, 10);
			work = "";
		}
	}

	if (work != "")
	{
		secs = parseInt(work, 10);
	}

	// validation and range checking
	if (isNaN(hours) || isNaN(mins) || isNaN(secs) 
		|| hours < 0 || hours > 23 || mins < 0 
		|| mins > 59 || secs < 0 || secs > 59)
	{
		if (thisField.getMaxLength() == 4)
		{
			// msg: Invalid time - should be HHMM -
			window.alert(getSystemMessage(msgInvaldTime4) + inputString);
		}
		else
		{
			// msg: Invalid time - should be HHMMSS -
			window.alert(getSystemMessage(msgInvaldTime) + inputString);
		}
		return false;
	}

	// format for display
	var fieldName = thisField.getName();
	if (thisField.getMaxLength() == 4)
	{
		document.getElementById(fieldName).value = padStringLeft(hours.toString(), "0", 2) 
					+ ":" + padStringLeft(mins.toString(), "0", 2);
	}
	else
	{
		document.getElementById(fieldName).value = padStringLeft(hours.toString(), "0", 2) 
					+ ":" + padStringLeft(mins.toString(), "0", 2) 
					+ ":" + padStringLeft(secs.toString(), "0", 2);
	}

	return true;
}

//+----------------------------------------------------------------------------
//	Function:	convertToMIRTime(aString)
//
//	Description:	Format a time string (HH:MM:SS or HH:MM) to the MIR
//				format (HHMMSS or HHMM)
//				This function is typically called on the submit event to
//				convert all the user-friendly format to MIR format
//
//	Arguments:	a string representing a time
//-----------------------------------------------------------------------------

function convertToMIRTime(aString)
{
	return aString.replace(/:/g, "");
}

//+----------------------------------------------------------------------------
//	Function:	convertToMIRNumber(aString, maxLength)
//
//	Description:	Format a UI display number string (-1,234,567.89) to the MIR
//				format (-001234567.89) of maxLength and convert the
//				decimal separator to Period 
//				This function is typically called on the submit event to
//				convert all the user-friendly format to MIR format
//
//	Arguments:	a string representing the UI display of the number
//				the maximum length of the field
//-----------------------------------------------------------------------------

function convertToMIRNumber(aString, maxLength)
{
	var work = aString;
	
	// are we negative?
	regexp = new RegExp("\\-|\\(|\\)");
	isNegative = work.search(regexp);

	// strip out all the formatting characters
	work = work.replace(m_currencyRegExpFormattingChars, "");

	// convert the decimal separator to Period
	work = work.replace(m_currencyDecSeparator, ".");

	// if the length of this string is greater than the maxLenght and there's a leading zero
	// then we need to strip out the leading zero
	
	if (work.length > maxLength && work.indexOf("0") == 0)
	{
		work = work.substr(1);
	}

	// pad with leading zeros
	if (isNegative >= 0)
	{
		return "-" + padStringLeft(work, "0", maxLength - 1);
	}
	else
	{
		return padStringLeft(work, "0", maxLength);
	}
}

//+----------------------------------------------------------------------------
//	Function:	convertToMIRCheckBox(ctl)
//
//	Description:	A checkbox on an HTML form will only send a value back to
//			the server if the checkbox is checked. We need to always
//			send a value back. So, if the checkbox is checked, this
//			function just returns. If the checkbox is not checked
//			though, we change the value attribute of the check box and
//			then check it!
//
//			This function is typically called on the submit event to
//			convert all the user-friendly format to MIR format
//
//	Arguments:	  the checkbox object
//-----------------------------------------------------------------------------

function convertToMIRCheckBox(ctl)
{
	// check box is checked, we don't have to do anything
	if (ctl.checked)
		return;

	// check box is not checked, see if an "uncheckedValue" attribute
	// was specified
	var uncheckedValue = "N";
	if (ctl.getAttribute("uncheckedValue") != null)
	{
		uncheckedValue = ctl.getAttribute("uncheckedValue");
	}

	// change check box's value attribute to the unchecked value
	ctl.value = uncheckedValue;

	// check the check box since if it isn't checked, its value will not be sent
	ctl.checked = true;
}

//+----------------------------------------------------------------------------
//	Function:	validateField(theField)
//
//	Arguments:	theField the field on which it operates
//
//	Description:	performs field level validation for a field
//				  (Note: validation is done at a "delayed" phase.  For
//				   example, on blur, the field to be validated is remembered.
//				   When the next field is onfocus, it decides whether to validate
//				   the previous field or not
//-----------------------------------------------------------------------------

function validateField(theField)
{
	if (theField == null) {
		m_contentDocument.m_fieldToBeValidated = null;
		m_contentDocument.m_validationStage = VALIDATION.READY;
		return true;
	}

	if (m_contentDocument.m_validationStage == VALIDATION.READY) {
		// a field is losing focus, so remember what it is so the next onfocus
		// field can validate the field

		m_contentDocument.m_fieldToBeValidated = theField;
		m_contentDocument.m_validationStage = VALIDATION.VALIDATE;
		window.event.preventDefault();
		return true;
	} else if (m_contentDocument.m_validationStage == VALIDATION.VALIDATE) {
		// a field is receiving focus, but first validate the previous field
		// Note: usually when this method is called when the m_validationStage is VALIDATION.VALIDATE,
		// the argument passed in is m_fieldToBeValidated

		m_contentDocument.m_fieldToBeValidated = null;
	
		m_contentDocument.m_validationStage = VALIDATION.READY;
		
		// Here do validation based on the field type
		var field = new Field(theField);

		switch(field.getType()) {
		case STYPES.Number:
		case STYPES.Currency:
		case STYPES.Percent:
			field.setValue(NumberFormat(field));
			break;
		case STYPES.Date:
			// if this isDate field fails to validate
			// a dialog box will show the associated validation message.
			// So set the m_validationStage to VALIDATION.FAILED and deal with the dialog box later
			if(!DateFormat(theField)) {
				m_contentDocument.m_validationStage = VALIDATION.FAILED;
			}
			break;
		case STYPES.Year:
			if(!YearFormat(theField)) {
				m_contentDocument.m_validationStage = VALIDATION.FAILED;
			}
			break;
		case STYPES.Month:
			if(!MonthFormat(theField)) {
				m_contentDocument.m_validationStage = VALIDATION.FAILED;
			}
			break;
		case STYPES.Day:
			if(!DayFormat(theField)) {
				m_contentDocument.m_validationStage = VALIDATION.FAILED;
			}
			break;
		case STYPES.Time:
			if(!TimeFormat(theField)) {
				m_contentDocument.m_validationStage = VALIDATION.FAILED;
			}
			break;
		case STYPES.EmperorDate:
			if(!EmperorDateFormat(theField)) {
				m_contentDocument.m_validationStage = VALIDATION.FAILED;
				theField.focus();
				// only select field if it is an <input type="text"> control
				if (theField.getAttribute("type") == "text") {
					theField.select();
				}
				return false;
			}
			break;
		}

		if (m_contentDocument.m_validationStage == VALIDATION.FAILED) {
			theField.focus();
			theField.select();
			return false;
		}
		
		return true;
	} else if (m_contentDocument.m_validationStage == VALIDATION.FAILED) {
		// When the validation fails a dialog box is displayed which causes onblur() to execute.
		// We're going to ignore the validation when this happens because the user has
		// been positioned back on the field that failed.

		m_contentDocument.m_validationStage = VALIDATION.READY;
		window.event.preventDefault();
		return true;
	}
}

//+----------------------------------------------------------------------------
//	Function:	enterField(theField)
//
//	Description:	performs some function on the onfocus event for the field
//
//	Arguments:	theField the field on wich it operates
//-----------------------------------------------------------------------------

function enterField(theField) {
	// Check to see if validation for the previous field is pending
	if (m_contentDocument.m_validationStage == VALIDATION.VALIDATE)	{
		if (validateFieldOnFocus(m_contentDocument.m_fieldToBeValidated, theField) == false) {
			window.status = "";
			return;
		}
	} else {
		// if not, set status back to initial stage
		m_contentDocument.m_validationStage = VALIDATION.READY;
	}

	var field = new Field(theField);
	
	var messageId = null;
	var suffix = null;

	// Determine which status message to display based on the type of the field

	switch(field.getType()) {
	case STYPES.Number:
		messageId = msgPromptNum; // Please enter a number.
		break;
	case STYPES.Currency:
		messageId = msgPromptAmt; // Please enter an amount.
		break;
	case STYPES.Percent:
		messageId = msgPromptPct; // Please enter a percent.
		break;
	case STYPES.Date:
		messageId = msgPromptDt; // Please enter a date.
		suffix = getValidDateFormatMessage();
		break;
	case STYPES.Year:
		messageId = msgPromptYr; // Please enter a 4 digit year.
		break;
	case STYPES.Month:
		messageId = msgPromptMo; // Please enter a month (blank or 0 - 12).
		break;
	case STYPES.Day:
		messageId = msgPromptDy; // Please enter a day (blank or 0 - 31).
		break;
	case STYPES.Time:
		if (field.getMaxLength() == 4) {
			messageId = msgPromptTime4; // Please enter a time (HHMM)
		} else {
			messageId = msgPromptTime;	// Please enter a time (HHMMSS)
		}
		break;
	case STYPES.Selection:
		messageId = msgPromptValu; //Please select a value.
		break;
	case STYPES.EmperorDate:
		messageId = msgPromptEmprrDt; // Please enter a date in Emperor date format.
		break;
	case STYPES.Alphabetic:
		messageId = msgPromptAlpha; // Please enter only alphabetic characters (a-z, A-Z).
		break;
	}

	var message = "";
	if (field.isMandatory())	{
		message = getSystemMessage(msgMandFld); // Please fill in the mandatory fields.	
	}
	
	if (messageId != null) {
		message += getSystemMessage(messageId);
	}
	
	if (suffix != null) {
		message += suffix;
	}

	window.status = message;
}

//+----------------------------------------------------------------------------
//	Function:	validateFieldOnFocus
//
//	Description:	validates the previous field when focus is received
//				  on a new field
//
//	Arguments:	prev - field that is to be validated
//				  cur  - field that has just received focus
//-----------------------------------------------------------------------------

function validateFieldOnFocus(prev, cur)
{
	// if the previous field was an emperor date field and the current field
	// is also an emperor date field, we don't want to validate yet.
	if ((prev != null) && (cur != null))
	{
		prevField = new Field(prev);
		curField = new Field(cur);

		if (prevField.getName() == curField.getName())
		{
			m_contentDocument.m_validationStage = VALIDATION.READY;
			return true;
		}
	}

	return validateField(prev);
}

//+----------------------------------------------------------------------------
//	Function:	displayWait
//
//	Description:	Show the "Please wait" frame and hide all other frames
//-----------------------------------------------------------------------------

function displayWait()
{
	// Show Please wait frame and hide all other frames (assumes there are at least two frames
	// and that the first frame is not the Waitframe)
	var myRows = "0";
	var parentWindow = m_contentWindow.parent;
	for (var i = 1; i < parentWindow.document.getElementById("myFrameSet").children.length; i++)
	{
		if (parentWindow.document.getElementById("myFrameSet").children[i].id == "WaitFrame")
		{
			myRows = myRows + ",*";
		}
		else
		{
			myRows = myRows + ",0";
		}
	}

	parentWindow.document.getElementById("myFrameSet").rows=myRows;
}

//+----------------------------------------------------------------------------
//	Function:	onSubmit
//
//	Description:	called before the page is submitted to the web server
//-----------------------------------------------------------------------------

function onSubmit()
{
	// If we're not the content window then call the onSubmit() function from
	// the content window.  That will recurse through any iframe windows.

	if (m_isIFrame == true)
	{
		return m_contentDocument.onSubmit();
	}

	// if we've already been submitted, don't submit again
	if (m_submitted)
	{
		return false;
	}

	var actionField = m_contentDocument.getElementById("action");
	var action = actionField.value;

	// If action is cancel or back, reset the form before submit
	if ((action == "ACTION_CANCEL") || (action == "ACTION_BACK"))
	{
		m_contentDocument.getElementById("inputForm").reset();
		// Store the action back in the form
		actionField.value = action;
		m_contentDocument.m_validationStage = VALIDATION.READY;
	}

	// validate the field to see if we can proceed
	if (m_contentDocument.m_validationStage == VALIDATION.VALIDATE)
	{
		if (validateField(m_contentDocument.m_fieldToBeValidated) == false)
		{
			return false;
		}
	}
	else
	{
		m_contentDocument.m_validationStage = VALIDATION.READY;
	}

	// Check the mandatory fields if action is ACTION_NEXT or ACTION_OK or ACTION_MORE
	if ((action == "ACTION_NEXT") || (action == "ACTION_OK") || (action == "ACTION_MORE"))
	{
		if (checkAllMandatoryFields() == false)
		{
			return false;
		}
	}

	convertToMIRValues();

	for (var count = 0; count < window.frames.length; ++count)
	{
		if (window.frames[count].document.getElementById("inputForm").onsubmit() == false)
		{
			return false;
		}
	}

	displayWait();

	window.status = "";

	m_submitted = true;

	return true;
}

//+----------------------------------------------------------------------------
//	Function:	onSubmitIFrame
//
//	Description:	called before the page is submitted to the web server
//-----------------------------------------------------------------------------

function onSubmitIFrame()
{
	var actionField = m_contentDocument.getElementById("action");
	var action = actionField.value;

	// If action is cancel or back, reset the form before submit
	if ((action == "ACTION_CANCEL") || (action == "ACTION_BACK"))
	{
		document.getElementById("inputForm").reset();
	}

	// Check the mandatory fields if action is ACTION_NEXT or ACTION_OK
	if ((action == "ACTION_NEXT") || (action == "ACTION_OK"))
	{
		if (checkAllMandatoryFields() == false)
		{
			return false;
		}
	}

	convertToMIRValues();

	updateIFrameFields();

	for (var count = 0; count < window.frames.length; ++count)
	{
		if (window.frames[count].document.getElementById("inputForm").onsubmit() == false)
		{
			return false;
		}
	}

	return true;
}

//+----------------------------------------------------------------------------
//	Function:	checkAllMandatoryFields()
//
//	Description:	Ensure that all fields identified as being mandatory have a value.
//-----------------------------------------------------------------------------

function checkAllMandatoryFields()
{
	var types = ["input", "select", "textarea"];
	
	var doc = window.document;

	for (var count = 0; count < types.length; ++count)
	{
		var aElements = doc.body.getElementsByTagName(types[count]);

		for (var index = 0; index < aElements.length; index++)
		{
			var field = aElements[index];

			if (checkMandatory(field) == false)
			{
				// msg: Please fill in the mandatory fields.
				alert(getSystemMessage(msgMandFld));
				return false;
			}
		}
	}

	return true;
}

//+----------------------------------------------------------------------------
//	Function:	checkMandatory()
//
//	Description:	Verify that the field passed in has a value if it's
//			identified as being mandatory.
//-----------------------------------------------------------------------------

function checkMandatory(theField)
{
	// Most fields aren't mandatory so do this test before creating a new Field object
	if (theField.getAttribute("mandatory") != "yes")
	{
		return true;
	}

	// if field is hidden, we won't check it
	if (theField.style.display == "none")
	{
		return true;
	}

	var field = new Field(theField);

	val = cleanString(field.getValue());

	// Special case for YesNos

	if (field.isYesNo())
	{
		var ctl = document.getElementsByName(field.getName());
		if ((ctl[0].checked == true) || (ctl[1].checked == true))
		{
			// We're just setting the value to something so that the
			// next test for mandatory will succeed
			val = "Y";
		}
		else
		{
			val = "";
		}
	}

	if (field.isYesNoUa())
	{
		var ctl = document.getElementsByName(field.getName());

		if ((ctl[0].checked == true) || (ctl[1].checked == true) || (ctl[2].checked == true))
		{
			// We're just setting the value to something so that the
			// next test for mandatory will succeed
			val = "Y";
		}
		else
		{
			val = "";
		}
	}

	// have to check for asterisk as well as empty string as an asterisk will cause the Ingenium
	// server code to blank a field
	if ((val == "") || (val == "*"))
	{
		return false;
	}

	return true;
}

//+----------------------------------------------------------------------------
//	Function:	convertToMIRValues
//
//	Description:	converts the fields values to their MIR representation
//-----------------------------------------------------------------------------

function convertToMIRValues()
{
	// only have to do <input> fields
	var aElements = document.body.getElementsByTagName("input");

	for (var count = 0; count < aElements.length; count++)
	{
		var tag = aElements[count];
		var field = new Field(tag);

		if (field.isCurrency() || field.isNumber()   ||
			field.isPercent()  || field.isYear()	 ||
			field.isMonth()	|| field.isDay())
		{
			tag.value = convertToMIRNumber(field.getValue(), field.getMaxLength());
		}
		else if (field.isTime())
		{
			tag.value = convertToMIRTime(field.getValue());
		}
		else if (tag.type == "checkbox")
		{
			convertToMIRCheckBox(tag);
		}
		else if (field.isDate())
		{
			tag.value = convertToISODate(field.getValue());
		}
                else 
                {
                        tag.value = removeInvalidChars(field.getValue());
                }		
	}
}

//+----------------------------------------------------------------------------
//	Function:	updateIFrameFields()
//
//	Description:	Move the value of any fields on any embedded IFrame
//				fields up to the hiddent fields on the content frame document.
//-----------------------------------------------------------------------------

function updateIFrameFields()
{
	if (m_isIFrame == false)
	{
		return;
	}

	var types = ["input", "select", "textarea"];
	
	var doc = window.document;

	for (var count = 0; count < types.length; ++count)
	{
		// Loop through all of the fields on the iframe and find the
		// corresponding hidden field on the content frame.
		var aElements = window.document.body.getElementsByTagName(types[count]);

		for (var index = 0; index < aElements.length; index++)
		{
			var frameField = aElements[index];
			var hiddenField = m_contentDocument.getElementById(frameField.name);

			// No hidden frameField on the content frame?
			if (hiddenField == null)
			{
				continue;
			}

			// We need to know if this is a selection box since the value is
			// set a little differently for them.
			var frameFieldType = frameField.getAttribute("SType");

			if (frameFieldType != null)
			{
				if (frameFieldType == "Selection")
				{
					// If this is a selection, the PageServer will have created one option
					// object who's value should be set to the value of the frame field.
					var option = hiddenField.options[0];
					option.value = frameField.options[frameField.selectedIndex].value;
				}
				else
				{
					hiddenField.value = frameField.value;
				}

				hiddenField.disabled = frameField.disabled;
			}
		}
	}
}

//+----------------------------------------------------------------------------
//	Function:	processEnterKey(keyStroke)
//
//	Description:	Simulates user clicking on the Next button if Enter key is
//				pressed
//
//	Arguments:	keyStroke - key pressed by user
//
//	Returns:	None
//-----------------------------------------------------------------------------

function processEnterKey(keyStroke)
{
	// Not enter?
	if ((m_keyCode = event.keyCode) != 13)
	{
		return;
	}

	m_contentDocument.m_validationStage = VALIDATION.VALIDATE;

	// force to validate the last field when the enter key is pressed

	if (validateField(window.event.target) == false)
	{
		m_keyCode = 0;

		// do not bubble up the event chain in case validation failed.
		return false;
	}

	// get the document for button frame
	var buttonDocument = getButtonWindowDocument();

	// Check the button bar frame to see what the default action is

	if (buttonDocument != null)
	{
		var defaultButton = buttonDocument.querySelector("[defaultButton]");
		if (defaultButton != null) {
			// Apply default action that is defined in button bar
			defaultButton.click();	

			// do not bubble up the event chain in case default button is pressed.
			// this will avoid annoying beep.
			return false;
		}
	}

	// Assume default is next, e.g. sign on page

	m_contentDocument.getElementById("action").value = "ACTION_NEXT";

	if (m_contentDocument.getElementById("inputForm").onsubmit()) {
		m_contentDocument.getElementById("inputForm").submit();
	} else {
		return false;
	}
}

//+----------------------------------------------------------------------------
//	Function:	processTabKey(keyStroke)
//
//	Description: 	Force validation on current field if tabbing out of content frame
//
//	Arguments:   	keyStroke - key pressed by user
//
//	Returns:	None
//-----------------------------------------------------------------------------

function processTabKey(keyStroke)
{
	if ((m_keyCode = event.keyCode) != 9)
	{
		// Not tab key then return
		return;
	}

	var field = window.event.target;

	if (window.event.shiftKey) 
	{
		// tab backwards
		// If first field doesn't need validation or we're not on the first field
		// then don't do anything special.
		if (m_firstTabControlElement != field)
		{
			return;
		}
	}
	else	
	{
		// tab forwards
		// Same for last field
		if (m_lastTabControlElement != field)
		{
			return;
		}
	}

	m_contentDocument.m_validationStage = VALIDATION.VALIDATE;

	if (m_isIFrame == true)
	{
		return;
	}

	// if validation failed, then tab didn't happen
	if (validateField(field) == false)
	{
		m_keyCode = 0;
		window.event.preventDefault();
	}
}

//+----------------------------------------------------------------------------
//	Function:	processClick()
//
//	Description:	Simulates user clicking on the Next button if Enter key is
//					pressed
//
//	Arguments:	None
//
//	Returns:	None
//-----------------------------------------------------------------------------

function processClick()
{
	// if user presses Enter key, an onblur on the current field occurs first.
	// Check to see if the current field has to be validated
	if (m_contentDocument.m_validationStage == VALIDATION.VALIDATE)
	{
		validateField(m_contentDocument.m_fieldToBeValidated);
		m_keyCode = 0;
	}
	else
	{
		m_contentDocument.m_validationStage = VALIDATION.READY;
	}
}

//-----------------------------------------------------------------------------
//	Function:	changeMandatoryFor(tagName, mandatory)
//
//	Description:	Recurses into all children nodes of this tag and for any
//					child which has the mandatory attribute changes this
//					attribute's value to the value passed in the  mandatory
//					argument. Used to disable the mandatory checking for items
//					that are invisible
//
//	Arguments:	tagName the name of the tag we want to change mandatory "yes" or 
//				"no" as strings
//
//	Returns:	None
//-----------------------------------------------------------------------------

function changeMandatoryFor(tag, mandatory)
{
	if (null == tag.attributes)
	{
		return;
	}

	var mandatoryAttrValue = tag.getAttribute("mandatory");

	if (null != mandatoryAttrValue)
	{
		tag.setAttribute("mandatory", mandatory);
	}

	if (!tag.hasChildNodes())
	{
		return;
	}

	var children = tag.childNodes;
	var size = children.length;

	// Recurse into children
	for (var index = 0; index < size; index++)
	{
		changeMandatoryFor(children.item(index), mandatory);
	}
}

//+----------------------------------------------------------------------------
//	Function:	convertToISODate(aString)
//
//	Description:	Format a date string (e.g DDMMYYYY) to the ISO date
//				format (DD-MM-YY)
//
//	Arguments:	a string representing a date
//-----------------------------------------------------------------------------

function convertToISODate(aString)
{
	if (m_dateISOInd == false)
	{
		return aString;
	}

	var aDate;

	if ((aString == "") || (aString == "*"))
	{
		aDate = aString;
	}
	else
	{
		var dateComponents = getDateComponents(aString);
		var sep = "-";
		aDate = padStringLeft(dateComponents[0].toString(),"0",4) + sep 
			+ padStringLeft(dateComponents[1].toString(),"0",2) + sep 
			+ padStringLeft(dateComponents[2].toString(), "0",2);
	}
	return aDate;
}

//+----------------------------------------------------------------------------
//	Function:	removeInvalidChars(aString)
//
//	Description:	Format a text field and remove the Horizontal tab at the 
//			end caused by copy pasting from EDGE browser	
//
//	Arguments:	a string representing a text
//-----------------------------------------------------------------------------

function removeInvalidChars(aString)

{
	if (aString == null)
	{
		return "";
	}

	return aString.replace("\t", "");
}


//-----------------------------------------------------------------------------
// Function: getFrame(frameName)
//
// Description: Searches backwards through the window hierarchy looking for
// a frame with the name passed in. 
//
// Arguments: Name of the frame to find. The search is case insensitive.
//
// Returns: The window representing the requested frame or null if
// no frame could be found.
//-----------------------------------------------------------------------------

function getFrame(frameName) {
	currentParent = parent;
	
	while (true) {
		if (currentParent.frames.length > 0) {
			var frame = currentParent.frames[frameName]
			if (frame) {
				return frame
			}
		}
		
		// If the window's parent is itself, then it has no parent.

		if (currentParent == currentParent.parent) {
			return null;
		}

		currentParent = currentParent.parent;
	}
}

//-----------------------------------------------------------------------------
// Function: getDocument(object)
//
// Description: Returns a document object for either a frame or a 
// window object.
//
// Arguments: Object that could be a window or frame	
//
// Returns: A document object or undefined
//-----------------------------------------------------------------------------

function getDocument(object) {
	if (object.document) {
		return object.document;
	} else if (object.contentDocument) {
		return object.contentDocument;
	} else if (object.contentWindow) {
		return object.contentWindow.document;
	} else {
		return undefined;
	}
}

