// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:11 PM EDT
//******************************************************************************
//*  Component:   BF022x.js                                                 *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
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
//     Functions for the BF022x.htm pages (Disbursement Functions)
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//     Functions:      onLoadCustom()
//
//     Description:    1.  Determines value selected as the Pay Out Method
//                      when page is loaded
//
//                     2.  Passes this value to Function checkValue()
//
//     Arguments:         None
//
//     Returns:         Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{
    var ctl=document.getElementById("MIR-DV-TRNXT-PAYO-MTHD-CD").selectedIndex;
    var elementSelected=document.getElementById("MIR-DV-TRNXT-PAYO-MTHD-CD").options[ctl].value;
    checkValue(elementSelected);
}

//-----------------------------------------------------------------------------
//
//     Function:       checkValue()
//
//     Description:    1.  Evaluates the pay out method passed to it and sends
//                      a boolean value to function displayEFTrow() based
//                      on the results of that evaluation
//
//     Arguments:         1.  If pay out method received (selectCtl) is 'C',
//                      sends boolean value of false to function displayEFTrow()
//
//                  2.  If pay out method received (selectCtl) is not 'C',
//                      sends boolean value of true to function displayEFTrow()
//
//     Returns:        nothing
//
//
//-----------------------------------------------------------------------------
    
function checkValue(selectCtl)
{
    if(selectCtl == 'C')
    {
        displayEFTRow(false);
    }
    
    else
    {
        displayEFTRow(true);
    }

}

//-----------------------------------------------------------------------------
//
//     Function:       displayEFTRow()
//
//     Description:    1.  Evaluates boolean value passed to it to determine which
//                      account number to show in the first row of the accounting
//                      fields
//
//     Arguments:         1.  If value received (show) is 'true', displays the EFT
//                      disbursement account (25300) in the first accounting row
//
//                  2.  If value received (show) is 'false', displays the Cheque
//                      disbursent account (259900) in the first accounting row
//
//     Returns:        nothing
//
//-----------------------------------------------------------------------------

function displayEFTRow(show)
{
    var chqFieldCtl = document.getElementById("nonEFTRow");
    var eftFieldCtl = document.getElementById("rowEFT");
    if (show)
     {
	    chqFieldCtl.style.display = "none";
        eftFieldCtl.style.display = "";
        
        //  IN CASE IT IS DECIDED THE DESCRIPTION TEXT SHOULD ALSO 
        //  CHANGE, SIMPLY REMOVE THE COMMENTS FROM THE FOLLOWING 
        //  LINE OF CODE
        
        //  document.getElementById("MIR-DV-ACCT-DESC-TXT-T[1]").value = "EFT DISB ACCT";
    }
     
    else
     {
		chqFieldCtl.style.display = "";
        eftFieldCtl.style.display = "none";
        //  IN CASE IT IS DECIDED THE DESCRIPTION TEXT SHOULD ALSO 
        //  CHANGE, SIMPLY REMOVE THE COMMENTS FROM THE FOLLOWING 
        //  LINE OF CODE

        //  document.getElementById("MIR-DV-ACCT-DESC-TXT-T[1]").value = "CHEQUE DISB ACCT";
        }
}
