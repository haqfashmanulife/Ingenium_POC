# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   BF9800List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Who      Description                                               *
#*                                                                             *
#*  02NB64  WBP      New                                                       *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "BF9800-I.s";
INCLUDE "BF9800-O.s";
INCLUDE "BF9800-P.p";
INCLUDE "BF8020Retrieve.f";
INCLUDE "BF8021Create.f";
INCLUDE "BF8022Update.f";
INCLUDE "BF8023Delete.f";
# UY3004 CHANGES START
INCLUDE "BF9D34List.f";
# UY3004 CHANGES END 

PROCESS BF9800List
{
  VARIABLES
  {
    OUT LastAction;

    OUT MIR-POL-ID-BASE;

    OUT MIR-POL-ID-SFX;

    OUT MIR-POL-PLAN-ID;

    OUT MIR-DV-OWN-CLI-NM;
  }

    Title = STRINGTABLE.IDS_TITLE_BF9800List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    MIR-CVG-NUM-START = "00";

    IF ReturnAgain == "TRUE"
        BRANCH RetrieveList;


    STEP ListStart
    {
        USES S-STEP "BF9800-I";
    }
    
    # UY3004 CHANGES START


    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH ListStart;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
      }

    # UY3004 CHANGES END    

    IF action == "ACTION_BACK"
    {
        LastAction = action;

        EXIT;

    }
        
    STEP RetrieveList
    {
        USES P-STEP "BF9800-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9800List;
    ButtonBar = "ButtonBarListsCRUDCanMoreNext";

    STEP DisplayList
    {
        USES S-STEP "BF9800-O";
    }

    IF action == "ACTION_CANCEL" || action == "ACTION_NEXT"
    {
        LastAction = action;

        EXIT;

    }

    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE"
    {
        MIR-CVG-NUM-START = MIR-CVG-NUM-END;

        BRANCH RetrieveList;

    }

    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the key will not be populated on the add
    # e.g.  IMPLICIT:
    # " " -> MIR-REQIR-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF8021Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.
    # MIR-CVG-NUM = VALUEOF("MIR-CVG-NUM-T-" + index);

    MIR-POL-ID-BASE = MIR-POL-ID-BASE;
    MIR-NEW-CVG-NUM = MIR-NEW-CVG-NUM-T[index];
    MIR-POL-ID-SFX = MIR-POL-ID-SFX;


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF8020Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-NEW-CVG-NUM -> MIR-CVG-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF8022Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-NEW-CVG-NUM -> MIR-CVG-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list
    # They can only delete the last coverage      

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF8023Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-NEW-CVG-NUM -> MIR-CVG-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

