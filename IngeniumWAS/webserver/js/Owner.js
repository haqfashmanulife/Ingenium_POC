// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   Owner.jsame>                                                 *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
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
//	Custom script for Owner.htm
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//	Function:       toggleReplacement
//
//	Description:    toggle the Policy Replacment screen section
//	                and handle dependent mandatory fields
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function toggleReplacement()
{
   if (inputForm.ReplacingPolicy_Q[0].checked)
   {
       inputForm.Replacement1035_Q.checked=false;
       
       ctl = document.getElementsByName("MIR-POL-REPL-TYP-CD");
       if(ctl)
       {
            ctl[0].setAttribute("Mandatory","yes");
            ctl[1].setAttribute("Mandatory","yes");
            changeLabel(ctl[0]);
       }

       ctl = document.getElementById("MIR-REPL-POL-ID");
       if(ctl)
       {
            ctl.setAttribute("Mandatory","yes");
            changeLabel(ctl);
       }

       Replacement.style.display = "Block";
   }
   else
   {
       ctl = document.getElementsByName("MIR-POL-REPL-TYP-CD");
       if(ctl)
       {
            ctl[0].setAttribute("Mandatory","no");
            ctl[1].setAttribute("Mandatory","no");
       }

       ctl = document.getElementById("MIR-REPL-POL-ID");
       if(ctl)
       {
            ctl.setAttribute("Mandatory","no");
       }
       Replacement.style.display = "None";
   }
}

//-----------------------------------------------------------------------------
//
//	Function:       toggle1035
//
//	Description:    toggle the 1035 question area
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function toggle1035()
{
    if(inputForm.Replacement1035_Q.checked)
    {
        Repl1035_Label.style.display = "Block";
        Repl1035_Content.style.display = "Block";
    }
    else
    {
        Repl1035_Label.style.display = "None";
        Repl1035_Content.style.display = "None";
    }
}
