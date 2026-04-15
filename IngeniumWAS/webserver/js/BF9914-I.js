//******************************************************************************
//*  Component:   BF9960.js                                                    *
//*  Description: Cloned from AppCwaFTJUL.js                                   *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  MP0026  CTS   New VERSION                                                 *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
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
//  Functions for the BF9960.htm  pages
//
//  Uses:  getCheckedRadioValue() from ClientLevelEdits.js
//
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//  Function:       onLoadCustom()
//
//  Description:  Custom onload handler. 
//                Shows or hides the CP Inquiry fields.
//
//  Arguments:    None
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{

     document.getElementById('NameKana').style.position = "relative";
     document.getElementById('NameKanji').style.position = "relative";
     document.getElementById('DOB').style.position = "relative";
     document.getElementById('PostalCode').style.position = "relative";
     document.getElementById('Other').style.position = "relative";     

     document.getElementsByName('MIR-SRCH-TYP-CD')[0].checked=true;
     document.getElementsByName('MIR-SRCH-CD')[0].checked=true;

     onClickSrchCd();

}

//-----------------------------------------------------------------------------
//
//  Function:   onClickSrchTypCd()
//
//  Description:                                            
//
//  Arguments:                    
//
//  OPTIONAL:                                         
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------

function onClickSrchTypCd()
{

     if (document.getElementsByName("MIR-SRCH-TYP-CD")[0].checked)     
     {
         document.getElementById('PRODRADIO').innerText = "Product code + Policy Id";
         document.getElementById('PRODCD').innerText = "Product Code:";
         document.getElementById('POLID').innerText = "Policy Id:";
     }

     if (document.getElementsByName("MIR-SRCH-TYP-CD")[1].checked)     
     {
         document.getElementById('PRODRADIO').innerText = "Illustrator Number + Application Number";
         document.getElementById('PRODCD').innerText = "Illustrator Number:";
         document.getElementById('POLID').innerText = "Application Number:";
     }

     document.getElementsByName("MIR-SRCH-CD")[0].checked = "true";
     onClickSrchCd();
}


//-----------------------------------------------------------------------------
//
//  Function:   onClickSrchCd()
//
//  Description:                                            
//
//  Arguments:                    
//
//  OPTIONAL:                                         
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------

function onClickSrchCd()
{

     HideAll();
     
     if (document.getElementsByName("MIR-SRCH-CD")[0].checked)     
     {
         document.getElementById('NameKana').style.display = "";
         document.getElementById('DOB').style.display = "";
     }

     if (document.getElementsByName("MIR-SRCH-CD")[1].checked)     
     {
         document.getElementById('NameKanji').style.display = "";
         document.getElementById('DOB').style.display = "";
     }
     
     if (document.getElementsByName("MIR-SRCH-CD")[2].checked)     
     {
         document.getElementById('PostalCode').style.display = "";
     }
     
     if (document.getElementsByName("MIR-SRCH-CD")[3].checked)     
     {
         document.getElementById('Other').style.display = "";
     }     
}


//-----------------------------------------------------------------------------
//
//  Function:     HideAll()
//
//  Description:  
//          
//  Arguments:    none required
//
//  OPTIONAL:   
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------

function HideAll()
{
     document.getElementById('NameKana').style.display = "none";
     document.getElementById('NameKanji').style.display = "none";
     document.getElementById('DOB').style.display = "none";
     document.getElementById('PostalCode').style.display = "none";
     document.getElementById('Other').style.display = "none";   
}


