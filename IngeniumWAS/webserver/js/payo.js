// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:19 PM EDT
//******************************************************************************
//*  Component:   payo.js                                                      *
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
//	Functions for PAYO pages (BF094*)
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//	Constants
//
//-----------------------------------------------------------------------------

var maxDests = 15;


//-----------------------------------------------------------------------------
//
//	Function:       onLoadCustom()
//
//	Description:	Custom onLoad functionality required for PAYO
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
//	Uses:       changeFormatInfo from payo.js
//
//
//-----------------------------------------------------------------------------

function onLoadCustomFormat()
{
	for (var i = 1; i <= maxDests; i++)
	{
		var ctl = document.getElementById("MIR-CDI-ALLOC-AMT-T[" + i + "]");
		if (ctl == null)
		{
			// we hit the end of the (generated) table, we can stop
			return;
		}

		// change formatting info according to value of MIR-CDI-ALLOC-CD-T[x]
		// and scale the field
		ctlFld = document.getElementById("MIR-CDI-ALLOC-CD-T[" + i + "]");
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
}

//+----------------------------------------------------------------------------
//
//  Function:       onChangeScalingCustom(ctlCd)
//
//  Description:    Processing for scaling controlled amount fields
//                  (i.e. those fields that have another field that control
//                  whether they are a currency amount or something else) when
//                  the ctlCd field is changed
//
//  Arguments:      ctlCd - field that controls whether amount field is a currency
//                  amount or something else
//
//  Returns:        nothing
//
//  Uses:           scalingRequired() from clientleveledits.js
//                  onChangeScaling() from clientleveledits.js
//
//-----------------------------------------------------------------------------

function onChangeScalingCustom(ctlCd)
{
	var fldCd = new Field(ctlCd);

	// we have to build the name of the amount field from the name of the
	// code field (actually what we really need to know is the index number)
	var fldName = fldCd.getName();
	if (fldName == null)
	{
		fldName = fldCd.getId();
		if (fldName == null)
		{
			return;
		}
	}

	// we know the code field is MIR-CDI-ALLOC-CD-T[nn]. We want to know what nn is.
	var ctlAmtName = "MIR-CDI-ALLOC-AMT-T[" + fldName.substr(19);

	// change formatting info according to value of MIR-CDI-ALLOC-CD-T[x]
	var ctlAmt = document.getElementById(ctlAmtName);
	if (ctlAmt == null)
	{
		// no point in continuing
		// msg: "bad control name in onChangeScalingCustom -" + ctlAmtName
		alert(getUserMessage(msgBadControlonChangecustom) + ctlAmtName);
		return;
	}

	changeFormatInfo(ctlAmt, fldCd);
	var fldAmt = new Field(ctlAmt);
	var txtValue = NumberFormat(fldAmt);
	fldAmt.setValue(txtValue);
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
	if (cd == "A" || cd == "AMOUNT" || cd == "金額")
	{
      if (currentLocale.currencyScale == 1)
      {
         ctlAmt.setAttribute("eLength",15, 0);
      }
      if (currentLocale.currencyScale == 0)
      {
         ctlAmt.setAttribute("maxlength", 14 , 0);
      }
      else
      {
           if (currentLocale.currencyScale == 1)
           {
               ctlAmt.setAttribute("maxlength", 18, 0);
           }
           else
           {
              if (currentLocale.currencyScale == 2)
              {
                  ctlAmt.setAttribute("maxlength", 19, 0);

              }
           }
      }
		ctlAmt.setAttribute("decimals", currentLocale.currencyScale, 0);
		ctlAmt.setAttribute("savedecimals", currentLocale.currencyScale, 0);
		return;
	}

	// cltAmt is a unit amount
	if (cd == "U" || cd == "UNITS" || cd == "ユニット")
	{
		ctlAmt.setAttribute("maxlength", 21, 0);
		ctlAmt.setAttribute("decimals", 9, 0);
		ctlAmt.setAttribute("savedecimals", 9, 0);
		return;
	}

	// cltAmt is a percent
	if (cd == "P" || cd == "PERCENT" || cd == "割合")
	{
		ctlAmt.setAttribute("maxlength", 8, 0);
		ctlAmt.setAttribute("decimals", 4, 0);
		ctlAmt.setAttribute("savedecimals", 4, 0);
		return;
	}

	// we don't know what ctlamt is
	ctlAmt.setAttribute("maxlength", 19, 0);
	ctlAmt.setAttribute("decimals", 9, 0);
	ctlAmt.setAttribute("savedecimals", 9, 0);
}

//+----------------------------------------------------------------------------
//
//  Function:       onSubmitCustom()
//
//  Description:    custom processing for the form onsubmit event
//
//  Arguments:      None
//
//  Returns:        true if submit should continue, false if it should be
//                  cancelled
//
//  Uses:           Field() from clientleveledits.js
//
//-----------------------------------------------------------------------------

function onSubmitCustom()
{
	// On some of the payo screens, we're entering fields as numbers where
	// the server expects text fields. In particular, if there is no data
	// the server wants to see spaces, not 0's. So we'll give it what it
	// wants.

	var ret = onSubmit();

	// we only continue if we could have successfully submitted
	if (!ret)
	{
		return ret;
	}

//017150 Remove the followings
	// this logic is only necessary if we've been scaling currency
//	if (!scalingRequired())
//	{
//		return ret;
//	}

	for (var i = 1; i <= maxDests; i++)
	{
		var ctlAmt = document.getElementById("MIR-CDI-ALLOC-AMT-T[" + i + "]");

		if (ctlAmt == null)
		{
			// we've hit the end of a generated table, we're done
			break;
		}

		var ctlCd = document.getElementById("MIR-CDI-ALLOC-CD-T[" + i + "]");

		var fldCd = new Field(ctlCd);
		if (fldCd.getValue() == "" || fldCd.getValue() == "*")
		{
			var fldAmt = new Field(ctlAmt);
			if (fldAmt.getValue() == "0000000.000000000")
			{
				fldAmt.setValue("");
			}
		}
	}

	return ret;
}
