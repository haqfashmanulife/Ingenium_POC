// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   polc.js                                                      *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*          6.0.2J   New for release 6.0.2J                                   *
//*  017150  6.1.2J   Removal of Currency Scaling                              *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
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
//	Functions for POLC pages (BF802*)
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//	Function:       onLoadCustom()
//
//	Description:	Custom onLoad functionality required for ANDI
//
//	Arguments:	none
//
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
	// check for conditional currency amount scaling
//017150 Remove the followings
//017150 onLoadCustomScaling();
    onLoadCustomFormat();

//017150 Add the followings
        return;
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
//	Uses:       changeFormatInfo from polc.js
//
//-----------------------------------------------------------------------------

function onLoadCustomFormat()
{
	ctl = document.getElementById("MIR-OUT-ALLOC-AMT-PCT");
	if (ctl == null)
	{
		//  we can stop
		return;
	}

	// change formatting info according to value of MIR-CVG-OUT-ALLOC-CD
	// and scale the field
	ctlFld = document.getElementById("MIR-CVG-OUT-ALLOC-CD");
	if (ctlFld != null)
	{
		var fldCd = new Field(ctlFld);
		changeFormatInfo(ctl, fldCd);


		// update value of field for new formatting
		var fldAmt = new Field(ctl);
		var txtValue = NumberFormat(fldAmt);
		fldAmt.setValue(txtValue);
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
//  Uses:           changeFormatInfo  from polc.js
//
//-----------------------------------------------------------------------------

function onChangeScaling(ctlCd)
{
	fldCd = new Field(ctlCd);

	// we have to build the name of the amount field from the name of the
	// code field (actually what we really need to know is the index number)
	fldName = fldCd.getName();
	if (fldName == null)
	{
		fldName = fldCd.getId();
		if (fldName == null)
		{
			return;
		}
	}

    ctl = document.getElementById("MIR-OUT-ALLOC-AMT-PCT");

	changeFormatInfo(ctl, fldCd);

	// update value of field for new formatting
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

	// cltAmt is an amount
	if (cd == "A" || cd == "AMOUNT" || cd == "àz")
	{
      if (currentLocale.currencyScale == 1)
      {
         ctlAmt.setAttribute("eLength",14, 0);
      }
      if (currentLocale.currencyScale == 0)
      {
         ctlAmt.setAttribute("maxlength", 13 , 0);
      }
      else
      {
           if (currentLocale.currencyScale == 1)
           {
               ctlAmt.setAttribute("maxlength", 17, 0);
           }
           else
           {
              if (currentLocale.currencyScale == 2)
              {
                  ctlAmt.setAttribute("maxlength", 18, 0);

              }
           }
      }
		ctlAmt.setAttribute("decimals", currentLocale.currencyScale, 0);
		ctlAmt.setAttribute("savedecimals", currentLocale.currencyScale, 0);
		return;
	}

	// we don't know what ctlamt is
	ctlAmt.setAttribute("maxlength", 19, 0);
	ctlAmt.setAttribute("decimals", 3, 0);
	ctlAmt.setAttribute("savedecimals", 3, 0);
}

