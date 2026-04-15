// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   printPage.js                                                 *
//*  Description: Ensure ActiveX control is available before enabling print.   *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*                                                                            *
//******************************************************************************

//*****************************************************************************
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
// (C) COPYRIGHT 2003 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED
//*****************************************************************************


//-----------------------------------------------------------------------------
//
//	Functions for 
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//	Constants
//
//-----------------------------------------------------------------------------




//-----------------------------------------------------------------------------
//
//	Function:       printPage()
//
//	Description:    If print ActiveX control is not available, disable
//                    print buttons.
//
//	Arguments:	    object which contains print controls
//
//	Returns:	    Nothing
//
//-----------------------------------------------------------------------------

function printPageInit(object)
{
    var controls = object.all.tags("input");

    // initially disable the print buttons
    for ( i = 0; i < controls.length; i++ )
    {
        controls[i].disabled = true;
    }
    if ( !factory.object )
    {
        alert("ActiveX Control to support printing not properly installed.");
        return;
    }

    // Set print settings
    factory.printing.header = "";
    factory.printing.footer = "";
    factory.printing.portrait = false;
    factory.printing.topMargin = 21;
    factory.printing.leftMargin = 50;

    // enable control buttons
    var templateSupported = factory.printing.IsTemplateSupported();

    for ( i = 0; i < controls.length; i++ )
    {
        controls[i].disabled = false;
        if ( templateSupported )
            controls[i].style.display = "inline";
    }
    return;
}
