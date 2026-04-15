// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:05 PM EDT
//******************************************************************************
//*  Component:   AppBillingJPTrad.js                                         *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  016423  602J     New for release 602J                                     *
//*  23774A  CTS      Changes done for ie retirement project to make it        *
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


//-----------------------------------------------------------------------------
//
//	Functions for the AppBillingJPTrad.htm page
//
//  Uses: cleanString()          from ClientLevelEdits.js
//	  setCheckedRadioValue() from ClientLevelEdits.js
//	  getCheckedRadioValue() from ClientLevelEdits.js
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------
var OKToEraseData = false;
var previousBillingMethodIndex;
var previousBillingMethod;
var undefined;  // special value to allow detection of undefined values

//-----------------------------------------------------------------------------
//
//	Function:		onChangeBillingMethodOrFrequency([ctl])
//
//	Description:	Determine which sections of the screen to display, based on
//			the Billing Method choice.
//
//	Arguments:		none required
//
//      OPTIONAL:	ctl - Billing Method or Frequency selection box control
//	                - if not passed, the function will find the control itself
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------

function onChangeBillingMethodOrFrequency(ctl)
{
	if (arguments.length < 1)
	{
		ctl = document.getElementById("MIR-DV-SBOX-CD-T");
	}

	if (null == ctl)
	{
		return;
	}

	OKToEraseData = false;

	var billingMethod = ctl.value.substring(0,1);

	//
	// If the user's new billing choice will cause us to hide and erase data
	// they've entered, then we'll ask for permission first.
	//
	// Otherwise, we'll just go ahead and hide the fields.
	//
	// msg: Choosing that Billing Method/Frequency will cause data which is no longer relevant to be deleted - confirm
 	if (newBillingChoiceWouldEraseData(previousBillingMethod, billingMethod) &&
		confirm(getUserMessage(msgBillingConfirmDel)) != true)
	{
		//
		// Restore drop-down choice to previous selection
		//
		document.getElementById("MIR-DV-SBOX-CD-T").selectedIndex = previousBillingMethodIndex;
        }
	else
	{
		//
		// Remember this new drop-down choice for next time
		//
		savePreviousBillingChoice();

		OKToEraseData    = true;

		if ("4" == billingMethod)		// Pre-Authorized Cheque
		{
			PacSection.style.display = "block";
                        document.getElementById("MIR-POL-PAC-DRW-DY").style.display = "";

			// make sure selection box is set to a value in list
			if (document.getElementById("MIR-POL-PAC-DRW-DY").value == "" ||
			    document.getElementById("MIR-POL-PAC-DRW-DY").value == "0")
			{
                        document.getElementById("MIR-POL-PAC-DRW-DY").value = "*";
            }
		}
		else
		{
			PacSection.style.display = "none";

			document.getElementById("MIR-POL-PAC-DRW-DY").value = "0";

                        document.getElementById("MIR-POL-PAC-DRW-DY").style.display = "none";

			//
			// Uncheck whichever account was selected
			//
			for (var index = 1; index <= document.getElementById("acctTable").getAttribute("genrows"); index++)
			{
				document.getElementById("SELECT-T[" + index + "]").checked = false;
			}
		}

		//
		// If billingMethod is Military, Other Listbill or Salary Deduction,
		// show the Draw Day Section
		//
		if (("5" == billingMethod) ||	// Military
			("G" == billingMethod) ||	// Other Listbill
			("S" == billingMethod))		// Salary Deduction
		{
			ListbillSection.style.display               = "block";
                        document.getElementById("MIR-POL-LBILL-DRW-DY").style.display = "";

			// make sure selection box is set to a value in list
			if (document.getElementById("MIR-POL-LBILL-DRW-DY").value == "" ||
			    document.getElementById("MIR-POL-LBILL-DRW-DY").value == "0")
			{
				document.getElementById("MIR-POL-LBILL-DRW-DY").value = "*";
			}
		}
		//
		// Otherwise, reset data, and hide section.
		//
		else
		{
			document.getElementById("MIR-POL-LBILL-DRW-DY").value   = "0";
                        document.getElementById("MIR-POL-LBILL-DRW-DY").style.display = "none";
			setCheckedRadioValue(document.getElementsByName("SFYesNo"), "N");
			document.getElementById("MIR-DV-LBILL-CLI-ID").value    = "";

			ListbillSection.style.display               = "none";
		}

		//
		// Whenever the Billing Method is changed, we'll double check
		// to ensure the SFBI selection is respected as well.
		//
		onClickSFBI();
	}
}

//-----------------------------------------------------------------------------
//
//	Function:		onClickSFBI(ctl)
//
//	Description:	Determine which sections of the screen to display, based on
//			the Special Frequency Requested choice.
//
//	Arguments:		none required
//
//      OPTIONAL:	ctl - Special Frequency Requested radio button choice
//			- if not passed, the function will find the value of
//			  the control itself
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------

function onClickSFBI(ctl)
{
	if (arguments.length < 1)
	{
		ctl = document.getElementsByName("SFYesNo");  // This represents the entire radio group...

		if (null == ctl)
		{
			return;
		}

		ctlValue = getCheckedRadioValue(ctl);
	}
	else
	{
		ctlValue = ctl.value;			// ..whereas this is a single radio button.
	}

	//
	// If Draw Day section is visible and Special Frequency Requested
	// is set to "Y", show SFBI section
	//
	if (("block" == ListbillSection.style.display) &&
		("Y" == ctlValue))
	{
		SFBISection.style.display = "block";

		// make sure selection box is set to a value in list
		if (document.getElementById("MIR-SFB-SEMI-MTHLY-DY").value == "" ||
		    document.getElementById("MIR-SFB-SEMI-MTHLY-DY").value == "0")
		{
			document.getElementById("MIR-SFB-SEMI-MTHLY-DY").value = "*";
        }
	}
	//
	// Otherwise, if user agrees, reset data, and hide section.
	//
	else
	{
		//
		// Since this code could be entered because the user chose a Billing Method / Frequency
		// which will cause this section of screen to be hidden, we may have already asked if
		// it's OK to delete data on the screen.
		//
		// Let's make sure we only ask once.
		//
		if (!OKToEraseData)
		{
			// msg: Special billing frequency information will be cleared - confirm
			if (thereIsSFBIData() &&
				(confirm(getUserMessage(msgSpecBillingConfirmDel)) != true))
			{
				// user doesn't want to lose the data
				window.event.preventDefault();
				setCheckedRadioValue(document.getElementsByName("SFYesNo"), "Y");
			}
			else
			{
				OKToEraseData = true;
			}
		}

		//
		// If there's no data anyway, or if the user has said it's OK to erase it, go ahead.
		//
		if (OKToEraseData)
		{
			document.getElementById("MIR-POL-SFB-CD").value         = "";
			document.getElementById("MIR-SFB-SEMI-MTHLY-DY").value  = "";
			document.getElementById("MIR-SFB-END-DT").value         = "";
			document.getElementById("MIR-SFB-GP-STRT-DT-NUM").value = "";
			document.getElementById("MIR-SFB-GP-END-DT-NUM").value  = "";

			SFBISection.style.display = "none";
		}
	}

	//
	// Reset flag for next time
	//
	OKToEraseData = false;
}

//-----------------------------------------------------------------------------
//
//	Function:	splitDVBillingCode()
//
//	Description:	Splits the dv billing code field into the billing type
//			and billing mode fields as required by INGENIUM
//
//	Arguments:	None
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------

function splitDVBillingCode()
{
	var dvBillingCode = document.getElementById("MIR-DV-SBOX-CD-T");
	var billingType = document.getElementById("MIR-POL-BILL-TYP-CD");
	var billingMode = document.getElementById("MIR-POL-BILL-MODE-CD");

	billingType.value = dvBillingCode.value.substr(0, 1);
	billingMode.value = dvBillingCode.value.substr(1, 2);
}

//-----------------------------------------------------------------------------
//
//	Function:	onLoadCustom()
//
//	Description:	Custom function executed when the page loads
//
//	Arguments:	None
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
	savePreviousBillingChoice();

	onChangeBillingMethodOrFrequency();

	// If INDEX contains a valid value, use it to restore appropriate "From" checkbox.
	// This will typically happen if the user proceeded to the next screen,
	// then returned by way of the "PREVIOUS" button.
	if (undefined !== document.forms[0].index)
	{
		ctl = document.getElementById("index");

		if (null != ctl.value && "" != ctl.value && "0" != ctl.value)
		{
			document.getElementById("SELECT-T[" + ctl.value + "]").checked = true;
		}
	}
}

//-----------------------------------------------------------------------------
//
//	Function:	onSubmitCustom()
//
//	Description:	Called before the page's onSubmit is called.
//			Allows for any extra processing to be done before
//			submitting the page.
//
//	Arguments:	None
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------

function onSubmitCustom()
{
	splitDVBillingCode();
}

//-----------------------------------------------------------------------------
//
//	Function:	newBillingMethodWouldEraseData(prevMethod, newMethod)
//
//	Description:	Called to determine whether or not we need to ask the
//					user's permission to hide and erase data.
//
//					This will be true if all of the following are true:
//					1. We're switching FROM a billing method which showed significant
//					   user enterable data fields.
//					2. We're switching TO a billing method which no longer shows
//					   those data fields.
//					3. The user had entered data in some of those data fields
//					   which we're about to hide and erase.
//
//					NOTE: It was decided that erasing the small amount of data
//						  associated with switching FROM a Pre-Authorized
//						  Chequing billing method (i.e.: just Draw Day and choice
//						  of account) did not warrant asking the user's permission.
//
//	Arguments:		prevMethod - the previous billing method
//					newMethod  - the billing method the user wishes to switch to
//
//	Returns:		true or false, depending on whether or not switching from
//					prevMethod to newMethod would cause the program to erase data
//					which the user has entered.
//
//-----------------------------------------------------------------------------

function newBillingChoiceWouldEraseData(prevMethod, newMethod)
{
	var fromMatters = ("5" == prevMethod) || ("G" == prevMethod) || ("S" == prevMethod);
	var toMatters   = ("5" != newMethod)  && ("G" != newMethod)  && ("S" != newMethod);
	var thereIsData = thereIsDrawDayData() || thereIsSFBIData();

	return fromMatters && toMatters && thereIsData;

}

//-----------------------------------------------------------------------------
//
//	Function:	savePreviousBillingChoice()
//
//	Description:	Called when the page loads and when the user chooses a
//			different billing method / frequency.  This function saves the
//			user's previous billing choice for two reasons:
//			1. Where the previous choice caused a significant amount of
//			   user-entered data to be displayed, we will ask the user to
//			   confirm that they really meant to choose something else which
//			   result in the clearing of that data.  To ask this question only
//			   at appropriate times, we need to know the prior billing choice.
//			2. If the user does NOT confirm that they wanted to lose their data,
//			   we need to be able to restore their billing choice to what it
//			   was previously.
//
//	Arguments:	None
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------

function savePreviousBillingChoice()
{
	previousBillingMethodIndex = document.getElementById("MIR-DV-SBOX-CD-T").selectedIndex;
	previousBillingMethod      = document.getElementById("MIR-DV-SBOX-CD-T").options[previousBillingMethodIndex].value;
	previousBillingMethod      = previousBillingMethod.substring(0,1);
}

//-----------------------------------------------------------------------------
//
//	Function:		thereIsDrawDayData()
//
//	Description:	Determines if there is currently data in Draw Day fields
//					which are about to be hidden and cleared.
//
//	Arguments:		None
//
//	Returns:		true or false
//
//-----------------------------------------------------------------------------

function thereIsDrawDayData()
{
	//
	// Determine if any of the fields we may be about to remove contain data
	//
	return (("0"  != document.getElementById("MIR-POL-LBILL-DRW-DY").value)               ||
			("N"  != getCheckedRadioValue(document.getElementsByName("SFYesNo")))            ||
			(""   != cleanString(document.getElementById("MIR-DV-LBILL-CLI-ID").value)));
}

//-----------------------------------------------------------------------------
//
//	Function:		thereIsSFBIData()
//
//	Description:	Determines if there is currently data in Special Frequency
//					Billing Information fields which are about to be hidden and
//					cleared.
//
//	Arguments:		None
//
//	Returns:		true or false
//
//-----------------------------------------------------------------------------

function thereIsSFBIData()
{
	//
	// Determine if any of the fields we may be about to remove contain data
	//
	return ((""   != document.getElementById("MIR-POL-SFB-CD").value)         ||
			((""   != document.getElementById("MIR-SFB-SEMI-MTHLY-DY").value) && ("00" != document.getElementById("MIR-SFB-SEMI-MTHLY-DY").value)) ||
			(""   != document.getElementById("MIR-SFB-END-DT").value)         ||
			(""   != document.getElementById("MIR-SFB-GP-STRT-DT-NUM").value) ||
			(""   != document.getElementById("MIR-SFB-GP-END-DT-NUM").value));
}

