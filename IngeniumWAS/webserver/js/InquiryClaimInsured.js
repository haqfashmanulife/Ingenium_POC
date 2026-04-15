//***************************************************************************************
//*  Component:   InquiryClaimInsured.js                                                *
//*  Description: This will allow multiple rows for a claim insured to be               *
//*               displayed without repeating the data common to each row.              *
//*                                                                                     *
//***************************************************************************************
//*  Chg#    Release  Author  Description                                               *
//*                                                                                     *
//*  EN0225  21JUL06  RAJU    New member.                                               *
//*  23774B  10APR22  CTS     Changes done for ie retirement project to make it         *
//*                           compatible for microsoft edge. Changes in html include    *
//*                           adding "id" attribute for all input fields and changes in *
//*                           java scripts to modify certain functions/commands which   *
//*                           are no longer compatilble with edge.                      *
//*  AS0044  11DEC23  CTS     ASD-44 CHANGES DONE TO FIX THE DUPLICATE CLAIM ID ISSUE   *
//***************************************************************************************
//-----------------------------------------------------------------------------
//
//  Custom script for BF9896-O.htm
//
//-----------------------------------------------------------------------------
//
//  Function:       InqClmInsured
//
//  Description:    Determine if Screen Line is for display of full coverage
//                  data or for partial coverage data.
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function InqClmInsured()
{
  var ClaimList = document.getElementById("ClaimList");

//AS0044 CHANGES STARTS HERE   
//for (i=1; i<30; i++)
  for (i=1; i<=30; i++)
//AS0044 CHANGES STARTS HERE
  {
    rowcvgs = ClaimList.rows.item(i);
    ClmIdCtl = document.getElementById("MIR-CLM-ID-T[" + i + "]");
    AscClmIdCtl = document.getElementById("MIR-ASSOC-CLM-ID-T[" + i + "]");
    indCtl= document.getElementById("MIR-DV-JS-LOAD-CD-T[" + i + "]");
    if(indCtl)
    {
      indicator = indCtl.value;
      switch(indicator)
      {
        case 'R': // If this is a repeated claim line, blank out the following values
          ClmIdCtl.style.display='none';
          AscClmIdCtl.style.display='none';
          break;
      }
    }
  }
}
