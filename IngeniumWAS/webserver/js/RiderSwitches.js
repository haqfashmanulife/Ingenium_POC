// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//**************************************************************************************
//*  Component:   RiderSwitches.js                                                     *
//*  Description:                                                                      *
//*                                                                                    *
//**************************************************************************************
//*  Chg#    Release  Author  Description                                              *
//*                                                                                    *
//*  MM0123  Jun 26           Add duration and bnft type to chktempPlan function       *
//*  DM37    10Oct03  CLB     Add new face amount field to screen                      *
//*  MFPLI5  02AUG04  CLB     Add a checkbox for Option 2 and 3 choice.                *
//*  P03143  28JUN06  CLB     Enable dur chg for 1 yr dur life in first year.          *
//*  RP2010  22JUN07  CTS     Add Sub Table 4 field to screen                          *
//*  RP2010                   Add new Renewal code 'M' to enable  Sub Table 4          *
//*  RPL010  07NOV07  CTS     Add Sub Table 3 field to screen                          *
//*  MP185H  29JUL12  CTS     Enabled the Sub-table 3 field                            *
//*  23774B  10APR22  CTS     Changes done for ie retirement project to make it        *
//*                           compatible for microsoft edge. Changes in html include   *
//*                           adding "id" attribute for all input fields and changes in*
//*                           java scripts to modify certain functions/commands which  *
//*                           are no longer compatilble with edge.                     *
//**************************************************************************************
//-----------------------------------------------------------------------------
//
//  Custom scripts for BF9182-I.htm, BF9182-O.htm and BF9183-I.htm
//
//-----------------------------------------------------------------------------
//
//  Function:       RiderSwitchLoad
//
//  Description:    Determine if Screen Line is Rider Renew (R) or a Total
//                  line (T) and blank or highlight certain fields.
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function RiderSwitchLoad()
{
  var cvgTable = document.getElementById("cvgTable");

  for (i=1; i<110; i++)
  {
    rowcvgs = cvgTable.rows.item(i);
    StatCtl = document.getElementById("MIR-DV-CHNG-STATUS-T[" + i + "]");
    PlanIdCtl = document.getElementById("temp-PLAN-ID-" + i);
    CvgNumCtl = document.getElementById("MIR-CVG-NUM-T[" + i + "]");
    SelectCtl = document.getElementById("SELECT-T[" + i + "]");
    DurationCtl = document.getElementById("MIR-CVG-STBL-1-CD-T[" + i + "]");
    BenefitCtl = document.getElementById("MIR-CVG-STBL-2-CD-T[" + i + "]");
    Stbl3Ctl = document.getElementById("MIR-CVG-STBL-3-CD-T[" + i + "]");
    Stbl4Ctl = document.getElementById("MIR-CVG-STBL-4-CD-T[" + i + "]");
    ClientNameCtl = document.getElementById("MIR-DV-INSRD-CLI-NM-T[" + i + "]");
    FaceAmtCtl = document.getElementById("MIR-CVG-FACE-AMT-T[" + i + "]");
    NewFaceAmtCtl = document.getElementById("MIR-DV-CVG-FACE-AMT-T[" + i + "]");
    MpremAmtCtl = document.getElementById("MIR-CVG-MPREM-AMT-T[" + i + "]");
    MpremChgDtCtl = document.getElementById("MIR-CVG-PREM-CHNG-DT-T[" + i + "]");
    indCtl= document.getElementById("MIR-DV-CVG-RENEW-CD-T[" + i + "]");
    if(indCtl)
    {
      indicator = indCtl.value;
      switch(indicator)
      {
        case '': // blank out entire row
          rowcvgs.style.display = "none";
          break;
        case 'S': // Default to input field colour
          PlanIdCtl.style.color='#FF0000';
          DurationCtl.style.color='#FF0000';
          BenefitCtl.style.color='#FF0000';
          NewFaceAmtCtl.style.color='#FF0000';
          Stbl3Ctl.style.color='#FF0000';
          Stbl4Ctl.style.color='#FF0000';
          break;
        case 'D': // disable changeable fields
          DurationCtl.disabled = true;
          break;
        case 'E': // disable changeable fields
          SelectCtl.disabled = true;
          PlanIdCtl.style.color='#808080';
          DurationCtl.style.color='FF0000';
          BenefitCtl.disabled = true;
          Stbl3Ctl.disabled = true;
          Stbl4Ctl.disabled = true;
          NewFaceAmtCtl.style.color='#808080';
          break;
        case 'F': // disable changeable fields for life riders, M00037
                  // enable duration for life riders, MFPLI5
                  // enable subtable 3 for life riders
          PlanIdCtl.style.color='#FF0000';
          DurationCtl.style.color='#FF0000';
//        DurationCtl.disabled = true;
          BenefitCtl.disabled = true;
//        Stbl3Ctl.disabled = true;
          Stbl3Ctl.style.color='#FF0000';
          Stbl4Ctl.disabled = true;
          NewFaceAmtCtl.style.color='#FF0000';
          break;
        case 'G': // disable changeable field for medical riders, M00037
          PlanIdCtl.style.color='#FF0000';
          SelectCtl.disabled = true;
          DurationCtl.style.color='#FF0000';
          BenefitCtl.style.color='#FF0000';
          Stbl3Ctl.style.color='#FF0000';
          Stbl4Ctl.disabled = true;
          NewFaceAmtCtl.disabled = true;
          break;
        case 'L': // disable changeable fields
          BenefitCtl.disabled = true;
          break;
        case 'B': // disable changeable fields
          DurationCtl.disabled = true;
          BenefitCtl.disabled = true;
          break;
        case 'N': // disable changeable fields
          PlanIdCtl.disabled = true;
          SelectCtl.disabled = true;
          DurationCtl.disabled = true;
          BenefitCtl.disabled = true;
          Stbl3Ctl.disabled = true;
          Stbl4Ctl.disabled = true;
          NewFaceAmtCtl.disabled = true;
          break;
        case 'M': // Enable Stbl4 field for surgery benefit medical riders
          PlanIdCtl.style.color='#FF0000';
          SelectCtl.disabled = true;
          DurationCtl.style.color='#FF0000';
          BenefitCtl.style.color='#FF0000';
          Stbl3Ctl.style.color='#FF0000';
          Stbl4Ctl.style.color='#FF0000';
          NewFaceAmtCtl.disabled = true;
          break;
        case 'T': // If Total Line, blank out field
          PlanIdCtl.style.display='none';
          CvgNumCtl.style.display='none';
          SelectCtl.style.display='none';
          DurationCtl.style.display='none';
          BenefitCtl.style.display='none';
          Stbl3Ctl.style.display='none';
          Stbl4Ctl.style.display='none';
          MpremChgDtCtl.style.display='none';
          FaceAmtCtl.style.display='none';
          NewFaceAmtCtl.style.display='none';
          ClientNameCtl.style.color='#FF0000';
          ClientNameCtl.style.fontWeight='bold';
          MpremAmtCtl.style.color='#FF0000';
          MpremAmtCtl.style.fontWeight='bold';
         break;
      }
    }
  }
}
//-----------------------------------------------------------------------------
//
//  Function:       RiderSwitchDisplay
//
//  Description:    Determine if Screen Line is Rider Renew (R) or a Total
//                  line (T) and blank or highlight certain fields.
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function RiderSwitchDisplay()
{
  for (i=1; i<61; i++)
  {
    PlanIdCtl = document.getElementById("MIR-DISP-PLAN-ID-T[" + i + "]");
    CvgNumCtl = document.getElementById("MIR-DISP-CVG-NUM-T[" + i + "]");
    DurationCtl = document.getElementById("MIR-DISP-CVG-STBL-1-CD-T[" + i + "]");
    BenefitCtl = document.getElementById("MIR-DISP-CVG-STBL-2-CD-T[" + i + "]");
    Stbl3Ctl = document.getElementById("MIR-DISP-CVG-STBL-3-CD-T[" + i + "]");
    Stbl4Ctl = document.getElementById("MIR-DISP-CVG-STBL-4-CD-T[" + i + "]");
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
          Stbl3Ctl.style.display='none';
          Stbl4Ctl.style.display='none';
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
          Stbl3Ctl.style.display='none';
          Stbl4Ctl.style.display='none';
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
//-----------------------------------------------------------------------------
//
//  Function:       chktempPlan
//
//  Description:    re-enable the temp plan id's so Pathfinder will
//                  collect them.
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function chktempPlan()
{
  var cvgTable = document.getElementById("cvgTable");

  for (i=1; i<110; i++)
  {
    PlanIdCtl = document.getElementById("temp-PLAN-ID-" + i);
    DurationCtl = document.getElementById("MIR-CVG-STBL-1-CD-T[" + i + "]");
    BenefitCtl = document.getElementById("MIR-CVG-STBL-2-CD-T[" + i + "]");
    Stbl3Ctl = document.getElementById("MIR-CVG-STBL-3-CD-T[" + i + "]");
    Stbl4Ctl = document.getElementById("MIR-CVG-STBL-4-CD-T[" + i + "]");
    NewFaceAmtCtl = document.getElementById("MIR-DV-CVG-FACE-AMT-T[" + i + "]");
    indCtl= document.getElementById("MIR-DV-CVG-RENEW-CD-T[" + i + "]");
    if(indCtl)
    {
      indicator = indCtl.value;
      switch(indicator)
      {
        case 'N': // re-enable changeable fields
          PlanIdCtl.disabled = false;
          DurationCtl.disabled = false;
          BenefitCtl.disabled = false;
          NewFaceAmtCtl.disabled = false;
          Stbl3Ctl.disabled = false;
          Stbl4Ctl.disabled = false;
          break;
        case 'F': // re-enable changeable fields for life riders, M00037
          PlanIdCtl.disabled = false;
          DurationCtl.disabled = false;
          BenefitCtl.disabled = false;
          Stbl3Ctl.disabled = false;
          Stbl4Ctl.disabled = false;
          NewFaceAmtCtl.disabled = false;
          break;
        case 'G': // re-enable changeable field for medical riders, M00037
          PlanIdCtl.disabled = false;
          DurationCtl.disabled = false;
          BenefitCtl.disabled = false;
          Stbl3Ctl.disabled = false;
          Stbl4Ctl.disabled = false;
          NewFaceAmtCtl.disabled = false;
          break;
        case 'M': // re-enable changeable field for medical riders, RP2010
          PlanIdCtl.disabled = false;
          DurationCtl.disabled = false;
          BenefitCtl.disabled = false;
          Stbl3Ctl.disabled = false;
          Stbl4Ctl.disabled = false;
          NewFaceAmtCtl.disabled = false;
          break;
      }
    }
  }
}
