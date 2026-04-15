//******************************************************************************
//*  Component:   MajorQstn.js                                                 *  
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  EN0395  CTS      New JScript containing functions for displaying the      *
//*                   questions in the Claim Additional Questions Screen       *
//*                   and disabling the questions in Claim Additional Questions* 
//*                   Inquiry screen                                           *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
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
//---------------------------------------------------------------------------------
//
//	Function:       Indent()
//
//	Description:    This function is invoked during the form load. It is used
//	                to indent the sub-questions according to their levels in 
//                      Claim Additional Questions Update and Inquiry Screens.
//
//	Arguments:      None
//
//	Returns:        None
//
//---------------------------------------------------------------------------------
function Indent()
{
    var myTable = document.getElementById("tab1");
    var numRow = myTable.rows.length;
    var tab1 = "  ";
    var tab2 = "     ";
    var tab3 = "        ";
    var tab4 = "           ";
    var lvlNum = 0;

    for (i = 1; i < numRow; i++)
    {
        lvlNum = "MIR-HID-LVL-NUM-T[" + i + "]";
        if (document.getElementById(lvlNum).value == "002")
        {
         document.getElementById("MIR-QSTN-DESC-TXT-T[" + i + "]").innerText = tab1 + document.getElementById("MIR-QSTN-DESC-TXT-T[" + i + "]").innerText;
        }

        if (document.getElementById(lvlNum).value == "003")
        {
         document.getElementById("MIR-QSTN-DESC-TXT-T[" + i + "]").innerText = tab2 + document.getElementById("MIR-QSTN-DESC-TXT-T[" + i + "]").innerText;
        }
        if (document.getElementById(lvlNum).value == "004")
        {
         document.getElementById("MIR-QSTN-DESC-TXT-T[" + i + "]").innerText = tab3 + document.getElementById("MIR-QSTN-DESC-TXT-T[" + i + "]").innerText;
        }
        if (document.getElementById(lvlNum).value == "005")
        {
         document.getElementById("MIR-QSTN-DESC-TXT-T[" + i + "]").innerText = tab4 + document.getElementById("MIR-QSTN-DESC-TXT-T[" + i + "]").innerText;
        }

    }
}

//---------------------------------------------------------------------------------
//
//	Function:       QstnDisable()
//
//	Description:    This function is invoked during the form load. It is used to
//	                disable the radio buttons of the answers in the Claim 
//                      Additional Questions Inquiry screen
//
//	Arguments:      None
//
//	Returns:        None
//
//---------------------------------------------------------------------------------

function QstnDisable()
{
    var myTable = document.getElementById("tab1");
    var numRow = myTable.rows.length;
    for (i = 1; i < numRow; i++)
    {
        respCd = "MIR-ANSWR-CD-T[" + i + "]";
        document.getElementsByName(respCd)[0].disabled=true;
        document.getElementsByName(respCd)[1].disabled=true;
        document.getElementsByName(respCd)[2].disabled=true;
    }

}

//---------------------------------------------------------------------------------
//
//	Function:       MajorQstn()
//
//	Description:    This function is called during the form load. It is used to
//	                display the major questions and the questions that have been
//                      answered by the user in the Claim Additional Questions
//                      Update and Inquiry Screens. 
//
//	Arguments:      None
//
//	Returns:        None
//
//---------------------------------------------------------------------------------

function MajorQstn()
{
    var myTable = document.getElementById("tab1");
    var numRow = myTable.rows.length;
    var row = myTable.rows.item(0);
    var respCd = "";
    var qstnId = "";
    var lvlNum = "";
    var lvlNumber = 0;

    for (i = 1; i < numRow; i++)
    {
        row = myTable.rows.item(i);
        lvlNum = "MIR-HID-LVL-NUM-T[" + i + "]";

        if (document.getElementById(lvlNum).value != "001")
        {
         row.style.display = "none";
        }
    }
     
    for (i = 1; i < numRow; i++)
    {
        row = myTable.rows.item(i);
        lvlNum = "MIR-HID-LVL-NUM-T[" + i + "]";
        respCd = "MIR-ANSWR-CD-T[" + i + "]";
        respCd1 = document.getElementsByName(respCd)[0].checked;
        respCd2 = document.getElementsByName(respCd)[1].checked;
        respCd3 = document.getElementsByName(respCd)[2].checked;
        lvlNumber = (+document.getElementById(lvlNum).value);
        lvlNumber = lvlNumber + 1;

        switch (true)
        {
           case respCd1:
              resp = document.getElementsByName(respCd)[0].value; 
              break;
           case respCd2:
              resp = document.getElementsByName(respCd)[1].value; 
              break;
           case respCd3:
              resp = document.getElementsByName(respCd)[2].value; 
              break;
           default:
              break;
        }   
  
        if ((row.style.display == "") && (respCd1 || respCd2 || respCd3 ))
        {
           qstnId = "MIR-HID-QSTN-ID-T[" + i + "]";
           qstnId = document.getElementById(qstnId).value;
           j = +i;
           j = j + 1;
           for (j = j; j < numRow; j++)
           {
              row = myTable.rows.item(j);
              subLvlNum = "MIR-HID-LVL-NUM-T[" + j + "]";
              respTrigCd = "MIR-HID-TRIGGR-CD-T[" + j + "]";
              respTrigCd = document.getElementById(respTrigCd).value;
              parntQstnId = "MIR-HID-PARNT-QSTN-ID-T[" + j + "]";
              parntQstnId = document.getElementById(parntQstnId).value;
              subLvlNumber = (+document.getElementById(subLvlNum).value);

              if (subLvlNumber > lvlNumber)
              {
                 break;
              }
              if ((respTrigCd != resp) || (parntQstnId != qstnId))
              {
                 continue;
              }
              row.style.display = "";
              break;
           }
        }
    }
     
    for (i = 1; i < numRow; i++)
    {
        row = myTable.rows.item(i);
        if (row.style.display == "none")
        {
           respCd = "MIR-ANSWR-CD-T[" + i + "]";
           document.getElementsByName(respCd)[0].checked = false;
           document.getElementsByName(respCd)[1].checked = false;
           document.getElementsByName(respCd)[2].checked = false;
        }
    }
     
    return;
}

