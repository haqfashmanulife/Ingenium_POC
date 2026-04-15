//******************************************************************************
//*  Component:   CheckAppStickerNumber.js                                     *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  EN5280  CTS      Checking of Valid Sticker Number in Application Form     *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//******************************************************************************

//-----------------------------------------------------------------------------
//
//      Function:       chkApplNumber()
//
//      Description:    Determines whether a valid value has been entered in a
//                      Input box for Application Sticker number
//
//      Arguments:      The input form
//
//      Returns:        true if the Input field is valid, false otherwise
//
//-----------------------------------------------------------------------------

function chkApplNumber(iForm)
{

  var flag=0;
  var elementCount = iForm.elements.length;

// Set the application number field as the field to be validated.

  for (var i = 0; i < elementCount; i++)
  {
    var strField = iForm.elements[i];
    var indField = iForm.elements[i].getAttribute("appno");
    
    if (indField == "yes")
    {    
       flag = 1;
       break;
    }
  }

// Start the validation only if the application sticker number is set as validation field.

  if (flag == 1)
  {
     var appl_len, val, sum;
     var appl_num = new Array(2);
     appl_num[0] = new Array(11);
     appl_num[1] = new Array(11);

     var strFieldValue = strField.value;
     appl_len = strFieldValue.length;

// If Application Sticker number field is blank or button pressed is CANCEL or PREVIOUS then skip validation.

     if(appl_len == 0 || document.getElementById("action").value == "ACTION_CANCEL" || document.getElementById("action").value == "ACTION_PREVIOUS") 
     {
        return true;
     }

// Check if Application Sticker number entered is of 11 digit or not

     if(appl_len > 0 && appl_len !== 11)
     {
        strField.focus();
        strField.select();
        alert(getUserMessage(msgIncorrectApplStckrLen));
        document.getElementById("action").value = no_action;
        return false;
     }

// Check if Application Sticker number entered is numeric or not

     for (var i=0; i < 11; i++)
     {
        appl_num[1][i] = strFieldValue.charAt(i);
        if(strFieldValue.charAt(i) < "0" || strFieldValue.charAt(i) > "9")
        {
           strField.focus();
           strField.select();
           alert(getUserMessage(msgIncorrectApplStckrLen));
           document.getElementById("action").value = no_action;
           return false;
        }
     }

// Check if 4th digit of Application Sticker number entered is between 5 to 9 or not

     if(strFieldValue.charAt(3) < "5" || strFieldValue.charAt(3) > "9")
     {
        strField.focus();
        strField.select();
        alert(getUserMessage(msgIncorrectApplStckrNo));
        document.getElementById("action").value = no_action;
        return false;
     }

// Check if the 11th digit of Application Sticker number is same as the calculated value

     sum = 0;
     for (var i=0; i < 10; i++)
     {
        val = appl_num[1][i];

        if((i % 2) == 0)
        {  
           val = val * 1;
        }
        else
        {
            val = val * 2;
        }

        if(val >= 10 )
        {
           appl_num[0][i] = 1;
           appl_num[1][i] = val - 10;
        }
        else
        {
            appl_num[0][i] = 0;
            appl_num[1][i] = val;
        }

        sum = sum + appl_num[0][i] + appl_num[1][i];
     }

     sum = sum % 10;
     sum = 10 - sum;
     sum = sum % 10;

     if(strFieldValue.charAt(10) != sum)
     {
        strField.focus();
        strField.select();
        alert(getUserMessage(msgIncorrectApplStckrNo));
        document.getElementById("action").value = no_action;
        return false;
     }
  }
  return true;
}
