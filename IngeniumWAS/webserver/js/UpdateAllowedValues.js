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
//*  (C) Copyright 2009-2010 Hewlett-Packard Development Company, L.P.         *
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
//*  Component:   UpdateAllowedValues.js                                       *
//*  Description: Javascript that uses the XMLHttpRequest object to retrieve   *
//*               selection box values dynamically.                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  045331  4.1      Automating Refresh Button                                *
//******************************************************************************

//-----------------------------------------------------------------------------
// Constructs an XMLHttpRequest object.  There are two ways to do
// this depending upon whether you're using IE6 or IE7.
//-----------------------------------------------------------------------------

function createXMLHttpRequest() {
	var xmlHttpRequest;

	if (window.XMLHttpRequest) {
		xmlHttpRequest = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}

	return xmlHttpRequest;
}

//-----------------------------------------------------------------------------
// Get the value of the blank description from a selection box.
// -----------------------------------------------------------------------------

function getCurrentBlankValue(selectElement) {
	for (index = 0; index < selectElement.options.length; index++) {
		if (selectElement.options[index].text == "") {
			return selectElement.options[index].value;
		}			
	}

	return null;
}

//-----------------------------------------------------------------------------
// This method will update the select element whose name is passed in. The
// code looks for the following attributes on the select element:
//
// codesource Identifies the CodeServer data source that provides the allowed
// values.
// codetype Identifies the group of elements in the data source.
// codesubtype Provides further identification of the elements to be returned.
// filterfields The number of filter field attributes
// filterfield1 The first of the filterfields. This is the name of another
// input element on this page that is used to refine the selection
// list. There must be as many filterfieldX elements as the
// value of the filterfields attribute specifies.
// -----------------------------------------------------------------------------

function updateAllowedValues(selectElementName,functionToCall) {
	var xmlHttpRequest = createXMLHttpRequest();
	if (xmlHttpRequest === null) {
		alert("This browser doesn't support XMLHttpRequest");
		return;
	}

	var selectElement = document.getElementById(selectElementName);
	
	// This function will be called when the AJAX call returns.
	
	xmlHttpRequest.onreadystatechange = function() {
		if (xmlHttpRequest.readyState == 4) {
			if (xmlHttpRequest.status == 200) {
				selectElement.length = 0;

				// The XML document will be in this form:
				// <avt><item code="1" description="foo"/></avt>
				// with multiple item elements.
				
				var xmlDoc = xmlHttpRequest.responseXML;
				var items = xmlDoc.getElementsByTagName("item");
				var numberOfItems = items.length;

				for (var index = 0; index < numberOfItems; index++) {
					var item = items[index];
					var description = item.getAttribute("description");
					var code = item.getAttribute("code");

					// If the item has the selected attribute then make it
					// the selected item.
					
					var option = new Option(description, code);
					if (item.getAttribute("selected") !== null) {
						option.selected = true;
					}

					selectElement.add(option, index);
				}

				if (selectElement.onchange !== null) {
					selectElement.onchange();
				}

				// Call additional function when a value is passed in
				if (functionToCall !== undefined) {
					functionToCall();
				}

			} else {
				alert("Unable to retrieve the selection list data for " + selectElementName  + 
						":" + xmlHttpRequest.status);
			}
		}
	};

	// Build the URL to pass to the AJAX server.
	
	var url = "../servlet/ajaxserver?command=updateAllowedValues&";
	url += "value=" + selectElement.value;

	var currentBlankValue = getCurrentBlankValue(selectElement);
	if (currentBlankValue !== null) {
		url += "&blankValue=" + currentBlankValue;
	}

	url += "&codesource=" + selectElement.getAttribute("codesource");
	
	var attributeValue = selectElement.getAttribute("codetype");
	if (attributeValue !== null) {
		url += "&codetype=" + attributeValue;
	}
	
	attributeValue = selectElement.getAttribute("codesubtype");
	if (attributeValue !== null) {
		url += "&codesubtype=" + attributeValue;
	}

	var numberOfFilterFields = selectElement.filterfields;
	if (numberOfFilterFields > 0) {
		url += "&filterfields=";
		for (var count = 1; count <= numberOfFilterFields; count++) {
			var filterFieldName = selectElement.getAttribute("filterfield" + count);
			var filterField = document.getElementById(filterFieldName);
			var filterFieldValue = new Field(filterField).getServerValue(); 
			if (filterFieldValue === null) {
				return;
			}

			url += "FilterField" + count + ":" + filterFieldValue;

			if (count < numberOfFilterFields) {
				url += ",";
			}
		}
	}

	xmlHttpRequest.open("GET", url, true);
	xmlHttpRequest.send(null);
}
