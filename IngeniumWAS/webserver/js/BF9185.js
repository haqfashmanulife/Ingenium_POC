// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:15 PM EDT
//******************************************************************************
//*  Component:   BF9185.js                                                    *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  PR006I  ManuMed Rider Release                                             *
//*  RP2009  Medical Re-pricing Changes                                        *
//*  RPL009  Limited Pay changes                                               *
//*  MP142B  Renewal Quote screen changes                                      *
//*  Q06190  New Duration drop down lossing data for disabled rows             *
//*  M241A3  Added new function to refresh the page when plan got changed      *
//*  018395  CHANGES DONE FOR RIDER RENEWAL                                    *
//*  TDM21C  CHANGES DONE FOR AUTOMATIC RIDER RENEWAL                          *
//*  23774A  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*  UY3033  CHANGES DONE FOR STREAM 3 RIDER RENEWAL                           *
//******************************************************************************
 
//-----------------------------------------------------------------------------
//
//  Custom script for BF9185-I.htm 
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
  var cvgTable = document.getElementById("cvgTable");
  for (i=1; i<110; i++)
  {
    rowcvgs = cvgTable.rows.item(i);
    StatCtl = document.getElementById("MIR-DV-CHNG-STATUS-T[" + i + "]");
    PlanIdCtl = document.getElementById("MIR-PLAN-ID-T[" + i + "]");
    NewPlanIdCtl = document.getElementById("temp-DV-CVG-PLAN-ID-" + i);
    CvgNumCtl = document.getElementById("MIR-CVG-NUM-T[" + i + "]");
    DurationCtl = document.getElementById("MIR-CVG-STBL-1-CD-T[" + i + "]");
    BenefitCtl = document.getElementById("MIR-CVG-STBL-2-CD-T[" + i + "]");
    Stbl3Ctl = document.getElementById("MIR-CVG-STBL-3-CD-T[" + i + "]");
    Stbl4Ctl = document.getElementById("MIR-CVG-STBL-4-CD-T[" + i + "]");
    NewDurationCtl = document.getElementById("MIR-DV-CVG-STBL-1-CD-T[" + i + "]");
    NewBenefitCtl = document.getElementById("MIR-DV-CVG-STBL-2-CD-T[" + i + "]");
    NewStbl3Ctl = document.getElementById("MIR-DV-CVG-STBL-3-CD-T[" + i + "]");
    NewStbl4Ctl = document.getElementById("MIR-DV-CVG-STBL-4-CD-T[" + i + "]");
    ClientNameCtl = document.getElementById("MIR-DV-INSRD-CLI-NM-T[" + i + "]");
    FaceAmtCtl = document.getElementById("MIR-CVG-FACE-AMT-T[" + i + "]");
    MpremAmtCtl = document.getElementById("MIR-CVG-MPREM-AMT-T[" + i + "]");
    NewMpremAmtCtl = document.getElementById("MIR-DV-CVG-MPREM-AMT-T[" + i + "]");
    NewFaceAmtCtl = document.getElementById("MIR-DV-CVG-FACE-AMT-T[" + i + "]");
    MpremChgDtCtl = document.getElementById("MIR-CVG-PREM-CHNG-DT-T[" + i + "]");
    IgnrErrCtl=document.getElementById("MIR-IGNORE-ERROR-IND-T[" + i + "]");
    indCtl= document.getElementById("MIR-DV-CVG-RENEW-CD-T[" + i + "]");
    if(indCtl)
    {
      indicator = indCtl.value;
      switch(indicator)
      {
        case '': // blank out entire row
          rowcvgs.style.display = "none";
          break;
        case 'R': // If renewing, change field colors
          NewFaceAmtCtl.style.color='#FF0000'; 
          NewPlanIdCtl.style.color='#FF0000';
          NewDurationCtl.style.color='#FF0000'; 
          NewBenefitCtl.style.color='#FF0000';
          break;
        case 'H': // 2nd line suppress client id 
          ClientNameCtl.style.display='none';
          MpremChgDtCtl.style.display='none';
          break;
        case 'T': // If Total Line, blank out field
          PlanIdCtl.style.display='none';
          NewPlanIdCtl.style.display='none';
          CvgNumCtl.style.display='none';
          DurationCtl.style.display='none';
          BenefitCtl.style.display='none';
          NewDurationCtl.style.display='none';
          NewBenefitCtl.style.display='none';
          NewStbl3Ctl.style.display='none';
          NewStbl4Ctl.style.display='none';
          Stbl3Ctl.style.display='none';
          Stbl4Ctl.style.display='none';
          IgnrErrCtl.style.display='none';
          MpremChgDtCtl.style.display='none';
          FaceAmtCtl.style.display='none';
          ClientNameCtl.style.color='#FF0000';
          ClientNameCtl.style.fontWeight='bold';
          MpremAmtCtl.style.color='#FF0000';
          MpremAmtCtl.style.fontWeight='bold';
          NewFaceAmtCtl.style.display='none';
          NewFaceAmtCtl.tabindex="";
          NewMpremAmtCtl.style.color='#FF0000';
          NewMpremAmtCtl.style.fontWeight='bold';
          break;
      }
// start of code for MP142B
      if (indicator == "R" || indicator == "H") 
      {
        var NewPrem = document.getElementById("MIR-DV-CVG-MPREM-AMT-T[" + i + "]").innerText;
        var FirstDigit = NewPrem.substr(1);
        if (NewPlanIdCtl.value == "" && FirstDigit == "0")
        {
          //case of termination of coverage, need to make fields non-editable
          document.getElementById("temp-DV-CVG-PLAN-ID-" + i ).disabled = true;
          document.getElementById("MIR-DV-CVG-STBL-1-CD-T[" + i + "]").disabled = true;
          document.getElementById("MIR-DV-CVG-STBL-2-CD-T[" + i + "]").disabled = true;
          document.getElementById("MIR-DV-CVG-STBL-3-CD-T[" + i + "]").disabled = true;
          document.getElementById("MIR-DV-CVG-STBL-4-CD-T[" + i + "]").disabled = true;
          document.getElementById("MIR-DV-CVG-FACE-AMT-T[" + i + "]").disabled = true;
        }
      }
      if (indicator == "R" || indicator == "H" || indicator == "N") 
      {
        FaceAmtChngCtl = document.getElementById("MIR-FACE-AMT-CHNG-OK-T[" + i + "]");
        var faceamtchng = FaceAmtChngCtl.value;
        if (faceamtchng == "Y")
        {
          //case of face amount only editable
          document.getElementById("temp-DV-CVG-PLAN-ID-" + i ).disabled = true;
          document.getElementById("MIR-DV-CVG-STBL-1-CD-T[" + i + "]").disabled = true;
          document.getElementById("MIR-DV-CVG-STBL-2-CD-T[" + i + "]").disabled = true;
          document.getElementById("MIR-DV-CVG-STBL-3-CD-T[" + i + "]").disabled = true;
          document.getElementById("MIR-DV-CVG-STBL-4-CD-T[" + i + "]").disabled = true;
          document.getElementById("MIR-DV-CVG-FACE-AMT-T[" + i + "]").disabled = false;          
        }
      }
// end of code for MP142B
// START OF CODE OF 018395
      if (indicator == "R" || indicator == "H" || indicator == "N") 
      {
        CvgrenwCtl =  document.getElementById("MIR-DV-CVG-RENW-IND-T[" + i + "]");
        var cvgrenw = CvgrenwCtl.value;
        if (cvgrenw == "Y")
        {
          //case of face amount only editable
	 document.getElementById("temp-DV-CVG-PLAN-ID-" + i ).disabled=true;
	 document.getElementById("MIR-DV-CVG-STBL-1-CD-T[" + i + "]").disabled=true;
	 document.getElementById("MIR-DV-CVG-STBL-2-CD-T[" + i + "]").disabled=true;
	 document.getElementById("MIR-IGNORE-ERROR-IND-T[" + i + "]").disabled=true;   
	 document.getElementById("MIR-DV-CVG-STBL-3-CD-T[" + i + "]").disabled = true;
     document.getElementById("MIR-DV-CVG-STBL-4-CD-T[" + i + "]").disabled = true;
        }
      }
// end of code for 018395
// START OF CODE OF TDM21C
      if (indicator == "R" || indicator == "H" || indicator == "N") 
      {
        AutorenwCtl =  document.getElementById("MIR-DV-AUTO-RENW-IND-T[" + i + "]");
        var autorenw = AutorenwCtl.value;
        if (autorenw == "Y")
        {
          //For TRAD Auto renewal - display base coverage with non-editable
	 document.getElementById("temp-DV-CVG-PLAN-ID-" + i ).disabled=true;
	 document.getElementById("MIR-DV-CVG-STBL-1-CD-T[" + i + "]").disabled=true;
	 document.getElementById("MIR-DV-CVG-STBL-2-CD-T[" + i + "]").disabled=true;
	 document.getElementById("MIR-IGNORE-ERROR-IND-T[" + i + "]").disabled=true;   
	 document.getElementById("MIR-DV-CVG-STBL-3-CD-T[" + i + "]").disabled = true;
         document.getElementById("MIR-DV-CVG-STBL-4-CD-T[" + i + "]").disabled = true;
         document.getElementById("MIR-DV-CVG-FACE-AMT-T[" + i + "]").disabled = true;
        }
      }
// END OF CODE TDM21C
    }
  }
  for (i=1; i<110; i++) 
  {
  document.getElementById("MIR-DV-CVG-STBL-1-CD-T[" + i + "]").disabled = false;
  document.getElementById("MIR-DV-CVG-STBL-2-CD-T[" + i + "]").disabled = false;
  document.getElementById("MIR-DV-CVG-STBL-3-CD-T[" + i + "]").disabled = false;
  document.getElementById("MIR-DV-CVG-STBL-4-CD-T[" + i + "]").disabled = false;
  document.getElementById("MIR-DV-CVG-FACE-AMT-T[" + i + "]").disabled = false;
  }
// START OF CODE OF UY3033  
  for (i=2; i<110; i++) 
  {
  document.getElementById("temp-DV-CVG-PLAN-ID-" + i ).disabled = false;
  indCtl= document.getElementById("MIR-DV-CVG-RENEW-CD-T[" + i + "]");
  if(indCtl)
   {
    indicator = indCtl.value;
   }
   if (indicator == "W")
   {
    document.getElementById("MIR-DV-CVG-STBL-1-CD-T[" + i + "]").disabled = true;
    document.getElementById("MIR-DV-CVG-STBL-2-CD-T[" + i + "]").disabled = true;
    document.getElementById("MIR-DV-CVG-STBL-3-CD-T[" + i + "]").disabled = true;
    document.getElementById("MIR-DV-CVG-STBL-4-CD-T[" + i + "]").disabled = true;
    document.getElementById("MIR-DV-CVG-FACE-AMT-T[" + i + "]").disabled = true;
    document.getElementById("temp-DV-CVG-PLAN-ID-" + i ).disabled = true;
   }
  } 
       
// END OF CODE UY3033  
}

//-----------------------------------------------------------------------------
//
//  Function:       IgnoreErrorCheck
//
//  Description:    Determine if ignore error cehckbox is selected for short term
//                  hospitalization or female disease riders, if so enable new
//                  plan ID, stbl 1 to 4 and face amount fields, disable otherwise.
//                  added for MP142B. Needs to be called from onclick event of 
//                  MIR-IGNORE-ERROR-IND-T
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function IgnoreErrorCheck()
{
  var cvgTable = document.getElementById("cvgTable");
   
  for (i=1; i<110; i++)
  {
    NewMpremAmtCtl = document.getElementById("MIR-DV-CVG-MPREM-AMT-T[" + i + "]");
    indCtl= document.getElementById("MIR-DV-CVG-RENEW-CD-T[" + i + "]");
    if(indCtl)
    {
      var indicator = indCtl.value;
      var newpremium = NewMpremAmtCtl.innerText;
      if ((indicator == "R" || indicator == "H" || indicator == "N") && document.getElementById("MIR-IGNORE-ERROR-IND-T[" + i + "]").checked == true && newpremium.substr(1) == "0")
      {
          //fields should become editable when ignore error check box is selected
          document.getElementById("temp-DV-CVG-PLAN-ID-" + i ).disabled = false;
          document.getElementById("MIR-DV-CVG-STBL-1-CD-T[" + i + "]").disabled = false;
          document.getElementById("MIR-DV-CVG-STBL-2-CD-T[" + i + "]").disabled = false;
          document.getElementById("MIR-DV-CVG-STBL-3-CD-T[" + i + "]").disabled = false;
          document.getElementById("MIR-DV-CVG-STBL-4-CD-T[" + i + "]").disabled = false;
          document.getElementById("MIR-DV-CVG-FACE-AMT-T[" + i + "]").disabled = false;  
      }
      if ((indicator == "R" || indicator == "H" || indicator == "N") && document.getElementById("MIR-IGNORE-ERROR-IND-T[" + i + "]").checked == false && newpremium.substr(1) == "0")
      {
          //fields should become non-editable when ignore error check box is un-selected
          document.getElementById("temp-DV-CVG-PLAN-ID-" + i ).disabled = true;
          document.getElementById("MIR-DV-CVG-STBL-1-CD-T[" + i + "]").disabled = true;
          document.getElementById("MIR-DV-CVG-STBL-2-CD-T[" + i + "]").disabled = true;
          document.getElementById("MIR-DV-CVG-STBL-3-CD-T[" + i + "]").disabled = true;
          document.getElementById("MIR-DV-CVG-STBL-4-CD-T[" + i + "]").disabled = true;
          document.getElementById("MIR-DV-CVG-FACE-AMT-T[" + i + "]").disabled = true;          
      }
    }
  }
}


//-----------------------------------------------------------------------------
//
//  Function:       EnableOnSubmit
//
//  Description:    fields should become editable before submit to stop loss of data
//                  disabled fields are loosing data while coming out of this page
//                  added as fix for Q06190
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function EnableOnSubmit()
{
  var cvgTable = document.getElementById("cvgTable");
  for (i=1; i<110; i++)
  {
    indCtl= document.getElementById("MIR-DV-CVG-RENEW-CD-T[" + i + "]");
    if(indCtl)
    {
      indicator = indCtl.value;
      if (indicator == "R" || indicator == "H" || indicator == "N")
      {
          //fields should become editable before submit to stop loss of data
          document.getElementById("temp-DV-CVG-PLAN-ID-" + i ).disabled = false;
          document.getElementById("MIR-DV-CVG-STBL-1-CD-T[" + i + "]").disabled = false;
          document.getElementById("MIR-DV-CVG-STBL-2-CD-T[" + i + "]").disabled = false;
          document.getElementById("MIR-DV-CVG-STBL-3-CD-T[" + i + "]").disabled = false;
          document.getElementById("MIR-DV-CVG-STBL-4-CD-T[" + i + "]").disabled = false;
          document.getElementById("MIR-DV-CVG-FACE-AMT-T[" + i + "]").disabled = false;  
      
      }
    }
  }
}
//--M241A3 Changes start here--
//-----------------------------------------------------------------------------
//
//	Function:       doRefreshPlan
//
//	Description:    Sets the action to ACTION_PLANCHG and submits the page
//
//	Arguments:      None
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function doRefreshPlan()
{
	// if user changes the Plan, call the refresh and set action = ACTION_PLANCHG
	// Check to see if there's any field that has to be validated
    // if validation fails, stop submitting the page.
	if (m_contentDocument.m_validationStage == "1")
	{
		if(validateField(m_contentDocument.m_fieldToBeValidated)==false)
        {
            m_keyCode = 0;
            window.event.preventDefault();
            return false;
        }
	}
	else
	{
		m_contentDocument.m_validationStage = "0";
	}
     
	inputForm.action.value = "ACTION_PLANCHG";

	if (inputForm.onsubmit())
	{
		inputForm.submit();
	}
}
//--M241A3 Changes End here--
