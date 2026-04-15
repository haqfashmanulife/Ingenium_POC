// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:14 PM EDT
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
//	Custom script for BF1392.htm 
//
//-----------------------------------------------------------------------------
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  23774A  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*                                                                            *
//******************************************************************************
//-----------------------------------------------------------------------------
//
//	Function:       setAllInTableToNo
//
//	Description:    Sets all yes/no/unanswered fields in a table to "no"
//
//	Arguments:      Name of table containing fields to set to no
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function setAllInTableToNo(tableName)
{
	// Get a reference to the table containing the fields to set to no

	var table = document.getElementById(tableName);

	if (table == null)
	{
		return;
	}

	var elements = table.getElementsByTagName("input");
	var elementCount = elements.length;

	// Check each object in the table

	for (count = 0; count < elementCount; ++count)
	{
          var object = elements[count];

		// If the object has an attribute called stype then it's
		// one of our input fields.

		if ((sType = object.getAttribute("stype")) != null)
		{
			// We only care about yes/no/unanswered fields.  There will
			// be three fields for each radio group.  The yes, the no and
			// the unanswered.

			if (sType == "YesNoUnanswered")
			{
				// UIGen will set the value for each field.  N means the field
				// is a "no" field.  If we find one, then set its checked value
				// to true to check it.  All other fields will be turned off.

				if (object.value.toLowerCase() == "n")
				{
					object.checked = true;
				}
				else
				{
					object.checked = false;
				}
			}
		}
	}
}


//-----------------------------------------------------------------------------
//
//	Function:       questionToOutput
//
//	Description:    gets the question relating to the details button and saves
//                 it into a variable that can be passed through S-steps to
//                 the final output display page.
//
//	Arguments:      Name of the Table Cell containing the question.
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function questionToOutput(cellName)
{
	// Get a reference to the cell                                   

	var cell = document.getElementById(cellName);

	if (cell == null)
	{
		return;
	}
   
   // Get the question text for the referenced cell and save it into 
   // QuestionText variable (a hidden field on the -I.htm page).
   // This variable is referenced in the S-steps and on the output
   // display pages (-O.htm's).

     var qtext = document.getElementById(cellName).innerText;
     document.getElementById("QuestionText").value = qtext;
}
//-----------------------------------------------------------------------------
//
//	Function:       saveObjectName                            
//
//	Description:   Saves the Radio Object Name associated with the Details
//                     button that is clicked.
//                 
//
//	Arguments:      Name of the Radio Object
//
//	Returns:        Value to "PageFocus" input type
//
//-----------------------------------------------------------------------------

function saveObjectName(save)
{
       document.getElementById("PageFocus").value = save;

}
//-----------------------------------------------------------------------------
//
//	Function:       setFocus                            
//
//	Description:    sets the Focus to the object that's name is saved
//                 in the hidden variable named "PageFocus".
//                                                   
//
//	Arguments:      Value of "PageFocus".                   
//
//	Returns:        Nothing
//
//-----------------------------------------------------------------------------

function setFocus()
{
       
       var firsttime = document.getElementById("PageFocus")
       if (firsttime.value == "") 
       {    
           return;
       }
       
       var objectname = document.getElementById("PageFocus").value;
       var objectfocus = document.getElementsByName(objectname);
       if (objectfocus.length > 0)
       {
         for (i = 0; i < objectfocus.length; i++)
         {
              if (objectfocus[i].checked) 
              {
                  objectfocus[i].focus();
                  document.getElementById("PageFocus").value = "";
                  objectfocus[i].scrollIntoView(true);
                  break;
              
              
              }
         }
       
       }
}
