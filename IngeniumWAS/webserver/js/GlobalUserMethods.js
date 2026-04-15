// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:16 PM EDT
//******************************************************************************
//*  Component:   GlobalUserMethods.js                                         *
//*  Description: This file was created to contain global methods added by     *
//*               users of INGENIUM.  It is created to provide an easy method  *
//*               to override or enhance default INGENIUM JScript, while at the*
//*               same time ensuring that an easy upgrade path is maintained.  *
//*               SOLCORP will not modify this file, but will include it in    *
//*               each HTML page included in the base release of INGENIUM.     *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*          1.1      New for Pathfinder 1.1                                   *
//*  015290  6.3      Pre & Post TEFRA Processing Enhancements                 *
//*  P01161  612J     Adjust field size to accommodate currency scale          *
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
//  Note:  Add methods to this file as needed.  This file will be the last script
//         included in the base system of INGENIUM and will therefore overwrite
//         duplicate methods if they exist.  This file can be used as a user
//         exit where routines supplied by the base system can be overridden and
//         replaced if required.  The file is supplied as a shell only, and
//         is included for maintainability of the system.
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//     Function:       getCheckedRadioValue(radioGrp)
//
//     Description:     Returns the value of the current selection within the
//                         radio group.  If none are selected, returns null.
//
//     Arguments:         radioGrp - the control representing the entire radio group.
//
//     Returns:         Either the value of the currently selected choice, or
//                         null if none is chosen.
//
//     eg:                ctlValue = getCheckedRadioValue(document.getElementById("theRadio"));
//
//-----------------------------------------------------------------------------

function getCheckedRadioValue(radioGrp)
{
     for (var index = 0; index < radioGrp.length; index++)
     {
          if (radioGrp[index].checked)
          {
               return radioGrp[index].value;
          }
     }

     return null;
}

//-----------------------------------------------------------------------------
//
//     Function:       setCheckedRadioValue(radioGrp, choice)
//
//     Description:     Sets the radio button choice corresponding to the value 
//                         passed in.  If no choice matches, no action is taken.
//
//     Arguments:         radioGrp - a control representing the entire group of 
//                                      radio buttons
//                         choice      - the value of the choice to be selected
//
//     Returns:         nothing
//
//     eg:                setCheckedRadioValue(document.getElementById("theRadio"), "Y");
//
//-----------------------------------------------------------------------------

function setCheckedRadioValue(radioGrp, choice)
{
     for (var index = 0; index < radioGrp.length; index++)
     {
          if (choice == radioGrp[index].value)
          {
               radioGrp[index].checked = true;
               break;
          }
     }
}

//-----------------------------------------------------------------------------
//
//     Function:       disableControl(ctl, [disable])
//
//     Description:     Prevents (or enables) various types of controls from having
//                         their values changed, without having to set their disabled
//                         status to true.  This is because if a control is truly
//                         disabled, its value will not be sent with the form.
//
//                         - For checkboxes, adds (or removes) flipCheckbox() as an
//                         onclick handler
//                         - For textboxes and passwords, sets the field's readonly
//                         attribute to true (or false)
//
//     Arguments:         ctl - the control being disabled or enabled.
//
//     OPTIONAL:          disable - true or false, indicating whether to disable or not.
//                              (Defaults to true.)
//
//     Returns:         none
//
//-----------------------------------------------------------------------------

function disableControl(ctl, disable)
{
     if (null == ctl)
     {
          return;
     }
     if (null == disable)
     {
          // Assume disable
          disable = true;
     }

     switch (ctl.type)
     {
          case "checkbox":
               if (disable)
               {
                    // Ensure it's not already attached.
                    ctl.removeEventListener("onclick", flipCheckbox);
                    ctl.addEventListener("onclick", flipCheckbox);
               }
               else
               {
                    ctl.removeEventListener("onclick", flipCheckbox);
               }
          case "text":
          case "password" :
               if (disable)
               {
                    ctl.readOnly = true;
               }
               else
               {
                    ctl.readOnly = false;
               }
          default:
               return;
     }
}


//-----------------------------------------------------------------------------
//
//     Function:       flipCheckbox()
//
//     Description:     An onclick event handler which prevents a checkbox's value
//                         from being changed without having to disable it, in which
//                         case its value wouldn't be submitted with the form.
//
//                         NOTE: if the requirement is to disable a checkbox in this
//                                way, but only under certain conditions, then you
//                                should attach this handler using the inhibitCheckbox(ctl)
//                                method.
//
//     NOTE:               DO NOT attach this event twice to the same checkbox control
//                         unless your intent is to reverse its purpose!!!! i.e. attachEvent
//                         adds to the list of eventhandlers, it doesn't replace them,
//                         so attaching this handler twice would cause the checkbox's
//                         status to be inverted then reverted again!
//                         If you use inhibitCheckbox(ctl) to attach the event you don't
//                         need to worry about this problem.
//
//     Arguments:         none
//
//     Returns:         none
//
//-----------------------------------------------------------------------------

function flipCheckbox()
{
     ctl = window.event.srcElement;

     ctl.checked = !ctl.checked;
}
//+----------------------------------------------------------------------------
//
//  Function:       onLoad()
//
//  Description:    run functions required on page load
//
//  Arguments:      None
//
//  Returns:        nothing
//
//-----------------------------------------------------------------------------

function onLoad()
{

  return;
}


//-----------------------------------------------------------------------------
//
//     Function:       onloadTable(ctl)
//
//     Description:     This function will hide the Table headingsif they have 
//                  no data to display. The script assumes
//                       that the tables have 2 heading rows
//
//
//     Arguments:         ctl - the Table ID.
//
//
//     Returns:         none
//
//-----------------------------------------------------------------------------

function onLoadTable(ctl)
{

     tbl = document.getElementById(ctl);
    
    if (tbl != null)
     {
          if (tbl.rows.length <= 2)
          {
               tbl.style.display = "none";
          }
     }
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
//+----------------------------------------------------------------------------
//
//  Function:       isValueCurrency(code)
//
//  Description:    Checks a code to see if it indicates a currency. Used with
//                  conditional number scaling.
//
//                  ***********************************************************
//
//                  This is the default check and may be overridden by
//                  a custom implementation of this function specific to a
//                  screen.
//
//                  ***********************************************************
//
//  Arguments:      code to check
//
//  Returns:        true if code indicates currency, false otherwise
//
//-----------------------------------------------------------------------------

function isValueCurrency(code)
{
  // Unfortunately we don't always get the code, sometimes its been
  // translated, so we check for the translated values too.
  return (code == "A" || code == "AMOUNT" || code == "àz")
}

//+----------------------------------------------------------------------------
//  Function:       convertToMIRValues
//  Description:    converts the fields values to their MIR representation
//-----------------------------------------------------------------------------

function convertToMIRValues()
{
	// only have to do <input> fields
	var aElements = document.body.getElementsByTagName("input");

	for (var count = 0; count < aElements.length; count++)
	{
		var tag = aElements[count];
		var field = new Field(tag);

                // if the field is a currency, fixed the adjusted field size
                var maxLength = field.getMaxLength();                               
                if (field.isCurrency())
                {
                   var decimals = field.getAttributeValue("Decimals");                   
	           if (null == decimals)
	           {
                      if (field.getDecimals() == 0)
                      {
                         maxLength = maxLength + 2;
                      }
                      else
                      {
                         if (field.getDecimals() == 1)
                         {
                           maxLength = maxLength + 1;
                         }
                      }
	           }                 
                }                 
		if (field.isCurrency() || field.isNumber()   ||
		    field.isPercent()  || field.isYear()     ||
		    field.isMonth()    || field.isDay())
		{
                        tag.value = convertToMIRNumber(field.getValue(), maxLength);
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

