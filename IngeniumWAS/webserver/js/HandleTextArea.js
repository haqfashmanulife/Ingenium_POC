//-----------------------------------------------------------------------------
// 	Function:       processKey()
//
//
//	Description:    This function traps the pressing of the ENTER key and overrides
//                  the default Ingenium behavior which is to click the default
//					button. 
//                  
//   				New behavior: If a TextArea object has the focus then do not 
// 					click the default button.  This allows the user to press the 
//					ENTER key to insert a a carriage return in the text. 
//
//	Arguments:	keyStroke - the last key that was pressed.
//
//	Returns:    True - when the TextArea object has the focus
//
//-----------------------------------------------------------------------------
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*                                                                            *
//******************************************************************************
// Trap the pressing of the enter key
document.onkeypress=processKey;

function processKey()
{
    if ((m_keyCode = event.keyCode) == 13)	// Enter key pressed
		{
		    //---------------------------------------------------------
			// 06-12-2002 DHR	
			// If the focus is in a textarea object then exit this
			// function now because you don't want to submit the form.
			//---------------------------------------------------------
			if (window.event.target.type == "textarea") 
				{
				return true;
				}
			else
				{
				//-------------------------------------------------------------
				// If the focus is not on a TextArea object then
				// Call the processEnterKey function in the ClientLevelEdits.js
				// (ClientLevelEdits.js is the base Ingenium J-Script for
				// client side edits)
				//--------------------------------------------------------------
				processEnterKey();
			}
	}
}

