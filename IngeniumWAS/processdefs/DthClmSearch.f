# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   DthClmSearch.f                                                *
#*  Description: Death Claim search can be used to List all the Clients for the*
#*               Policy and then to List out all the Claims existing for the   *
#*               selected client from the List                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCACS  CTS      DEATH CLAIM SEARCH                                        *
#*  ABU255  CTS      ADDED CHANGES TO RETAIN VALUES OF SESSION VARIABLES       *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************
# Identify Insured by passing the Policy ID
# and listing all the Insured's existing for the Policy.

INCLUDE "DthClmPolSearch-I.s";

# P-step to get list of  insured for a policy

INCLUDE "BF8041-P.p";
INCLUDE "DthClmInsrdList-O.s";

# P-Step to get list of Death Claims for Client Id

INCLUDE "BF9A54-P.p";

INCLUDE "BF9A54-O.s";
# Calling the Death Master Claims screens

INCLUDE "BF9A50Retrieve.f";
INCLUDE "BF9A51Create.f";
INCLUDE "BF9A52Update.f";
INCLUDE "BF9A53Delete.f";


PROCESS DthClmSearch
{

    Title = STRINGTABLE.IDS_TITLE_DthClmSearchPhase1;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP PolSearchList
    {
        USES S-STEP "DthClmPolSearch-I";
    }

   # Ask the user where they'd like to start the list
   # If cancel is pressed exit the screen
    IF action == "ACTION_BACK"
       EXIT;
 #UY3004 CHANGES START

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
        BRANCH PolSearchList;
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

 #UY3004 CHANGES END

    STEP RetrieveList
    {
        USES P-STEP "BF8041-P";
    }

    IF LSIR-RETURN-CD != "00"
    {
        BRANCH PolSearchList;
    }

    # After reaching the List Screen
    Title = STRINGTABLE.IDS_TITLE_DthClmSearchPhase2;
    TitleBarSize = "70";
    ButtonBar = "ButtonBarDataListCan";
    ButtonBarSize = "50";
    MessageFrame = "MessagesDisp";


    STEP RetrieveInsrdList
    {
       
       USES S-STEP "DthClmInsrdList-O";
       STRINGTABLE.IDS_TITLE_DthClmSearchPhase2 -> Title;
    }

    # If cancel is pressed exit the screen and traverse back to the Death Claim List Screen.

    IF action == "ACTION_BACK"
    {
       MESSAGES-T[0] = "";      
       Title = STRINGTABLE.IDS_TITLE_DthClmSearchPhase1;
       ButtonBar = "ButtonBarOKCancel";
       BRANCH PolSearchList;
    }

    # If action is datalist in the insured list screen
    IF action == "SelectItem" || action == "ACTION_DATALIST"
    {
            MIR-CLI-ID = MIR-CLI-ID-T[index];

        BRANCH RetrieveClaimList;
    }

    # The user has indicated that they want to add an element to the list.
    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH RetrieveInsrdList;

    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is
    # used here as an example only.
    # After reaching the List Screen

    MIR-CLI-ID = MIR-CLI-ID-T[index];
    MIR-DV-CLI-KJ-NM = MIR-DV-CLI-KJ-NM-T[index];
    MIR-DV-CLI-NM = MIR-DV-CLI-NM-T[index];
    MIR-CLI-BTH-DT = MIR-CLI-BTH-DT-T[index];
    MIR-CLI-SEX-CD = MIR-CLI-SEX-CD-T[index];
    STEP RetrieveClaimList
    {
        USES P-STEP "BF9A54-P";
    }

    IF LSIR-RETURN-CD != "00" || MIR-CLI-ID == ""
        BRANCH RetrieveInsrdList;


     IF index == "0"
         BRANCH RetrieveInsrdList;


     Title = STRINGTABLE.IDS_TITLE_DthClmSearchPhase3;
     ButtonBar = "ButtonBarCRUDOkCancel";
     TitleBarSize = "70";
     ButtonBarSize = "50";
     MessageFrame = "MessagesDisp";
     MessageFrameSize = "70";

    SESSION.MIR-CLI-ID = MIR-CLI-ID;
    
    STEP DisplayClaimList
    {
        USES S-STEP "BF9A54-O";
        STRINGTABLE.IDS_TITLE_DthClmSearchPhase3 -> Title;
        
    }


    # The user has indicated that they want to add an element to the list.
    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
       BRANCH DisplayClaimList;


    #If the user presses cancel button then user will go to blank screen.
    IF action == "ACTION_BACK"
       EXIT;

    IF action == "ACTION_OK"
    {
       MESSAGES-T[0] = "";      
       Title = STRINGTABLE.IDS_TITLE_DthClmSearchPhase2;
       ButtonBar = "ButtonBarDataListCan";
       BRANCH RetrieveInsrdList;
    }

    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the key will not be populated on the add
    # e.g.  IMPLICIT:
    # " " -> MIR-REQIR-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF9A51Create";
            ATTRIBUTES
            {
                Explicit;            
                GetMessages = "NO";
                SendMessages = "NO";                
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-CLI-ID -> MIR-CLI-ID;
            "FALSE" -> DisplayInput;             
        }

        BRANCH RetrieveClaimList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayClaimList;

    MIR-CLM-ID = MIR-CLM-ID-T[index];
    
    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9A50Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLM-ID -> MIR-CLM-ID;
            "FALSE" -> DisplayInput;            
        }
        SESSION.MIR-CLM-ID = MIR-CLM-ID;
        BRANCH RetrieveClaimList;
    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9A52Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLM-ID -> MIR-CLM-ID;
            "FALSE" -> DisplayInput;
        }
        SESSION.MIR-CLM-ID = MIR-CLM-ID;
        BRANCH RetrieveClaimList;

    }

    # The user wants to delete an item in the list
    # They can only delete the last coverage

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9A53Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLM-ID -> MIR-CLM-ID;
            "FALSE" -> DisplayInput;             
        }
        SESSION.MIR-CLM-ID = MIR-CLM-ID;
        BRANCH RetrieveClaimList;        
    }


    # If Search is pressed exit the screen and traverse back to the Death Claim List Screen.

    IF action == "ACTION_SEARCH"
    {
           MESSAGES-T[0] = "";    
           Title = STRINGTABLE.IDS_TITLE_DthClmSearchPhase1;
           ButtonBar = "ButtonBarOKCancel";
           BRANCH PolSearchList;

    }

}

