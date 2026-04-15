// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:11 PM EDT
//******************************************************************************
//*  Component:   Policypayo.js                                                 *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  UY3004   CTS    PAYOUT POLICY ID LIST CHANGES                             *
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
//  Function:       SubInpPayoPolicy,SubInpPayoPolicy1,SubInpPayoPolicy2,
//                  SubInpPayoPolicy3,SubInpPayoPolicy4
//
//  Description:    All functions Reads the policy id and suffix from the screen 
//                  and display policy number as 10 digit
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
function SubInpPayoPolicy()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
     if (indicator == "Y")
     {
      var pol5 = document.getElementById("MIR-10-POL-ID");
      payopol = pol5.value;
      document.getElementById("MIR-POL-ID-BASE").innerHTML  = payopol.substr(0,9);
      document.getElementById("MIR-POL-ID-SFX").innerHTML   = payopol.substr(9,1);
     }
}

function SubInpPayoPolicy1()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pol6 = document.getElementById("MIR-10-POL-ID");
      payopol = pol6.value;
      document.getElementById("MIR-POL-ID").innerHTML = payopol.substr(0,10);
  }
}

function SubInpPayoPolicy2()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pol11 = document.getElementById("MIR-10-POL-ID");
      payopol = pol11.value;
      document.getElementById("MIR-DEST-POL-ID-BASE").innerHTML  = payopol.substr(0,9);
      document.getElementById("MIR-DEST-POL-ID-SFX").innerHTML   = payopol.substr(9,1);
  }
}

function SubInpPayoPolicy3()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pol12 = document.getElementById("MIR-10-POL-ID");
      payopol = pol12.value;
      document.getElementById("MIR-CHQ-REF-ID").innerHTML  = payopol.substr(0,10);
  }
}

function SubInpPayoPolicy4()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var polc1 = document.getElementById("MIR-10-POL-ID");
      payopol = polc1.value;
      document.getElementById("MIR-CPEVNT-POL-CLI-ID-BASE").innerHTML  = payopol.substr(0,9);
      document.getElementById("MIR-CPEVNT-POL-CLI-ID-SFX").innerHTML   = payopol.substr(9,1);
  }
}
function SubInpPayoPolicy5()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pol13 = document.getElementById("MIR-10-POL-ID");
      payopol = pol13.value;
      document.getElementById("MIR-POL-ID-BASE").innerHTML  = payopol.substr(0,10);
  }
}
//-----------------------------------------------------------------------------
//
//  Function:       SubInpArPayoPolicy,SubInpArPayoPolicy1,SubInpArPayoPolicy2
//
//  Description:    Reads the policy id and suffix from the List screen and display 
//                  policy number as 10 digit
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
function  SubInpArPayoPolicy()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pol10 = document.getElementById("MIR-10-POL-ID");
      payopol = pol10.value;
      for (i=1; document.getElementById("MIR-POL-ID-BASE-T["+i+"]").innerHTML != null ; i++)
      {
        document.getElementById("MIR-POL-ID-BASE-T["+i+"]").innerHTML  = payopol.substr(0,10);
      }
  }
}

function  SubInpArPayoPolicy1()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pol8= document.getElementById("MIR-10-POL-ID");
      payopol = pol8.value;
      for (i=1; document.getElementById("MIR-DEST-POL-ID-BASE-T["+i+"]").innerHTML != null ; i++)
      {
        document.getElementById("MIR-POL-ID-BASE-T["+i+"]").innerHTML  = payopol.substr(0,9);
        document.getElementById("MIR-DEST-POL-ID-SFX-T["+i+"]").innerHTML   = payopol.substr(9,1);
      }
  }
}

function  SubInpArPayoPolicy2()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pol9 = document.getElementById("MIR-10-POL-ID");
      payopol = pol9.value;
      for (i=1; document.getElementById("MIR-POL-ID-T["+i+"]").innerHTML != null ; i++)
      {
        document.getElementById("MIR-POL-ID-T["+i+"]").innerHTML  = payopol.substr(0,10);
      }
  }
}
//-----------------------------------------------------------------------------
//
//  Function:       InpPayoPolicy,InpPayoPolicy1,InpPayoPolicy2,InpPayoPolicy3,
//                  InpPayoPolicy4
//
//  Description:    Reads the policy id and suffix from the input screen and 
//                  wherever policy id is an editable field and .display policy 
//                  number as 10 digit
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
function InpPayoPolicy()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pol1 = document.getElementById("MIR-10-POL-ID");
      payopol = pol1.value;
      document.all("MIR-POL-ID-BASE").value  = payopol.substr(0,9);
      document.all("MIR-POL-ID-SFX").value   = payopol.substr(9,1);
  }
}

function InpPayoPolicy1()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pol2 = document.getElementById("MIR-10-POL-ID");
      payopol = pol2.value;
      document.all("MIR-POL-ID").value  = payopol.substr(0,10);
  }
}

function InpPayoPolicy2()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pol3 = document.getElementById("MIR-10-POL-ID");
      payopol = pol3.value;
      document.all("MIR-POL-ID").value  = payopol.substr(0,10);
  }
}

function InpPayoPolicy3()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pol4 = document.getElementById("MIR-10-POL-ID");
      payopol = pol4.value;
      document.all("MIR-DEST-POL-ID-BASE").value  = payopol.substr(0,9);
      document.all("MIR-DEST-POL-ID-SFX").value   = payopol.substr(9,1);
  }
}

function InpPayoPolicy4()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pol5 = document.getElementById("MIR-10-POL-ID");
      payopol = pol5.value;
      document.all("MIR-CPEVNT-POL-CLI-ID-BASE").value  = payopol.substr(0,9);
      document.all("MIR-CPEVNT-POL-CLI-ID-SFX").value   = payopol.substr(9,1);
  }
}
function InpPayoPolicy5()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pol6 = document.getElementById("MIR-10-POL-ID");
      payopol = pol6.value;
      document.all("MIR-POL-ID-BASE").value  = payopol.substr(0,10);
  }
}
//-------------------------------------------------------------------------------------
//
//  Function:       inputlistPayopolicy,returnlistPayopolicy,inputlistPayopolicy1,
//                  returnlistPayopolicy1
//
//  Description:    Reads the policy id and suffix from the page and assigns to varibales 
//                  while page submition holds the value to reget the records on list 
//                  page if user/Agent doesnt change/retain the policy on editable input field.
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------------
function inputlistPayopolicy()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      var pollistp1 = document.getElementById("MIR-10-POL-ID");
      payopol = pollistp1.value;
      document.all("MIR-POL-ID-BASE").value  = payopol.substr(0,9);
      document.all("MIR-POL-ID-SFX").value   = payopol.substr(9,1);
      
      var pollist1 = document.all("MIR-POL-ID-BASE").value;
      var pollist2 = document.all("MIR-POL-ID-SFX").value;

      document.all("Dispolval").value = pollist1;
      document.all("Dissfxval").value = pollist2;
  }
}

function returnlistPayopolicy()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
      
    var  pollist3 = document.all("Dispolval").value;
    var  pollist4 = document.all("Dissfxval").value;
    var  pollist5 = pollist3.substr(0,9);
    
    if (pollist5 == document.all("MIR-POL-ID-BASE").value && document.all("MIR-POL-ID-SFX").value == "")
       { 
         document.all("MIR-POL-ID-BASE").value = pollist3;
         document.all("MIR-POL-ID-SFX").value = pollist4;
       }
   }
}

function inputlistPayopolicy1()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  polNew= document.getElementById("MIR-10-POL-ID");
  disyPol = polNew.value;
  indicator = indCtl.value;
  if (indicator == "Y")
  {
     var pollistp2 = document.getElementById("MIR-10-POL-ID");
     payopol = pollistp2.value;
     document.all("MIR-CPEVNT-POL-CLI-ID-BASE").value  = payopol.substr(0,9);
     document.all("MIR-CPEVNT-POL-CLI-ID-SFX").value   = payopol.substr(9,1);
      
     var pollist11 = document.all("MIR-CPEVNT-POL-CLI-ID-BASE").value;
     var pollist21 = document.all("MIR-CPEVNT-POL-CLI-ID-SFX").value;

     document.all("Dispolval").value = pollist11;
     document.all("Dissfxval").value = pollist21;
   }
}

function returnlistPayopolicy1()
{
  indCtl= document.getElementById("MIR-STR3-PAYO-IND");
  indicator = indCtl.value;
  if (indicator == "Y")
  {
    var  pollist31 = document.all("Dispolval").value;
    var  pollist41 = document.all("Dissfxval").value;
    var  pollist51 = pollist31.substr(0,9);
    
    if (pollist51 == document.all("MIR-CPEVNT-POL-CLI-ID-BASE").value && document.all("MIR-CPEVNT-POL-CLI-ID-SFX").value == "")
       { 
         document.all("MIR-CPEVNT-POL-CLI-ID-BASE").value = pollist31;
         document.all("MIR-CPEVNT-POL-CLI-ID-SFX").value = pollist41;
       }
  }
}
