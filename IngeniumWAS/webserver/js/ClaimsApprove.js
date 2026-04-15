//******************************************************************************
//*  Component:   ClaimsApprove.js                                             *  
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  Task29  CSE022   New JScript containing the function for popping up       *
//*                   dialog box in Final Approval screen in case the decision *
//*                   code is pending(as part of EN000265)                     *
//*  23774B   CTS     Changes done for ie retirement project to make it        *
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
//---------------------------------------------------------------------------------
//
//	Function:       onClickedActionButtonConfirm
//
//	Description:    This function is called when the user clicks on a button
//	                and you want to put up an alert message asking the user
//	                if they're sure they want to do the action.  You have to
//	                pass in the string that will be displayed in the alert
//	                and the action to be sent if the user chooses OK or
//	                the action to be sent if the user chooses CANCEL in the
//	                alert. If you pass in an empty string for cancelAction,
//	                you will stay on the same page
//
//	Arguments:      See description above
//
//	Returns:        Cancel Action of the Confirm Box
//
//---------------------------------------------------------------------------------

function chkDecsnStat(message, okAction, cancelAction)
{
	// Display a confirm message box to the user displaying the message
	// passed in.  A confirm box has an OK and CANCEL button on it.
	// confirm returns true if OK is pressed.


	if (document.getElementById("action").value == "ACTION_NEXT" && document.getElementById("MIR-POL-ID-3-T[1]") != null )

	{

	   for (i = 1; document.getElementById("MIR-POL-ID-3-T[" + i + "]") != null; i++)
         {  

               if (document.getElementById("MIR-BNFT-DECSN-CD-T[" + i + "]").getAttribute("value") == "U")
               {

	          if (confirm(message) == true)
	              action = okAction;

	          else
	          {
	              if (cancelAction == "")
	              {
	                  //window.event.returnValue = false;
	                  return document.getElementById("action").value;
                      }	
	              else
	              {
	                  document.getElementById("action").value = cancelAction;
	                  action = cancelAction;
	                  return document.getElementById("action").value;
	              }
	           } 
	           return;
	        }
             }
          }

}

