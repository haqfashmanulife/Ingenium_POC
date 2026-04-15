// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:14 PM EDT
//******************************************************************************
//*  Component:   BF5001.js                                                    *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
//*  017150  6.1.2 J  Removal of Currency Scaling                              *
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
//	Functions for JETI pages (BF5001...)
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//	Constants
//
//-----------------------------------------------------------------------------

var maxCoverages = 8;


//-----------------------------------------------------------------------------
//
//	Function:       onLoadCustom()
//
//	Description:	Hide empty rows in Coverages table
//
//	Arguments:	none
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
	// check for currency amount scaling
//017150 Remove the followings
//017150 onLoadCustomScaling();
    onLoadCustomFormat();

	// Hide empty coverages
	var myTable = document.getElementById("Coverages");
	if (myTable == null)
	{
		return;
	}

	var emptyRow = findEmptyRow(myTable);

	// if there are no coverages, leave the first coverage unhidden
	if (emptyRow == 1)
	{
		emptyRow = 2;
	}

	// if there are no empty rows, disable the add rows control and
	// we're done
	if (emptyRow >= maxCoverages)
	{
		var ctl = document.getElementById("addRowButton");
		if (ctl != null)
		{
			ctl.disabled = true;
		}
		return;
	}

	// Loop through coverages and hide each row after the last
	// non-empty one.
	for (var i = emptyRow; i <= maxCoverages; i++)
	{
		document.getElementById("Coverage" + i).style.display = "none";
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       addRow(tableName)
//
//	Description:	Unhide the next unhidden row in a table. If we unhide
//			the last row, disable the button (or link) that was
//			clicked to unhide the row.
//
//	Arguments:	tableName - name of table whose rows we are going to
//			unhide
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------

function addRow(tableName)
{
	var myTable = document.getElementById(tableName);
	if (myTable == null)
	{
		return;
	}

	// Find the first row that is hidden and unhide it
	// We start at 2 because we are assuming there is a heading row and the first
	// row is not hidden.
	for (i = 2; i <= maxCoverages; i++)
	{
		if (document.getElementById("Coverage" + i).style.display == "none")
		{
			document.getElementById("Coverage" + i).style.display = "";
			break;
		}
	}

	// if we unhid the last row, disable the button (or link) they clicked
	// on to invoke this processing.
	if (i == maxCoverages)
	{
		window.event.target.disabled = true;
	}
}

//-----------------------------------------------------------------------------
//
//	Function:       findEmptyRow(myTable)
//
//	Description:	Finds the first empty row in a table
//
//	Arguments:	myTable - table to search
//
//	Returns:	Index of first empty row (1 based). Will return a
//			value greater than the number of rows in the table
//			if there are no empty rows.
//
//-----------------------------------------------------------------------------

function findEmptyRow(myTable)
{
	for (var i = 1; i <= maxCoverages; i++)
	{
		var val;
		if (document.getElementById("MIR-PLAN-ID-T[" + i + "]").tagName == "SELECT")
		{
			val = document.getElementById("MIR-PLAN-ID-T[" + i + "]").value;
		}
		else
		{
			val = document.getElementById("MIR-PLAN-ID-T[" + i + "]").innerText;
		}

		if (cleanString(val) == "")
		{
			return i;
		}
	}

	return i;
}

//-----------------------------------------------------------------------------
//
//	Function:       onLoadCustomFormat()
//
//	Description:	Checks if currency fields need conditional formatting (i.e.
//	                formatting based on the value of another field) and if they
//	                do, will format the fields that need it on the initial page
//	                load
//
//	Arguments:	None
//
//	Returns:	Nothing
//
//	Uses:           changeFormatInfo from BF5001.js
//
//-----------------------------------------------------------------------------

function onLoadCustomFormat()
{
	// not all of the jeti screens have the fields that need to be formatted
	// so we'll check for the first one. If we don't find it, we'll assume
	// that they don't have the rest.
	ctl = document.getElementById("MIR-OUT-ALLOC-AMT-PCT-T[1]");
	if (ctl == null)
	{
		return;
	}

	// format the fields that require (conditional) formatting
	for (var i = 1; i <= maxCoverages; i++)
	{
		ctl = document.getElementById("MIR-OUT-ALLOC-AMT-PCT-T[" + i + "]");
		if (ctl == null)
		{
			// we hit the end of the (generated) table, we can stop
			return;
		}
    	ctlFld = document.getElementById("MIR-CVG-OUT-ALLOC-CD-T[" + i + "]");
    	if (ctlFld != null)
    	{
    		var fldCd = new Field(ctlFld);
    		changeFormatInfo(ctl, fldCd);

    		var fldAmt = new Field(ctl);
    		var txtValue = NumberFormat(fldAmt);
    		fldAmt.setValue(txtValue);
    	}
	}
}

//+----------------------------------------------------------------------------
//
//  Function:       onChangeScaling(ctlCd)
//
//  Description:    Processing for formatting controlled amount fields
//                  (i.e. those fields that have another field that control
//                  whether they are a currency amount or something else) when
//                  the ctlCd field is changed
//
//  Arguments:      ctlCd - field that controls whether amount field is a currency
//                  amount or something else
//
//  Returns:        nothing
//
//  Uses:           changeFormatInfo  from BF5001.js
//
//-----------------------------------------------------------------------------

function onChangeScaling(ctlCd)
{
	fldCd = new Field(ctlCd);

	fldName = fldCd.getName();
	if (fldName == null)
	{
		fldName = fldCd.getId();
		if (fldName == null)
		{
			return;
		}
	}

	var ctlAmtName = "MIR-OUT-ALLOC-AMT-PCT-T[" + fldName.substr(23);
    ctl = document.getElementById(ctlAmtName);


	// update value of field for new formatting
	changeFormatInfo(ctl, fldCd);
    var fld = new Field(ctl);
	var txtValue = NumberFormat(fld);
	fld.setValue(txtValue);
}
//+----------------------------------------------------------------------------
//
//  Function:       changeFormatInfo(ctlAmt, fldCd)
//
//  Description:    Change the value of the length, elength and decimals
//                  attributes on an amount field based on the value of an
//                  associated code field
//
//  Arguments:      ctlAmt - controlling containing amount
//                  fldCd - field that controls what ctlAmt is
//
//  Returns:        nothing
//
//-----------------------------------------------------------------------------

function changeFormatInfo(ctlAmt, fldCd)
{
	// note: when checking values, cd could be a code or a description of the
	//       code!

	var cd = fldCd.getValue();
   ctlAmt.setAttribute("elength", 11, 0);
   if (currentLocale.currencyScale == 1)
   {
      ctlAmt.setAttribute("eLength",10, 0);
   }

	// ctlAmt is an amount
	if (cd == "A" || cd == "AMOUNT" || cd == "àz")
	{
      if (currentLocale.currencyScale == 0)
      {
         ctlAmt.setAttribute("maxlength", 9 , 0);
      }
      else
      {
           if (currentLocale.currencyScale == 1)
           {
               ctlAmt.setAttribute("maxlength", 13, 0);
           }
           else
           {
              if (currentLocale.currencyScale == 2)
              {
                  ctlAmt.setAttribute("maxlength", 14, 0);

              }
           }
      }
		ctlAmt.setAttribute("decimals", currentLocale.currencyScale, 0);
		ctlAmt.setAttribute("savedecimals", currentLocale.currencyScale, 0);
		return;
	}

	// we don't know what ctlamt is
	ctlAmt.setAttribute("maxlength", 12, 0);
	ctlAmt.setAttribute("decimals", 3, 0);
	ctlAmt.setAttribute("savedecimals", 3, 0);
}

