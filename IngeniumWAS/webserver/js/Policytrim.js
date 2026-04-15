// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:11 PM EDT
//******************************************************************************
//*  Component:   Policytrim.js                                                 *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  UY3004   CTS    DUPLICATE POLICY ID LIST CHANGES                          *
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
//  Function:       SubInpTrimPolicy,SubInpTrimPolicy1,SubInpTrimPolicy2,
//                  SubInpTrimPolicy3,SubInpTrimPolicy4
//
//  Description:    All functions Reads the policy id and suffix from the screen 
//                  and display policy number as 7 digit and make suffix blank
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
function SubInpTrimPolicy()
{
  if (document.getElementById("MIR-POL-ID-BASE").innerHTML != null)
  { 
    var pol5 = document.getElementById("MIR-POL-ID-BASE").innerHTML;
    document.getElementById("MIR-POL-ID-BASE").innerHTML = pol5.substr(0,7);
   }
  if (document.getElementById("MIR-POL-ID-SFX").innerHTML != null)
  { 
    var pol7 = document.getElementById("MIR-POL-ID-SFX").innerHTML;
    document.getElementById("MIR-POL-ID-SFX").innerHTML = "";
  }
}

function SubInpTrimPolicy1()
{
  if (document.getElementById("MIR-POL-ID").innerHTML != null)
  { 
    var pol6 = document.getElementById("MIR-POL-ID").innerHTML;
    document.getElementById("MIR-POL-ID").innerHTML = pol6.substr(0,7);
  }
}

function SubInpTrimPolicy2()
{
  if (document.getElementById("MIR-DEST-POL-ID-BASE").innerHTML != null)
  { 
    var pol11 = document.getElementById("MIR-DEST-POL-ID-BASE").innerHTML;
    document.getElementById("MIR-DEST-POL-ID-BASE").innerHTML = pol11.substr(0,7);
  }

  if (document.getElementById("MIR-DEST-POL-ID-SFX").innerHTML != null)
  { 
    var pol12 = document.getElementById("MIR-DEST-POL-ID-SFX").innerHTML;
    document.getElementById("MIR-DEST-POL-ID-SFX").innerHTML = "";
  }
}

function SubInpTrimPolicy3()
{
  if (document.getElementById("MIR-CHQ-REF-ID").innerHTML != null)
  { 
    var pol11 = document.getElementById("MIR-CHQ-REF-ID").innerHTML;
     document.getElementById("MIR-CHQ-REF-ID").innerHTML = pol11.substr(0,7);
  }
}

function SubInpTrimPolicy4()
{
  if (document.getElementById("MIR-CPEVNT-POL-CLI-ID-BASE").innerHTML != null)
  { 
    var polc1 = document.getElementById("MIR-CPEVNT-POL-CLI-ID-BASE").innerHTML;
    document.getElementById("MIR-CPEVNT-POL-CLI-ID-BASE").innerHTML = polc1.substr(0,7);
  }

  if (document.getElementById("MIR-CPEVNT-POL-CLI-ID-SFX").innerHTML != null)
  { 
    var polc2 = document.getElementById("MIR-CPEVNT-POL-CLI-ID-SFX").innerHTML;
    document.getElementById("MIR-CPEVNT-POL-CLI-ID-SFX").innerHTML = "";
  }
}
//-----------------------------------------------------------------------------
//
//  Function:       SubInpArTrimPolicy,SubInpArTrimPolicy1,SubInpArTrimPolicy2
//
//  Description:    Reads the policy id and suffix from the List screen and display 
//                  policy number as 7 digit and make suffix blank
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
function  SubInpArTrimPolicy()
{
  if (document.getElementById("MIR-POL-ID-BASE-T[1]").innerHTML != null )
  {
    for (i=1; document.getElementById("MIR-POL-ID-BASE-T["+i+"]").innerHTML != null ; i++)
    {
      var pol10 = document.getElementById("MIR-POL-ID-BASE-T["+i+"]").innerHTML;
      document.getElementById("MIR-POL-ID-BASE-T["+i+"]").innerHTML = pol10.substr(0,7);
    }  
  }
}

function  SubInpArTrimPolicy1()
{
  if (document.getElementById("MIR-DEST-POL-ID-BASE-T[1]").innerHTML != null )
  {
    for (i=1; document.getElementById("MIR-DEST-POL-ID-BASE-T["+i+"]").innerHTML != null ; i++)
    {
      var pol8 = document.getElementById("MIR-DEST-POL-ID-BASE-T["+i+"]").innerHTML;
      document.getElementById("MIR-DEST-POL-ID-BASE-T["+i+"]").innerHTML = pol8.substr(0,7);
      
      var sfx1 = getElementById("MIR-DEST-POL-ID-SFX-T["+i+"]").innerHTML;
      document.getElementById("MIR-DEST-POL-ID-SFX-T["+i+"]").innerHTML = "";
    }  
  }
}

function  SubInpArTrimPolicy2()
{
  if (document.getElementById("MIR-POL-ID-T[1]").innerHTML != null )
  {
    for (i=1; document.getElementById("MIR-POL-ID-T["+i+"]").innerHTML != null ; i++)
    {
      var pol9 = document.getElementById("MIR-POL-ID-T["+i+"]").innerHTML;
      document.getElementById("MIR-POL-ID-T["+i+"]").innerHTML = pol9.substr(0,7);
    }  
  }
}

function  SubInpArTrimPolicy3()
{
  if (document.getElementById("MIR-POL-ID-2-T[1]").innerHTML != null )
  {
    for (i=1; document.getElementById("MIR-POL-ID-2-T["+i+"]").innerHTML != null ; i++)
    {
      var pol9 = document.getElementById("MIR-POL-ID-2-T["+i+"]").innerHTML;
      document.getElementById("MIR-POL-ID-2-T["+i+"]").innerHTML = pol10.substr(0,7);
    }  
  }
}

function  SubInpArTrimPolicy4()
{
  if (document.getElementById("MIR-POL-ID-3-T[1]").innerHTML != null )
  {
    for (i=1; document.getElementById("MIR-POL-ID-3-T["+i+"]").innerHTML != null ; i++)
    {
      var pol9 = document.getElementById("MIR-POL-ID-3-T["+i+"]").innerHTML;
      document.getElementById("MIR-POL-ID-3-T["+i+"]").innerHTML = pol11.substr(0,7);
    }  
  }
}

function  SubInpArTrimPolicy5()
{
  if (document.getElementById("MIR-POL-ID-5-T[1]").innerHTML != null )
  {
    for (i=1; document.getElementById("MIR-POL-ID-5-T["+i+"]").innerHTML != null ; i++)
    {
      var pol9 = document.getElementById("MIR-POL-ID-5-T["+i+"]").innerHTML;
      document.getElementById("MIR-POL-ID-5-T["+i+"]").innerHTML = pol12.substr(0,7);
    }  
  }
}
//-----------------------------------------------------------------------------
//
//  Function:       InpTrimPolicy,InpTrimPolicy1,InpTrimPolicy2,InpTrimPolicy3,
//                  InpTrimPolicy4
//
//  Description:    Reads the policy id and suffix from the input screen and 
//                  wherever policy id is an editable field and .display policy 
//                  number as 7 digit and make suffix blank
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
function InpTrimPolicy()
{

  if (document.all("MIR-POL-ID-BASE").value != null )
  {
    var pol1 = document.all("MIR-POL-ID-BASE").value;
    document.all("MIR-POL-ID-BASE").value = pol1.substr(0,7);

  }
  if (document.all("MIR-POL-ID-SFX").value != null)
  {
    document.all("MIR-POL-ID-SFX").value = ""; 
  }

}

function InpTrimPolicy1()
{
  if (document.all("MIR-POL-ID").value != null)
  {
    var pol2 = document.all("MIR-POL-ID").value;
    document.all("MIR-POL-ID").value = pol2.substr(0,7);
  }
}

function InpTrimPolicy2()
{
  if (document.all("MIR-CHQ-REF-ID").value != null)
  {
    var pol3 = document.all("MIR-CHQ-REF-ID").value;
    document.all("MIR-CHQ-REF-ID").value = pol3.substr(0,7);
  }
}

function InpTrimPolicy3()
{
  if (document.all("MIR-DEST-POL-ID-BASE").value != null )
  {
    var pol4 = document.all("MIR-DEST-POL-ID-BASE").value;
    document.all("MIR-DEST-POL-ID-BASE").value = pol4.substr(0,7);
  }
  if (document.all("MIR-DEST-POL-ID-SFX").value != null)
  {
    document.all("MIR-DEST-POL-ID-SFX").value = ""; 
  }
}

function InpTrimPolicy4()
{
  if (document.all("MIR-CPEVNT-POL-CLI-ID-BASE").value != null )
  {
    var pol5 = document.all("MIR-CPEVNT-POL-CLI-ID-BASE").value;
    document.all("MIR-CPEVNT-POL-CLI-ID-BASE").value = pol5.substr(0,7);
  }
  if (document.all("MIR-CPEVNT-POL-CLI-ID-SFX").value != null)
  {
    document.all("MIR-CPEVNT-POL-CLI-ID-SFX").value = ""; 
  }
}
//-------------------------------------------------------------------------------------
//
//  Function:       inputlisttrimpolicy,returnlisttrimpolicy,inputlisttrimpolicy1,
//                  returnlisttrimpolicy1
//
//  Description:    Reads the policy id and suffix from the page and assigns to varibales 
//                  while page submition holds the value to reget the records on list 
//                  page if user/Agent doesnt change/retain the policy on editable input field.
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------------
function inputlisttrimpolicy()
{
     var pollist1 = document.all("MIR-POL-ID-BASE").value;
     var pollist2 = document.all("MIR-POL-ID-SFX").value;

     document.all("Dispolval").value = pollist1;
     document.all("Dissfxval").value = pollist2;

}

function returnlisttrimpolicy()
{
  var  pollist3 = document.all("Dispolval").value;
  var  pollist4 = document.all("Dissfxval").value;
  var  pollist5 = pollist3.substr(0,7);

  if (pollist5 == document.all("MIR-POL-ID-BASE").value && document.all("MIR-POL-ID-SFX").value == "")
     { 
       document.all("MIR-POL-ID-BASE").value = pollist3;
       document.all("MIR-POL-ID-SFX").value = pollist4;
     }
}

function inputlisttrimpolicy1()
{
     var pollist11 = document.all("MIR-CPEVNT-POL-CLI-ID-BASE").value;
     var pollist21 = document.all("MIR-CPEVNT-POL-CLI-ID-SFX").value;

     document.all("Dispolval").value = pollist11;
     document.all("Dissfxval").value = pollist21;

}

function returnlisttrimpolicy1()
{
  var  pollist31 = document.all("Dispolval").value;
  var  pollist41 = document.all("Dissfxval").value;
  var  pollist51 = pollist31.substr(0,7);

  if (pollist51 == document.all("MIR-CPEVNT-POL-CLI-ID-BASE").value && document.all("MIR-CPEVNT-POL-CLI-ID-SFX").value == "")
     { 
       document.all("MIR-CPEVNT-POL-CLI-ID-BASE").value = pollist31;
       document.all("MIR-CPEVNT-POL-CLI-ID-SFX").value = pollist41;
     }
}
