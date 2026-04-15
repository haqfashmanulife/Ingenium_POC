//***************************************************************************************
//*  Component:   PAIFundAllocation.js                                                  *
//*  Description: This will allow multiple fund rows for a rider to be                  *
//*               displayed without repeating the data common to each row.              *
//*                                                                                     *
//***************************************************************************************
//*  Chg#    Release  Author  Description                                               *
//*                                                                                     *
//*  MFFPI   23JAN06  JE      New member.                                               *
//*  23774B  10APR22  CTS     Changes done for ie retirement project to make it         *
//*                           compatible for microsoft edge. Changes in html include    *
//*                           adding "id" attribute for all input fields and changes in *
//*                           java scripts to modify certain functions/commands which   *
//*                           are no longer compatilble with edge.                      *
//***************************************************************************************
//-----------------------------------------------------------------------------
//
//  Custom script for BF9985-O.htm
//
//-----------------------------------------------------------------------------
//
//  Function:       PAIFundSurrLoad
//
//  Description:    Determine if Screen Line is for display of full coverage
//                  data or for partial coverage data.
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function PAIFundSurrLoad()
{
  var surrTable = document.getElementById("surrTable");
   
  for (i=1; i<28; i++)
  {
    rowcvgs = surrTable.rows.item(i);
    AcumCvgAmtCtl = document.getElementById("MIR-DV-ACUM-FND-VAL2-T[" + i + "]");
    CvgSurrAmtCtl = document.getElementById("MIR-DV-SURRCHRG2-T[" + i + "]");
    NetSurrAmtCtl = document.getElementById("MIR-DV-NET-GCSV-AMT2-T[" + i + "]");
    indCtl= document.getElementById("MIR-DV-JS-LOAD-CD2-T[" + i + "]");
    if(indCtl)
    {
      indicator = indCtl.value;
      switch(indicator)
      {
        case 'R': // If this is a repeated coverage line, blank out the following values
          AcumCvgAmtCtl.style.display='none';
          CvgSurrAmtCtl.style.display='none';
          NetSurrAmtCtl.style.display='none';
          break;
      }
    }
  }
}
