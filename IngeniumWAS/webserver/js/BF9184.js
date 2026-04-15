// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:15 PM EDT
//******************************************************************************
//*  Component:   BF9184.js                                                    *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  PR006I  ManuMed Rider Release                                             *
//*  MM0077  Remove the override on the prem chng date field in case 'H'       *
//*  23774A  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//******************************************************************************
 
//-----------------------------------------------------------------------------
//
//  Custom script for BF9184-I.htm 
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//
//  Function:       RiderRenewCheck
//
//  Description:    Determine if Screen Line is Rider Renew (R) or a Total
//                  line (T) and blank or highlight certain fields. 
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function RiderRenewCheck()
{
  for (i=1; i<61; i++)
  {
    PlanIdCtl = document.getElementById("MIR-DISP-PLAN-ID-T[" + i + "]");
    CvgNumCtl = document.getElementById("MIR-DISP-CVG-NUM-T[" + i + "]");
    DurationCtl = document.getElementById("MIR-DISP-CVG-STBL-1-CD-T[" + i + "]");
    BenefitCtl = document.getElementById("MIR-DISP-CVG-STBL-2-CD-T[" + i + "]");
    ClientNameCtl = document.getElementById("MIR-DISP-DV-INSRD-CLI-NM-T[" + i + "]");
    FaceAmtCtl = document.getElementById("MIR-DISP-CVG-FACE-AMT-T[" + i + "]");
    MpremAmtCtl = document.getElementById("MIR-DISP-CVG-MPREM-AMT-T[" + i + "]");
    MpremChgDtCtl = document.getElementById("MIR-DISP-CVG-PREM-CHNG-DT-T[" + i + "]");
    indCtl= document.getElementById("MIR-DISP-DV-CVG-RENEW-CD-T[" + i + "]");
    if(indCtl)
    {
      indicator = indCtl.value;
      switch(indicator)
      {
        case 'H': // 2nd line suppress client id 
          ClientNameCtl.style.display='none';
          break;
        case 'T': // Total Line 1
          PlanIdCtl.style.display='none';
          CvgNumCtl.style.display='none';
          DurationCtl.style.display='none';
          BenefitCtl.style.display='none';
          MpremChgDtCtl.style.display='none';
          FaceAmtCtl.style.display='none';
          ClientNameCtl.style.color='#FF0000';
          ClientNameCtl.style.fontWeight='bold';
          MpremAmtCtl.style.color='#FF0000';
          MpremAmtCtl.style.fontWeight='bold';
          break;
        case 'V': // Total Line 2
          PlanIdCtl.style.display='none';
          CvgNumCtl.style.display='none';
          DurationCtl.style.display='none';
          BenefitCtl.style.display='none';
          MpremChgDtCtl.style.display='none';
          FaceAmtCtl.style.display='none';
          ClientNameCtl.style.color='#008000';
          ClientNameCtl.style.fontWeight='bold';
          MpremAmtCtl.style.color='#008000';
          MpremAmtCtl.style.fontWeight='bold';
          break;
      }
    }
  }
}

