#*******************************************************************************
#*  Component:   BF9C94BCList.f                                                *
#*  Description: Billing Change List Process                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP142F  CTS      Intial Version                                            *
#*                                                                             *
#*  Q07081  CTS      MP142F-Displaying 1st list screen back without any message*
#*                   after clicking cancel button on the 2nd list screen       *
#*******************************************************************************

INCLUDE "BF9C94-I.s";
# Change this to the P that retrieves the list

INCLUDE "BF9C94-O.s";
INCLUDE "BF9C94-P.p";
INCLUDE "BF9C90BC.f";
INCLUDE "BF9C91Create.f";
INCLUDE "BF9C92BC.f";
INCLUDE "BF9C93BC.f";

PROCESS BF9C94BC
{
    Title = STRINGTABLE.IDS_TITLE_BF9C94List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    STEP RetrieveList
    {
        USES P-STEP "BF9C94-P";
        "BC" -> MIR-DV-POL-FUT-ACTV-TYP-CD;        
    }

    Title = STRINGTABLE.IDS_TITLE_BF9C94List;

    IF LSIR-RETURN-CD != "00"
    {     
       EXIT;
    } 
    
    ButtonBar = "ButtonBarListsCRUD";    
    
    STEP DisplayList
    {
        USES S-STEP "BF9C94-O";
    }

    IF action == "ACTION_BACK"
    {
	MESSAGES-T[0] = "";    
        EXIT;
    }

    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF9C91Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-PBRQ-EFF-DT;
            " " -> MIR-DV-POL-FUT-ACTV-TYP-CD;
            " " -> MIR-POL-ID-BASE;
            " " -> MIR-POL-ID-SFX;
            "FALSE" -> DisplayInput;
        }


        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. 
    
    MIR-PBRQ-EFF-DT = MIR-PBRQ-EFF-DT-T[index];
    MIR-DV-POL-FUT-ACTV-TYP-CD = MIR-DV-POL-FUT-ACTV-TYP-CD-T[index];

    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9C90BC";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
 
            MIR-PBRQ-EFF-DT -> MIR-PBRQ-EFF-DT;
            MIR-DV-POL-FUT-ACTV-TYP-CD -> MIR-DV-POL-FUT-ACTV-TYP-CD;
            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
    STEP Main
    {
        USES PROCESS "BF9C92BC";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }
  
        STRINGTABLE.IDS_TITLE_BF9C92UpdateList -> Title;
        MIR-PBRQ-EFF-DT -> MIR-PBRQ-EFF-DT;
        MIR-DV-POL-FUT-ACTV-TYP-CD -> MIR-DV-POL-FUT-ACTV-TYP-CD;
        "FALSE" -> DisplayInput;
    }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9C93BC";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
  
            MIR-PBRQ-EFF-DT -> MIR-PBRQ-EFF-DT;
            MIR-DV-POL-FUT-ACTV-TYP-CD -> MIR-DV-POL-FUT-ACTV-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    EXIT;    
}

