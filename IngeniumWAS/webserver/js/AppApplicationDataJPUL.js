// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:04 PM EDT
//******************************************************************************
//*  Component:   AppApplicationDataJPUL.js                                   *
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
//	Functions for the AppApplicationDataJPUL.htm page
//
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//	Function:       onLoadCustom()
//
//	Description:	Custom onload handler. Will:
//			1. Show/Hide/Disable User-defined Policy ID based on override 
//			checkbox and BannerPolicyID
//			2. Show/Hide replacement fields based on replacement
//			radio buttons
//			3. Show-display a couple of columns in the owner table
//			4. Hide the product selection box if the issue location 
//			is empty
//			5. Displays an error message if the combination of 
//			issue location, date, app form and company did not 
//			proprely populate the product selection box
//
//	Arguments:	None
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
	// 1. Show/Hide User-defined Policy ID based on override checkbox
	showHidePolicyID();

	
	// 2. Show/Hide replacement fields based on replacement checkbox
	// Figure out which radio button is checked (assume no if none are
	// checked).
	var ctls = document.getElementsByName("ReplacementQuestion");
	if (ctls[0].checked)
	{
		showHideRepl(ctls[0]);
	}
	else
	{
		showHideRepl(ctls[1]);
	}

	
	// 3. Show-display a couple of columns in the owner table
	showHideRelationshipLinks();
	
	
	// 4. Hide the product selection box if the issue location or the app 
	// date or form type or sub-company are empty
	// The user will have to fill in these fields and then hit
	// refresh to make the product id selection box visible
	// THIS CODE RELIES UPON THE PRODUCT SELECTION BOX BEING IN 
	// THE 4TH ROW OF THE APPLICATION DATA TABLE. 

	var locationSelected = hasSelection("MIR-POL-ISS-LOC-CD");
	var appFormSelected = hasSelection("MIR-APP-FORM-TYP-ID");
	var companySelected = hasSelection("MIR-SBSDRY-CO-ID");

	if (!locationSelected  ||
	    document.getElementById("MIR-POL-APP-RECV-DT").value == "" ||
	    !appFormSelected  ||
            !companySelected )
	{
		var planRow = document.getElementById("applicationDataTable").rows.item(3);
		changeMandatoryFor(planRow, "no");
		planRow.style.display = "none";
	}

	
	// 5. If all filter fields used to populate the product selection box
	// are valued but after refreshing the product selection box 
	// is empty, then display an error message dialog prompting the user
	// to change the filter values to a valid combination.
	if (locationSelected &&
	    document.getElementById("MIR-POL-APP-RECV-DT").value != "" && 
            appFormSelected && 
            companySelected &&
            document.getElementById("MIR-PLAN-ID").options.length == 1) 
	{
		// msg: No valid Products can be found for the Issue Location, Date, Form Type and Company entered.  Revise these values and Refresh this page.
		alert(getUserMessage(msgNoValidProd));
	}
}


//-----------------------------------------------------------------------------
//
//	Function:       showHidePolicyID(message)
//
//	Description:	Show or hide (or disable) user-defined policy id fields 
//			based on whether the PolicyIDAssignmentOverride checkbox is checked. No
//			need to warn the user that they'll lose data, just erase the fields.
//
//	Arguments:		none
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function showHidePolicyID()
{
	// Get table used for user-defined client id entry
	var ctl = document.getElementById("PolicyIDFields");
	if (ctl == null)
	{
		return;
	}

	// Get the checkbox that controls whether user-defined client id
	// entry table is displayed
	var masterCtl = document.getElementById("PolicyIDAssignmentOverride");
	if (masterCtl == null)
	{
		return;
	}

	// If a policy has already been created, prevent user from creating another.
	var policyID = getBannerPolicyID();
	if (policyID != "")
	{
		masterCtl.disabled = true; // Disable check box
		document.getElementById("UserDefinedPolicyIDBase").disabled = true;
		document.getElementById("UserDefinedPolicyIDSuffix").disabled = true;
	}

	// show or hide table depending on master checkbox
	if (masterCtl.checked)
	{
		// Unhide each element to re-enable mandatory checking.
		document.getElementById("UserDefinedPolicyIDBase").style.display = "";
		document.getElementById("UserDefinedPolicyIDSuffix").style.display = "";
		
		ctl.style.display = "";
	}
	else
	{                               
		// No need to ask for confirmation on these fields, just erase them.
		document.getElementById("UserDefinedPolicyIDBase").value = "";
		document.getElementById("UserDefinedPolicyIDSuffix").value = "";

		// Hide each element to prevent mandatory checking.
		document.getElementById("UserDefinedPolicyIDBase").style.display = "none";
		document.getElementById("UserDefinedPolicyIDSuffix").style.display = "none";

		ctl.style.display = "none";
	}
}


//-----------------------------------------------------------------------------
//
//	Function:       showHideRelationshipLinks()
//
//	Description:	Show or Hide relationship links based on whether or not
//			the user has indicated that the "Owner's Relationship to Insured"
//			is "Same Person".  If so, hide the links, else show them.
//
//			Also, if user chooses "Same Person", restore the address fields
//			from the hidden PrimaryInsured fields.  This is so that if the user
//			chooses something other than Same Person, goes off and selects that
//			other person, returns, then changes their mind and reselects Same
//			Person, we won't have to hit the server in order to show the proper
//			address information.
//
//	Arguments:		none
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function showHideRelationshipLinks()
{
	if ("SAME" == getSelectionBoxValue("MIR-POL-CLI-INSRD-CD-T[1]"))
	{
		//
		// Hide relationship links
		//
		document.getElementById("OwnerIndividualAddLink").style.display = "none";
		document.getElementById("OwnerCompanyAddLink").style.display    = "none";
	}
	else
	{
		//
		// Show relationship links
		//
		document.getElementById("OwnerIndividualAddLink").style.display = "";
		document.getElementById("OwnerCompanyAddLink").style.display    = "";
	}
}


//-----------------------------------------------------------------------------
//
//	Function:       onChangeRelationship()
//
//	Description:	Cause relationship links to either be shown or hidden.
//
//	Arguments:		none
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function onChangeRelationship()
{
	if ("SAME" == getSelectionBoxValue("MIR-POL-CLI-INSRD-CD-T[1]"))
	{
		//
		// Restore original Primary Insured data
		//
		document.getElementById("MIR-CLI-TAX-ID-T[1]").innerText    = document.getElementById("PrimaryInsuredTAX-ID-T[1]").value;
		document.getElementById("MIR-DV-OWN-CLI-NM-T[1]").innerText = document.getElementById("PrimaryInsuredName").value;
		document.getElementById("MailName").innerText              = document.getElementById("PrimaryInsuredName").value;
		document.getElementById("MIR-CLI-ADDR-TYP-CD-T[1]").value   = document.getElementById("PrimaryInsuredADDR-TYP-CD-T[1]").value;
		document.getElementById("MIR-CLI-ID-T[1]").value            = document.getElementById("PrimaryInsuredOwnerClientID").value;

		for (var index = 1; index <= document.getElementById("addressTable").getAttribute("genrows"); index++)
		{
			document.getElementById("MailAddressLine-T[" + index + "]").innerText = document.getElementById("PrimaryInsuredMailAddressLine-T[" + index + "]").value;
		}
	}
	showHideRelationshipLinks();
}



//-----------------------------------------------------------------------------
//
//	Function:       showHideRepl
//
//	Description:	SHow or Hide replacement fields
//
//	Arguments:		ctl - replacement radio button that has been checked
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function showHideRepl(ctl)
{
	// show or hide replacement fields based on radio button that has
	// been checked
	if (ctl.value == "Y")
	{
		document.getElementById("replacementFields").style.display = "";
		
		var ctls = document.getElementsByName("ReplacementCodeQuestion");
		var qCtl; 
		if (ctls[0].checked)
		{
			qCtl = ctls[0];
		}
		else
		{
			qCtl = ctls[1];
		}

		showHideReplCpSearch(qCtl);

		// we have to specifically unhide the input fields because of
		// mandatory processing
		document.getElementById("MIR-REPL-POL-ID").style.display = "";
		document.getElementsByName("ReplacementCodeQuestion")[0].style.display = "";
		document.getElementsByName("ReplacementCodeQuestion")[1].style.display = "";
		
	}
	else
	{
		document.getElementById("replacementFields").style.display = "none";
		
		
		// we have to specifically hide the input fields for mandatory
		// checking to be bypassed
		document.getElementById("MIR-REPL-POL-ID").style.display = "none";
		document.getElementsByName("ReplacementCodeQuestion")[0].style.display = "none";
		document.getElementsByName("ReplacementCodeQuestion")[1].style.display = "none";
		var replSearch = document.getElementById("ReplacementCompanySearch");	
		changeMandatoryFor(replSearch, "no");
	}
}


//-----------------------------------------------------------------------------
//
//	Function:       showHideReplCpSearch
//
//	Description:	Processes the actions for the replacement code radio button
//
//	Arguments:		ctl Replacement company question radio button that has been 
//					checked
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function showHideReplCpSearch(ctl)
{
	// Shoq or hide the search for the replacement company based on the
	// replacement company question radio buttons values
	
	var replSearch = document.getElementById("ReplacementCompanySearch");	
	
	if (ctl.value == "Y")
	{
		document.getElementById("ReplacementCode").value = "Internal";
		replSearch.style.display = "none";  
		changeMandatoryFor(replSearch, "no");
	}
	else 
	{
		document.getElementById("ReplacementCode").value = "External";
		replSearch.style.display = "inline";   
		changeMandatoryFor(replSearch, "yes");
 	}
}


//-----------------------------------------------------------------------------
//
//	Function:       onSubmitCustom
//
//	Description:	Called before standard onSubmit function when form is
//					going to be submitted. Will
//					1. Clear replacement fields if they are hidden
//
//	Arguments:		none
//
//	Returns:		Nothing
//
//-----------------------------------------------------------------------------

function onSubmitCustom()
{
	// clear replacement fields if they are hidden
	if (document.getElementById("replacementFields").style.display == "none")
	{
		document.getElementById("MIR-REPL-POL-ID").value = "";
		document.getElementsByName("ReplacementCodeQuestion")[0].checked = false;
		document.getElementsByName("ReplacementCodeQuestion")[1].checked = false;
		document.getElementById("ReplacementCode").value = "";
		document.getElementById("MIR-DV-REPL-CO-CLI-NM").value = "";
	}
}


//-----------------------------------------------------------------------------
//
//	Function:       getSelectionBoxValue(selectionBoxName)
//
//	Description:	Returns the value of the selcted option in a selection 
//			box. This function assumes the selection box exists
//			on the HTML page and has options.
//
//	Arguments:	selectionBoxName
//
//	Returns:	A string containing the selected option's value;
//			The value of the first element if no option is selected;
//			This is because the first option is selected by defaut
//			if the value of the select element does not match any
//			of the options available in the selection box
//
//-----------------------------------------------------------------------------

function getSelectionBoxValue(selectionBoxName)
{
	var selectionBox = document.getElementById(selectionBoxName);
	
	var options = selectionBox.options; 
	var size = options.length;
	var option = null;
	var index;

	for (index = 0; index < size; index++)
	{
		option = options[index];
		if (option.selected)
		{
			return option.value;
		}
	}

	return options[0].value;
}


//-----------------------------------------------------------------------------
//
//	Function:       hasSelection(selectionBoxName)
//
//	Description:	Determines whether a valid value has been entered in a
//			selection box. A valid value is considered any value
//			different than "" or "*"
//
//	Arguments:	selectionBoxName
//
//	Returns:	true if the selection is valid, false otherwise
//
//-----------------------------------------------------------------------------

function hasSelection(selectionBoxName)
{
	var value = getSelectionBoxValue(selectionBoxName);
	if (value == "" || value =="*")
		return false;

	return true;
}


//-----------------------------------------------------------------------------
//
//	Function:       getBannerPolicyID()
//
//	Description:	Returns the Policy ID from the banner frame, or
//					the empty string.
//
//	Arguments:	    None
//
//	Returns:	    The Policy ID from the banner frame, or the
//					empty string
//
//-----------------------------------------------------------------------------

function getBannerPolicyID()
{
    var policyID = "";

	var bannerFrame = getFrame("BannerFrame");
	
	if (bannerFrame != null)
	{
		var bannerID = getDocument(bannerFrame).getElementById("BannerPolicyID");
		if (bannerID != null)
		{
			policyID = cleanString(bannerID.innerText);
		}
	}

	return policyID;
}


