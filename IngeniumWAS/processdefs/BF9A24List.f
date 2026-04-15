
#*******************************************************************************
#*  Component:   BF9A24List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  WF2004  CTS      INITIAL REVISION                                          *
#*  AHS150  CTS      CHANGED FOR 'MORE' FUNCTIONALITY                          *
#*  AHS150  CTS      CHANGED FOR CHANGE INDICATOR                              *
#*  BU3679  CTS      FIX FOR PF/CS ERROR LOGS                                  *
#*******************************************************************************
# Change this to the S that starts the list
# Change this to the P that retrieves the list

INCLUDE "BF9A24-O.s";
INCLUDE "BF9A20-I.s";
INCLUDE "BF9A24-P.p";
INCLUDE "BF9A20-P.p";
INCLUDE "BF9A20-O.s";
INCLUDE "BF9A20Retrieve.f";


PROCESS BF9A24List
{
    Title = STRINGTABLE.IDS_TITLE_BF9A24List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    FLOW-PAGE = 1;
    # Ask the user where they'd like to start the list

    MIR-COUNT-INIT = 0;
    IF DisplayInput == "FALSE"
       BRANCH RetrieveList;

    STEP ListStart
    {
        USES S-STEP "BF9A24-I";
    }


    IF action == "ACTION_BACK"
        EXIT;

    IF MIR-POL-ID != ""
    && MIR-CLI-ID != ""
    && MIR-USER-ID != ""
    && MIR-APP-TYP-CD != ""
    && MIR-SEQ-NUM != ""
    {
        STEP RetrieveList1
         {
          USES P-STEP "BF9A20-P";
         }
        IF LSIR-RETURN-CD != "00"
           BRANCH ListStart;

        Title = STRINGTABLE.IDS_TITLE_BF9A20Retrieve;
        ButtonBar = "ButtonBarOK";
        STEP DisplayList1
         {
           USES S-STEP "BF9A20-O";
         }


        IF action == "ACTION_NEXT"
           EXIT;

     }

    STEP RetrieveList
    {
        USES P-STEP "BF9A24-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9A24List;
    ButtonBar = "ButtonBarListsCRUD1";

    STEP DisplayList
    {
        USES S-STEP "BF9A24-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    {
       MIR-COUNT-INIT = FLOW-PAGE;
       FLOW-PAGE = FLOW-PAGE + 1;

       BRANCH RetrieveList;
     }



    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is
    # used here as an example only.

    MIR-POL-ID = MIR-POL-ID-T[index];
    MIR-CLI-ID = MIR-CLI-ID-T[index];
    MIR-USER-ID = MIR-USER-ID-T[index];
    MIR-APP-TYP-CD = MIR-APP-TYP-CD-T[index];
    MIR-SEQ-NUM = MIR-SEQ-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9A20Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

                MIR-POL-ID -> MIR-POL-ID;
          MIR-CLI-ID -> MIR-CLI-ID;
          MIR-USER-ID -> MIR-USER-ID;
          MIR-APP-TYP-CD -> MIR-APP-TYP-CD;
                MIR-SEQ-NUM -> MIR-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }
     # Changes for AHS150 start
        IF action == "ACTION_NEXT"
     #  Fix for BU3679 start
     #  BRANCH ListStart;
        EXIT;
     #  Fix for BU3679 start
     #  BRANCH Input;
     # Changes for AHS150 end

    }



}

