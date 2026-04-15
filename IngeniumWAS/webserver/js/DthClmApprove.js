//******************************************************************************
//*  Component:   DthClmApprove.js                                             *  
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  IPCAFA  CTS      New JScript containing the function for popping up       *
//*                   dialog box in Final Approval screen                      *
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
//      Function:       ChkDecsnStat
//
//      Description:    This function is called when the user clicks on a button
//                      and A value in html is validated and depending on that value 
//                      a pop-up message is thrown
//      Arguments:      See description above
//
//      Returns:        OK and Cancel Action of the Confirm Box
//
//---------------------------------------------------------------------------------

function chkDecsnStat(message1,message2,message3,okaction,cancelAction) 
{
   
  if (document.getElementById("action").value == "ACTION_NEXT")
   {

    var flag = document.all ("MIR-CHK-ADJU-AMT").value;
    var flag1 = document.all ("MIR-CHK-OTHR-AMT").value;
    
    if (flag =='A' && flag1 =='B')
   {
         var ok = confirm(message1);
         if (ok) return okaction;
          else
     {
        if (cancelAction == "")
        {
         //window.event.preventDefault();
           return document.getElementById("action").value;
        }
        else
        {
            document.getElementById("action").value = cancelAction;
            action = cancelAction;
            return document.getElementById("action").value;
        }
      }
    }
   if (flag == 'A')
    {
        var ok = confirm(message2);
        if (ok) return okaction;
      
        else
        {
           if (cancelAction == "")
           {
               //window.event.preventDefault();
               return document.getElementById("action").value;
           }
           else
           {
               document.getElementById("action").value = cancelAction;
               action = cancelAction;
               return document.getElementById("action").value;
           }
         }
      }
     if (flag1 == 'B')
      {
         var ok = confirm(message3);
         if (ok) return okaction;
       
         else
         {
            if (cancelAction == "")
            {
                //window.event.preventDefault();
                return document.getElementById("action").value;
            }
            else
            {
                document.getElementById("action").value = cancelAction;
                action = cancelAction;
                return document.getElementById("action").value;
            }           
          }
      }
     
    return okaction;
    }
    
}
