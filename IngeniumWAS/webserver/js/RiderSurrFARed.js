//
//**************************************************************************************
//*  Component:   RiderSurrFARed.js                                                    *
//*  Description:                                                                      *
//*                                                                                    *
//**************************************************************************************
//*  Chg#    Release  Author  Description                                              *
//*  MP242F  DEC 24   CTS     CHECK PLAN IDS ELIGIBLE FOR WOP INDICATOR EDIT           *
//*  23774B  10APR22  CTS     Changes done for ie retirement project to make it        *
//*                           compatible for microsoft edge. Changes in html include   *
//*                           adding "id" attribute for all input fields and changes in*
//*                           java scripts to modify certain functions/commands which  *
//*                           are no longer compatilble with edge.                     *
//**************************************************************************************
//-----------------------------------------------------------------------------
//
//  Custom scripts for BF.htm   
//
//-----------------------------------------------------------------------------
//
//  Function:       WOP Indicator Check
//
//  Description:    Determine if Plan is eligible for Waiver of Premium
//                  Indicator Edit
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function WOPIndicatorEditable()

{
 var y = document.getElementById('CvgInfo').rows;
 var z = y.length;
 var elementCount = z - 1;
   for (i=1; i<elementCount; i++)
   {
        if ((document.getElementById("MIR-CVG-NUM-T[" + i + "]").innerText == "01"))

    {
       document.getElementById("MIR-CVG-WP-IND-T[" + i + "]").onclick="onCheckBox()";
       document.getElementById("MIR-CVG-WP-IND-T[" + i + "]").onfocus="enterField(this)";
    }

   }

        return;
}
