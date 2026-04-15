//**************************************************************************************
//*  Component:   CoverageAllocations.js                                               *
//*  Description: This will allow multiple fund rows for a rider to be                 *
//*               displayed without repeating the data common to each row.             *
//*                                                                                    *
//**************************************************************************************
//*  Chg#    Release  Author  Description                                              *
//*                                                                                    *
//*  MFFALL  03OCT05  CLB     New member.                                              *
//*  23774B  10APR22  CTS     Changes done for ie retirement project to make it        *
//*                           compatible for microsoft edge. Changes in html include   *
//*                           adding "id" attribute for all input fields and changes in*
//*                           java scripts to modify certain functions/commands which  *
//*                           are no longer compatilble with edge.                     *
//**************************************************************************************
//-----------------------------------------------------------------------------
//
//  Custom script for BF0850-O.htm and BF0851-I.htm
//
//-----------------------------------------------------------------------------
//
//  Function:       CvgAllocLoad
//
//  Description:    Determine if Screen Line is for display of full coverage
//                  data or for partial coverage data.
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function CvgAllocLoad()
{
  var allocTable = document.getElementById("allocTable");
   
  for (i=1; i<140; i++)
  {
    rowcvgs = allocTable.rows.item(i);
    CvgNumCtl = document.getElementById("MIR-CVG-NUM-T[" + i + "]");
    PlanIDCtl = document.getElementById("MIR-PLAN-ID-T[" + i + "]");
    CvgStatCtl = document.getElementById("MIR-CVG-CSTAT-CD-T[" + i + "]");
    CvgAmtCtl = document.getElementById("MIR-CDI-CVG-ALLOC-AMT-T[" + i + "]");
    indCtl= document.getElementById("MIR-DV-JS-LOAD-CD-T[" + i + "]");
    if(indCtl)
    {
      indicator = indCtl.value;
      switch(indicator)
      {
        case 'R': // If this is a repeated coverage line, blank out the following values
          CvgNumCtl.style.display='none';
          PlanIDCtl.style.display='none';
          CvgStatCtl.style.display='none';
          CvgAmtCtl.style.display='none';
          break;
      }
    }
  }
}
