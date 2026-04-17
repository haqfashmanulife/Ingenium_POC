//******************************************************************************
//*  All right, title and interest in and to the software                      *
//*  (the "Software") and the accompanying documentation or                    *
//*  materials (the "Documentation"), including all proprietary                *
//*  rights, therein including all patent rights, trade secrets,               *
//*  trademarks and copyrights, shall remain the exclusive                     *
//*  property of Electronic Data Systems LLC.                                  *
//*  No interest, licence or any right respecting the Software                 *
//*  and the Documentation, other than expressly granted in                    *
//*  the Software Licence Agreement, is granted by implication                 *
//*  or otherwise.                                                             *
//*                                                                            *
//*  (C) Copyright 2000-2008 Electronic Data Systems LLC.                      *
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
//*  Component:   ActionHandlers.js                                            *
//*  Description: Javascript for generic functions that apply to most pages    *
//*                                                                            *
//*  Note:  DO NOT MODIFY THIS CODE.  If there is a requirement to override    *
//*         the methods in this file, please add required code or method to    *
//*         the GlobalUserMethods.js file.                                     *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*          1.0      New for release 1.0 of Pathfinder                        *
//*  23460   3.0      Changed for changes in table syntax                      *
//*  EN9512  PF4.0.2  PathFinder Upgrade                                       * 
//*  23774A  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *                                                                              *
//*                                                                            *
//* MLJ IT IS
//******************************************************************************


//------------------------------------------------------------------------------
//
//	GLOBAL VARIABLES
//	
//------------------------------------------------------------------------------

	var m_prevFieldName = null; // used to store the previous field name in OnListCheckBox()



//-----------------------------------------------------------------------------
//
//	Function:       onAction
//
//	Description:    This function handles the onclick event of a hyperlink. 
//	                The function looks among the hyperlink's attributes after 
//	                an attribute called action. The value of this attribute 
//	                is assigned to the hidden input field called action and 
//	                then the form on the page is submitted to the web server. 
//	                The action attribute's value can be empty in which case 
//	                nothing is done
//
//	Arguments:	None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function onAction()
{
	var source = window.event.target;

	var action = source.getAttribute("Action");

	if (null == action || "" == action) 
	{
		return;
	}
	var index = source.getAttribute("Index");
	if (null != index)
	{
		inputForm.index.value = index;
	}

	inputForm.action.value = action;

	if (inputForm.onsubmit())
	{
		inputForm.submit();
	}
}


//-----------------------------------------------------------------------------
//
//	Function:       saveValue
//
//	Description:    This function is used in conjunction with onYesNoUa.
//	                This function saves the  checked attribute of the 
//	                radio button that implements the YesNo field in a 
//	                global variable called valueBefore
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

var valueBefore;

function saveValue() 
{
	var source = window.event.target;
	valueBefore = source.checked;
}

//-----------------------------------------------------------------------------
//
//	Function:       onYesNoUa
//
//	Description:    This function handles the onclick event of a radio 
//	                buttons group. The radio buttons implement the YesNo 
//	                field type. The function looks among the radio button's 
//	                attributes after an attribute called OnYes, OnNo or OnUa. 
//	                The value of this attribute is assigned to the hidden input 
//	                field called action and then the form on the page is 
//	                submitted to the web server. If the value of the OnYes, 
//	                OnNo or OnUa is empty nothing is done
//
//	Arguments:      what
//	
//	Returns:        None
//
//-----------------------------------------------------------------------------

function onYesNoUa(what)
{
	var source = window.event.target;
	var onYes = source.getAttribute("OnYes");
	var onNo = source.getAttribute("OnNo");
	var onUa = source.getAttribute("OnUa");

	if (what == "Yes")
	{
		if (null == onYes ||  "" == onYes)
		{
			return;
		}

		inputForm.action.value = onYes;
	}
	else if (what == "No")
	{	
		if (null == onNo || "" == onNo)
		{
			return;
		}

		inputForm.action.value = onNo;
	}
	else if (what == "Ua")
	{
		if (null == onUa || "" == onUa)
		{
			return;
		}

		inputForm.action.value = onUa;
	}
	
	valueAfter = source.checked;
	
	if (valueAfter != valueBefore)
	{
		if (inputForm.onsubmit())
		{
			inputForm.submit();
		}
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       onCheckBox
//
//	Description:    This function handles the onclick event of a check box.
//	                The check box implements an Indicator field type.
//	                The function looks among the checkboxs' attributes 
//	                after an attribute called OnCheck and OnUnckeck. 
//	                The value of this attribute is assigned to the hidden 
//	                input field called action and then the form on the page 
//	                is submitted to the web server.
//	                If the value of the OnCheck or OnUnckeck is empty 
//	                nothing is done
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function onCheckBox()
{
	var source = window.event.target;

	var onCheck = source.getAttribute("OnCheck");
	var onUnCheck = source.getAttribute("OnUnCheck");
	
	if(source.checked == true)
	{
		// the checkbox is now checked
		if(null == onCheck || "" == onCheck)
		{
			return;
		}

		var index = source.getAttribute("Index");

		if (null != index)
		{
			inputForm.index.value = index;
		}

		inputForm.action.value = onCheck;

		if(inputForm.onsubmit())
		{
			inputForm.submit();
		}
	} 
	else
	{
		if (null == onUnCheck || "" == onUnCheck)
		{
			return;
		}

		var index = source.getAttribute("Index");

		if (null != index)
		{
			inputForm.index.value = index;
		}

		inputForm.action.value = onUnCheck;

		if(inputForm.onsubmit())
		{
			inputForm.submit();
		}
	}

}

//-----------------------------------------------------------------------------
//
//	Function:       onListCheckBox
//	
//	Description:
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function onListCheckBox()
{
	var source = window.event.target;
	var index = source.getAttribute("Index");

	// If the checkbox doesn't have an Index attribute...

	if (index == null)
	{
		return;
	}

	// Find out if a row was previously checked.

	var previousIndex = inputForm.index.value;

	if (previousIndex > 0)
	{
		// Turn off the previously checked field

		document.getElementById(m_prevFieldName).checked = false;
	}

	// the checkbox is now checked

	if(source.checked == true)
	{
		inputForm.index.value = index;
	} 
	else
	{
		inputForm.index.value = 0;
	}

	// save the name of the newly checked field, so we can uncheck it next time we come in here
    	m_prevFieldName = source.name;
}

//+----------------------------------------------------------------------------
//
//	Function:     onCheckAll(slaveCtlsPrefix)
//	
//	Description:  This function will check (or uncheck) all checkboxes associated
//	              with a master control checkbox.
//
//	Arguments:    slaveCtlsPrefix - start of the name of the associated slave
//	              checkboxes. We will append a number to this name, starting at 1,
//	              and check (or uncheck) every control on the page that starts
//	              with the prefix, depending on whether the master checkbox
//	              was checked or unchecked.
//
//	Returns:      Nothing
//
//-----------------------------------------------------------------------------

function onCheckAll(slaveCtlsPrefix)
{
	// get master control checkbox
	var masterCtl = window.event.target;

	// masterCtl should be a checkbox
	if (masterCtl.type != "checkbox")
	{
		return;
	}

	// slaveCtlsPrefix should be a string
	if (slaveCtlsPrefix == null)
	{
		return;
	}

	// sequentially go through each control starting with slaveCtlsPrefix
	// and check or uncheck as appropriate. Stop when we hit the first
	// non-existent control.
	for (i = 1; i != 0; i++)
	{
		ctl = document.getElementById(slaveCtlsPrefix + i + "]");
		if (ctl == null)
		{
			break;
		}

		if (ctl.type != "checkbox")
		{
			break;
		}

		if (masterCtl.checked != ctl.checked)
		{
			ctl.checked = masterCtl.checked;
		}
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       doRefresh
//
//	Description:    Sets the action to ACTION_REFRESH and submits the page
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function doRefresh()
{
	// if user click on Refresh button, an onblur on the current field occurs first.
	// Check to see if there's any field that has to be validated
    // if validation fails, stop submitting the page.
	if (m_contentDocument.m_validationStage == "1")
	{
		if(validateField(m_contentDocument.m_fieldToBeValidated)==false)
        {
            m_keyCode = 0;
            window.event.preventDefault();
            return false;
        }
	}
	else
	{
		m_contentDocument.m_validationStage = "0";
	}
     
	inputForm.action.value = "ACTION_REFRESH";

	if (inputForm.onsubmit())
	{
		inputForm.submit();
	}
}
